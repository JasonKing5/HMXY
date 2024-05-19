
export class PoemModel {
  content: string
  origin: string
  author: string
  category: string

  constructor(content: string, ori: string, author: string, cate) {
    this.content = content
    this.origin = ori
    this.author = author
    this.category = cate
  }
}