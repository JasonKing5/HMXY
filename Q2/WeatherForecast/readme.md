# 天气预报项目

## 自行设计天气预报项目
* 创建项目
* 修改配置项
  * 网络请求
  * 应用的图标和名称
* 编写界面
* 实现功能
  * 发请求
  * 接受和解析数据
---
编写步骤：
1. 配置网络权限:

在`src/main/module.json5` 文件中，追加：
```typescript
 "requestPermissions": [
      {
        "name": "ohos.permission.INTERNET"
      }
    ]
```

2. 修改软件的图标和名称
*  阿里巴巴矢量图标库： https://www.iconfont.cn/home/index 
* 在`src/main/module.json5` 文件中，修改 `"abilities"`配置项中的 `"icon"`和`"label"`

## 获取天气数据
* 聚合数据网站：https://www.juhe.cn/
* 天气接口：http://apis.juhe.cn/simpleWeather/query
  * city
  * key
* > 我们要发送的api地址：
  > http://apis.juhe.cn/simpleWeather/query?city=荥阳&key=个人的key