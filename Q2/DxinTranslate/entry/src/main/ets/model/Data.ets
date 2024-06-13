// 语种选择的类型
export class Language {
  lang: string
  chinese: string
  //   构造函数
  constructor(lang:string,chinese:string) {
    this.lang = lang
    this.chinese = chinese
  }
}

//发请求的参数类型
export class ReqParams{
  api:string  //接口地址
  key:string  //个人中心的key

  constructor(api:string,key:string) {
    this.api = api
    this.key = key
  }
}

// 请求结果返回的类型
export class Resp{
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