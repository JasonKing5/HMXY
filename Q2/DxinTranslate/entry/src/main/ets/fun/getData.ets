// 向外暴露一个函数：给我一个英文标记。返回给你一个对应中文名称
import Constants from '../common/Constants'
import { Language } from '../model/Data'

export function getLangaugeText(lang:string):string{
  // todo: 从 src/main/ets/common/Constants.ets数组中查
  let obj:Language  = Constants.languageItem.find((item:Language) => item.lang === lang)
  return obj.chinese
}