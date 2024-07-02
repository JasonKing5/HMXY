/*
 * 本文件封装多个类。
 *    本项目中使用多种自定义的数据类型时，都通以放在此处管理
 * */

// 页面导航的类型。
export  class NavigationModel{
  label:string
  url:string
  title:string

  constructor(label: string, url: string,title:string) {
    this.label = label
    this.url = url
    this.title = title
  }
}


