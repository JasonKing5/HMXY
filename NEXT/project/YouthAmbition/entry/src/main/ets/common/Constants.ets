// 常量数据文件
export default class Constants{
  // 主页轮播诗词 数组
 static readonly  swiperPoemArr:string[] = [
    '日拱一卒无有尽，功不唐捐终入海',
    '何须浅碧深红色，自是花中第一流',
    `劝君莫忘少年志，曾许人间第一流`,
    `菩提本无树，明镜亦非台`
  ]

  // 获取全部类型诗句的随机诗词 的API地址
  static readonly URL_All : string = 'https://v1.jinrishici.com/all'

  // 存储诗词的时候弄个数组标记
  static readonly poemArr:string ='poemArr'


}