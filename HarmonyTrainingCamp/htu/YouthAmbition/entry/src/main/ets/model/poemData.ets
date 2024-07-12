// 跟诗词相关的数据类型都定义到此处

// 匹配服务器端的字段的诗词类  跟服务器返回效果一样一样的
export  class Poem{
  content : string
  origin : string
  author : string
  category : string

  constructor(content: string, origin: string, author: string, category: string) {
    this.content = content
    this.origin = origin
    this.author = author
    this.category = category
  }
}

@ObservedV2
// 在收藏页面需要用到分组诗词。分组诗词的类型
export class Category{

  categoryName:string
  @Trace categoryPoem:Poem[]

  constructor(categoryName: string, categoryPoem: Poem[]) {
    this.categoryName = categoryName
    this.categoryPoem = categoryPoem

  }
}


