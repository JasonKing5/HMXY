// 常量数据。
import { Language, ReqParams } from '../model/Data'

export default class Constants{
  //可选的语种
  static readonly languageItem: Language[] = [
    new Language("en", "英语"),
    new Language("zh", "中文"),
    new Language("jp", "日语"),
    new Language("kor", "韩语"),
    new Language("fra", "法语"),
    new Language("spa", "西班牙语"),
    new Language("th", "泰语"),
    new Language("ara", "阿拉伯语"),
    new Language("ru", "俄语"),
    new Language("pt", "葡萄牙语"),
    new Language("de", "德语"),
    new Language("it", "意大利语")
  ]

  //默认的语种 字母标记
  static readonly lang:string = 'zh'

  // 翻译接口的标记字段
  static readonly tianxing:string = 'tianxing'

//   存取历史翻译数据的标记字段名 history
  static readonly history:string = 'history'

//   todo 发请求的时候，需要用到的参数。API接口和个人的key  不管是天行数据还是百度翻译，。。。
  static readonly txReq:ReqParams = new ReqParams('https://apis.tianapi.com/fanyi/index','d94776b74d81b54caacefdaa560cb77c')

}