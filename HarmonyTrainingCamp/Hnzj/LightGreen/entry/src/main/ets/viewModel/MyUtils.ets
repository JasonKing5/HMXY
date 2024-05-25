// 本文件存放各种函数:处理业务
import http from '@ohos.net.http'
import Constants from '../common/Constants'
import { PoemFromApi } from '../data/LightGreenData'

//发送http请求,获取诗词
export async function getPoemDate():Promise<PoemFromApi>{
  let tempObj:PoemFromApi
  //发送网络请求，获取真实的数据覆盖原来
  await http.createHttp().request(Constants.poemApi)
    .then((data: http.HttpResponse) => {
      let content: string = JSON.parse(`${data.result}`).content
      let origin: string = JSON.parse(`${data.result}`).origin
      let author: string = JSON.parse(`${data.result}`).author
      let category: string = JSON.parse(`${data.result}`).category
       tempObj =  new PoemFromApi(content, origin, author, category)
      console.log('请求到的tempObj:=>',JSON.stringify(tempObj))
    })


  return tempObj
}


