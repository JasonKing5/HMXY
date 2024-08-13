import TopTitle from '../view/TopTitle'
import { common, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { router } from '@kit.ArkUI'
import Constants from '../common/Constants'
import { GroupItem, GroupPhase, ModuleRouter } from '../model/CustomModel'

@Entry
@Component
struct Index {
  // 拉起其他 module 或者 ability时 需要上下文对象
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

  // 知识点分组标题
  @Builder
  listItemGroupHeader(groupName: string) {
    Text(groupName).fontSize(30)
  }

  build() {
    Column({ space: 10 }) {
      TopTitle({ isBack: false })

      // 知识点展示
      List({ space: 20 }) {
        ForEach(Constants.groupPhaseArr, (groupPhase: GroupPhase) => {
          ListItemGroup({ header: this.listItemGroupHeader(groupPhase.groupName) }) {
            ForEach(groupPhase.GroupItemArr, (groupItem: GroupItem, index: number) => {
              ListItem() {
                RowItem({ index, groupItem })
              }
            })
          }
        })
      }
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)

      Divider().strokeWidth(5).color('#ff1678d9')
      Text('项目案例：')
      ForEach(Constants.moduleRouterArr, (item: ModuleRouter, index: number) => {
        Button(item.labels).onClick((event: ClickEvent) => {
          // 准备 want 信息传递 载体
          let wantInfo: Want = item.wantInfo
          this.context.startAbility(wantInfo)
            .then(() => {
              console.log('dxin =>', `拉起 ${item.labels} 成功`)
            })
            .catch((e: BusinessError) => {
              console.log('dxin =>', `拉起 ${item.labels} 失败`, e.message)
            })
        })
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}


// 每一个知识点
@Component
struct RowItem {
  index: number = 0
  groupItem: GroupItem = new GroupItem('每一个知识点的标题', '知识点url')

  build() {
    Row() {
      Text(this.index + '').fontColor('#ff2e5641')
      // caseTitle
      Text(this.groupItem.caseTitle)
    }
    .width('90%')
    .height(30)
    .borderRadius(15)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 10, right: 10 })
    .margin(10)
    .backgroundColor('#ffffffff')
    .onClick(() => {
      router.pushUrl({
        // caseUrl
        url: this.groupItem.caseUrl
      })
    })
  }
}