/*
 * if 和for
 * */
@Entry
@Component
struct Render {
  @State flag:boolean = true
  names:string[] = ['马园威',"不多先生",`帝心`,'马老师']
  build() {
    Row() {
      Column({space:30}) {
        if (this.flag){
          Text('if分支----text')
        }else{
          Button('if分支----button')
        }
        Divider()
        Button('change flag...')
          .onClick(() => {
            this.flag =!this.flag
          })
        Divider()
        ForEach(this.names, (item:string,index:number) => {
            // Text( index + " : " +  item )
          Text(`${index} : ${item}`)
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}