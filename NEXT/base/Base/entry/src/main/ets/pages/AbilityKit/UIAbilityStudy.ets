import { common, Want } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { RouterParm } from '../../model/MyRouterInfo';

// UI Ability学习
@Entry
@Component
struct UIAbilityStudy {
  pageName: string = (router.getParams() as RouterParm)?.pageName || 'uiabilityStudy'
  @State message: string = this.pageName
  private context = getContext(this) as common.UIAbilityContext

  startAbilityTest() {
    let want: Want = {
      //want参数信息
    }
    this.context.startAbility(want)
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('UIAbilityStudyHelloWorld')
        .fontSize(20)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}