// 本文件存放各种函数:处理业务
import http from '@ohos.net.http'
import Constants from '../common/Constants'
import { PoemFromApi } from '../data/LightGreenData'

//发送http请求,获取诗词
export async function getPoemDate(): Promise<PoemFromApi> {
  let tempObj: PoemFromApi
  //发送网络请求，获取真实的数据覆盖原来
  await http.createHttp().request(Constants.poemApi)
    .then((data: http.HttpResponse) => {
      let content: string = JSON.parse(`${data.result}`).content
      let origin: string = JSON.parse(`${data.result}`).origin
      let author: string = JSON.parse(`${data.result}`).author
      let category: string = JSON.parse(`${data.result}`).category
      tempObj = new PoemFromApi(content, origin, author, category)
      console.log('请求到的tempObj:=>', JSON.stringify(tempObj))
    })


  return tempObj
}


// 保存当前服务端 发过来的诗词
export function saveCurrentPoem(obj: PoemFromApi) {
  //保存 自行扩展成持久化的效果   保存的就得是一个数组  每一次把当前数据 塞进去数组中。 然后保存新数组。
  // let baiShiArr:PoemFromApi[] = []  这也不对。每次都会置空数组

  // 应该用之前上次你存过的数组。  如果是第一次的话。之前没存过。给一个默认空数组。
  let baiShiArr: PoemFromApi[] = getColl(Constants.baiShi)

  baiShiArr.unshift(obj)
  // API9版本。到next时会移除。
  AppStorage.SetOrCreate(Constants.baiShi, baiShiArr)
  //  next版本
  // AppStorage.setOrCreate(Constants.baiShi,baiShiArr)
}

// 获取存过的百诗斩的 收藏数组
export function getColl(fieldName: string): Array<PoemFromApi> {
  // API9
  return (AppStorage.Get(fieldName) || []) as PoemFromApi[]
  // API11
  // return (AppStorage.get(fieldName) || []) as PoemFromApi[]
}


// 给我一个字符串。我还你一个数组。
export function stringToArr(str: string, spa: string) {
  return str.split(spa)
}

// 从收藏的数组中移除
export function cancelColl(content: string) {
  let baiShiArr: PoemFromApi[] = getColl(Constants.baiShi)
  //当前数组中肯定有该对象 filter 函数用来过滤数组。去除掉符合规则的数据。
  let newArr: PoemFromApi[] = baiShiArr.filter((item: PoemFromApi) => item.content !== content)
  // API9
  AppStorage.SetOrCreate(Constants.baiShi, newArr)
  // next
  // AppStorage.setOrCreate(Constants.baiShi,newArr)
}