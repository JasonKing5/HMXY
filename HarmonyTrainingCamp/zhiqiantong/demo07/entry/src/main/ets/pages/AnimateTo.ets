/*
 * 显式动画：提供全局animateTo显式动画接口来指定由于闭包代码导致的状态变化插入过渡动效。
 *  animateTo(value: AnimateParam, event: () => void): void
 * */
@Entry
@Component
struct AnimateTo {
  @State rotateAngle:number = 45
  @State color:string = 'red'
  build() {
    Column({ space: 10 }) {
      Button('click me change rotate angle').rotate({ x: 1, y: 1, z: 1, angle: this.rotateAngle })
        .fontColor(this.color)
        .onClick(()=>{
            animateTo(
              {
                duration:2000,
                curve:Curve.LinearOutSlowIn,
                iterations:-1,
                playMode:PlayMode.Alternate,
                onFinish:()=>{
                //   当动画结束的时候，触发该回调函数
                    this.color = 'gray'
                }
              },
              ()=>{
                this.rotateAngle = -45
              }
            )
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}