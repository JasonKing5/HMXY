import http from '@ohos.net.http'
import TopBack from '../view/TopBack'

class PoemModel {
  content: string
  origin: string
  author: string
  category: string

  constructor(content: string, ori: string, author: string, cate) {
    this.content = content
    this.origin = ori
    this.author = author
    this.category = cate
  }
}

@Entry
@Component
struct Poem {
  @State message: string = '诗词学习'
  @State poemObj: PoemModel = new PoemModel('劝君莫负艳阳天，努力学习趁少年', '念奴娇-劝学', '不多先生', '现代-劝学-鸡汤')

  build() {
    Row() {
      Column({ space: 20 }) {
        TopBack()

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()

        Column({ space: 20 }) {
          Text(this.poemObj.content)//样式代码的抽取和复用
            .poemStyle('#ffd71414', 15)

          Text(this.poemObj.origin)
            .poemStyle('#ff2bdd72', 20)

          Text(this.poemObj.author)
            .fontWeight(FontWeight.Bold)
          Text(this.poemObj.category)
            .fontWeight(FontWeight.Bold)

          Button('更换诗词')
            .margin({
              top: 50
            })
            .onClick(() => {
              //数据从哪来。我一个前端。我一个移动端。我管你数据从哪来啊。我问后端要。后端就得给我。
              http.createHttp().request('https://v1.jinrishici.com/all.json').then((data) => {
                let content = JSON.parse(data.result + '').content
                let origin = JSON.parse(data.result + '').origin
                let author = JSON.parse(data.result + '').author
                let category = JSON.parse(data.result + '').category


                this.poemObj = new PoemModel(content,origin,author,category)

              })
            })
        }
        .width('85%')
        .layoutWeight(1)
        .borderRadius(20)
        .backgroundColor('#fff1cbcb')
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function poemStyle(tcolor: string, tsize: number) {
  .fontSize(tsize)
  .fontColor(tcolor)
  .fontStyle(FontStyle.Italic)
  .lineHeight(40)
}
