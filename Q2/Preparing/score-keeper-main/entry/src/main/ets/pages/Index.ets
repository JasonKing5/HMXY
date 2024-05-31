import common from '@ohos.app.ability.common'
import { IS_ACCEPT_PRIVACY } from '../common/preferences/PreferencesConfig'
import { PreferencesUtils } from '../common/preferences/PreferencesUtils'
import ScoreCustomDialog from './customDialog'
import privacyCustomDialog from './privacyDialog'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  context = getContext(this) as common.UIAbilityContext

  @State left: {
    color: string,
    score: number,
    winGame: number,
    history: number[]
  } = {
    color: '#ea564e',
    score: 0,
    winGame: 0,
    history: []
  }

  @State right: {
    color: string,
    score: number,
    winGame: number,
    history: number[]
  } = {
    color: '#4396c6',
    score: 0,
    winGame: 0,
    history: []
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
    this.left = {
      color: '#ea564e',
      score: 0,
      winGame: 0,
      history: []
    }
    this.right = {
      color: '#4396c6',
      score: 0,
      winGame: 0,
      history: []
    }
  }

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
          Button('', {type: ButtonType.Normal})
            .onClick((event: ClickEvent) => this.addScore('left'))
            .width('100%')
            .height('50%')
            .position({x: 0, y: 0})
            .zIndex(99)
            .backgroundColor('transparent')
          Text(this.left.score.toString())
            .fontSize(this.left.score > 9 ? 180 : 220)
          Button('', {type: ButtonType.Normal})
            .onClick((event: ClickEvent) => this.minusScore('left'))
            .width('100%')
            .height('50%')
            .position({x: 0, y: '50%'})
            .zIndex(99)
            .backgroundColor('transparent')
        }
        .width('30%')
        .height('100%')
        .borderRadius(20)
        .backgroundColor(this.left.color)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        // 中间部分：赢的局数比分及功能按钮
        Column() {
          Row() {
            // 左边赢的局数
            Column() {
              Text(this.left.winGame.toString())
                .fontSize(this.left.winGame > 9 ? 80 : 100)
            }
            .width('48%')
            .height('40%')
            .borderRadius(20)
            .backgroundColor(this.left.color)
            .alignItems(HorizontalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .onClick(() => this.addWinGame('left'))
            // 右边赢的局数
            Column() {
              Text(this.right.winGame.toString())
                .fontSize(this.right.winGame > 9 ? 80 : 100)
            }
            .width('48%')
            .height('40%')
            .borderRadius(20)
            .backgroundColor(this.right.color)
            .alignItems(HorizontalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .onClick(() => this.addWinGame('right'))
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          Button('交换场地').onClick(() => this.changeArea())
            .width('100%')
            .height(30)
            .backgroundColor('#f1f3fb')
            .fontColor('#265696')
            .margin({top: 20})
          Button('每局比分').onClick(() => this.dialogController.open())
            .width('100%')
            .height(30)
            .backgroundColor('#f1f3fb')
            .fontColor('#265696')
            .margin({top: 20})
          Button('清空数据').onClick(() => this.clearData())
            .width('100%')
            .height(30)
            .backgroundColor('#f1f3fb')
            .fontColor('#265696')
            .margin({top: 20})
        }
        .width('30%')
        .height('100%')
        // 右边每局分数
        Column() {
          Button('', {type: ButtonType.Normal})
            .onClick((event: ClickEvent) => this.addScore('right'))
            .width('100%')
            .height('50%')
            .position({x: 0, y: 0})
            .zIndex(99)
            .backgroundColor('transparent')
          Text(this.right.score.toString())
            .fontSize(this.right.score > 9 ? 180 : 220)
          Button('', {type: ButtonType.Normal})
            .onClick((event: ClickEvent) => this.minusScore('right'))
            .width('100%')
            .height('50%')
            .position({x: 0, y: '50%'})
            .zIndex(99)
            .backgroundColor('transparent')
        }
        .width('30%')
        .height('100%')
        .borderRadius(20)
        .backgroundColor(this.right.color)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({left: 12, right: 12, bottom: 30 })
  }
}