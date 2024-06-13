# 何浅红
> 参考与“西窗烛”app，开发自己的应用，名字取自于：
> 
> 何须浅碧深红色，自是花中第一流。

配置网络权限
> 文件路径： src/main/module.json5
```typescript
 "requestPermissions": [
      {
        "name": "ohos.permission.INTERNET"
      }
    ]
``` 

---
随机诗词API接口： 
```typescript
https://api.apiopen.top/api/sentences
```

---
父组件和子组件数据联动：
* 父@State -----> 子@Prop
* 父@State <-----> 子@Link