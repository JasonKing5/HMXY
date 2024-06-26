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