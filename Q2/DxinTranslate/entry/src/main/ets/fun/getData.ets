import axios, { AxiosResponse } from '@ohos/axios'
import Constants from '../common/Constants'
import { TianXingResp } from '../model/Data'

// 从天行数据获取翻译
export async function getDataTianXing(text: string, lang: string) {
  let url = `${Constants.tianXing.baseUrl}?key=${Constants.tianXing.key}&text=${text}&to=${lang}`
  //   res.data.result.dst
  let response: AxiosResponse = await axios.get(url)
  // console.log('axios结果', JSON.stringify(response))
  let from = response.data.result.dst
  let to = response.data.result.to
  let src = response.data.result.src
  let dst = response.data.result.dst
  return new TianXingResp(from, to, src, dst)
}

// 保存历史数据
export function saveHistory(tranObj: TianXingResp) {
  //从本地存储中获取数组对象
  let historyArr: TianXingResp[] = getHistory()
  // 查重
  let flag = historyArr.some((item) => {
    if (item.src === tranObj.src) {
      return true
    }
  })
  // 如果不存在 存入
  if (!flag) {
    historyArr.push(tranObj)
  }
  //存进去
  AppStorage.SetOrCreate(Constants.histroy, historyArr)
}

// 获取历史数据
export function getHistory(): TianXingResp[] {
  return AppStorage.Get(Constants.histroy) || []
}
