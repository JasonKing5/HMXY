export default class MyRouterInfo{
  // 页面路径
  url: string
  // 页面标题
  title: string

  constructor(url: string, title: string) {
    this.url = url;
    this.title = title
  }
}
// 路由携带的对象：传递一个知识点的名称 或者说页面名称
export class RouterParm{
  pageName:string

  constructor(pageName: string ) {
    this.pageName = pageName;
  }

}