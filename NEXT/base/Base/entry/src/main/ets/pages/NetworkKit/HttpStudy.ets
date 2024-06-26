import { http } from '@kit.NetworkKit';
import { router } from '@kit.ArkUI';
import { RouterParm } from '../../model/MyRouterInfo';

@Entry
@Component
struct HttpStudy {
  pageName: string = (router.getParams() as RouterParm).pageName
  @State message: string = this.pageName

  aboutToAppear(): void {

    console.log(JSON.stringify(router.getParams()))
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HttpStudyHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button('测试网络请求')
        .onClick(() => {
          http.createHttp().request('https://v1.jinrishici.com/all.json')
            .then((data) => {
              console.log(data.result + '')
            })
        })

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}