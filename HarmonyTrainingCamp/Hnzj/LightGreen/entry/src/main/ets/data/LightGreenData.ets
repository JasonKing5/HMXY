
export class PoemFromApi{
  content:string
  origin:string
  author:string
  category:string

  constructor(content:string,origin:string,author:string,category:string) {
    this.content = content
    this.origin = origin
    this.author = author
    this.category = category
  }
}