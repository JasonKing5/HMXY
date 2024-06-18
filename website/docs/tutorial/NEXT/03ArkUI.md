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
- 通过`lineHeight`属性设置文本行高。
- 通过`baselineOffset`属性设置文本基线的偏移量。
- 通过`letterSpacing`属性设置文本字符间距。
- 通过`minFontSize`与`maxFontSize`自适应字体大小，`minFontSize`设置文本最小显示字号，`maxFontSize`设置文本最大显示字号，`minFontSize`与`maxFontSize`必须搭配同时使用，以及需配合`maxline`或布局大小限制一起使用，单独设置不生效。
- 通过`copyOption`属性设置文本是否可复制粘贴。

### 事件

`Text`组件可以添加通用事件，可以绑定`onClick`、`onTouch`等事件来响应操作。

由于`Span`组件无尺寸信息，事件仅支持添加点击事件`onClick`。

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

