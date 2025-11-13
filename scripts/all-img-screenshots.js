// 列出指定目录下的所有图片文件
// 包括：
//   'docs/**/img/'
//   'blog/**/img/'
//   'docs/**/screenshots/'
//   'blog/**/screenshots/'

const fs = require('fs');
const path = require('path');
const glob = require('glob');

// 图片文件扩展名
const IMAGE_EXTENSIONS = ['.png', '.jpg', '.jpeg', '.gif', '.webp'];

// 要搜索的目录模式
const SEARCH_PATTERNS = [
  'docs/**/img/',
  'blog/**/img/',
  'docs/**/screenshots/',
  'blog/**/screenshots/'
];

// 获取所有图片文件
function getAllImageFiles() {
  const imageFiles = [];

  SEARCH_PATTERNS.forEach(pattern => {
    // 获取所有匹配的目录
    const dirs = glob.sync(pattern, { absolute: false });
    
    dirs.forEach(dir => {
      // 递归读取目录下的所有文件
      const files = glob.sync('**/*', { 
        cwd: dir,
        nodir: true,  // 只包含文件
        absolute: false
      });

      // 过滤出图片文件
      files.forEach(file => {
        const ext = path.extname(file).toLowerCase();
        const relativePath = path.join(dir, file).replace(/\\/g, '/');
        imageFiles.push(relativePath);
        // if (IMAGE_EXTENSIONS.includes(ext)) {
        //   const relativePath = path.join(dir, file).replace(/\\/g, '/');
        //   imageFiles.push(relativePath);
        // }
      });
    });
  });

  return imageFiles;
}

// 主函数
function main() {
  const imageFiles = getAllImageFiles();
  
  // 输出所有图片文件路径
  console.log('找到的图片文件:');
  imageFiles.forEach(file => console.log(file));
  console.log(`\n共找到 ${imageFiles.length} 个图片文件`);
}

// 执行
main();