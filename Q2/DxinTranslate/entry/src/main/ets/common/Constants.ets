// 封装常量数据
import { Language, TianXingParams } from '../model/Data'
import CryptoJS from '@ohos/crypto-js'

export default class Constants {
  //可选语种
  static readonly languageItem: Language[] = [
    new Language("en", "英语"),
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
  // 语种映射关系
  static readonly languageMap:object = {
    "en":"英语",
    "zh":"中文",
    "jp": "日语",
    "kor": "韩语",
    "fra": "法语",
    "spa": "西班牙语",
    "th":"泰语",
    "ara": "阿拉伯语",
    "ru": "俄语",
    "pt":"葡萄牙语",
    "de": "德语",
    "it": "意大利语"
  }
  //如果用户未选择时 默认翻译的目标语种
  static readonly lang: string = 'zh'

    //   天行数据
  static readonly tianXing: TianXingParams =   new TianXingParams('d94776b74d81b54caacefdaa560cb77c','https://apis.tianapi.com/fanyi/index')

//   历史数据 键名
  static readonly histroy:string  = 'history'
}