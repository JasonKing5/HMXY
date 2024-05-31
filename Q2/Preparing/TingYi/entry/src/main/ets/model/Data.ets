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


// 请求结果返回的类型
export class Record{
  from:string
  to:string
  src:string
  dst:string
  //那个翻译API ： 天行  百度 聚合
  tranApi:string

  constructor(from:string,to:string,src:string,dst:string,tranApi:string) {
    this.from = from
    this.to = to
    this.src = src
    this.dst = dst
    this.tranApi = tranApi
  }
}
