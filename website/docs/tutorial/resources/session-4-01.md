---
sidebar_position: 102
---

# 面试题
:::tip
微信交流群和网络资源整理，如有错误，欢迎指正。
:::

## ArkTS语法使用常见问题

---
### 说-下@State、@Link、@Builder、@Provide和@Consume?
> 这题说不明白就别面鸿蒙了

---
### ArkUI如何通过代码动态创建组件
>   
>   ArkUI使用ArkTS声明式开发范式，开发者无法持有组件实例，在声明时通过渲染控制语法以及动态构建UI元素的方式，控制组件的创建。
>
```ArkTS
// 条件渲染语句创建组件
if(this.isTrue) {
  Text("创建文本组件").fontSize(30)
}
// 循环渲染语句创建组件
ForEach(this.nums,(item) => {
  Text(item + '').fontSize(30)
},item => JSON.stringify(item))
```
---
### 子组件使用@Link修饰成员变量时，如何通过父组件传值
>   
>   * 子组件使用@Link接受父组件的值时，需要使用’$'建立变量之间的引用关系。才能实现同步。
---
### 如何监听屏幕旋转
>屏幕旋转可使用媒体查询接口进行监听。

```ArkTS
import mediaquery from '@ohos.mediaquery'
let listener = mediaquery.matchMediaSync('(orientation: landscape)'); //监听横屏事件
function onPortrait(mediaQueryResult) {
  if (mediaQueryResult.matches) {
   // do something here
  } else {
   // do something here
  }
}
listener.on('change', onPortrait) // 注册回调
listener.off('change', onPortrait) // 去注册回调
```
---
## ArkUI组件开发常见问题(ArkTS)

### 问list组件如果有100多种类型item怎么优化处理?
>   
>   * 帝王虾： 算了，我不要那么高工资，你也别问这种煞笔问题
---

### 自定义弹窗中的变量如何传递给页面
**问题现象**

在自定义弹窗内定义的变量内容，在关闭弹窗或变量变化时需要及时传递给页面，可以通过何种方式传递？

**解决措施**

* 方式一：使用组件的状态变量传递。
* 方式二：在初始化弹窗时，传递一个方法给自定义弹窗，在自定义弹窗中触发该方法，弹窗中变量作为方法的参数。
* 方式三：使用AppStorage或LocalStorage方式管理页面状态，实现自定义弹窗和页面之间状态的共享。

**代码示例**
* 方式一：
```ArkTS
@CustomDialog
struct CustomDialog01 {
  @Link inputValue: string
  controller: CustomDialogController
  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '', text: this.inputValue }).height(60).width('90%')
        .onChange((value: string) => {
          this.inputValue = value
        })
    }
  }
}

@Entry
@Component
struct DialogDemo01 {
  @State inputValue: string = 'click me'
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog01({
      inputValue: $inputValue
    })
  })

  build() {
    Column() {
      Button(this.inputValue)
        .onClick(() => {
          this.dialogController.open()
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}
```
* 方式二：
```ArkTS
@CustomDialog
struct CustomDialog02 {
  private inputValue: string
  changeInputValue: (val: string) => void
  controller: CustomDialogController
  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '', text: this.inputValue }).height(60).width('90%')
        .onChange((value: string) => {
          this.changeInputValue(value)
        })
    }
  }
}

@Entry
@Component
struct DialogDemo02 {
  @State inputValue: string = 'click me'
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog02({
      inputValue: this.inputValue,
      changeInputValue: (val: string) => {
        this.inputValue = val
      }
    })
  })

  build() {
    Column() {
      Button(this.inputValue)
        .onClick(() => {
          this.dialogController.open()
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}

```
* 方式三：
```ArkTS
let storage = LocalStorage.GetShared()
@CustomDialog
struct CustomDialog03 {
  @LocalStorageLink('inputVal')  inputValue: string = ''
  controller: CustomDialogController
  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
      TextInput({ placeholder: '', text: this.inputValue }).height(60).width('90%')
        .onChange((value: string) => {
          this.inputValue = value;
        })
    }
  }
}

@Entry(storage)
@Component
struct DialogDemo03 {
  @LocalStorageLink('inputVal') inputValue: string = ''
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog03()
  })

  build() {
    Column() {
      Button(this.inputValue)
        .onClick(() => {
          this.dialogController.open()
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}
```