// 常量数据文件
import { Category } from '../model/poemData'

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
  static readonly poemList:string ='poemList'


  // 服务端设计的诗词 分类 分隔符 -
  static readonly separator: string = '-'

  // 所有分类 类型
  static readonly categoryTypeArr:string[] = ['抒情', '四季', '山水', '天气', '人物', '人生', '生活', '节日', '动物','食物', '植物']

  // 所有分类列表
  static  categoryList:Category[] = [  ]

  // 诗词主体页面 和 收藏页面 公用一个 页面级的 状态变量 删除收藏中的某一句诗词时候，确定当前诗词主体页面 正在显示的诗词是否取消收藏
  static readonly isCollectCurrentPoem:string = 'isCollectCurrentPoem'

}
















