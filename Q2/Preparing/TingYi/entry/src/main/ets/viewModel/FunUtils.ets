import axios, { AxiosResponse } from '@ohos/axios'
import { Constants } from '../common/Constants'
import { LanguageMap, Record } from '../model/Data'
import { CryptoJS } from '@ohos/crypto-js'

// // 1： 给我一个英文的字母标记。我就给你返回该语种对照表的中文
export function langToChinese(lang: string) {
  let obj: LanguageMap =
    Constants.langaugeList.find((item: LanguageMap) => item.lang === lang) || new LanguageMap('zh', '中文')
  return obj.chinese
}

// 发送请求 【天行翻译】 返回一个数据
export async function getDataTianXing(message: string, lang: string) {
  //   axios请求 安装第三方包
  let api = Constants.tianXingUserInfo.api
  let key = Constants.tianXingUserInfo.key
  let url = `${api}?key=${key}&text=${message}&to=${lang}`
  let resObj: AxiosResponse = await axios.get(url)

  let src: string = message //原文
  let dst: string = resObj.data.result.dst //翻译结果
  let from: string = resObj.data.result.from //原语种
  let to: string = lang //目标语种


  return new Record(from, to, src, dst, Constants.tianxing)
}

// 发送请求 【百度翻译】 返回一个数据
export async function getDataBaiDu(message: string, lang: string) {
  let api: string = Constants.baiDuUserInfo.api
  let appid: string = Constants.baiDuUserInfo.key
  //获取一个随机数。获取当前日期的毫秒值
  let salt: string = Date.now().toString()
  //密钥
  let bdPassWord:string = Constants.baiDuPassword
  // 需要签名 : 注意细节
  let sign: string = CryptoJS.MD5(appid + message + salt + bdPassWord)
  console.log('签名：',sign)
  // 完整的拼接：http://api.fanyi.baidu.com/api/trans/vip/translate?q=apple&from=en&to=zh&appid=2015063000000001&salt=1435660288&sign=f89f9594663708c1605f3d736d01d2d4

  let url = `${api}?q=${message}&from=${'auto'}&to=${lang}&appid=${appid}&salt=${salt}&sign=${sign}`
  console.log('baidu拼接后的url:',url)

  let resObj: AxiosResponse = await axios.get(url)
  let resData = resObj.data
  console.log('baidu-->服务端数据：',JSON.stringify(resData))
  console.log('baidu-->服务端数据：',resData.trans_result[0].dst)

  let src: string = message //原文
  let dst: string = resData.trans_result[0].dst //翻译结果
  let from: string = resData.from //原语种
  let to: string = lang //目标语种
  return new Record(from, to, src, dst, Constants.baidu)
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
  // 假设数组中跟当前的数据不重复
  let flag = false

  // 去重。
  if (histroyArr.length !== 0) {
    flag = deduplication(histroyArr, tranObj)
  }
  // 如果重复。直接return
  if (flag) return
  //倒着存储
  histroyArr.unshift(tranObj)
  // API9
  AppStorage.SetOrCreate(Constants.history, histroyArr)
  // next
  // AppStorage.setOrCreate(Constants.history,tranObj)
}

// 判断数组中是否包含指定规则的对象
function deduplication(arr: Record[], obj: Record) {
  return arr.some((item: Record) => item.src === obj.src && item.tranApi === obj.tranApi && item.dst === obj.dst)
}
