/**
 * Custom pop-up window.
 */
import router from '@ohos.router';

@Preview
@CustomDialog
export default struct CustomDialogComponent {
  controller: CustomDialogController;
  cancel: () => void;
  confirm: () => void;

  build() {
    Column({ space: 20 }) {
      Text() {
        Span($r('app.string.user_privacy_title'))
          .fontColor('#182431')
          .fontWeight(FontWeight.Bold)
          .fontSize(20)
        Span('\n')
        // 隐私协议超链接
        Span($r('app.string.user_privacy_link'))
          .fontColor('#007DFF')
          .onClick(() => {
            router.pushUrl({
              url: "pages/PrivacyPage"
            }).catch((err) => {
              console.log('dxinError:点击查看隐私跳转出错...')
            })
          })
        Span($r('app.string.user_privacy_label'))
      }
      .privacyText()

      Row() {
        Text('不同意')
          .fancy(false)
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
        Blank()
          .backgroundColor('#F5F5F5')
          .width('1vp')
          .height('32vp')
        Text('同意')
          .fancy(true)
          .onClick(() => {
            this.controller.close()
            this.confirm()
          })
      }
    }
    .priDiaCol()
  }
}

// 协议按钮样式
@Extend(Text)
function fancy(flag: boolean) {
  .fontColor(flag ? '#007DFF' : '#ff73a6ee')
  .fontSize('20fp')
  .textAlign(TextAlign.Center)
  .fontWeight(FontWeight.Medium)
  .layoutWeight(1)
}

//协议文本样式
@Extend(Text)
function privacyText() {
  .width('90%')
  .fontSize('18fp')
  .lineHeight(25)
  .textAlign(TextAlign.Center)
  .textOverflow({ overflow: TextOverflow.Ellipsis })
  .maxLines(5)
}

//priDiaCol 弹窗column布局样式
@Extend(Column)
function priDiaCol() {
  .backgroundColor('#fff')
  .borderRadius(24)
  .width('90%')
  .padding({ top: 30, bottom: 30 })
  .margin({ bottom: '3%' })
}
