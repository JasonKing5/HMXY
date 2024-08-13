// 知识阶段 分组
import Want from '@ohos.app.ability.Want'

export class GroupPhase{
  groupName:string
  GroupItemArr:GroupItem[]
  constructor(groupName: string, GroupItemArr: GroupItem[]) {
    this.groupName = groupName
    this.GroupItemArr = GroupItemArr
  }
}

// 分组的每一项
export class GroupItem{
  caseTitle ?:string
  caseUrl?:string

  constructor(caseTitle: string, caseUrl: string) {
    this.caseTitle = caseTitle
    this.caseUrl = caseUrl
  }
}


// Ability 和 module 数据
export class ModuleRouter{
  labels:string = ''
  wantInfo:Want = {
    deviceId: '', // 本设备
    // bundleName: 'com.dxin.parmonyos', //应用包名
    bundleName: 'com.dxin.parmonyos', //也可动态获取
    moduleName: '待跳转的module名称', // 目标 模块名称
    abilityName: '待跳转的module下的ability名称', // 该模块下可能有多个 ability
    parameters: {
      info: '来自 entry index' // 参数可以省略
    }
  }

  constructor(labels: string, wantInfo: Want) {
    this.labels = labels
    this.wantInfo = wantInfo
  }
}
