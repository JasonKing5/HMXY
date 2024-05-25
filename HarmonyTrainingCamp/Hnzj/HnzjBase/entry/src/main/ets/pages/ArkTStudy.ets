// 基本语法快速学习
import { Poem } from '../data/HzData'
import TopTitle from '../view/base/TopTitle'

class Person {
  name: string
  sex: number
  constructor(name: string, sex: number) {
    this.name = name
    this.sex = sex
  }
}

@Entry
@Component
struct ArkTStudy {
  // 数据类型
  message: string = '日拱一卒无有尽，功不唐捐终入海'
  age: number = 32
  flag: boolean = true
  //对象类型
  dxin: Person = new Person('帝心', 18)
  // 数组类型
  poemArr: Poem [] = []
  // 生命周期函数
  aboutToAppear(){
    //业务代码  加载资源 http
      this.poemArr = [
        new Poem(0, '去二仙桥要走成华达大道', '谭警官'),
        new Poem(1, '长城炮', '炮姐'),
        new Poem(2, '何须浅碧深红色，自是花中第一流', '帝心')
      ]
  }

  build() {
    Column({ space: 30 }) {
      TopTitle({message:this.message})
      Divider()
      ForEach(this.poemArr, (item: Poem, index: number) => {
        Text(`${item.index}<->${item.content}<->${item.origin}`)
      })
    }
    .clmStyle()
  }
}

@Extend(Column)
function clmStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor($r('app.color.theme_color'))
  .justifyContent(FlexAlign.Center)
}
