/*
 * 路径动画
 * path：位移动画的运动路径，使用svg路径字符串。path中支持使用start和end进行起点和终点的替代，
 *      如：'Mstart.x start.y L50 50 Lend.x end.y Z'，
 *      'M start.x start.y L 300 200 L 400 500 Lend.x end.y',
 * */
@Entry
@Component
struct MotionPath {
  @State toggle: boolean = true
  build() {
   Column(){
     Image($r('app.media.bg3')).width(100).height(100)
       // 执行动画
       .motionPath({
         path:'M start.x start.y L 300 200 L 400 500 L end.x end.y',
         from:0,
         to:1,
         rotatable:true
       })
       .onClick(()=>{
          animateTo({duration:4000,curve:Curve.Linear,iterations:-1,playMode:PlayMode.Alternate}, () => {
            this.toggle = !this.toggle
          })
       })
   }
    .width('100%')
    .height('100%')
    .alignItems( this.toggle ? HorizontalAlign.Start : HorizontalAlign.End)
  }
}