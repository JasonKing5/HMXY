import http from '@ohos.net.http'
import LogoAndTitle from '../viewComp/LogoAndTitle'
import ShowPoem from '../viewComp/ShowPoem'
import { fromToAuthorAndSubject } from '../fun/Utils'

@Entry
@Component
struct PoemMain {
  @State poem: string = '何须浅碧深红色，自是花中第一流'
  @State author: string = '李清照'
  @State subject: string = '鹧鸪天·桂花'

  aboutToAppear() {
    setInterval( () => {
      let p =  http.createHttp().request('https://api.apiopen.top/api/sentences')
      p.then((data) => {
        // 获取的作者和《题目》
        let from: string = JSON.parse(`${data.result}`).result.from
        // todo: 解析出作者和题目
        this.author = fromToAuthorAndSubject(from)[0]
        this.subject = fromToAuthorAndSubject(from)[1]
        // 获取诗句内容
        this.poem = JSON.parse(`${data.result}`).result.name
      })
    },3000)
  }

  build() {
    Column({ space: 30 }) {
      // 顶部
      LogoAndTitle()
      //   中间显式诗词内容
      ShowPoem({
        poem: this.poem,
        author: this.author,
        subject: this.subject
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))

  }
}