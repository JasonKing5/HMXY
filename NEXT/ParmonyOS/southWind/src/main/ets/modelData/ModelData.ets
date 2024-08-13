// 整体诗词类型
export class CateGoryPoem{
  firstTitle ?:string = '抒情'
  cateGoryApi ?:string = 'https://v1.jinrishici.com/shuqing'
  itemArr?:Array<CateGoryItem> = [
    new CateGoryItem('爱情', 'https://v1.jinrishici.com/shuqing/aiqing'),
    new CateGoryItem('友情', 'https://v1.jinrishici.com/shuqing/youqing'),
    new CateGoryItem('离别', 'https://v1.jinrishici.com/shuqing/libie'),
  ]

  constructor(firstTitle?:string, cateGoryApi?:string, itemArr?:Array<CateGoryItem>) {
    this.firstTitle = firstTitle
    this.cateGoryApi = cateGoryApi
    this.itemArr = itemArr
  }
}

// 二级分类诗词类型

export class CateGoryItem{
  itemTitle :string = '离别'
  itemApi :string = 'https://v1.jinrishici.com/shuqing/libie'

  constructor(itemTitle:string, itemApi:string) {
    this.itemTitle = itemTitle
    this.itemApi = itemApi
  }
}
