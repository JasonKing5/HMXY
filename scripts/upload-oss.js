#!/usr/bin/env node

const fs = require('fs-extra');
const path = require('path');
const crypto = require('crypto');
const COS = require('cos-nodejs-sdk-v5');
const glob = require('glob');
const sharp = require('sharp');

const cos = new COS({
  SecretId: process.env.TENCENT_COS_SECRET_ID,
  SecretKey: process.env.TENCENT_COS_SECRET_KEY,
});

const bucket = process.env.TENCENT_COS_BUCKET;
const region = process.env.TENCENT_COS_REGION;
const ossBaseUrl = process.env.TENCENT_COS_BASE_URL;

const mdGlob = ['docs/**/*.{md,mdx}', 'blog/**/*.{md,mdx}'];

// 压缩图片，保留合理质量
async function compressImage(filePath) {
  const stat = await fs.stat(filePath);
  if (stat.size < 50 * 1024) {
    // 小于50KB不压缩
    return filePath;
  }

  const ext = path.extname(filePath).toLowerCase();
  const tempPath = filePath + '.tmp';

  let pipeline = sharp(filePath);

  if (ext === '.png') {
    pipeline = pipeline.png({ quality: 80, compressionLevel: 8 });
  } else if (ext === '.jpg' || ext === '.jpeg') {
    pipeline = pipeline.jpeg({ quality: 80 });
  } else if (ext === '.gif' || ext === '.webp') {
    // 不处理 GIF 和 WebP 格式
    console.log(`ℹ️  跳过 ${ext.toUpperCase()} 格式的压缩: ${filePath}`);
    return filePath;
  } else {
    // 其他格式不处理
    console.log(`ℹ️  不支持的图片格式 ${ext}, 跳过压缩: ${filePath}`);
    return filePath;
  }

  await pipeline.toFile(tempPath);
  await fs.move(tempPath, filePath, { overwrite: true });
  return filePath;
}

// 获取文件 MD5 哈希
function getFileHash(filePath) {
  const buffer = fs.readFileSync(filePath);
  return crypto.createHash('md5').update(buffer).digest('hex').slice(0, 8);
}

// 检查 OSS 文件是否存在
async function isFileExist(key) {
  return new Promise((resolve) => {
    cos.headObject({
      Bucket: bucket,
      Region: region,
      Key: key
    }, (err, data) => {
      if (err) {
        if (err.statusCode === 404) {
          resolve(false);
        } else {
          console.warn(`⚠️ 检查文件是否存在时出错 (${key}):`, err.message);
          resolve(false); // 出错时默认认为文件不存在，继续上传
        }
      } else {
        resolve(true);
      }
    });
  });
}

// 上传图片到 OSS
async function uploadFile(filePath, targetDir = 'docs') {
  const hash = getFileHash(filePath);
  const ext = path.extname(filePath);
  const base = path.basename(filePath, ext);
  const key = `${targetDir}/${base}.${hash}${ext}`;
  const url = `${ossBaseUrl}/${key}`;

  console.log(`🔍 检查文件: ${filePath}`);
  console.log(`  生成 Key: ${key}`);
  
  try {
    const exist = await isFileExist(key);
    if (exist) {
      console.log('✅ 文件已存在，跳过上传:', key);
      return url;
    }
    
    console.log('⬆️  开始上传文件:', filePath);

    await new Promise((resolve, reject) => {
      const params = {
        Bucket: bucket,
        Region: region,
        Key: key,
        Body: fs.createReadStream(filePath),
        ACL: 'public-read',
      };
      
      console.log(`  上传参数:`, {
        Bucket: params.Bucket,
        Region: params.Region,
        Key: params.Key,
        FileSize: fs.statSync(filePath).size + ' bytes'
      });

      cos.putObject(params, async (err, data) => {
        if (err) {
          console.error(`❌ 上传失败 (${key}):`, err);
          reject(err);
        } else {
          console.log(`✅ 上传成功: ${key}`);
          console.log(`  文件链接: ${url}`);
          
          // 上传成功后删除本地文件
          try {
            await fs.unlink(filePath);
            console.log(`🗑️  已删除本地文件: ${filePath}`);
          } catch (deleteErr) {
            console.warn(`⚠️  删除本地文件失败 (${filePath}):`, deleteErr.message);
          }
          
          resolve(data);
        }
      });
    });
    
    return url;
  } catch (error) {
    console.error(`❌ 处理文件时出错 (${filePath}):`, error);
    throw error; // 重新抛出错误，由上层处理
  }
}

// 处理 Markdown 文件中的图片
async function processMarkdown(mdFile) {
  let content = fs.readFileSync(mdFile, 'utf8');
  const regex = /!\[([^\]]*)\]\((.*?)\)/g;
  let hasChanges = false;
  
  const processImage = async (fullMatch, alt, imgPath) => {
    // 检查是否需要上传
    const needUpload = imgPath.startsWith('./img/') || 
                      imgPath.startsWith('./screenshots/') ||
                      imgPath.startsWith('img/') || 
                      imgPath.startsWith('screenshots/')
    
    if (!needUpload) return null;
    
    // 处理相对路径
    const filePath = path.isAbsolute(imgPath) ? imgPath : path.join(path.dirname(mdFile), imgPath);
    if (!fs.existsSync(filePath)) {
      console.warn(`⚠️  Image not found: ${filePath}`);
      return null;
    }
    
    // 压缩并上传图片
    await compressImage(filePath);
    // 根据 Markdown 文件路径确定目标目录
    const targetDir = mdFile.includes('blog/') ? 'blog' : 'docs';
    const url = await uploadFile(filePath, targetDir);
    return { fullMatch, url: `![${alt}](${url})` };
  };
  
  // 收集所有图片处理任务
  const tasks = [];
  let match;
  while ((match = regex.exec(content)) !== null) {
    const [fullMatch, alt, imgPath] = match;
    tasks.push(processImage(fullMatch, alt, imgPath));
  }
  
  // 并行处理所有图片
  const results = await Promise.all(tasks);
  
  // 替换原始内容
  results.forEach(result => {
    if (result) {
      content = content.replace(result.fullMatch, result.url);
      hasChanges = true;
    }
  });
  
  // 如果有更新，则写回文件
  if (hasChanges) {
    fs.writeFileSync(mdFile, content, 'utf8');
    console.log('✏️  Updated Markdown:', mdFile);
  } else {
    // console.log('ℹ️  No changes needed:', mdFile);
  }
}

// 主函数
async function main() {
  console.log('🚀 Start processing markdown files...');
  // 支持 glob 数组，合并多个模式匹配结果
  const mdFiles = mdGlob.flatMap(pattern => glob.sync(pattern));
  
  // 处理所有 Markdown 文件
  for (const file of mdFiles) {
    await processMarkdown(file);
  }

  console.log('✅ All images processed and uploaded.');
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});