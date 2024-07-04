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

// 列表组件处用到的通讯录相关类型
// 通讯录类联系人 类型
export class Contacts{
  name:string
  icon:Resource

  constructor(name: string, icon: Resource) {
    this.name = name
    this.icon = icon
  }
}

// 联系人分组类型
export class ContactsGroup{
  title:string = ''
  contacts: Array<Contacts> | null= null
  constructor(title: string, contacts: Array<Contacts> | null) {
    this.title = title
    this.contacts = contacts
  }
}


