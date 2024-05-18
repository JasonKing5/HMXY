import axios, { AxiosResponse } from '@ohos/axios'
import { Constants } from '../common/Constants'
import { LanguageMap, Record } from '../model/Data'

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

  let src: string = message //原文
  let dst: string = resObj.data.result.dst //翻译结果
  let from: string = resObj.data.result.from //原语种
  let to: string = lang //目标语种


  return new Record(from,to,src,dst, Constants.tianxing)
}


// 取出来历史数据
export function getHistory(): Record[] {
  //  API9
  return AppStorage.Get(Constants.history) || []
  //   NEXT
  //   return AppStorage.get(Constants.history) || []
}


// 保存曾经翻译过的历史数据
export function saveHistory(tranObj: Record) {
  let histroyArr: Record[] = getHistory()
  // 去重。
  let flag =  deduplication(histroyArr,tranObj)
  if (!flag) histroyArr.unshift(tranObj)
  // API9
  AppStorage.SetOrCreate(Constants.history,histroyArr)
  // next
  // AppStorage.setOrCreate(Constants.history,tranObj)
}

// 判断数组中是否包含指定规则的对象
function deduplication(arr:Record[],obj:Record){
  return arr.some((item:Record) => item.src=== obj.src && item.tranApi === obj.tranApi && item.dst === obj.dst)
}
