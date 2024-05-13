import axios, { AxiosResponse } from '@ohos/axios'
import Constants from '../common/Constants'
import { Language, TianXingResp } from '../model/Data'

// 从天行数据获取翻译
export async function getDataTianXing(text: string, lang: string) {
  let url = `${Constants.tianXing.baseUrl}?key=${Constants.tianXing.key}&text=${text}&to=${lang}`
  //   res.data.result.dst
  let response: AxiosResponse = await axios.get(url)
  // console.log('axios结果', JSON.stringify(response))
  let from: string = response.data.result.dst
  let to: string = response.data.result.to
  let src: string = response.data.result.src
  let dst: string = response.data.result.dst
  return new TianXingResp(from, to, src, dst)
}

// 保存历史数据
export function saveHistory(tranObj: TianXingResp) {
  //从本地存储中获取数组对象
  let historyArr: TianXingResp[] = getHistory()
  // 查重
  let flag = historyArr.some(item => item.src === tranObj.src)
  // 如果不存在 存入
  if (!flag) {
    historyArr.push(tranObj)
  }
  //存进去
  // AppStorage.SetOrCreate(Constants.histroy, historyArr)
  AppStorage.setOrCreate(Constants.histroy, historyArr)
  console.log('存储结束')
}

// 获取历史数据
export function getHistory(): TianXingResp[] {
  // return AppStorage.Get(Constants.histroy) || []
  return AppStorage.get(Constants.histroy) || []
}

// 给我一个语言标记 从数组中查出来对应语种进行返回
export function getLanguageText(lang:string):string{
  let obj:Language = Constants.languageItem.find( (item:Language) => item.lang === lang ) as Language
  return obj.chinese
}
