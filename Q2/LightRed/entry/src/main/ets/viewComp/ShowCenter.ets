// show页面的中心主要展示数据区域。
import http from '@ohos.net.http'
import { fromToAuthorAndSubject } from '../fun/Utils'
import Poem from '../model/Poem'
import ShowPoem from './ShowPoem'
import ShowRecommend from './ShowRecommend'

@Component
export default struct ShowCenter {
  @State poem: Poem = new Poem('何须浅碧深红色，自是花中第一流', '李清照', '桂花')

  aboutToAppear() {
    setInterval(() => {
      let p = http.createHttp().request('https://api.apiopen.top/api/sentences')
      p.then((data) => {
        // 获取的作者和《题目》
        let from: string = JSON.parse(`${data.result}`).result.from
        // todo: 解析出作者和题目
        this.poem.author = fromToAuthorAndSubject(from)[0]
        this.poem.subject = fromToAuthorAndSubject(from)[1]
        // 获取诗句内容
        this.poem.content = JSON.parse(`${data.result}`).result.name
      })
    }, 3000)
  }

  //自定义构建组件的函数：我是个函数。但是可以呈现组件效果。
  @Builder
  tabTitle(str: string, colorVal: string | Color) {
    Column({ space: 5 }) {
      Text(str).fontSize(20).fontColor(colorVal)
      Divider().width(60).strokeWidth(3).color(colorVal)
    }
  }

  build() {
    //   中间显式两部分可以切换视图的tab栏效果
    Tabs({ barPosition: BarPosition.Start }) {
      // 网络获取诗词
      TabContent() {
        ShowPoem({ poem: this.poem })
      }.tabBar(this.tabTitle('随机诗词', '#ff60e38a'))

      // todo:帝心老师推荐自己喜欢的内容给你
      TabContent() {
        ShowRecommend()
      }.tabBar(this.tabTitle('帝心推荐', Color.Orange))
    }
    .tabsStyle() // 配合barPosition设置tab栏上右下左位置
  }
}

@Extend(Tabs)
function tabsStyle() {
  //   中间显式两部分可以切换视图的tab栏效果
  .height('80%')
  .margin({
    top: -10
  })
  .vertical(false)
}
