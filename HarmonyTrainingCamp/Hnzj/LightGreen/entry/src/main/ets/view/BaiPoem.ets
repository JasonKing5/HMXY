import http from '@ohos.net.http'
import Constants from '../common/Constants'
import { PoemFromApi } from '../data/LightGreenData'
import { getPoemDate } from '../viewModel/MyUtils'

@Component
export default struct BaiPoem {
  @State baiPoemObj: PoemFromApi = new PoemFromApi(`我醉欲眠卿且去,明朝有意抱琴来`, `无题`, `帝心`, `自由`)

  // aboutToAppear() {
  //   setInterval(() => {
  //     http.createHttp().request(Constants.poemApi)
  //       .then((data: http.HttpResponse) => {
  //         let content: string = JSON.parse(`${data.result}`).content
  //         let origin: string = JSON.parse(`${data.result}`).origin
  //         let author: string = JSON.parse(`${data.result}`).author
  //         let category: string = JSON.parse(`${data.result}`).category
  //         this.baiPoemObj = new PoemFromApi(content, origin, author, category)
  //       })
  //   }, 3000)
  // }

  build() {
    Column({ space: 20 }) {
      Text(this.baiPoemObj.content)
      Text(this.baiPoemObj.origin)
      Text(this.baiPoemObj.author)
      Text(this.baiPoemObj.category)
    }
    .onClick(async () => {
      this.baiPoemObj =await getPoemDate()
      // console.log( 'main' + getPoemDate() )
    })
  }
}