// 根据上面代码，以下解释正确的是
/*
 * 本例子可以运行起来，所以代码没有问题。
 *为了避免@Prop的拷贝，可以优化使用@Link，在该例子中行为和@Prop一样。
 * 在自定义组件Page的build方法里改变状态变量是非法操作，可能导致未定义的异常UI行为
 * 在ChangeMode里改变mode的值，会触发其父组件Page的Title内容的切换。
 * */
enum Mode {
  fullScreen,
  halfScreen
}

@Entry
@Component
struct Page {
  @State title:string  = ""
  @State mode:Mode  = Mode.fullScreen

  isShownTitle():boolean {
    if (this.mode == Mode.fullScreen) {
      this.title = "Title"
      return true
    }else {
      this.title= "Section"
      return false
    }
  }
  build() {
    Column(){
      if (this.isShownTitle()){
        Text(`${this.title}`)
      }else {
        Text(`${this.title}`)
      }
      ChangeMode({mode:this.mode})
    }
  }
}

@Component
struct ChangeMode {
  @Prop mode:Mode;
  build() {
    Row({space:20}){
      Button('full screen')
        .onClick(() => {
          this.mode = Mode.fullScreen
        })
      Button('half scrtten')
        .onClick(() => {
          this.mode = Mode.halfScreen
        })
    }
  }
}