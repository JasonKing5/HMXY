---
sidebar_position: 106
---
# 06：动画和网络



# 动画概述

ArkUI中，产生动画的方式是改变属性值且指定动画参数。动画参数包含了如动画时长、变化规律（即曲线）等参数。当属性值发生变化后，按照动画参数，从原来的状态过渡到新的状态，即形成一个动画。

**AnimateParam对象说明**

| **名称**   | **类型**                                                     | **描述**                                                     |
| ---------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| duration   | number                                                       | 动画持续时间，单位为毫秒。默认值：1000从API version 9开始，该接口支持在ArkTS卡片中使用。**说明：**- 在ArkTS卡片上最大动画持续时间为1000毫秒，若超出则固定为1000毫秒。- 设置浮点型类型的值时，向下取整。例如，设置值为1.2，按照1处理。 |
| tempo      | number                                                       | 动画的播放速度，值越大动画播放越快，值越小播放越慢，为0时无动画效果。默认值：1.0 |
| curve      | [Curve](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-appendix-enums-0000001478061741-V3#ZH-CN_TOPIC_0000001574248789__curve) \| [ICurve](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-curve-0000001427585072-V3#ZH-CN_TOPIC_0000001523808354__icurve) \| string | 动画曲线。默认值：Curve.EaseInOut从API version 9开始，该接口支持在ArkTS卡片中使用。 |
| delay      | number                                                       | 单位为ms(毫秒)，默认不延时播放。默认值：0**说明：**- 设置浮点型类型的值时，向下取整。例如，设置值为1.2，按照1处理。 |
| iterations | number                                                       | 默认播放一次，设置为-1时表示无限次播放。默认值：1            |
| playMode   | [PlayMode](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-appendix-enums-0000001478061741-V3#ZH-CN_TOPIC_0000001574248789__playmode) | 设置动画播放模式，默认播放完成后重头开始播放。默认值：PlayMode.Normal从API version 9开始，该接口支持在ArkTS卡片中使用。相关使用约束请参考PlayMode说明。 |
| onFinish   | () => void                                                   | 动效播放完成回调。从API version 9开始，该接口支持在ArkTS卡片中使用。 |

## 动画分类

- ArkUI提供的动画能力按照页面的分类方式，可分为页面内的动画和页面间的动画。页面内的动画指在一个页面内即可发生的动画，页面间的动画指两个页面跳转时才会发生的动画。
- 如果按照基础能力分，可分为属性动画、显式动画、转场动画三部分。

按照页面分类的动画

![image-20240211105135884](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/image-20240211105135884.e7f202ab.png)

按照基础能力分类的动画

## 页面内的动画

### 布局更新动画

- 使用显式动画产生布局更新动画
- 使用属性动画产生布局更新动画

[显式动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-explicit-animation-0000001478341181-V3)（animateTo）和[属性动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-animatorproperty-0000001478181445-V3)（animation）是ArkUI提供的最基础和常用的动画功能。在布局属性（如[尺寸属性](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-universal-attributes-size-0000001428061700-V3)、[位置属性](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-universal-attributes-location-0000001427584824-V3)）发生变化时，可以通过属性动画或显式动画，按照动画参数过渡到新的布局参数状态。

| **动画类型**          | **特点**                                                     |
| --------------------- | ------------------------------------------------------------ |
| 显式动画 （函数）     | 闭包内的变化均会触发动画，包括由数据变化引起的组件的增删、组件属性的变化等，可以做较为复杂的动画。 |
| 属性动画 （属性方法） | 动画设置简单，属性变化时自动触发动画。（属性值的变化需要加在animation属性之前） |

#### **使用显式动画产生布局更新动画**

显式动画的接口为：

```JavaScript
animateTo(value: AnimateParam, event: () => void): void
```

第一个参数指定动画参数，第二个参数为动画的闭包函数。

##### 案例：位置变化

![显示动画-位置变化](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/xianshi1.0e5f42d4.gif)

```JavaScript
// 显示动画 ： 位置变化
@Entry
@Component
struct LayoutChange {
  // 用于控制Column的alignItems属性
  @State itemAlign: HorizontalAlign = HorizontalAlign.Start;
  allAlign: HorizontalAlign[] = [HorizontalAlign.Start, HorizontalAlign.Center, HorizontalAlign.End];
  alignIndex: number = 0;

  build() {
    Column({space:30}) {
      Text('点击修改布局位置').fontSize(30).margin({top:100})
      Column({ space: 10 }) {
        Button("帝心").width(100).height(50)
        Button("庄生").width(100).height(50)
        Button("周道").width(100).height(50)
      }
      .margin(20)
      .alignItems(this.itemAlign)
      .justifyContent(FlexAlign.Center)
      .borderWidth(2)
      .width("90%")
      .height(200)

      Button("click")
        .onClick(() => {
        // 动画时长为1000ms，曲线为EaseInOut
        animateTo({ duration: 1000, curve: Curve.EaseInOut }, () => {
          this.alignIndex = (this.alignIndex + 1) % this.allAlign.length;
          // 在闭包函数中修改this.itemAlign参数，使Column容器内部孩子的布局方式变化，使用动画过渡到新位置
          this.itemAlign = this.allAlign[this.alignIndex];
        });
      })
        .fontSize(30)
    }
    .width("100%")
    .height("100%")
  }
}
```

##### 案例：尺寸变化

![显示动画-尺寸变化](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/xianshi2.46fd1dda.gif)

```JavaScript
// 显示动画：尺寸变化
@Entry
@Component
struct LayoutChange2 {
  @State myWidth: number = 100;
  @State myHeight: number = 50;
  // 标志位，true和false分别对应一组myWidth、myHeight值
  @State flag: boolean = false;

  build() {
    Column({ space: 10 }) {
      Button("change:尺寸")
        .type(ButtonType.Normal)
        .width(this.myWidth)
        .height(this.myHeight)
        .margin(20)
      Button(this.flag ? '变小' : '变大')
        .fontSize(20)
        .position({ x: "40%", y: 250 })
        .margin(20)
        .onClick(() => {
          animateTo({ duration: 1000, curve: Curve.Ease }, () => {
            // 动画闭包中根据标志位改变控制第一个Button宽高的状态变量，使第一个Button做宽高动画
            if (this.flag) {
              this.myWidth = 100;
              this.myHeight = 50;
            } else {
              this.myWidth = 200;
              this.myHeight = 100;
            }
            this.flag = !this.flag;
          });
        })
    }
    .width("100%")
    .height("100%")
  }
}
```

##### 案例：角度变化

![显示动画-角度变化](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/xianshi3.666b6d33.gif)

```JavaScript
// 显示动画-角度改变
@Entry
@Component
struct LayoutChange3 {
  @State message: string = '角度改变动画'
  @State rotateAngle: number = 0
  @State flag: boolean = false

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Image($r('app.media.afterDixin'))
          .width(300)
          .height(300)
          .borderRadius(150)
          .rotate({
            x: 1,
            y: 1,
            z: 1,
            angle: this.rotateAngle
          })
          .onClick(() => {
            animateTo({}, () => {
              if (this.flag) {
                this.rotateAngle = 0
              } else {
                this.rotateAngle = 640
              }
              this.flag = !this.flag
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

##### 扩展：弹簧曲线动画

ArkUI提供了[预置动画曲线](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-appendix-enums-0000001478061741-V3#ZH-CN_TOPIC_0000001574248789__curve)，指定了动画属性从起始值到终止值的变化规律，如Linear、Ease、EaseIn等。同时，ArkUI也提供了由弹簧振子物理模型产生的弹簧曲线。通过弹簧曲线，开发者可以设置超过设置的终止值，在终止值附近震荡，直至最终停下来的效果。弹簧曲线的动画效果比其他曲线具有更强的互动性、可玩性。

弹簧曲线的接口包括两类，一类是[springCurve](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-curve-0000001427585072-V3#ZH-CN_TOPIC_0000001523808354__curvesspringcurve9)，另一类是[springMotion](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-curve-0000001427585072-V3#ZH-CN_TOPIC_0000001523808354__curvesspringmotion9)和[responsiveSpringMotion](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-curve-0000001427585072-V3#ZH-CN_TOPIC_0000001523808354__curvesresponsivespringmotion9)，这两种方式都可以产生弹簧曲线。

[弹簧曲线动画-页面内的动画-使用动画-基于ArkTS的声明式开发范式-UI开发-开发-HarmonyOS应用开发](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-spring-animation-0000001450915478-V3)

> 自行根据文档学习

#### **使用属性动画产生布局更新动画**

显式动画把要执行动画的属性的修改放在闭包函数中触发动画，而属性动画则无需使用闭包，把animation属性加在要做属性动画的组件的属性后即可。

属性动画的接口为：

```JavaScript
animation(value: AnimateParam)
```

其入参为动画参数。想要组件随某个属性值的变化而产生动画，此属性需要加在animation属性之前。有的属性变化不希望通过animation产生属性动画，可以放在animation之后。上面显式动画的示例很容易改为用属性动画实现。

> **重要**
>
> 1. 使用属性动画时，会按照指定的属性动画参数执行动画。每个组件可为自己的属性配置不同参数的属性动画。
> 2. 显式动画会对动画闭包前后造成的所有界面差异执行动画，且使用同一动画参数，适用于统一执行的场景。此外，显式动画也可以用于一些非属性变量造成的动画，如if/else的条件，ForEach使用的数组元素的删减。
> 3. 如果一个属性配置了属性动画，且在显式动画闭包中改变该属性值，属性动画优先生效，会使用属性动画的动画参数。

![属性动画](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/sx.b593b5b4.gif)

```JavaScript
// 属性动画
@Entry
@Component
struct AttrAnimation {
  @State widthSize: number = 250
  @State heightSize: number = 100
  @State rotateAngle: number = 0
  @State flag: boolean = true

  build() {
    Column() {
      Button('change size')
        .onClick(() => {
          if (this.flag) {
            this.widthSize = 150
            this.heightSize = 50
          }else{
            this.widthSize = 250
            this.heightSize = 100
          }
          this.flag = !this.flag
        })
        .margin(30)
        .width(this.widthSize)
        .animation({
          duration:2000,
          iterations:3,
          curve:Curve.Linear,
          playMode:PlayMode.Alternate
        })
        .height(this.heightSize)
        .animation({
          duration:1000,
          // iterations:-1,
          curve:Curve.Linear,
          playMode:PlayMode.Alternate
        })

      Button('change rotate angle')
        .onClick(() => {
          this.rotateAngle = 90
        })
        .margin(50)
        .rotate({angle:this.rotateAngle})
        .animation({
          duration:1000,
          iterations:-1,
          curve:Curve.Linear,
          playMode:PlayMode.Alternate
        })

    }.width('100%').margin({ top: 20 })
  }
}
```

### 组件内转场动画：**transition**

- transition常见用法
- if/else产生组件内转场动画
- ForEach产生组件内转场动画

组件的插入、删除过程即为组件本身的转场过程，组件的插入、删除动画称为组件内转场动画。通过组件内转场动画，可定义组件出现、消失的效果。

组件内转场动画的接口为：

```JavaScript
transition(value: TransitionOptions)
```

[transition](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-transition-animation-component-0000001427902496-V3)函数的入参为组件内转场的效果，可以定义平移、透明度、旋转、缩放这几种转场样式的单个或者组合的转场效果，必须和[animateTo](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-update-animation-0000001500356349-V3#section686991962314)一起使用才能产生组件转场效果。

#### **transition常见用法**

type用于指定当前的transition动效生效在组件的变化场景，类型为[TransitionType](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-appendix-enums-0000001478061741-V3#ZH-CN_TOPIC_0000001574248789__transitiontype)。

- 组件的插入、删除使用同一个动画效果

```JavaScript
Button()
  .transition({ type: TransitionType.All, scale: { x: 0, y: 0 } })
```

当type属性为TransitionType.All时，表示指定转场动效生效在组件的所有变化（插入和删除）场景。此时，删除动画和插入动画是相反的过程，删除动画是插入动画的逆播。

例如，以上代码定义了一个Button控件。在插入时，组件从scale的x、y均为0的状态，变化到scale的x、y均为1（即完整显示）的默认状态，以逐渐放大的方式出现。在删除时，组件从scale的x、y均为1的默认状态，变化到指定的scale的x、y均为0的状态，逐渐缩小至尺寸为0。

- 组件的插入、删除使用不同的动画效果

```JavaScript
Button()
  .transition({ type: TransitionType.Insert, translate: { x: 200, y: -200 }, opacity: 0 })
  .transition({ type: TransitionType.Delete, rotate: { x: 0, y: 0, z: 1, angle: 360 } })
```

当组件的插入和删除需要实现不同的转场动画效果时，可以调用两次transition函数，分别设置type属性为TransitionType.Insert和TransitionType.Delete。

例如，以上代码定义了一个Button控件。在插入时，组件从相对于组件正常布局位置x方向平移200vp、y方向平移-200vp的位置、透明度为0的初始状态，变化到x、y方向平移量为0、透明度为1的默认状态，插入动画为平移动画和透明度动画的组合。在删除时，组件从旋转角为0的默认状态，变化到绕z轴旋转360度的终止状态，即绕z轴旋转一周。

- 只定义组件的插入或删除其中一种动画效果。

```JavaScript
Button()
  .transition({ type: TransitionType.Delete, translate: { x: 200, y: -200 } })
```

当只需要组件的插入或删除的转场动画效果时，仅需设置type属性为TransitionType.Insert或TransitionType.Delete的transition效果。

例如，以上代码定义了一个Button控件。删除时，组件从正常位置、没有平移的默认状态，变化到从相对于正常布局位置x方向平移200vp、y方向平移-200vp的位置的状态。插入该组件并不会产生该组件的转场动画。

#### **if/else产生组件内转场动画**

![26016703-31b0-4a0a-af50-80e2f87db81f](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/26016703-31b0-4a0a-af50-80e2f87db81f.b23196ca.gif)

`if/else`语句可以控制组件的插入和删除。如下代码即可通过`Button`的点击事件，控制if的条件是否满足，来控制`if`下的`Image`组件是否显示。

```JavaScript
@Entry
@Component
struct IfElseTransition {
  @State flag: boolean = true;

  build() {
    Column() {
       Button(this.flag ?  '隐藏' : '显示').fontSize(30).margin(30).width(150).height(50)
        .onClick(() => {
          // 点击Button控制Image的显示和消失
          this.flag = !this.flag;
        })
      if (this.flag) {
          Image($r('app.media.harmonyOS4')).width(300)
      }
    }.height('100%').width('100%')
  }
}
```

以上代码没有配置任何动画。接下来，我们将给以上代码加入组件内转场的效果。首先Image组件是由if控制的组件，需要给其加上transition的参数，以指定组件内转场的具体效果。例如，可以如以下代码，给其插入时加上平移效果，删除时加上缩放和透明度效果。

```JavaScript
if (this.flag) {
  Image($r('app.media.harmonyOS4')).width(200).height(200)
    .transition({ type: TransitionType.Insert, translate: { x: 200, y: -200 } })
    .transition({ type: TransitionType.Delete, opacity: 0, scale: { x: 0, y: 0 } })
}
```

以上代码虽然指定了动画的样式，但是未指定动画参数，尚不知道需要用多长时间、怎样的曲线完成该动画。transition必须配合animateTo一起使用，并在animateTo的闭包中，控制组件的插入、删除。

对于以上示例代码，即为在animateTo闭包中改变flag的值，该部分代码如下所示。指定动画时长为1000ms，曲线使用animateTo函数默认的曲线，改变flag的值。则由flag变化所引起的一切变化，都会按照该动画参数，产生动画。在这里，flag会影响Image的出现和消失。

```JavaScript
animateTo({ duration: 1000 }, () => {
  this.flag = !this.flag;
})
```

经过以上过程，当animateTo和transition一起使用时，即产生了组件内转场动画。完整示例代码如下：

```JavaScript
@Entry
@Component
struct IfElseTransition {
  @State flag: boolean = true;
  build() {
    Column() {
        Button(this.flag ?  '隐藏' : '显示').fontSize(30).margin(30).width(150).height(50)
        .onClick(() => {
          animateTo({}, () => {
            // 点击Button控制Image的显示和消失
            this.flag = !this.flag;
          })
        })
      if (this.flag) {
        Image($r("app.media.harmonyOS4")).width(300)
          // .transition({ type: TransitionType.All,translate:{x:300,y:200} })
          .transition({type: TransitionType.Insert,opacity: 1, scale: { x: 0, y: 0 },rotate: { z: 1, angle: 360 } })
          .transition({ type: TransitionType.Delete, translate: { x: 300, y: 200 },opacity: 0,scale: { x: 0, y: 0 }, rotate: { z: 1, angle: 360 } })
      }
    }.height('100%').width('100%')
  }
}
```

> **说明**
>
> 当配置transition的效果为translate或scale时，本身位置叠加上平移或放大倍数后，动画过程中有可能超过父组件的范围。如果超出父组件的范围时，希望子组件完整的显示，那么可以设置父组件的clip属性为false，使父组件不对子组件产生裁剪。如果超出父组件的范围时，希望超出的子组件部分不显示，那么可以设置父组件的clip属性为true，裁剪掉子组件超出的部分。

#### **ForEach****产生组件内转场动画**

![组件内转场动画-forEach](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/zjnzc.41f55cd0.gif)

和`if`/`else`类似，`ForEach`可以通过控制数组中的元素个数，来控制组件的插入和删除。通过`ForEach`来产生组件内转场动画，仍然需要两个条件：

- ForEach里的组件配置了transition效果。
- 在animateTo的闭包中控制组件的插入或删除，即控制数组的元素添加和删除。

以下代码是使用ForEach产生组件内转场动画的一个示例。

```JavaScript
@Entry
@Component
struct ForEachTransition {
  @State poem: string[] = [
    '满堂花醉三千客，人生得意须尽欢。',
    '仰天大笑出门去，归来倚杖自叹息。',
    '天生我材必有用，会须一饮三百杯。',
    '最是人间留不住，千金散尽还复来。'
  ]

  // 借用一个动态变化的数据拼接给新增元素。避免每次新增的数据相同，遍历时不显示。
  num:number = 0

  build() {
    Column({ space: 10 }) {
      Column(){
        ForEach(this.poem, (item) => {
          // ForEach下的直接组件需配置transition效果
          Text(item).fet_text()
            .transition({ type: TransitionType.All, translate: { x: 200 }, scale: { x: 0, y: 0 } })
        }, item => item)
      }.fet_column()


      Button('向头部添加元素').fet_btn(Color.Orange, () => {
        animateTo({}, () => {
          this.num ++
          this.poem.unshift('芙蓉帐暖度春宵,朕与将军解战袍' + this.num)
        })
      })
      Button('向尾部添加元素').fet_btn(Color.Green, () => {
        animateTo({}, () => {
          this.num++
          this.poem.push('问世间情为何物，两岸猿声啼不住' + this.num)
        })
      })
      Button('删除头部元素').fet_btn(Color.Blue, () => {
        animateTo({}, () => {
          this.poem.shift()
        })
      })
      Button('删除尾部元素').fet_btn(Color.Red, () => {
        animateTo({}, () => {
          this.poem.pop()
        })
      })
    }
    .width('100%')
    .height('100%')
  }
}
// 存放诗词的容器样式
@Extend(Column) function fet_column() {
  .margin(10)
  .justifyContent(FlexAlign.Start)
  .alignItems(HorizontalAlign.Center)
  .width("90%")
  .height("50%")
}
// 诗词文本样式
@Extend(Text) function fet_text() {
  .width(300)
  .height(60)
  .fontSize(18)
  .margin({ top: 3 })
  .backgroundColor(Color.Pink)
  .textAlign(TextAlign.Center)
}
//按钮样式
@Extend(Button) function fet_btn(bgColor: Color, click: Function) {
  .width(200)
  .height(50)
  .fontSize(18)
  .backgroundColor(bgColor)
  .onClick(() => {
    // 此处的click是一个形参。具体代表的是调用除传进来的函数。后方跟小括号代表执行传进来的函数。
    click()
  })
}
```

由于`Column`布局方式设为了`FlexAlign.Start`，即竖直方向从头部开始布局。所以往数组末尾添加元素时，并不会对数组中现存元素对应的组件位置造成影响，只会触发新增组件的插入动画。而往数组头部添加元素时，原来数组中的所有元素的下标都增加了，虽然不会触发其添加或者删除，但是会影响到对应组件的位置。所以除新增的组件会做transition动画以外，之前存在于ForEach中组件也会做位置动画。

> **重要说明**
>
> `if`/`else`、`ForEach`为语法节点，配置组件内转场效果的组件应直接作为语法节点的孩子。由语法节点的增删引起的组件增删，只能触发其直接孩子组件的组件内转场动画，开发者不应期望其对更深层次的组件产生组件转场动画。

## 页面间的动画

### 共享元素转场动画

在不同页面间，有使用相同的元素（例如同一幅图）的场景，可以使用[共享元素转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-transition-animation-shared-elements-0000001428061776-V3)动画衔接。为了突出不同页面间相同元素的关联性，可为它们添加共享元素转场动画。如果相同元素在不同页面间的大小有明显差异，即可达到放大缩小视图的效果。

共享元素转场的接口为：

```JavaScript
sharedTransition(id: string, options?: sharedTransitionOptions)
```

其中根据`sharedTransitionOptions`中的`type`参数，共享元素转场分为Exchange类型的共享元素转场和Static类型的共享元素转场。

#### **Exchange类型的共享元素转场**

交换型的共享元素转场，需要两个页面中，存在通过sharedTransition函数配置为相同id的组件，它们称为共享元素。这种类型的共享元素转场适用于两个页面间相同元素的衔接，会从起始页共享元素的位置、大小过渡到目标页的共享元素的位置、大小。如果不指定type，默认为Exchange类型的共享元素转场，这也是最常见的共享元素转场的方式。使用Exchange类型的共享元素转场时，共享元素转场的动画参数由目标页options中的动画参数决定。

#### **Static类型的共享元素转场**

静态型的共享元素转场通常用于页面跳转时，标题逐渐出现或隐藏的场景，只需要在一个页面中有Static的共享元素，不能在两个页面中出现相同id的Static类型的共享元素。在跳转到该页面（即目标页）时，配置Static类型`sharedTransition`的组件做透明度从`0`到该组件`设定的透明度`的动画，`位置保持不变`。在该页面（即起始页）消失时，做透明度逐渐变为`0`的动画，位置保持不变。

共享元素转场的动画参数由该组件`sharedTransition`属性中的动画参数决定。

#### 案例：共享元素转场

下面介绍使用共享元素转场进行放大缩小图片的示例。

![页面间共享元素转场](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/yemjgx.60721a94.gif)

案例效果

`// src page`

```JavaScript
import router from '@ohos.router';

@Entry
@Component
struct SharedTransitionSrc {
  build() {
    Column({ space: 30 }) {
      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image($r('app.media.bg')).width(50).height(50).opacity(.3).borderRadius(75)
        .sharedTransition('sharedImage1', {
          duration: 1000,
          curve: Curve.Linear
        })
    }
    .onClick(() => {
      // 点击路由跳转至下一页面
      router.pushUrl({ url: "pages/SharedTransitionDest" });
    })
    .padding(10)
    .width("100%")
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
```

`// dest page`

```javascript
import router from '@ohos.router';
@Entry
@Component
struct SharedTransitionDest {
  build() {
    Column({ space: 30 }) {
      // 配置Static类型的共享元素转场
      Text("致敬pink").fontSize(22).fontColor(Color.Green).opacity(.8).fontWeight(FontWeight.Bold).margin({ top: 10 })
        .sharedTransition('text', {
          duration: 500,
          curve: Curve.Linear,
          type: SharedTransitionEffectType.Static
        })

      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image($r('app.media.bg')).width(150).height(150).opacity(1).borderRadius(75)
        .sharedTransition('sharedImage1', {
          duration: 500,
          curve: Curve.Linear
        })
    }
    .width("100%")
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      // 点击图片时路由返回至上一页面
      router.back();
    })
  }
}
```



上述示例中，第一个页面（src page)和第二个页面（dest page）都配置了id为"`sharedImage1`"的共享元素转场，使两个页面能匹配到这一组共享元素。从第一个页面跳转到第二个页面时，第一个页面为起始页，第二个页面为目标页。配置id为"`sharedImage1`"的组件按照目标页中500ms的时长进行共享元素转场，达到放大视图的效果，id为"`text`"的组件按照配置的`Static`类型`sharedTransition`参数中的`500ms`的时长进行共享元素转场，标题逐渐出现。从第二个页面返回到第一个页面时，第二个页面为起始页，第一个页面为目标页。配置id为"`sharedImage1`"的组件按照目标页中1000ms的时长进行共享元素转场，缩小为原始视图，id为"`text`"的组件按照配置的Static类型`sharedTransition`参数中的500ms的时长进行共享元素转场，标题逐渐隐藏。

### 页面转场动画

![页面间转场动画](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/17076203173681.2badeffa.gif)

两个页面间发生跳转，一个页面消失，另一个页面出现，这时可以配置各自页面的页面转场参数实现自定义的页面转场效果。[页面转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-page-transition-animation-0000001477981233-V3)效果写在pageTransition函数中，通过PageTransitionEnter和PageTransitionExit指定页面进入和退出的动画效果。

PageTransitionEnter的接口为：

```JavaScript
PageTransitionEnter({type?: RouteType,duration?: number,curve?: Curve | string,delay?: number})
```

PageTransitionExit的接口为：

```JavaScript
PageTransitionExit({type?: RouteType,duration?: number,curve?: Curve | string,delay?: number})
```

上述接口定义了PageTransitionEnter和PageTransitionExit组件，可通过slide、translate、scale、opacity属性定义不同的页面转场效果。对于PageTransitionEnter而言，这些效果表示入场时起点值，对于PageTransitionExit而言，这些效果表示退场的终点值，这一点与组件转场transition配置方法类似。此外，PageTransitionEnter提供了onEnter接口进行自定义页面入场动画的回调，PageTransitionExit提供了onExit接口进行自定义页面退场动画的回调。

上述接口中的参数type，表示路由生效的类型，这一点开发者容易混淆其含义。页面转场的两个页面，必定有一个页面退出，一个页面进入。如果通过router.pushUrl操作从页面A跳转到页面B，则页面A退出，做页面退场动画，页面B进入，做页面入场动画。如果通过router.back操作从页面B返回到页面A，则页面B退出，做页面退场动画，页面A进入，做页面入场动画。即页面的PageTransitionEnter既可能是由于新增页面(push，入栈)引起的新页面的入场动画，也可能是由于页面返回(back，或pop，出栈)引起的页面栈中老页面的入场动画，为了能区分这两种形式的入场动画，提供了type参数，这样开发者能完全定义所有类型的页面转场效果。

#### **type配置为RouteType.None**

type为RouteType.None表示对页面栈的push、pop操作均生效，type的默认值为RouteType.None。

```JavaScript
// page A
pageTransition() {
  // 定义页面进入时的效果，从左侧滑入，时长为1200ms，无论页面栈发生push还是pop操作均可生效
  PageTransitionEnter({ type: RouteType.None, duration: 1200 })
    .slide(SlideEffect.Left)
  // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
  PageTransitionExit({ type: RouteType.None, duration: 1000 })
    .slide(SlideEffect.Left)
}
```

```javascript
// page B
pageTransition() {
  // 定义页面进入时的效果，从右侧滑入，时长为1000ms，无论页面栈发生push还是pop操作均可生效
  PageTransitionEnter({ type: RouteType.None, duration: 1000 })
    .slide(SlideEffect.Right)
  // 定义页面退出时的效果，向右侧滑出，时长为1200ms，无论页面栈发生push还是pop操作均可生效
  PageTransitionExit({ type: RouteType.None, duration: 1200 })
    .slide(SlideEffect.Right)
}
```



#### **禁用某页面的页面转场**

> 通过设置页面转场的时长为0，可使该页面无页面转场动画。

```JavaScript
pageTransition() {
  PageTransitionEnter({ type: RouteType.None, duration: 0 })
  PageTransitionExit({ type: RouteType.None, duration: 0 })
}
```

#### 案例： 界面进场退场效果

![页面间转场动画](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/17076203173681.2badeffa.gif)

```JavaScript
import router from '@ohos.router'
@Entry
@Component
struct PageTransitionSrc {
  @State scale1: number = 1
  @State opacity1: number = 1

  build() {
    Column({space:30}) {

      Text('src...')
        .fontSize(50)
        .opacity(this.opacity1)

      Image($r('app.media.bg1'))
        .width('100%')
        .height('100%')
        .scale({ x: this.scale1 })
        .opacity(this.opacity1)
    }
    .width('100%')
    .height('90%')
    .onClick(() => {
      router.pushUrl({
        url:'pages/PageTransitionDest'
      })
    })
  }

  pageTransition(){
    // progress动效的归一化进度
    PageTransitionEnter({  }).onEnter((type: RouteType, progress: number) => {
      this.scale1 = 1
      this.opacity1 = progress
    })
    // progress动效的归一化进度
    PageTransitionExit({  }).onExit((type: RouteType, progress: number) => {
      this.scale1 = 1 - progress
      this.opacity1 = 1 - progress
    })
  }
}
```

```javascript
import router from '@ohos.router'
@Entry
@Component
struct PageTransitionDest {
  @State scale1: number = 1
  @State opacity1: number = 1

  build() {
    Column() {
      Text('dest')
        .fontSize(50)
        .opacity(this.opacity1)
      Image($r('app.media.bg2'))
        .width('100%')
        .height('100%')
        .scale({ y: this.scale1})
        .opacity(this.opacity1)
    }
    .width('100%')
    .height('100%')
    .onClick(() => {
      router.back()
    })
  }

  pageTransition(){
    // progress动效的归一化进度
    PageTransitionEnter({  }).onEnter((type: RouteType, progress: number) => {
      this.scale1 = progress
      this.opacity1 = progress
    })

    PageTransitionExit({  }).onExit((type: RouteType, progress: number) => {
      this.scale1 = 1 - progress
      this.opacity1 = 1 - progress
    })
  }
}
```



[页面转场动画-页面间的动画-使用动画-基于ArkTS的声明式开发范式-UI开发-开发-HarmonyOS应用开发](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-page-transition-animation-0000001450755574-V3)

# 网络

1. ## 基于web组件构建网络应用

### **加载在线网页**

访问在线网页时您需要在module.json5文件中申明网络访问权限：ohos.permission.INTERNET。

> 加载网页效果无法在预览器中查看，需要在模拟器或者真机中展示项目

```JavaScript
{
    "module" : {
        "requestPermissions":[
           {
             "name": "ohos.permission.INTERNET"
           }
        ]
    }
}
```

Web组件的使用非常简单，只需要ArkTS文件中创建一个`Web`组件，传入两个参数就可以了。其中`src`指定引用的网页路径，`controller`为组件的控制器，通过`controller`绑定`Web`组件，用于实现对`Web`组件的控制。

```JavaScript
// xxx.ets
// 使用web组件加载网页
import webview from '@ohos.web.webview'
@Entry
@Component
struct WebComp {
  controll:WebviewController = new webview.WebviewController()
  build() {
    Row() {
      Column() {
        Web({
          src:'https://mayw-teaching.feishu.cn/drive/folder/Qm0LfbzjIlBwE8duFZ1cKEKinUd?from=space_shared_folder',
          controller:this.controll
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

1. ## HTTP数据请求

### **场景介绍**

应用通过HTTP发起一个数据请求，支持常见的GET、POST、OPTIONS、HEAD、PUT、DELETE、TRACE、CONNECT方法。

### **接口说明**

HTTP数据请求功能主要由http模块提供。使用该功能需要申请ohos.permission.INTERNET权限。

具体接口说明如下表。

| **接口名**                  | **功能描述**                        |
| --------------------------- | ----------------------------------- |
| createHttp()                | 创建一个http请求。                  |
| request()                   | 根据URL地址，发起HTTP网络请求。     |
| destroy()                   | 中断请求任务。                      |
| on(type: 'headersReceive')  | 订阅HTTP Response Header 事件。     |
| off(type: 'headersReceive') | 取消订阅HTTP Response Header 事件。 |

### **开发步骤**

1. import需要的http模块。

```JavaScript
import http from '@ohos.net.http';
```

1. 创建一个HTTP请求，返回一个HttpRequest对象。

```JavaScript
// 每一个httpRequest对应一个http请求任务，不可复用
let httpRequest = http.createHttp();
```

1. （可选）订阅HTTP响应头。
2. 根据URL地址，发起HTTP网络请求。
3. （可选）处理HTTP响应头和HTTP网络请求的返回结果。

```JavaScript
httpRequest.request('接口地址',{
  method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
  // 开发者根据自身业务需要添加header字段
  header: {
    'Content-Type': 'application/json'
  },
  // 当使用POST请求时此字段用于传递内容
  extraData: {
    "data": "data to send",
  },
  connectTimeout: 60000, // 可选，默认为60s
  readTimeout: 60000, // 可选，默认为60s
}, (err,data) => {
  if (!err) {
    // data.result为http响应内容，可根据业务需要进行解析
    console.info('Result:' + data.result);
    console.info('code:' + data.responseCode);
    // data.header为http响应头，可根据业务需要进行解析
    console.info('header:' + JSON.stringify(data.header));
    console.info('cookies:' + data.cookies); // 8+
  } else {
    console.info('error:' + JSON.stringify(err));
    // 该请求不再使用，调用destroy方法主动销毁。
    httpRequest.destroy();
  }
})
```

### 案例：诗词学习

![网络请求获取诗词](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/wangluo.7b4179e8.gif)

获取诗词接公开API接口

> 所需接口自行去网络查找，内事不决问百度，外事不决问谷歌。
>
> 例如搜索关键词：公开的API接口地址。

```JavaScript
// 获取随机诗词AIP
https://api.apiopen.top/api/sentences
```
```JavaScript
// 获取随机诗词AIP 这个更好用
https://v1.jinrishici.com/all.json
```

```JavaScript
// 藏头诗API
https://py.myie9.com/hidepoem/****
```

测试接口软件：https://www.apipost.cn/

> 如果是get请求。可以直接在浏览器测试

```JavaScript
/*
 * 发起http请求
 * */
// 1:导入http模块
import http from '@ohos.net.http'
@Entry
@Component
struct HttpReq {
  @State poem: string = '把酒祝东风'
  @State from:string = '柳宗元'

  aboutToAppear(){
   setInterval(() => {
     // 2. 常见http请求对象
     let httpReq = http.createHttp()
     // 3. 发起请求
     httpReq.request('https://api.apiopen.top/api/sentences',
       {
         method:http.RequestMethod.GET,
       },
       (err,data) => {
         // 4. 处理结果
         if (!err) {
           this.poem = JSON.parse(`${data.result}`).result.name
           this.from = JSON.parse(`${data.result}`).result.from
         }
       }
     )
   },2000)
  }
  build() {
    Row() {
      Column() {
        Text(this.poem)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(this.from)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

## http请求-Promise方式。

> 避免地狱回调

```JavaScript
// 1:导入http模块
import http from '@ohos.net.http'

@Entry
@Component
struct HttpReqPromise {
  @State poem: string = '把酒祝东风'
  @State from: string = '柳宗元'

  aboutToAppear() {
    setInterval(() => {
      // 2. 常见http请求对象
      let httpReq = http.createHttp()
      // 3. 发起请求
     let promise =  httpReq.request('https://api.apiopen.top/api/sentences')
      promise.then((data) => {
        this.poem = JSON.parse(`${data.result}`).result.name
        this.from = JSON.parse(`${data.result}`).result.from
      })
    }, 2000)
  }

  build() {
    Row() {
      Column() {
        Text(this.poem)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(this.from)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
```