## 比赛计分器
> 用来实现元服务。
> 
> 
---
1. 相关知识点
* 设置屏幕默认方向
`src/main/module.json5`
```

module-->abilities--> 
// 设置横屏展示
"orientation": "landscape",
```
* 设置卡片尺寸
  `supportDimensions`支持的卡片尺寸数组必须包含`defaultDimension`默认的尺寸
```
"defaultDimension": "1*2",
"supportDimensions": [
"1*2"
]
```