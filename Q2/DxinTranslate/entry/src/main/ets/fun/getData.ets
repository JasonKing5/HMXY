import axios, { AxiosResponse } from '@ohos/axios'
import Constants from '../common/Constants'
import { Language, Resp } from '../model/Data'

// 向外暴露一个函数：给我一个英文标记。返回给你一个对应中文名称
export function getLangaugeText(lang: string): string {
  // todo: 从 src/main/ets/common/Constants.ets数组中查
  let obj: Language = Constants.languageItem.find((item: Language) => item.lang === lang)
  return obj.chinese
}


// todo:向外暴露一个获取 天行翻译 的函数:给我一个文本，我返回给你一个结果。
export async function getDataTianXing(text: string, lang: string = 'zh') {
  let uri: string = Constants.txReq.api
  let key: string = Constants.txReq.key
  let url: string = `${uri}?key=${key}&text=${text}&to=${lang}`
  let response: AxiosResponse = await axios.get(url)

  let src: string = text //原文
  let dst: string = response.data.result.dst //翻译结果
  let from: string = response.data.result.from //原语种
  let to: string = lang //目标语种
  return new Resp(from, to, src, dst, Constants.tianxing)
}


// 保存曾经翻译过的历史数据
export function saveHistory(tranObj: Resp) {
  //获取 AppStorage 对象中存过的数组。可能是空数组。也可能是有数据的数组。
  let histroyArr: Resp[] = getHistory()
  // 去重。
 let flag =  histroyArr.some((item) => item.src=== tranObj.src && item.tranApi === tranObj.tranApi && item.dst === tranObj.dst)
  if (!flag) {
    //还没存过 tranObj  存到数组的开头  比如只存50条记录。
    histroyArr.unshift(tranObj)
  }

  // 此时 histroyArr 已经多了一个新的数据  全局存进去更新后的数组。不要手误，存 传进来的对象
  // API9
  AppStorage.SetOrCreate(Constants.history,histroyArr)
  // next
  // AppStorage.setOrCreate(Constants.history,tranObj)
}


// 取出来历史数据
export function getHistory(): Resp[] {
  //  API9
  return AppStorage.Get(Constants.history) || []
  //   NEXT
  //   return AppStorage.get(Constants.history) || []
}
