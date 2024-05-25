import { BtnNavigation } from '../data/HzData'

export default class Contants {
  // 按钮导航数组
  static readonly btnNavigation: BtnNavigation [] = [
    new BtnNavigation('文本组件', "pages/TextComp"),
    new BtnNavigation('图片学习', "pages/ImageComp"),
    new BtnNavigation('List组件', "pages/ListComp"),
    new BtnNavigation('ArkTS语法', "pages/ArkTStudy"),
    new BtnNavigation('自定义组件', "pages/CustomComp"),
    new BtnNavigation('装饰器学习', "pages/CustomComp"),
    new BtnNavigation('分支和类型大小写', "pages/IfEl"),

  ]
}