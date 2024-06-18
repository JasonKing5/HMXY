---
sidebar_position: 103
---
> ArkUI组件系统过一遍


# 03 ArkUI



## 按钮 (Button)
Button是按钮组件，通常用于响应用户的点击操作，其类型包括胶囊按钮、圆形按钮、普通按钮。Button做为容器使用时可以通过添加子组件实现包含文字、图片等元素的按钮。具体用法请参考Button。

### 创建按钮
Button通过调用接口来创建，接口调用有以下两种形式：

1. 创建不包含子组件的按钮。

```typescript
Button(label?: ResourceStr, options?: { type?: ButtonType, stateEffect?: boolean })
```
其中，label用来设置按钮文字，type用于设置Button类型，stateEffect属性设置Button是否开启点击效果。

```typescript
Button('Ok', { type: ButtonType.Normal, stateEffect: true }) 
  .borderRadius(8) 
  .backgroundColor(0x317aff) 
  .width(90)
  .height(40)
```

2. 创建包含子组件的按钮。

```typescript
Button(options?: {type?: ButtonType, stateEffect?: boolean})
```

只支持包含一个子组件，子组件可以是[基础组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-blank-V5)或者[容器组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-container-badge-V5)。

```typescript
Button({ type: ButtonType.Normal, stateEffect: true }) {
  Row() {
    Image($r('app.media.loading')).width(20).height(40).margin({ left: 12 })
    Text('loading').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
  }.alignItems(VerticalAlign.Center)
}.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)
```

### 设置按钮类型

Button有三种可选类型，分别为胶囊类型（Capsule）、圆形按钮（Circle）和普通按钮（Normal），通过type进行设置。

1. 胶囊按钮（默认类型）

此类型按钮的圆角自动设置为高度的一半，**不支持**通过`borderRadius`属性重新设置圆角。

```typescript
Button('Disable', { type: ButtonType.Capsule, stateEffect: false })   .backgroundColor(0x317aff)   .width(90)  .height(40)
```

![img](screenshots/03ArkUI/btnDisable.png)

2. 圆形按钮

此类型按钮为圆形，**不支持**通过`borderRadius`属性重新设置圆角。

```typescript
Button('Circle', { type: ButtonType.Circle, stateEffect: false })   .backgroundColor(0x317aff)   .width(90)   .height(90)
```

![img](screenshots/03ArkUI/btnCircle.png)

3. 普通按钮

此类型的按钮默认圆角为0，**支持**通过`borderRadius`属性重新设置圆角。

```typescript
Button('Ok', { type: ButtonType.Normal, stateEffect: true })   .borderRadius(8)   .backgroundColor(0x317aff)   .width(90)  .height(40)
```

![img](screenshots/03ArkUI/btnOK.png)

### 样式和事件

- 调用系统属性方法设置样式、也可以定义自定义属性方法。
- 正常绑定事件实现功能

---
## Text文本组件

Text是文本组件，通常用于展示用户视图，如显示文章的文字。具体用法请参考[Text](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-text-V5)。

### 创建文本

Text可通过以下两种方式来创建：

1. `string`字符串

```typescript
Text('帝心同学细的雅痞')
```

2. 引用`Resource`资源

   资源引用类型可以通过`$r`创建`Resource`类型对象，文件位置为/`resources/base/element/string.json`。

```typescript
Text($r('app.string.module_desc'))
  .baselineOffset(0)
  .fontSize(30)
  .border({ width: 1 })
  .padding(10)
  .width(300)
```

### 添加子组件

[Span](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-span-V5)只能作为[Text](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-text-V5)和[RichEditor](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-richeditor-V5)组件的子组件显示文本内容。可以在一个`Text`内添加多个`Span`来显示一段信息，例如产品说明书、承诺书等。

- 创建`Span`。

`Span`组件需要写到`Text`组件内，单独写`Span`组件不会显示信息，`Text`与`Span`同时配置文本内容时，`Span`内容**覆盖**`Text`内容。

```typescript
Text('我是Text') {
  Span('我是Span')
}
.padding(10)
.borderWidth(1)
```

### 常见属性方法

- 通过`decoration`设置文本装饰线及颜色。

- 通过`textCase`设置文字一直保持大写或者小写状态。

- 通过`textAlign`属性设置文本对齐样式

- 通过`textAlign`属性设置文本对齐样式。

- 通过`textOverflow`属性控制文本超长处理，`textOverflow`需配合`maxLines`一起使用（默认情况下文本自动折行）。

  - ```typescript
    textOverflow({ overflow: TextOverflow.None })
    ```

  - ```typescript
    textOverflow({ overflow: TextOverflow.Ellipsis })
    ```

  - ```typescript
    textOverflow({ overflow: TextOverflow.MARQUEE })    
    ```

- 通过`lineHeight`属性设置文本行高。

- 通过`baselineOffset`属性设置文本基线的偏移量。

- 通过`letterSpacing`属性设置文本字符间距。

- 通过`minFontSize`与`maxFontSize`自适应字体大小，`minFontSize`设置文本最小显示字号，`maxFontSize`设置文本最大显示字号，`minFontSize`与`maxFontSize`必须搭配同时使用，以及需配合`maxline`或布局大小限制一起使用，单独设置不生效。

