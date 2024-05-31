import common from '@ohos.app.ability.common';
import { IS_ACCEPT_PRIVACY } from '../common/preferences/PreferencesConfig';
import { PreferencesUtils } from '../common/preferences/PreferencesUtils';
import Card from '../model/Card';
import ScoreCustomDialog from '../view/ScoreCustomDialog';
import privacyCustomDialog from './privacyDialog';

@Entry
@Component
struct Index {
  context = getContext(this) as common.UIAbilityContext

  @State message: string = 'Hello World';

  @State left: Card = new Card('#ea564e',0,0,[])


  @State right:Card =  new Card('#4396c6',0,0,[])


  onPageShow() {
    PreferencesUtils.getPreferences(this.context, 'store')
      .then((preferences) => {
        preferences.get(IS_ACCEPT_PRIVACY, false).then((data) => {
          if (!data) { // 如果未点击过同意按钮，则弹出隐私协议弹窗
            this.privacyDialogController.open()
          }
        })
      })
  }

  // 添加分数
  addScore(key) {
    this[key].score += 1
  }

  // 减少分数
  minusScore(key) {
    if (this[key].score != 0) {
      this[key].score -= 1
    }
  }

  // 比赛记一局比分
  addWinGame(key) {
    // 点击的一方记一分
    this[key].winGame += 1
    // 将双方的分数push进history数组存储
    this.left.history.push(this.left.score)
    this.right.history.push(this.right.score)
    // 清空双方比分
    this.left.score = 0
    this.right.score = 0
  }

  // 交换场地
  changeArea() {
    const temp = Object.assign({}, this.left)
    this.left = Object.assign({}, this.right)
    this.right = Object.assign({}, temp)
  }

  // 清空数据
  clearData() {
    this.left = new Card('#ea564e',0,0,[])
    this.right = new Card('#4396c6',0,0,[])
  }


  dialogController: CustomDialogController = new CustomDialogController({
    builder: ScoreCustomDialog({
      left: $left,
      right: $right
    })
  })

  privacyDialogController: CustomDialogController = new CustomDialogController({
    builder: privacyCustomDialog(),
    autoCancel: false
  })

  build() {
    Row() {
      // 左边每局分数
      Column() {
        Button('', { type: ButtonType.Normal })
          .changScore(0)
          .onClick((event: ClickEvent) => this.addScore('left'))
        Text(this.left.score.toString())
          .fontSize(this.left.score > 9 ? 180 : 220)
        Button('', { type: ButtonType.Normal })
          .changScore('50%')
          .onClick((event: ClickEvent) => this.minusScore('left'))
      }
      .liftAndRighStyle(this.left.color)

      // 中间部分：赢的局数比分及功能按钮
      Column() {
        Row() {
          // 左边赢的局数
          Column() {
            Text(this.left.winGame.toString())
              .fontSize(this.left.winGame > 9 ? 80 : 100)
          }
          .winStyle(this.left.color)
          .onClick(() => this.addWinGame('left'))

          // 右边赢的局数
          Column() {
            Text(this.right.winGame.toString())
              .fontSize(this.right.winGame > 9 ? 80 : 100)
          }
          .winStyle(this.right.color)
          .onClick(() => this.addWinGame('right'))
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Button('交换场地').onClick(() => this.changeArea())
          .btnStyle()
        Button('每局比分').onClick(() => this.dialogController.open())
          .btnStyle()
        Button('清空数据').onClick(() => this.clearData())
          .btnStyle()
      }
      .width('30%')
      .height('100%')

      // 右边每局分数
      Column() {
        Button('', { type: ButtonType.Normal })
          .onClick((event: ClickEvent) => this.addScore('right'))
          .changScore(0)
        Text(this.right.score.toString())
          .fontSize(this.right.score > 9 ? 180 : 220)
        Button('', { type: ButtonType.Normal })
          .onClick((event: ClickEvent) => this.minusScore('right'))
          .changScore('50%')
      }
      .liftAndRighStyle(this.right.color)
    }
    .containerStyle()
  }
}

@Extend(Row)
function containerStyle() {
  .width('100%')
  .height('100%')
  .justifyContent(FlexAlign.SpaceBetween)
  .padding({ left: 12, right: 12, bottom: 30 })
}

@Extend(Button)
function changScore(yVale:number | string) {
  .width('100%')
  .height('50%')
  .position({ x: 0, y: yVale})
  .zIndex(99)
  .backgroundColor('transparent')
}

@Extend(Button)
function btnStyle() {
  .width('100%')
  .height(30)
  .backgroundColor('#f1f3fb')
  .fontColor('#265696')
  .margin({ top: 20 })
}

@Extend(Column)
function winStyle(winColor:string) {
  // 左边赢的局数
  .width('48%')
  .height('40%')
  .borderRadius(20)
  .alignItems(HorizontalAlign.Center)
  .justifyContent(FlexAlign.Center)
  .backgroundColor(winColor)

}

@Extend(Column)
function liftAndRighStyle(currentBgc:string) {
  // 左边每局分数
  .width('30%')
  .height('100%')
  .borderRadius(20)
  .alignItems(HorizontalAlign.Center)
  .justifyContent(FlexAlign.Center)
  .backgroundColor(currentBgc)

}
