import Constants from '../common/Constants'
import { Category, Poem } from '../model/poemData'

class PoemVM {
  // 获取存储的诗词数组  分类
  getCategoryPoemList(): Category[] {
    let list:Category[] = AppStorage.get(Constants.poemList) || Constants.categoryList
    // console.log('collectPoem 1=> getCategoryPoemList 取最新',JSON.stringify(list))
    return list
  }
  // 收藏功能
  collectPoem(poem: Poem) {
    //0： 先确定 poem 的类型   古诗文-山水-月亮
    let poemType:string  = this.getPoemType(poem)
    console.log('collectPoem 1=> poemType',poemType)
    // 1: 从分类数组中根据 分类名称 获取该分类的 Poem 数组
    let categoryArr :Category[] = this.getCategoryPoemList()
    console.log('collectPoem 2=> categoryArr 获取到的外层数组列表', JSON.stringify(categoryArr) )
    // 2: 根据  poemType 找出来 当前类型对象 包含分类  标题+诗词数组
    let currentTypeObj = categoryArr.find((item: Category) => item.categoryName === poemType )
    console.log('collectPoem 3=> categoryArrItem 存入诗句前 分类对象 ',  JSON.stringify(currentTypeObj))
    console.log('collectPoem 3=> categoryArrItem 存入诗句前 数组 ',  JSON.stringify(currentTypeObj?.categoryPoem))

    // 3 把当前的 poem 放到该 分类 诗词 categoryPoem 中
    currentTypeObj?.categoryPoem.unshift(poem)

    console.log('collectPoem 4=> categoryArrItem 存入诗句后 分类对象' ,JSON.stringify(currentTypeObj))
    console.log('collectPoem 4=> categoryArrItem 存入诗句后 数组' ,JSON.stringify(currentTypeObj?.categoryPoem))

    //4 覆盖替换 categoryArr 的 categoryArrItem
    // 4.1如果大数组中的分类名称 === 传进来的poem 分类 那么就替换
    let newCateGoryList = categoryArr.map((item:Category) => item.categoryName === poemType ? currentTypeObj : item)
    console.log('collectPoem 5=> newCateGoryList 存入前整体 ' ,JSON.stringify(newCateGoryList))

    //5 整个应该存起来的数据 发生了改变。记得存起来。
    AppStorage.setOrCreate(Constants.poemList,newCateGoryList)
    console.log('collectPoem 6=> newCateGoryList 存入后整体 ' ,JSON.stringify(this.getCategoryPoemList()))

  }
  // 取消收藏的功能     根据一个诗词对象 从数组中删除
  deletePoem(categoryList:Category[],categoryTitle:string,currentPoem:Poem) {
    // 找到当前分类对象
    let currentCategoryObj :Category =  categoryList.find( item => item.categoryName === categoryTitle ) as Category
    // 找到 当前分类里的诗词数组
    let currentCategoryPoemArr =  currentCategoryObj?.categoryPoem as Poem []
    console.log('deletePoem => 待删除诗句的数组',JSON.stringify(currentCategoryPoemArr) )
    // 当前分类数组中删除当前 诗句后 的新的数组
    let tempArr:Poem[] = currentCategoryPoemArr?.filter( item =>  currentPoem.content !== item.content )
    console.log('deletePoem => 已删除诗句的数组',JSON.stringify(tempArr))

    // 覆盖  当前分类对象里的 categoryPoem
    currentCategoryObj.categoryPoem = tempArr

    // 切记此处将更新后的数组 重新覆盖存储一下
    AppStorage.setOrCreate(Constants.poemList,categoryList)
  }
  // 根据诗词对象 获取诗词类型
  getPoemType(poem:Poem){
    return poem.category.split(Constants.separator)[1]
  }
  // 判断 是否为全 初始化的 空数组
  isInitList(list:Category[]){
   return  list.filter((item:Category) =>  item.categoryPoem.length > 0 ).length === 0
  }

}
let poemVM: PoemVM = new PoemVM()
export default poemVM