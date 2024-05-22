# 婷婷翻译
> 22前端授课项目：翻译软件
> 
* 接口信息
> 天行数据接口，个人中心获取key
```typescript
接口地址：https://apis.tianapi.com/fanyi/index 
请求示例：https://apis.tianapi.com/fanyi/index?key=你的APIKEY&text=hallo 
支持协议：http/https
请求方式：get/post
返回格式：utf-8 json
```

## 使用Axios包
1. 下载安装
2. 导包并使用
---
0. 验证自己电脑上是否配置了 `ohpm` 环境变量
   * `win` + `r` 然后`cmd`进入黑窗口输入: `ohpm`
   * 如果展示代码内容。说明ohpm环境变量OK
   * 如果展示的是 `ohpm 不是内部或外部命令，也不是可运行的程序
     或批处理文件。` 说明需要配置ohpm
   
---

1. 配置 `ohpm` 环境变量。
   * 找到 `ohpm` 的安装路径。并追加一级 `\bin`。
   * ![img.png](screenshots/img.png)
   * 例如： `D:\program\HarmonySDK\ohpm\bin` 在环境变量 `path` 中新增。
   * 重新执行第 `0`步骤，验证是否配置成功。
---
2.  如何下载安装
* 浏览器搜索: `openHarmony三方库中心仓`
  * `https://ohpm.openharmony.cn/`
* 主页即可看到 `@ohos/axios` 包。或者搜索关键字 `Axios`
* 下载安装
  * 提前打开 项目根目录 `oh-package.json5` 文件观察效果
  * ![img.png](screenshots/beforeInstall.png)
  * 在 `DevEco Studio` 编辑器终端执行 ：`ohpm install @ohos/axios`
  * ![img.png](screenshots/afterInstall.png)
---
3.  使用Axios
* 需要权限: 
```
ohos.permission.INTERNET
```
* 需要导包
```typescript
import axios from '@ohos/axios'
```
* 使用
```typescript

      Button('点击翻译')
        .onClick(async () => {
          //发请求 携带输入的带翻译的内容
          console.log(this.message)
          //   axios请求 安装第三方包
          let uri = 'https://apis.tianapi.com/fanyi/index'
          let key = 'd94776b74d81b54caacefdaa560cb77c'
          let resObj:AxiosResponse =await axios.get(`${uri}?key=${key}&text=${this.message}`)

          console.log(JSON.stringify(resObj))
        })
```

---
## 通用翻译的语种列表：
> https://api.fanyi.baidu.com/product/113
