// 本项目需要很多类型数据 都靠这个文件同意管理和产生数据
export class Poem {
  index: number
  content: string
  origin: string
  constructor(index: number, content: string, origin: string) {
    this.index = index
    this.content = content
    this.origin = origin
  }
}

export class BtnNavigation{
  title:string
  url:string

  constructor(title:string,url:string) {
    this.title = title
    this.url = url
  }
}