import { PoemModel } from '../model/Model'

export default  class Cantants{
  // 诗词API接口地址
  static readonly poemApi :string = 'https://v1.jinrishici.com/all.json'


  //app的多页面的标题
  static readonly titile:string = '诗文学习'

  // 默认诗文首页的诗句对象
  static readonly homePoem:PoemModel = new PoemModel('玲珑骰子安红豆，入骨相思知不知','相思','王维','唐-宋-元')
}