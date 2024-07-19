import TopTitle from '../view/TopTitle'
import { common, UIAbility, Want, } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
import routerConfig from '../common/routerCofig.json'

@Entry
@Component
struct Index {
  // 拉起其他 module 或者 ability时 需要上下文对象
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

  aboutToAppear(): void {
    console.log('index => routerConfig ',JSON.stringify(routerConfig))
  }

  @Builder
  listItemGroupHeader(groupName:string){
    Text(groupName).fontSize(30)
  }

  build() {
    Column({ space: 30 }) {
      TopTitle({ isBack: false })

      List(){
        ForEach(routerConfig, (group:object,index:number) => {
          // ListItemGroup({header:this.listItemGroupHeader(group.groupName)}){
          //
          // }
        })
      }


      Text('章节 demo')
      Button('ArkData Ability').onClick((event: ClickEvent) => {
        // 准备 want 信息传递 载体
        let wantInfo: Want = {
          deviceId: '', // 本设备
          bundleName: 'com.dxin.parmonyos', //应用包名
          moduleName: 'entry', // 目标 模块名称
          abilityName: 'ArkData', // 该模块下可能有多个 ability
          parameters: {
            info: '来自 entry index' // 参数可以省略
          }
        }
        this.context.startAbility(wantInfo)
          .then(() => {
            console.log('ppp', '拉起 ArkDataAbility 成功')
          })
          .catch((e: BusinessError) => {
            console.log('ppp', '拉起 ArkDataAbility 失败', e.message)

          })
      })
      Text('阶段项目')
      Button('南风意 module').onClick((event: ClickEvent) => {
        // 准备 want 信息传递 载体
        let wantInfo: Want = {
          deviceId: '', // 本设备
          bundleName: 'com.dxin.parmonyos', //应用包名
          moduleName: 'southWind', // 目标 模块名称
          abilityName: 'SouthWindAbility', // 该模块下可能有多个 ability
          parameters: {
            info: '来自 entry' // 参数可以省略
          }
        }
        this.context.startAbility(wantInfo)
          .then(() => {
            console.log('ppp', '拉起 南风意 成功')
          })
          .catch((e: BusinessError) => {
            console.log('ppp', '拉起 南风意 失败', e.message)

          })
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}