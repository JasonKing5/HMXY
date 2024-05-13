// 常量数据。
import { Language } from '../model/Data'

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

}