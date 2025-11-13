---
sidebar_position: 100
---

# 01：云函数学习

> 参考教程：黑马程序员端云一体话教程



AppGallery Connet网址：

https://developer.huawei.com/consumer/cn/service/josp/agc/index.html#/



## 端云一体化：云函数

#### 开发云函数步骤：

1. 新建项目和应用，开通云函数服务(AGC)
2. 使用端云一体化模板创建应用（DevEcoStudio)
3. 新建云函数（DevEcoStudio)
4. 编写云函数代码(DevEcoStudio)
5. 部署云函数（DevEcoStudio)
6. 配置和测试(AGC）

---

### 1. 新建项目和应用，开通云函数服务(AGC)

- #### 登录到AppGallery Connet新建项目

![image-20240307095313404](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307095313404.7eb33090.png)

![image-20240307095425071](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307095425071.0f7e1fa0.png)

![image-20240307095441010](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307095441010.326d1290.png)

- #### 创建项目后，该项目中还没有应用。可以先添加应用，亦可先开通云函数。无先后顺序。

![image-20240307095611995](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307095611995.463a335c.png)

- #### 先开通云函数

![image-20240307095928573](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307095928573.20f54051.png)

![image-20240307095956983](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307095956983.e927f33f.png)

至此，云函数开通好了。

- #### 再添加应用

![image-20240307100057430](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307100057430.90aa604c.png)



![image-20240307100243016](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307100243016.01253b64.png)

---

### 2. 使用端云一体化模板创建应用（DevEcoStudio)

- #### 使用DevEcoStudio创建端云一体化项目

> 不同版本IDE可能显示模板有差异。此处截图为4.0

![image-20240307100530418](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307100530418.45a9ada3.png)



![image-20240307100901512](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307100901512.14f1fa3f.png)

![image-20240307100935290](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307100935290.59933f8a.png)

<img src="screenshots/image-20240307100949572.png" alt="image-20240307100949572" />

![image-20240307101327808](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307101327808.762a89b6.png)

![image-20240307101711309](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307101711309.1501c012.png)

### 3. 创建云函数

![image-20240307101849379](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307101849379.a5ed632f.png)

#### 默认生成云函数

```typescript
let myHandler = async function (event, context, callback, logger) {
  logger.info(event);

  // do something here

  callback({
    code: 0,
    desc: "Success."
  });
};

export { myHandler };
```

#### 云函数解释：

- 云函数使用的是ts语言。无需界面，所以不涉及arkts
- 触发时机
  - http请求
  - 云数据库（插入）
  - 云存储（上传文件）
- 四大参数
  - event 输入信息
  - context  ：上下文信息（环境变量）
  - callback  ： 输出（返回结果）
  - logger ：记录日志

### 4. 编写云函数代码

```typescript
let myHandler = async function (event, context, callback, logger) {
  logger.info(JSON.stringify(event));

  // do something here

  callback({
    code: 200,
    desc: "Hello Dxin Study Function."
  });
};

export { myHandler };
```

#### 运行云函数看效果

![image-20240307102609958](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307102609958.8dd90feb.png)

> 暂时没看出来去哪里看效果，稍后补充。



### 5. 部署云函数

![image-20240307103115027](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307103115027.36476776.png)

#### 部署成功后在AGC查看自己的云函数

![image-20240307103258754](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240307103258754.4780b30f.png)


### 6.测试云函数
![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-image.558c611c.png)
![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-image-1.f4a42cd3.png)
![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-image-2.f6d68579.png)

---

## 端侧调用云函数

### 1. 添加依赖 
使用端云一体化模板创建的项目自动添加了核心依赖
```typescript
  "dependencies": {
    "@hw-agconnect/cloud": "^1.0.0",
    "@hw-agconnect/hmcore": "^1.0.0",
    "@hw-agconnect/auth-component": "^1.0.0",
    "long": "5.2.1"
  }
```
![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-image-3.30e0b250.png)

### 2. 初始化AGConnect
> 使用云侧函数、数据科、存储等，前提是先初始化AGConnect。使用模板创建项目的时候，已经自动初始化了。

> 在 `src/main/ets/entryability/EntryAbility.ts`文件中可以查看初始化代码
```typescript
// 导入hmcore模块
 import { initialize } from '@hw-agconnect/hmcore';

   async onWindowStageCreate(windowStage: Window.WindowStage) {
    /* 
        读取src/main/resources/rawfile/agconnect-services.json文件。
        加载成二进制的数组类型。但是不能直接用。
        再讲该二进制数组类型转换成字符串类型
        最后再将字符串转换成js对象交给initialize()方法使用
    */
    const context = this.context
    const value = await context.resourceManager.getRawFileContent("agconnect-services.json");
    let json: string = buffer.from(value).toString("utf8");
    initialize(this.context, JSON.parse(json));
    // Main window is created, set main page for this ability
    windowStage.loadContent('pages/Index', (err, data) => {
     //...
    });
  }
```
> 以上代码分析发现，初始化AGConnect需要调用initialize函数读取`src/main/resources/> rawfile/agconnect-services.json`文件。而且参数是js对象类型。
>
> 其实可以有更简单的方式：使用import语句直接引入该文件。引入的结果就是js对象类型。
> 并且初始化的时机，应放在`onCreate()`中
> 
> 代码如下：

```typescript
// 导入json文件。结果就是js对象。注意直接引入json文件需要忽略ts错误
// @ts-ignore
import json from '../../resources/rawfile/agconnect-services.json'
onCreate() {
    // 初始化 AGConnect
    try {
      initialize(this.context, json);
    } catch (err) {
      hilog.error(0x000,'AGConnect初始化错误',JSON.stringify(err))
    }

    // ...
  }
```



`src/main/resources/rawfile/agconnect-services.json`文件是记录了云侧配置的文件。如果云侧做了配置修改，则需要从AGC平台下载该文件进行更新。下载位置如下：
![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-image-4.37b71a7e.png)


### 3. ArkTS界面开发


> 编写界面代码，使用`@ohos.agconnect.cloud`模块调用云侧接口。

![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-image-5.4a59e285.png)
> 
> 代码如下：
```ts
import cloud from '@hw-agconnect/cloud'

@Entry
@Component
struct MyIndex {
  @State message: string = '云函数返回值'

  build() {
    Row() {
      Column() {
        Button('调用云函数').fontSize(20)
          .onClick(async () => {
            const result = await cloud.callFunction({
              name: 'hello',
              version: '$latest', //最新版本，也可指定数字
              params: {}   //参数
            })
            // 返回的 result.getValue()  就是云函数的返回对象
            this.message = result.getValue().desc
          })
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```
> 测试效果只能使用模拟器或者真机。无法使用预览器。
>
>所以注意修改项目启动页面：`windowStage.loadContent('pages/MyIndex', (err, data) => {});`
>

### 4. ArkTS调用云函数

真机运行效果如下：点击按钮，调用云函数，返回自己云函数指定结果。

![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-recording.02d13033.gif)


## 云函数开发细节

### 1. 传参问题
> 在端侧调用云函数的时候，可以根据业务传参。
> 比如添加一个输入框。调用的时候将用户输入作为参数进行传递。

#### 端侧添加输入框
```typescript
import cloud from '@hw-agconnect/cloud'

@Entry
@Component
struct MyIndex {
  @State message: string = '云函数返回值'
  @State name:string = ''
  build() {
    Row() {
      Column() {
        TextInput({placeholder:'请输入姓名'})
          .onChange((value:string) => {
            this.name  = value
          })
        Button('调用云函数').fontSize(20)
          .onClick(async () => {
            const result = await cloud.callFunction({
              name: 'hello',
              version: '$latest', //最新版本，也可指定数字
              params: {
                name:this.name
              }   //参数
            })
            // 返回的 result.getValue()  就是云函数的返回对象
            this.message = result.getValue().desc
          })
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

#### 云函数接收参数
> 云函数接收参数，是通过http请求方式进行触发。格式参考官方指南。
> https://developer.huawei.com/consumer/cn/doc/AppGallery-connect-Guides/agc-cloudfunction-appx-event-0000001620581529

HTTP触发器:字段
```javascript
{
    "path": "yourpath",
    "httpMethod": "POST",
    "headers": {"Content-Type": "application/json"},
    "queryStringParameters": "key1=value1&key2=value2",
    "body": {"request": "Hello World!"},
    "isBase64Encoded": true
}
```

| 字段                  | 说明                                                         |
| --------------------- | ------------------------------------------------------------ |
| path                  | HTTP请求的触发URL的路径。                                    |
| httpMethod            | 触发器请求方式，目前HTTP触发器仅支持POST事件请求方式。       |
| headers               | 请求头，指明请求或描述消息，一般包含"authorization"、"content-length"、"x-tenant-id"、"x-business-id"、"x-product-id"、"content-type"、"connection"、"accept-encoding"等字段，可由您自定义。 |
| queryStringParameters | 查询参数，键值对形式，可以为多组。                           |
| body                  | 请求数据的消息体，可由您自定义，JSON格式的字符串，最大为4M。注意如果函数由应用客户端调用，在函数定义中需要在event.body获取应用客户端的传入的HTTP body体，再从body体中解析传入的参数值。 |
| isBase64Encoded       | 消息体是否为base64编码的布尔值标识。true：消息体为base64编码。false：消息体为非base64编码。 |

#### 编写云函数代码获取参数
```typescript
let myHandler = async function (event, context, callback, logger) {
  logger.info(JSON.stringify(event));

  // 获取端侧参数
  /*
   * 注意，此时event.body的结果是一个json字符串。
   * 记得解析成对象
   * */
  const name= JSON.parse(event.body).name

  callback({
    code: 200,
    desc: "Hello " +  name  //将端侧的参数响应回去
  });
};

export { myHandler };

```

#### 重新部署测试
>> 云函数需要重新部署到AGC
>
> >端侧代码也要重新部署到真机或模拟器
>
> >真机运行测试

![alt text](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/AppGalleryStudy-recording-1.9faa5026.gif)

---
### 2. 环境变量


### 3. 流量治理
















