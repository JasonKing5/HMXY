// 知识阶段 分组
export class GroupPhase{
  tag:string
  groupName:string
  groupContentArr:GroupContent[]

  constructor(tag: string, groupName: string, groupContentArr: GroupContent[]) {
    this.tag = tag
    this.groupName = groupName
    this.groupContentArr = groupContentArr
  }
}

export class GroupContent{
  btnContent :string
  pageUrl:string

  constructor(btnContent: string, pageUrl: string) {
    this.btnContent = btnContent
    this.pageUrl = pageUrl
  }
}
