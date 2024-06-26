// 常量数据文件
import MyRouterInfo from '../model/MyRouterInfo'
import MyPreferenceData from '../model/MyPreferenceData'

export default class Constants {
  // 首选项 沙箱文件名 当前项目用
  static readonly PreferencesFileName: string = 'base'
  // 首选项 首页字体 对象
  static readonly prefFontSizeObj: MyPreferenceData =
    new MyPreferenceData(this.PreferencesFileName, 'indexFontSize', 22)
  // index页面路由数组 对象
  static readonly indexRouters: Array<MyRouterInfo> = [
    new MyRouterInfo('pages/ArkUI/ArkUIHome', 'ArkUI 组件'),
    new MyRouterInfo('pages/AbilityKit/AbilityKitHome', 'AbilityKitHome 应用程序框架'),
    new MyRouterInfo('pages/NetworkKit/NetworkKitHome', 'NetworkKit 网络请求'),
    new MyRouterInfo('pages/ArkData/ArkDataHome', 'ArkData 数据管理'),
  ]
  // ArkUI home 路由
  static readonly arkUIRouters: Array<MyRouterInfo> = [
    new MyRouterInfo('pages/ArkUI/SliderBase', 'Slider组件基础'),
    new MyRouterInfo('pages/ArkUI/SliderCase', 'Slider组件案例'),
  ]
}

