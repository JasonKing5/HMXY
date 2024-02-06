/*
 *   LauncherPage 是应用程序的入口点，演示如何开发 LauncherPage。
 *    在 LauncherPage 停留几秒钟以跳转到 index页面。
 * */
import Constants from '../common/Constants'
import PrivacyDialog from '../view/PrivacyDialog'
import preferences from '@ohos.data.preferences'
import common from '@ohos.app.ability.common'
import router from '@ohos.router'

@Entry
@Component
struct LauncherPage {
  // todo context如何获取 有问题----------
  context: common.UIAbilityContext
  @State appName: Resource = $r('app.string.App_Name')
  // 弹窗控制器
  privacyDialog: CustomDialogController = new CustomDialogController({
    builder: PrivacyDialog({
      cancel: () => {
        this.privacyDialog.close()
        console.log('好好好，头铁是吧。下次还给你弹窗')
        //   直接跳转
        router.replaceUrl({
          url: "pages/Index"
        })
      },
      confirm: () => {
        this.privacyDialog.close()
        console.log('听人劝吃饱饭')
        //   todo 首选项存储 同意条款
        this.savePrivacyState()
      }
    }),
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -24 },
    customStyle: true,
    // 是否点击空白关闭
    autoCancel: false
  })

  // 同意条款 存储同意状态
  savePrivacyState() {
    // 首选项对象
    let pf: Promise<preferences.Preferences> = preferences.getPreferences(this.context, 'DxinPoem')
    // 存储：同意
    pf.then((DxinPoem) => {
      let privacyState = DxinPoem.put('privacyState', true)
      DxinPoem.flush()
      privacyState.then(() => {
        // 状态存储执行OK
        console.info('DxinFlag:用户已同意条款')
        //   跳转去主页
        router.replaceUrl({
          url: "pages/Index"
        })
      }).catch(() => {
        console.log('DxinFlag:记录条款状态时，代码出错')
      })
    }).catch(() => {
      console.log('DxinFlag:获取首选项对象DxinPoem出错')
    })
  }

  // 控制弹窗显示的时机
  onPageShow() {
    this.context = getContext(this) as common.UIAbilityContext
    // todo 先获取一下状态。
    let pf: Promise<preferences.Preferences> = preferences.getPreferences(this.context, 'DxinPoem')
    pf.then((DxinPoem) => {
      let privacyState = DxinPoem.get('privacyState', false)
      console.log('隐私状态privacyState：',JSON.stringify(privacyState))

      privacyState.then((val) => {
        console.log('隐私状态val：',val)

        if (val) {
          // 为true 。同意过。
          setTimeout(() => {
            router.replaceUrl({
              url: "pages/Index"
            })
          }, 2000)
        } else {
          // 之前不同意
          this.privacyDialog.open()
        }
      })
    })
  }

  build() {
    Column({ space: 20 }) {
      Text(this.appName).appNameStyle()
      Image($r('app.media.logo')).logoStyle()
      Text(Constants.DxinWord).DxinWordStyle()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_background'))
    .justifyContent(FlexAlign.Center)
  }
}

// 软件名（标题） 样式
@Extend(Text)
function appNameStyle() {
  .fontSize(40)
  .fontWeight(FontWeight.Bold)
  .letterSpacing(30)
}

//logo 图片 样式
@Extend(Image)
function logoStyle() {
  .width(100)
  .height(100)
  .interpolation(ImageInterpolation.High)
  .borderRadius(24)
}

//
@Extend(Text)
function  DxinWordStyle() {
  .textOverflow({ overflow: TextOverflow.Ellipsis })
  .maxLines(1)
  .fontSize(20)
  .fontColor(Color.Green)
  .fontStyle(FontStyle.Italic)
}