import Constants from '../common/Constants'
import { Poem } from '../model/poemData'


class PoemVM {
  // 获取存储的诗词数组
  getPoemArr(): Poem[] {
    return AppStorage.get(Constants.poemArr) || []
  }

  // 收藏功能
  collectPoem(poem: Poem) {
    // 前面的变量确定了类型  后面赋值，调用函数获取返回值   那么返回值也需要是确定的对应类型。否则需要用as
    let tempArr: Poem[] = this.getPoemArr()
    tempArr.push(poem)
    AppStorage.setOrCreate(Constants.poemArr, tempArr)
    // console.log('收藏后：',JSON.stringify(this.getPoemArr()))
  }

  // 取消收藏的功能     根据一个诗词对象 从数组中删除
  deletePoem(poem: Poem) {
    // let poemArr: Poem[] = this.getPoemArr()
    // let newPoemArr =  poemArr.filter((item:Poem) => poem.content !== item.content  && poem.origin !== item.origin)
    // console.log('deletePoem => 删除操作前：',JSON.stringify(this.getPoemArr()))
    // let newPoemArr =  this.getPoemArr().filter((item:Poem) => JSON.stringify(poem) !== JSON.stringify(item))


    let newPoemArr =  this.getPoemArr().filter((item:Poem) => poem.content !== item.content)
    // 切记此处将更新后的数组 重新覆盖存储一下
    AppStorage.setOrCreate(Constants.poemArr,newPoemArr)
    // console.log('deletePoem => 删除后的poemArr:',JSON.stringify(this.getPoemArr()))
  }
}

let poemVM: PoemVM = new PoemVM()

export default poemVM


// 导出简单了  导入的时候，得手动给这个对象取个名字了
// export default new PoemVM()
