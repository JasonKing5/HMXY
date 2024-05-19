import http from '@ohos.net.http'
import router from '@ohos.router'
import { PoemModel } from '../model/Model'
import TopBack from '../view/TopBack'


@Entry
@Component
struct Poem {
  @State message: string = '诗词学习'
  @State poemObj: PoemModel = new PoemModel('劝君莫负艳阳天，努力学习趁少年', '念奴娇-劝学', '不多先生', '现代-劝学-鸡汤')
  @State isCollection: boolean = false // 标记是否收藏过这个诗词
  @State angleNum:number  = 0

  @State changPoemBtn:string = '#ffe55353'

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
            .backgroundColor(this.changPoemBtn)
            .rotate({
              angle:this.angleNum
            })
            .margin({
              top: 50
            })
            .onClick(() => {
              //骚操作一下
            animateTo({
              // duration:1000
              // delay:2000
              curve:Curve.Linear
            },()=>{
              // this.angleNum = 360
              if (this.angleNum == 360) {
                this.changPoemBtn = '#ff176fc6'
                this.angleNum = 0
              }else {
                this.angleNum = 360
                this.changPoemBtn = '#ffe55353'
              }
            })
              //数据从哪来。我一个前端。我一个移动端。我管你数据从哪来啊。我问后端要。后端就得给我。
              http.createHttp().request('https://v1.jinrishici.com/all.json').then((data) => {
                let content = JSON.parse(data.result + '').content
                let origin = JSON.parse(data.result + '').origin
                let author = JSON.parse(data.result + '').author
                let category = JSON.parse(data.result + '').category
                this.poemObj = new PoemModel(content, origin, author, category)

                // 收藏按钮就应该恢复成 未收藏的情况
                this.isCollection = false
              })
            })
        }
        .poemClmStyle()

        Divider()
        Row() {
          Button(this.isCollection ? '已收藏' : '未收藏')
            .width('30%')
            .fontColor(this.isCollection ? '#ff4506a2' : '#ffca0c0c')
            .backgroundColor(this.isCollection ? '#ff1ea0c1' : '#ffff9003')
            .onClick(() => {
              //业务操作。。 去保存一下【当前】这句诗词 只保存诗句本身 升级后可以保存整个诗词对象的内容。方便查看的时候，看看zz 看看ly

              let poemArr: PoemModel [] = AppStorage.Get('poem') || []
              poemArr.push(this.poemObj)

              // todo 将变化后的该数组重新存一下。覆盖之前的 poem

              AppStorage.SetOrCreate('poem',poemArr)

              // 收藏----> 已收藏
              this.isCollection = !this.isCollection
            })

          Button('查看收藏')
            .width('30%')
            .onClick(() => {
              router.pushUrl({
                url: "pages/CollPoem"
              })
            })
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.SpaceBetween)

      }
      .width('100%')
      .padding({
        bottom:30
      })
    }
    .height('100%')
    .backgroundColor($r('app.color.app_bgc'))
  }
}

@Extend(Column)
function poemClmStyle() {
  .width('85%')
  .layoutWeight(1)
  .borderRadius(20)
  .backgroundColor('#fff1cbcb')
}

@Extend(Text)
function poemStyle(tcolor: string, tsize: number) {
  .fontSize(tsize)
  .fontColor(tcolor)
  .fontStyle(FontStyle.Italic)
  .lineHeight(40)
}
