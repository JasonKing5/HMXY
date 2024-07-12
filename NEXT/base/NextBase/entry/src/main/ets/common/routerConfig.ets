// 配置路由信息
import { NavigationModel } from '../model/BaseClass'

// 首页路由到一级知识点home页面，需要很多路由
// 在一级知识点home页面，同样需要很多路由去耳机知识点。
//甚至还有三级路由或者案例demo路由。


// 路由配置类。
export default class RouterCfg {
  // 首页导航到一级知识点的数组。
  static readonly homeArr: NavigationModel[] = [
    new NavigationModel('学习ArkUI', "pages/ArkUI/ArkUIHome", "ArkUIHome"),
    new NavigationModel('学习NetWorkKit', "pages/NetworkKit/NetWorkKitHome", "NetWorkKitHome"),
    new NavigationModel('学习ArkData', "pages/ArkData/ArkDataHome", "ArkDataHome"),

  ]
  // ArkUIHome 页面知识点的数组
  static readonly arkUIHome: NavigationModel [] = [
    new NavigationModel('Stack', "pages/ArkUI/StackDemo", "Stack 组件"),
    new NavigationModel('List', "pages/ArkUI/ListDemo", "List 组件"),
    new NavigationModel('RowColumn', "pages/ArkUI/RowColumn", "Row/Column 组件"),
    new NavigationModel('Image', "pages/ArkUI/ImageDemo", "Image 组件"),
    new NavigationModel('Button', "pages/ArkUI/ButtonDemo", "Button 组件"),
    new NavigationModel('Text', "pages/ArkUI/TextDemo", "Text 组件"),


  ]
}