export default  class Poem {
  content: string
  author: string
  subject: string

  constructor(content: string, author: string, subject: string) {
    this.content = content
    this.author = author
    this.subject = subject
  }
}
