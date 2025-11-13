// 清理无用的图片
// 遍历以下路径：
// "docs/**/img/**/*.{png,jpg,jpeg,gif,webp}"
// "blog/**/img/**/*.{png,jpg,jpeg,gif,webp}"
// "docs/**/screenshots/**/*.{png,jpg,jpeg,gif,webp}"
// "blog/**/screenshots/**/*.{png,jpg,jpeg,gif,webp}"
// 检查这些图片是否在md/mdx文件中被引用
// 列出所有未被引用的图片

const fs = require('fs');
const path = require('path');
const glob = require('glob');

// 1. 获取所有图片文件
const imagePatterns = [
  'docs/**/img/**/*.{png,jpg,jpeg,gif,webp}',
  'blog/**/img/**/*.{png,jpg,jpeg,gif,webp}',
  'docs/**/screenshots/**/*.{png,jpg,jpeg,gif,webp}',
  'blog/**/screenshots/**/*.{png,jpg,jpeg,gif,webp}'
];

// 2. 获取所有markdown文件
const mdFiles = glob.sync('{docs,blog}/**/*.{md,mdx}');

// 3. 收集所有图片引用
const imageReferences = new Set();

// 读取markdown文件，提取图片引用
mdFiles.forEach(mdFile => {
  const content = fs.readFileSync(mdFile, 'utf-8');
  // 匹配 ![...](...) 或 <img ... src="..." ...> 格式的图片引用
  const imageRegex = /!\[[^\]]*\]\(([^)]+)\)|<img[^>]+src="([^"]+)"[^>]*>/g;
  let match;
  
  while ((match = imageRegex.exec(content)) !== null) {
    // match[1] 是 ![]() 格式的图片路径
    // match[2] 是 <img src=""> 格式的图片路径
    const imgPath = match[1] || match[2];
    if (imgPath && !imgPath.startsWith('http')) {
      const absPath = path.isAbsolute(imgPath) 
        ? imgPath 
        : path.join(path.dirname(mdFile), imgPath);
      imageReferences.add(path.normalize(absPath));
    }
  }
});

// 4. 检查哪些图片未被引用
const allImages = new Set();
imagePatterns.forEach(pattern => {
  glob.sync(pattern).forEach(imgPath => {
    allImages.add(path.normalize(imgPath));
  });
});

// 5. 找出未使用的图片
const unusedImages = [...allImages].filter(imgPath => {
  // 检查图片是否被引用
  const isUsed = [...imageReferences].some(refPath => 
    refPath.includes(path.basename(imgPath))
  );
  return !isUsed;
});

// 6. 输出未使用的图片
console.log('未使用的图片:');
unusedImages.forEach(img => console.log(img));
console.log(`\n共找到 ${unusedImages.length} 个未使用的图片`);

// 7. 可选：删除未使用的图片
const doDelete = true; // 设置为 true 来删除文件
if (doDelete) {
  unusedImages.forEach(file => {
    fs.unlinkSync(file);
    console.log(`已删除: ${file}`);
  });
}