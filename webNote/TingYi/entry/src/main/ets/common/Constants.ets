import { LanguageMap, UserInfo } from '../model/Data'

export class Constants{
  // 语种的 字母标记 和 中文表示 映射数组
  static readonly langaugeList:LanguageMap[] = [
    new LanguageMap('zh','中文'),
    new LanguageMap('en','英语'),
    new LanguageMap('jp','日语'),
    new LanguageMap('kor','韩语'),
    new LanguageMap('fra','法语'),
    new LanguageMap('spa','西班牙语'),
    new LanguageMap('th','泰语'),
    new LanguageMap('ara','阿拉伯语'),
    new LanguageMap('ru','俄语'),
    new LanguageMap('el','希腊语'),
    new LanguageMap('bul','保加利亚语'),
    new LanguageMap('slo','斯洛文尼亚语'),
    new LanguageMap('pl','波兰语')
  ]

  // 天行数据的 api 和 key  一个变量 既可以保存api 还可以保存 key
  static readonly tianXingUserInfo:UserInfo = new UserInfo('https://apis.tianapi.com/fanyi/index','d94776b74d81b54caacefdaa560cb77c')

  // 百度翻译的api和 appid
  static readonly baiDuUserInfo:UserInfo = new UserInfo('https://fanyi-api.baidu.com/api/trans/vip/translate','20240510002047733')
  // 百度翻译还需要一个密钥
  static readonly baiDuPassword:string = 'xphFCeytICtN_NXI5Yf8'


  //   存取历史翻译数据的标记字段名 history
  static readonly history:string = 'history'

  // 翻译接口的标记字段
  static readonly tianxing:string = 'tianxing'

}