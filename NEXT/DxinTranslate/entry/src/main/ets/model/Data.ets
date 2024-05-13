//导入axios网络请求模块
import axios from '@ohos/axios'
import CryptoJS from '@ohos/crypto-js'
import Constants from '../common/Constants'

// 语种
export class Language {
  lang: string
  chinese: string

  constructor(lang: string, chinese: string) {
    this.lang = lang
    this.chinese = chinese
  }
}

// 天行数据参数
@Observed
export class TianXingParams{
  key:string
  baseUrl:string

  constructor(key:string,baseUrl:string) {
    this.key = key
    this.baseUrl = baseUrl
  }
}

// 天行数据响应数据 类
export class TianXingResp{
  from:string
  to:string
  src:string
  dst:string

  constructor(from:string,to:string,src:string,dst:string) {
    this.from = from
    this.to = to
    this.src = src
    this.dst = dst
  }

}