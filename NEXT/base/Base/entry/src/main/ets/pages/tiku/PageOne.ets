// 已知下列代码PageOne页面为navigation中的某一子页面，依次点击PageOne页面中toPageTwo按钮，
import { JSON } from '@kit.ArkTS';

// PageTwo页面中toPageOne按钮，此时点击get按钮获取全部名为name的NavDestination页面的位置索引为
//PageOne.ets
@Entry
@Component
 struct PageOneTmp {
  @Consume('pageInfos') pageInfos:NavPathStack;
  build() {
    NavDestination(){
      Column(){
        Button('toPageTwo',{stateEffect:true,type:ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick( ()=>{
            this.pageInfos.pushPathByName('pageTwo',"")
          })
        Button('get',{stateEffect:true,type:ButtonType.Capsule})
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            console.log('取全部名为name的NavDestination页面的位置索',JSON.stringify(this.pageInfos))
          })
      }.width('100%').height('100%')
    }
    .title('pageOne')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop()
      console.log('pop'+'返回值'+JSON.stringify(popDestinationInfo))
      return true
    })
  }
}
