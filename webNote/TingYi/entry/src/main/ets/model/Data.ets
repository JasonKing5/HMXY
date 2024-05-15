// 常见语种列表
export class LanguageMap{
  lang:string
  chinese:string

  constructor(lang:string, chinese:string) {
    this.lang= lang
    this.chinese = chinese
  }
}

// 翻译接口 用户信息 api key
export class UserInfo{
  api:string
  key:string

  constructor(api:string,key:string) {
    this.api = api
    this.key = key
  }
}

