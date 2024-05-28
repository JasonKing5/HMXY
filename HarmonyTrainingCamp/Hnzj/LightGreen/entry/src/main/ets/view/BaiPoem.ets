import http from '@ohos.net.http'
import router from '@ohos.router'
import Constants from '../common/Constants'
import { PoemFromApi } from '../data/LightGreenData'
import { cancelColl, getPoemDate, saveCurrentPoem } from '../viewModel/MyUtils'

@Component
export default struct BaiPoem {
  @State baiPoemObj: PoemFromApi = new PoemFromApi('何须浅碧深红色，自是花中第一流', `无题`, `帝心`, `帝心-桂花`)
  @State isCollection: boolean = false
  @State angleVal: number = 0

  build() {
    Column({ space: 20 }) {
      Text(this.baiPoemObj.content)
      Text(this.baiPoemObj.origin)
      Text(this.baiPoemObj.author)
      Text(this.baiPoemObj.category)
      Row() {
        Button(this.isCollection ? '已收藏' : '收藏')
          .onClick(() => {
            this.isCollection = !this.isCollection
            // todo 不能直接去保存数据。应该根据状态变量。
            if (this.isCollection) {
              saveCurrentPoem(this.baiPoemObj) //收藏的业务逻辑 ： 保存当前数据 baiPoemObj
            } else {
              // todo 删除曾经收藏过的这首诗词
              cancelColl(this.baiPoemObj.content)
            }
          })
          .width('30%')
          .backgroundColor(this.isCollection ? '#ffc19c9c' : '#ff56a56b')

        Button('去查看收藏')
          .backgroundColor('#ff56a56b')
          .onClick(() => {
            // 跳转页面
            router.pushUrl({
              url: "pages/ShowColl"
            })
          })
      }
      .width('90%')
      .height(40)
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .onClick(async () => {
      this.baiPoemObj = await getPoemDate()
      //还应该更新按钮的收藏状态
      this.isCollection = false
      // 旋转一下特效
      animateTo({duration:500}, () => {
        this.angleVal = this.angleVal === 0 ? 360 : 0
      })
    })
    .height('90%')
    .justifyContent(FlexAlign.SpaceEvenly)
    // .backgroundColor('#ffbcb8b8')
    // .borderRadius(150)
    .rotate({
      // x:1,
      // y:1,
      z:1,
      angle: this.angleVal
    })
  }
}