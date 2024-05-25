import { BtnNavigation } from '../data/HzData'

export default class Contants {
  // 按钮导航数组
  static readonly btnNavigation: BtnNavigation [] = [
    new BtnNavigation('文本组件', "pages/TextComp"),
    new BtnNavigation('图片学习', "pages/ImageComp"),
    new BtnNavigation('List组件', "pages/ListComp"),
    new BtnNavigation('ArkTS语法', "pages/ArkTStudy")
  ]
}