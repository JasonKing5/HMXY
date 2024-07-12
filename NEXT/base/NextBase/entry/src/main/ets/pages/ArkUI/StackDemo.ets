import { router } from '@kit.ArkUI'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct StackDemo {
  title: string = (router.getParams() as Record<string, string>)?.title as string

  // 准备数组数据。方便遍历。
  @State itemArr:string [] = ['11','12','13','14','15','16','17','18','19']

  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      // 层叠布局
      Stack(){
        List({space:20}){
          ListItem(){
            Row(){
              Text('1').fontSize(30)
              Image($r('app.media.create')).width(40)
            }
            .width('100%')
            .height(80)
            .backgroundColor('#aaa')
          }

          ListItemGroup({space:30}){
            ForEach(this.itemArr, (item:string,index:number) => {
              ListItemRow({serial:item})
            })
          }
          .backgroundColor('#bbb')

        }
        .backgroundColor('#acb')
        .layoutWeight(1)
        Button('+')
          .width(70)
          .height(70)
          .fontSize(50)
          .onClick(() => {
            this.itemArr.push( Number(this.itemArr[this.itemArr.length-1])+1    + '')
          })
          .offset({
            x:120,
            y:200
          })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}


@Component
struct ListItemRow {
  // 定义一个序号
  serial?:string
  build() {
    Row(){
      Text(this.serial).fontSize(30)
      Image($r('app.media.create')).width(40)
    }
    .width('100%')
    .height(80)
    .backgroundColor('#ccc')
  }
}