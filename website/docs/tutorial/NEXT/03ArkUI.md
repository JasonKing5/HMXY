---
sidebar_position: 103
---
> ArkUI基础组件


#  ArkUI



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
Button('Disable', { type: ButtonType.Capsule, stateEffect: false })   
    .backgroundColor(0x317aff)   
    .width(90)  
    .height(40)
```

![img](screenshots/03ArkUI/btnDisable.png)

2. 圆形按钮

此类型按钮为圆形，**不支持**通过`borderRadius`属性重新设置圆角。

```typescript
Button('Circle', { type: ButtonType.Circle, stateEffect: false })   
    .backgroundColor(0x317aff)   
    .width(90)   
    .height(90)
```

![img](screenshots/03ArkUI/btnCircle.png)

3. 普通按钮

此类型的按钮默认圆角为0，**支持**通过`borderRadius`属性重新设置圆角。

```typescript
Button('Ok', { type: ButtonType.Normal, stateEffect: true })   
    .borderRadius(8)   
    .backgroundColor(0x317aff)   
    .width(90)  
    .height(40)
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
Text('我以江月敬浮生')
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
Text('我以江月敬浮生') {
  Span('郁江孤影憾不平')
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

> 也可以绑定通用事件，如点击、触摸等

---

## 文本输入 (TextInput/TextArea)

`TextInput`、`TextArea`是输入框组件，通常用于响应用户的输入操作，比如评论区的输入、聊天框的输入、表格的输入等，也可以结合其它组件构建功能页面，例如登录注册页面。具体用法请参考[TextInput](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-textinput-V5)、[TextArea](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-textarea-V5)。

### 创建输入框

`TextInput`为单行输入框、TextArea为多行输入框。通过以下接口来创建。

```typescript
TextInput(value?:{placeholder?: ResourceStr, text?: ResourceStr, controller?: TextInputController})
```

```typescript
TextArea(value?:{placeholder?: ResourceStr, text?: ResourceStr, controller?: TextAreaController})
```

- 单行输入框

```typescript
TextInput()
```

- 多行输入框

  > 多行输入框文字超出一行时会自动折行。

```typescript
TextArea()
```

### 设置输入框类型

`TextInput`有9种可选类型，通过type属性进行设置：

1. `Normal`基本输入模式
2. `Password`密码输入模式
3. `Email`邮箱地址输入模式
4. `Number`纯数字输入模式
5. `PhoneNumber`电话号码输入模式
6. `USER_NAME`用户名输入模式
7. `NEW_PASSWORD`新密码输入模式
8. `NUMBER_PASSWORD`纯数字密码输入模式
9. `NUMBER_DECIMAL`带小数点的数字输入模式。

例如：

```typescript
TextInput()
  .type(InputType.Password)
```

### 样式

- `placeholder` 设置无输入时的提示文本。`text` 设置输入框当前的文本内容。

  > 如果同时设置，则显示`text`内容

  ```typescript
  TextInput({placeholder:'我是提示文本',text:'我是当前文本内容'})
  ```

- 通用属性方法：`尺寸`、`背景色`等

### 事件

文本框主要用于获取用户输入的信息，把信息处理成数据进行上传，绑定`onChange`事件可以获取输入框内改变的内容。用户也可以使用`通用事件`来进行相应的交互操作。

```typescript
TextInput()
  .onChange((value: string) => {
    console.info(value);
  })
  .onFocus(() => {
    console.info('获取焦点');
  })
```

---

## 进度条 (Progress)

`Progress`是进度条显示组件，显示内容通常为目标操作的当前进度。具体用法请参考[Progress](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-progress-V5)。

### 创建进度条

`Progress`通过调用接口来创建，接口调用形式如下：

```typescript
Progress(options: {value: number, total?: number, type?: ProgressType})
```

其中，`value`用于设置初始进度值，`total`用于设置进度总长度，`type`用于设置`Progress`样式。

```typescript
Progress({ value: 24, total: 100, type: ProgressType.Linear }) // 创建一个进度总长为100，初始进度值为24的线性进度条
```

### 设置进度条样式

> 从API version9开始，组件高度大于宽度时，自适应垂直显示；组件高度等于宽度时，保持水平显示。

`Progress`有**5**种可选类型，通过`ProgressType`可以设置进度条样式，`ProgressType`类型包括：

1. `ProgressType.Linear`（线性样式）
2. `ProgressType.Ring`（环形无刻度样式）
3. `ProgressType.ScaleRing`（环形有刻度样式）
4. `ProgressType.Eclipse`（圆形样式）
5. `ProgressType.Capsule`（胶囊样式）。

### 属性方法

- 环形无刻度样式进度条

```typescript
// 从左往右，1号环形进度条，默认前景色为蓝色渐变，默认strokeWidth进度条宽度为2.0vp
Progress({ value: 40, total: 150, type: ProgressType.Ring })
    .width(100)
    .height(100)
// 从左往右，2号环形进度条
Progress({ value: 40, total: 150, type: ProgressType.Ring })
    .width(100)
    .height(100)
    .color(Color.Grey)    // 进度条前景色为灰色
    .style({ strokeWidth: 15})    // 设置strokeWidth进度条宽度为15.0vp
```

- 环形有刻度样式进度条

```typescript
Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
    .width(100)
    .height(100)
    .backgroundColor(Color.Black)
    .style({ scaleCount: 20, scaleWidth: 5 })    // 设置环形有刻度进度条总刻度数为20，刻度宽度为5vp
Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
    .width(100)
    .height(100)
    .backgroundColor(Color.Black)
    .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 5 })    // 设置环形有刻度进度条宽度15，总刻度数为20，刻度宽度为5vp
Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
    .width(100)
    .height(100)
    .backgroundColor(Color.Black)
    .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 3 })    // 设置环形有刻度进度条宽度15，总刻度数为20，刻度宽度为3vp
```

- 圆形样式进度条
- 胶囊样式进度条
- ...

### 场景示例

​		更新当前进度值，如应用安装进度条。可通过点击`Button`增加`progressValue`，`value`属性将`progressValue`设置给`Progress`组件，进度条组件即会触发刷新，更新当前进度。

```typescript
@Entry
@Component
struct ProgressCase1 { 
  @State progressValue: number = 0    // 设置进度条初始值为0
  build() {
    Column() {
      Column() {
        Progress({value:0, total:100, type:ProgressType.Capsule})
            .width(200)
            .height(50)
            .value(this.progressValue)
        Row()
            .width('100%')
            .height(5)
        Button("进度条+5")
          .onClick(()=>{
            this.progressValue += 5
            if (this.progressValue > 100){
              this.progressValue = 0
            }
          })
      }
    }
      .width('100%')
      .height('100%')
  }
}
```

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

---

## 单选框 (Radio)

`Radio`是单选框组件，通常用于提供相应的用户交互选择项，同一组的`Radio`中只有一个可以被选中。具体用法请参考[Radio](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-radio-V5)

### 创建单选框

`Radio`通过调用接口来创建，接口调用形式如下：

```typescript
Radio(options: {value: string, group: string})
```

​		其中，`value`是单选框的名称，`group`是单选框的所属群组名称。`checked`属性可以设置单选框的状态，状态分别为`false`和`true`，设置为`true`时表示单选框被选中。

`Radio`支持设置选中状态和非选中状态的样式，不支持自定义形状。

```typescript
Radio({ value: 'Radio1', group: 'radioGroup' })  
    .checked(false)
Radio({ value: 'Radio2', group: 'radioGroup' })  
    .checked(true)
```

### 添加事件

除支持[通用事件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-universal-events-click-V5)外，`Radio`还用于选中后触发某些操作，可以绑定`onChange`事件来响应选中操作后的自定义行为。

```typescript
  Radio({ value: 'Radio1', group: 'radioGroup' })
    .onChange((isChecked: boolean) => {
      if(isChecked) {
        //需要执行的操作
      }
    })
  Radio({ value: 'Radio2', group: 'radioGroup' })
    .onChange((isChecked: boolean) => {
      if(isChecked) {
        //需要执行的操作
      }
    })
```

### 场景演示：

通过点击Radio切换声音模式。

![RadioCase](screenshots/03ArkUI/RadioCase.gif)

```typescript
// radio案例
@Entry
@Component
struct RadioCase {
  @State soundModel: string = '响铃';

  build() {
    Column({ space: 50 }) {
      // 一行三个单选框
      Row(){
        RadioItem({
          radioVal:'sound1',
          soundModel:this.soundModel,
          modelName:'响铃',
          currentState:true
        })
        RadioItem({
          radioVal:'sound2',
          soundModel:this.soundModel,
          modelName:'静音'
        })
        RadioItem({
          radioVal:'sound3',
          soundModel:this.soundModel,
          modelName:'震动'
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      Text(){
        Span('当前为：')
          .fontSize(20)
        Span(this.soundModel)
          .fontSize(20)
          .fontWeight(700)
          .fontColor('#ffb926d9')
        Span('模式')
          .fontSize(20)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct RadioItem {
  modelName:string ='模式'
  radioVal:string = 'radio0'
  //默认状态
  currentState:boolean = false
  //和父组件同步数据
  @Link soundModel :string
  build() {
    Column({space:10}){
      Radio({value:this.radioVal,group:'soundModel'})
        .width(50)
        .height(50)
        .onChange((isChecked:boolean) => {
          if (isChecked) this.soundModel =  this.modelName
        })
        .checked(this.currentState)
      Text( this.modelName).fontSize(20)
    }
  }
}
```

---

## 切换按钮 (Toggle)

`Toggle`组件提供状态按钮样式、勾选框样式和开关样式，一般用于两种状态之间的切换。具体用法请参考[Toggle](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-basic-components-toggle-V5)。

### 创建切换按钮

`Toggle`通过调用接口来创建，接口调用形式如下：

```typescript
Toggle(options: { type: ToggleType, isOn?: boolean })
```

其中，`ToggleType`为开关类型，包括`Button`、`Checkbox`和`Switch`，`isOn`为切换按钮的状态。

>  API version 11开始，`Checkbox`默认样式由圆角方形变为圆形。

接口调用有以下两种形式：

- 创建不包含子组件的`Toggle`。

  当`ToggleType`为`Checkbox`或者`Switch`时，用于创建不包含子组件的Toggle：

  ```typescript
  Toggle({ type: ToggleType.Checkbox, isOn: false })
  Toggle({ type: ToggleType.Checkbox, isOn: true })
  ```

![img](screenshots/03ArkUI/ToggleCheckbox.png)

```typescript
Toggle({ type: ToggleType.Switch, isOn: false })
Toggle({ type: ToggleType.Switch, isOn: true })
```

![img](screenshots/03ArkUI/ToggleSwitch.png)

- 创建包含子组件的`Toggle`。

当`ToggleType`为`Button`时，只能包含一个子组件，如果子组件有文本设置，则相应的文本内容会显示在按钮上。

```typescript
Toggle({ type: ToggleType.Button, isOn: false }) {
  Text('status button')
    .fontColor('#182431')
    .fontSize(12)
}.width(100)
Toggle({ type: ToggleType.Button, isOn: true }) {
  Text('status button')
    .fontColor('#182431')
    .fontSize(12)
}.width(100)
```

![img](screenshots/03ArkUI/ToggleButton.png)

### 自定义样式

- 通过`selectedColor`属性设置`Toggle`打开选中后的背景颜色。
- 通过`switchPointColor`属性设置`Switch`类型的圆形滑块颜色，仅对`type`为`ToggleType.Switch`生效。

### 添加事件

除支持[通用事件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-universal-events-click-V5)外，`Toggle`还用于选中和取消选中后触发某些操作，可以绑定`onChange`事件来响应操作后的自定义行为。

```typescript
Toggle({ type: ToggleType.Switch, isOn: false })
  .onChange((isOn: boolean) => {
      if(isOn) {
        // 需要执行的操作
      }
  })
```

### 场景示例

`Toggle`用于切换蓝牙开关状态。

![ToggoleCase](screenshots/03ArkUI/ToggoleCase.gif)

```typescript
// Toggle用于切换蓝牙开关状态。
@Entry
@Component
struct ToggleCase {
  @State BluetoothState: string = 'off';

  build() {
    Column({ space: 30 }) {
      Text("Bluetooth Mode")
        .height(50)
        .fontSize(30)
      Row() {
        Text("Bluetooth")
          .fontSize(16)
        Toggle({ type: ToggleType.Switch })
          .width(50)
          .onChange((isOn: boolean) => {
            this.BluetoothState = isOn ? ' on' : ' off'
          })
      }
      .width('90%')
      .height(50)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left:10,
        right:20
      })
      .backgroundColor(0xFFFFFF)

      Text() {
        Span('bluetooth is ')
          .font({ size: 30, weight: 700 })
        Span(this.BluetoothState)
          .font({ size: 30, weight: 700 })
          .fontColor('#bb2b2b')
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}
```

---

## 自定义弹窗 (CustomDialog)

​		`CustomDialog`是自定义弹窗，可用于广告、中奖、警告、软件更新等与用户交互响应操作。开发者可以通过`CustomDialogController`类显示自定义弹窗。具体用法请参考[自定义弹窗](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-methods-custom-dialog-box-V5)。

### 创建自定义弹窗

1. 使用`@CustomDialog`装饰器装饰自定义弹窗。

2. `@CustomDialog`装饰器用于装饰自定义弹框，此装饰器内进行自定义内容（也就是弹框内容）。

   ```typescript
   // 1. 自定义弹窗 CustomDialog1  弹窗控制器中需要给出 builder，配置弹出哪个弹窗
   @CustomDialog
   struct CustomDialog1{
     dialogController:CustomDialogController = new CustomDialogController({
       builder:CustomDialog1()
     })
     build() {
       Column() {
         Text(`我家猫会后空翻`)
           .fontSize(20)
       }
     }
   }
   ```
   
3. 创建构造器，与装饰器呼应相连。

4. 点击与onClick事件绑定的组件使弹窗弹出。

   ```typescript
   /*
    * 1. 使用`@CustomDialog`装饰器装饰自定义弹窗。
    * 2. 在自定义弹窗内完成： 控制器+布局
    * 3. 在入口组件：控制器 + 根据业务触发弹窗
    * */
   @Entry
   @Component
   struct CustomDialogDemo1 {
     // 入口组件 控制器
     dialogController:CustomDialogController = new CustomDialogController({
       builder:CustomDialog1()
     })
   
     build() {
       Column({ space: 30 }) {
         Button('click me open CustomDialog1...')
           .onClick(() => {
             this.dialogController.open()
           })
       }
       .width('100%')
       .height('100%')
       .backgroundColor($r('app.color.theme_color'))
       .justifyContent(FlexAlign.Center)
     }
   }
   
   ```

   

### 弹窗的交互

弹窗可用于数据交互，完成用户一系列响应操作。

1. 在@CustomDialog装饰器内添加按钮，同时添加数据函数。

```typescript
// 带有取消和确认按钮的弹窗
@CustomDialog
struct CustomDialog2 {
  cancel?: () => void
  confirm?: () => void
  // 定义弹窗时，该控制器 需要默认值。否则预览报错。而如果设置？表示可选，即默认null。按钮业务中调用close方法又会编译不通过
  controller: CustomDialogController = new CustomDialogController({
    builder:CustomDialog2()
  })

  build() {
    Column() {
      Text('我是CustomDialogDemo2内容').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .backgroundColor(0xffffff).fontColor(Color.Black)
          .onClick(() => {
            this.controller.close() // 关闭弹窗
            if (this.cancel) {
              this.cancel() //调用处传递
            }
          })
        Button('确认')
          .backgroundColor(0xffffff).fontColor(Color.Red)
          .onClick(() => {
            this.controller.close() // 关闭弹窗
            if (this.confirm) {
              this.confirm() //调用处传递
            }
          })
      }
    }
  }
}
```

2. 页面内需要在构造器内进行接收，同时创建相应的函数操作。

```typescript
// 弹窗的交互
@Entry
@Component
struct CustomDialogDemo2 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog2({
      // 点击【取消】按钮时执行
      cancel: () => {
        this.onCancel()
      },
      // 点击【确认】按钮时执行
      confirm: () => {
        this.onAccept()
      }
    })
  })

  onCancel() {
    console.info('当【取消】按钮被点击时执行业务代码')
  }

  onAccept() {
    console.info('当【确认】按钮被点击时执行业务代码')
  }

  build() {
    Column({ space: 30 }) {
      Button('click me open CustomDialog2...')
        .onClick(() => {
          this.dialogController.open()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}
```

### 弹窗的动画

弹窗通过定义`openAnimation`控制弹窗出现动画的持续时间，速度等参数。

```typescript
// 弹窗的动画
@Entry
@Component
struct CustomDialogDemo3 {
  @State textValue: string = ''
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialog3(),
    // 弹窗动画效果
    openAnimation: {
      duration: 1200,
      curve: Curve.Friction,
      delay: 500,
      playMode: PlayMode.Alternate,
      onFinish: () => {
        console.info('play end')
      }
    },
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    // 弹窗位置
    offset: { dx: 0, dy: -50 },
    // 弹窗的尺寸
    gridCount: 4,
    customStyle: false,
    backgroundColor: 0xd9ffffff,
    cornerRadius: 10,
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }

  build() {
    Column({ space: 30 }) {
      Button(`弹窗动画效果`)
        .backgroundColor('#bb2b2b')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

@CustomDialog
struct CustomDialog3 {
  controller?: CustomDialogController

  build() {
    Column() {
      Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 })
    }
  }
}
```























---

## 视频播放 (Video)









