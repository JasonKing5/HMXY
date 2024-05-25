@Component
export default struct BaiPoem{
  // 伪代码，稍后修改
  @State poem:string  =`偷弹清泪寄烟波，见江头故人，为言憔悴如许。`
  build() {
    Column({space:20}){
      Text(this.poem)
      Text(`剑器近·夜来雨`)
      Text(`袁去华`)
      Text(`古诗文-抒情-伤感`)
    }
    .onClick(() => {
      //发送网络请求，获取真实的数据覆盖原来

    })
  }
}