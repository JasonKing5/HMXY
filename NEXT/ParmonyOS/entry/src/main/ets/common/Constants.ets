// 常量数据配置
import { GroupItem, GroupPhase, ModuleRouter } from '../model/CustomModel'
import { Context } from '@ohos.arkui.UIContext'
import { common } from '@kit.AbilityKit'

export default class Constants {
  // 知识点分组数据
  static readonly groupPhaseArr: Array<GroupPhase> = [
    new GroupPhase('ArkUI', [
      new GroupItem('Web',  "pages/ArkUI/WebComp"),
      new GroupItem('Navigation',  "pages/ArkUI/NavigationComp"),
      new GroupItem('Video',  "pages/ArkUI/VideoComp"),
      new GroupItem('Row/Column', '???'),
    ]),
    new GroupPhase('ArkTS', [
      new GroupItem('自定义组件', 'pages/ArkTS/CustomComponents'),
      new GroupItem('@Builder装饰器', 'pages/ArkTS/BuilderDecorators'),
      new GroupItem('@BuilderParam装饰器', 'pages/ArkTS/BuilderParamDecorators'),
      new GroupItem('wrapBuilder', 'pages/ArkTS/???'),
      new GroupItem('stateStyles：多态样式', 'pages/ArkTS/???'),
      new GroupItem('@AnimatableExtend装饰器', 'pages/ArkTS/???'),
      new GroupItem('@Require装饰器', 'pages/ArkTS/???'),
      new GroupItem('@Observed和@ObjectLink', 'pages/ArkTS/???'),
      new GroupItem('LocalStorage页面级UI状态存储', 'pages/ArkTS/???'),
      new GroupItem('AppStorage：应用全局的UI状态存储', 'pages/ArkTS/???'),
      new GroupItem('PersistentStorage：持久化存储UI状态', 'pages/ArkTS/???'),
      new GroupItem('Environment：设备环境查询', 'pages/ArkTS/???'),
      new GroupItem('@Watch装饰器：状态变量更改通知', 'pages/ArkTS/???'),
      new GroupItem('$$语法', 'pages/ArkTS/???'),
      new GroupItem('@Track装饰器', 'pages/ArkTS/???'),
      new GroupItem('自定义组件冻结功能', 'pages/ArkTS/???'),
      new GroupItem('V2所属装饰器...', 'pages/ArkTS/???'),
      new GroupItem('...', 'pages/ArkTS/???'),
    ]),

    new GroupPhase('ArkData', [
      new GroupItem('ArkData', '???'),
    ])
  ]

  // 上下文对象
  static readonly   context:Context = getContext(this) as common.UIAbilityContext

  // Ability 和 module 数据
  static readonly moduleRouterArr: Array<ModuleRouter> = [
    new ModuleRouter('ArkData',{
      deviceId: '', // 本设备
      bundleName: getContext(this.context).applicationInfo.name, // 通过上下文对象动态获取
      // bundleName: 'com.dxin.parmonyos', //应用包名
      moduleName: 'entry', // 目标 模块名称
      abilityName: 'ArkData', // 该模块下可能有多个 ability
      parameters: {
        info: 'dxin 来自 entry index' // 参数可以省略
      }
    }),
    new ModuleRouter('南风意', {
      deviceId: '', // 本设备
      bundleName: getContext(this.context).applicationInfo.name, // 通过上下文对象动态获取
      // bundleName: 'com.dxin.parmonyos', //应用包名
      moduleName: 'southWind', // 目标 模块名称
      abilityName: 'SouthWindAbility', // 该模块下可能有多个 ability
      parameters: {
        info: 'dxin 来自 entry module' // 参数可以省略
      }
    }),
  ]
}