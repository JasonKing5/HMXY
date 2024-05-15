import axios, { AxiosResponse } from '@ohos/axios'
import { Constants } from '../common/Constants'
import { LanguageMap } from '../model/Data'

// // 1： 给我一个英文的字母标记。我就给你返回该语种对照表的中文
export function langToChinese(lang:string){
 let obj:LanguageMap =
   Constants.langaugeList.find((item:LanguageMap) => item.lang === lang) ||  new LanguageMap('zh','中文')
  return obj.chinese
}


// 发送请求 【天行翻译】 返回一个数据
export async function getDataTianXing(message:string,lang:string){
  //   axios请求 安装第三方包
  let api = Constants.tianXingUserInfo.api
  let key = Constants.tianXingUserInfo.key
  let url = `${api}?key=${key}&text=${message}&to=${lang}`
  let resObj:AxiosResponse =await axios.get(url)
  console.log('请求结果：',JSON.stringify(resObj.data))
  return resObj.data.result.dst
}
