import router from '@ohos.router';
import process from '@ohos.process';
import { PreferencesUtils } from '../common/preferences/PreferencesUtils';
import common from '@ohos.app.ability.common';
import { IS_ACCEPT_PRIVACY } from '../common/preferences/PreferencesConfig';
@CustomDialog
export default struct privacyCustomDialog {
  controller: CustomDialogController
  context = getContext(this) as common.UIAbilityContext

  gotoPrivacyPage() {
    router.pushUrl({
      url: 'pages/privacyPage'
    })
  }

  acceptPrivacy() {
    PreferencesUtils.getPreferences(this.context, 'store')
      .then((preferences) => {
        preferences.put(IS_ACCEPT_PRIVACY, true)
          .then(() => {
            preferences.flush()
          })
          .catch((err) => {
            console.log(err)
          })
      })
  }

  build() {
    Column() {
      Text('用户隐私条款').fontSize(20).margin({top: 20, bottom: 10})
      Text() {
        Span('为了更好的保护您的个人信息，我们根据最新的法律法规及相关政策要求，对隐私条款进行了更新，请您仔细阅读并确认')
        Span('《隐私条款》').fontColor('red').onClick(() => this.gotoPrivacyPage())
        Span('。（特别是加粗及下划线部分），我们会严格按照本')
        Span('《隐私条款》').fontColor('red').onClick(() => this.gotoPrivacyPage())
        Span('的约定收集、使用、存储您在使用本软件过程中的个人信息以便为您提供更优质的服务，感谢您的理解与信任。')
      }
      .padding({right: 20, left: 20})
      Flex({ justifyContent: FlexAlign.SpaceBetween}) {
        Button('不同意').onClick((event: ClickEvent) => {
          // 不同意直接退出程序
          let pro = new process.ProcessManager()
          pro.exit(0)
        })
          .backgroundColor('#FFFFFF')
          .fontColor(Color.Gray)
        Button('同意').onClick((event: ClickEvent) => {
          this.controller.close()
          this.acceptPrivacy()
        })
          .backgroundColor('#FFFFFF')
          .fontColor(Color.Red)
      }
      .width('50%')
      .margin({bottom: 20})
    }
  }
}