- 通过`copyOption`属性设置文本是否可复制粘贴。

### 事件

`Text`组件可以添加通用事件，可以绑定`onClick`、`onTouch`等事件来响应操作。

由于`Span`组件无尺寸信息，事件仅支持添加点击事件`onClick`。

---
## 显示图片 (`Image`)

开发者经常需要在应用中显示一些图片，例如：按钮中的`icon`、网络图片、本地图片等。在应用中显示图片需要使用`Image`组件实现，`Image`支持多种图片格式，包括`png`、`jpg`、`bmp`、svg`和``gif`，具体用法请参考[Image](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-image-0000001815927572)组件。

`Image`通过调用接口来创建，接口调用形式如下：

```typescript
Image(src: PixelMap | ResourceStr | DrawableDescriptor)
```

该接口通过图片数据源获取图片，支持本地图片和网络图片的渲染展示。其中，src是图片的数据源，加载方式请参考[加载图片资源](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-graphics-display-0000001813416088#ZH-CN_TOPIC_0000001813416088__加载图片资源)。

### 加载图片资源

`Image`支持加`载存档图`、`多媒体像素图`两种类型。

#### 存档图类型数据源

存档图类型的数据源可以分为`本地资源`、网络资源、`Resource资源`、`媒体库资源`和`base64`。

- 本地资源

  创建文件夹，将本地图片放入ets文件夹下的任意位置。

  `Image`组件引入本地图片路径，即可显示图片（根目录为`ets`文件夹）。

  ```typescript
  Image('images/view.jpg').width(200)
  ```

- 网络资源

  引入网络图片需申请权限`ohos.permission.INTERNET`，具体申请方式请参考[声明权限](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/declare-permissions-0000001820999665)。此时，`Image`组件的`src`参数为网络图片的链接。

  `Image`组件首次加载网络图片时，需要请求网络资源，非首次加载时，默认从缓存中直接读取图片，更多图片缓存设置请参考[setImageCacheCount](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-system-app-0000001821000765#ZH-CN_TOPIC_0000001857876165__setimagecachecount7)、[setImageRawDataCacheSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-system-app-0000001821000765#ZH-CN_TOPIC_0000001857876165__setimagerawdatacachesize7)、[setImageFileCacheSize](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-system-app-0000001821000765#ZH-CN_TOPIC_0000001857876165__setimagefilecachesize7)。

  > 如果是预览器，未申请网络权限时，也可以打开

  ```typescript
  Image('https://foruda.gitee.com/avatar/1680571445959229147/9556293_mayuanwei_1680571445.png') 
  ```

- `Resource`资源 : 使用资源格式可以`跨包`/`跨模块`引入图片，`resources文件夹`下的图片都可以通过`$r`资源接口读 取到并转换到`Resource格式`。

  **图1** `resources`

![img](screenshots/03ArkUI/media.jpg)

```typescript
Image($r('app.media.icon'))
```

**图2** `rawfile` : 还可以将图片放在rawfile文件夹下。

![rawfile.jpg](screenshots/03ArkUI/rawfile.jpg)

```typescript
Image($rawfile('example1.png'))
```

- 媒体库 `file://data/storage`

支持`file://`路径前缀的字符串，用于访问通过[媒体库](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-file-picker-0000001774121766)提供的图片路径。从媒体库获取的url格式通常如下。

```typescript
Image('file://media/Photos/5')
.width(200)
```

- base64

  路径格式为 `data:image/[png|jpeg|bmp|webp];base64,[base64 data]` ，其中 `[base64 data]` 为`Base64`字符串数据。

  `Base64`格式字符串可用于存储图片的像素数据，在网页上使用较为广泛。

#### 多媒体像素图

`PixelMap`是图片解码后的像素图，具体用法请参考[图片开发指导](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/image-overview-0000001821000129)。以下示例将加载的网络图片返回的数据解码成`PixelMap`格式，再显示在`Image`组件上，



### 显示矢量图

`Image`组件可显示矢量图（`svg`格式的图片），支持的`svg`标签为：`svg`、`rect`、`circle`、`ellipse`、`path`、`line`、`polyline`、`polygon`和`animate`。

`svg`格式的图片可以使用`fillColor`属性改变图片的绘制颜色。

```typescript
Image($r('app.media.cloud'))
  .width(50)
  .fillColor(Color.Blue) 
```



### 属性

- 设置图片缩放类型：通过`objectFit`属性使图片缩放到高度和宽度确定的框内。

- 图片插值：当原图分辨率较低并且放大显示时，图片会模糊出现锯齿。这时可以使用`interpolation`属性对图片进行插值，使图片显示得更清晰。

- 设置图片重复样式：通过`objectRepeat`属性设置图片的重复样式方式，重复样式请参考[ImageRepeat](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-appendix-enums-0000001815927712#ZH-CN_TOPIC_0000001815927712__imagerepeat)枚举说明。

- 设置图片渲染模式：通过`renderMode`属性设置图片的渲染模式为原色或黑白。

- 设置图片解码尺寸：通过`sourceSize`属性设置图片解码尺寸，降低图片的分辨率。

- 为图片添加滤镜效果：通过`colorFilter`修改图片的像素颜色，为图片添加滤镜。

- 同步加载图片：一般情况下，图片加载流程会异步进行，以避免阻塞主线程，影响UI交互。但是特定情况下，图片刷新时会出现闪烁，这时可以使用`syncLoad`属性，使图片同步加载，从而避免出现闪烁。不建议图片加载较长时间时使用，会导致页面无法响应。

  ```typescript
  Image($r('app.media.icon'))
    .syncLoad(true)
  ```

  

### 事件调用

通过在`Image`组件上绑定`onComplete`事件，图片加载成功后可以获取图片的必要信息。如果图片加载失败，也可以通过绑定`onError`回调来获得结果。

---

## Slider滑块组件

滑动条组件，通常用于快速调节设置值，如音量调节、亮度调节等应用场景。

### 接口

```typescript
Slider(options?: SliderOptions)
```

### SliderOptions对象说明

> 详细内容请参考官方文档，此处只以代码展示

```typescript
  Slider({
        min:0,
        max:100,
        value:40,
        step:10,
        // 滑块在外面 || 里面
        // style:SliderStyle.OutSet,
        style:SliderStyle.InSet,
        // 横向 或者  纵向
        direction:Axis.Horizontal,
        // direction:Axis.Vertical,
        // 是否反向滑动
        reverse:false
      })
        .width('90%')
        .showTips(true)   // 滑动时候展示百分比
        .blockColor('#ffe2109c')    // 滑块颜色
        // 改变滑块时 会获取当前滑块值  60%的时候好像有点异常 但是无伤大雅
        .onChange((value) => {
          this.sliderVal1 = value
        })
```

### 案例：风车效果

![SliderCase](screenshots/03ArkUI/SliderCase.gif)

```typescript
import { router } from '@kit.ArkUI'
import { RouterParm } from '../../model/MyRouterInfo'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct SliderPage {
  pageName: string = (router.getParams() as RouterParm)?.pageName || '滑块组件'
  @State message: string = this.pageName
  // 初始化风车旋转角度
  @State angle: number = 0
  // 初始化缩放倍数
  @State imageSize: number = 1
  //默认初始化速度
  @State speed: number = 5
  // 定时器timmer
  private interval: number = 0

  // 页面加载，定时修改旋转速度
  onPageShow(): void {
    // 避免定时器重复。先清空
    clearInterval(this.interval)
    this.interval = setInterval(() => {
      this.angle += this.speed
    }, 15)
  }

  build() {
    Column({ space: 30 }) {
      TopTitle({ message: this.message })
      Blank()
      // 添加风车
      Image($rawfile('windmill.png'))
        .windmillStyle(this.angle,this.imageSize)


      Blank()
      // 速度面版
      SliderPanels({
        title: '速度',
        // 父子双向数据联动
        sliderVal: this.speed,
        mark: 'S',
        options: {
          min: 1,
          max: 10,
          step: 1,
          value: this.speed,
          style: SliderStyle.InSet
        },
        selectedColor: '#ff0be775'
      })

      // 缩放面版Panels
      SliderPanels({
        title: '缩放比例',
        // 父子双向数据联动
        sliderVal: this.imageSize,
        mark: 'A',
        options: {
          min: .5,
          max: 2.5,
          step: .1,
          value: this.imageSize,
          style: SliderStyle.InSet
        },
        selectedColor: '#ffb8cf54'
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}

@Component
struct SliderPanels {
  title: string = '面板标题'
  @Link sliderVal: number
  //滑块左右的标记提示
  mark: string = 'S'
  // 滑块SliderOptions
  options: SliderOptions = {
    value: this.sliderVal,
    min: 1,
    max: 10,
    step: 1,
    style: SliderStyle.InSet
  }
  // 滑块颜色
  selectedColor: string = '#ff0be775'

  build() {
    // 面版Panels
    Column({ space: 20 }) {
      Text(this.title)
        .fontSize(18)
      Column() {
        // 变成字符串，保留一位小数
        Text(this.sliderVal.toFixed(1))
        Row({ space: 10 }) {
          Text(this.mark)
            .fontSize(16)
          // 滑块组件
          Slider(this.options)
            .selectedColor(this.selectedColor)
            .layoutWeight(1)
            .onChange((value: number) => {
              this.sliderVal = value
            })
          Text(this.mark)
            .fontSize(22)
        }
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.White)
      .borderRadius(24)
      .height(100)
      .width('98%')
      .padding({
        left: 10,
        right: 10
      })
      .margin({
        top: 10,
        bottom: 10
      })
    }
    .width('100%')
    .padding({
      left: 10,
      right: 10
    })
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}


@Extend(Image)
function windmillStyle(angleVal:number,scaleVal:number){
  .width(150)
  .height(150)
  .objectFit(ImageFit.Contain)//   沿着Z轴旋转
  .rotate({
    z: 1,
    angle: angleVal
  })// 缩放值
  .scale({
    x: scaleVal,
    y: scaleVal
  })
}
```

