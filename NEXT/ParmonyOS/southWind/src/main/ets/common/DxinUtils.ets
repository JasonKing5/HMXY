// 导入自己准备好的数据
import poemArr from 'resources/rawfile/poemArr.json'
import { CateGoryItem, CateGoryPoem } from '../modelData/ModelData'
import { http } from '@kit.NetworkKit'

class DxinUtils {
  //将mock数据设计成 可用的数组数据 两级分类
  mock2Data(): Array<CateGoryPoem> {
    // 准备一个空的数组
    let resultArr: Array<CateGoryPoem> = []
    poemArr.forEach((item) => {
      //  Object.keys(item)[0] 获取的是键名数组第一项。即 【节日】 或者 【节日-元宵节】
      let firstTitle: string = Object.keys(item)[0].split('-')[0]
      let itemTitle: string = Object.keys(item)[0].split('-')[1] //如果是【节日】。则无法分割，也娶不到二级标题

      const api: string = Object.values(item)[0] // 此时的Api 可能是一级标题的，也可能是二级标题的

      // 如果没有二级标题。 创建 一级标题对象。itemArr数组给默认空
      if (!itemTitle) {
        resultArr.push(new CateGoryPoem(firstTitle, api, []))
      } else {
        // 如果有二级标题。一级标题一定已经存在了。往itemArr数组中放二级标题的属性即可
        resultArr.find(item => item.firstTitle === firstTitle)?.itemArr?.push(new CateGoryItem(itemTitle, api))
      }
    })
    return resultArr as [CateGoryPoem]
  }

  // 根据当前的一级分类标题，获取所有二级分类对象
  getItemArr(tagName: string): CateGoryItem[] {
    // map出新的一个数组数据。 find是满足条件直接返回自己本身数组。不具备修改
    return (this.mock2Data().find((item: CateGoryPoem) => item.firstTitle === tagName) as CateGoryPoem).itemArr as CateGoryItem[]
    // 根据一级名称找到当前对象
    // let currentCateGory:CateGoryPoem  = this.mock2Data().find((item: CateGoryPoem) => item.firstTitle === tagName) as CateGoryPoem
    // // 找到当前对象的二级数组
    // let itemArr = currentCateGory.itemArr
  }

  // 根据二级分类API 获取对应诗词数据
  async getPoem(itemApi:string){
    console.log('dxin=> getPoem api:',itemApi)
    let res =await http.createHttp().request(itemApi + '.txt')
    console.log(`dxin=> getPoem res:${res.result}`)
    return res.result
  }


}

export default new DxinUtils()