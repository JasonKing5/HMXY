import { router } from '@kit.ArkUI'
import { Contacts, ContactsGroup } from '../../model/BaseClass'
import TopTitle from '../../view/TopTitle'


@Entry
@Component
struct ListDemo {
  title: string = (router.getParams() as Record<string, string>)?.title as string
  contactsGroups :ContactsGroup []=[
    new ContactsGroup('D',[
      new Contacts('帝心',$r("app.media.nickname0")),
      new Contacts('帝肺',$r("app.media.nickname1")),
      new Contacts('帝王虾',$r("app.media.nickname3")),
    ]),
    new ContactsGroup('H',[
      new Contacts('鸿蒙之父',$r("app.media.nickname0")),
      new Contacts('鸿蒙诗人',$r("app.media.nickname1")),
      new Contacts('鸿蒙野生侠',$r("app.media.nickname3")),
    ]),
  ]

  // 字母标题自定义组件。
  @Builder itemHeader(text:string){
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(10)
  }

  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      List({space:20}){
        ForEach(this.contactsGroups, (contactsGroupItem:ContactsGroup,index:number) => {
          ListItemGroup({space:30,header:this.itemHeader(contactsGroupItem.title)}){
            ForEach(contactsGroupItem.contacts, (contactsItem:Contacts,index:number) => {
              ListItemRow({name:contactsItem.name,icon:contactsItem.icon})
            })
          }
          .divider({strokeWidth:3,color: '#ffcedeee',startMargin:60,endMargin:10})
        })
      }
      .layoutWeight(1)
      // .listDirection(Axis.Horizontal)
      .lanes(1)
      .divider({strokeWidth:2,color:'red'})
      .scrollBar(BarState.Off)  // 不显示滚动条
      .scrollBar(BarState.On)   // 持续显示
      // .scrollBar(BarState.Auto)  // 显示两秒 然后消失
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}


@Component
struct ListItemRow {
  // 定义一个序号
  name?:string
  icon?:Resource
  build() {
    Row({space:20}){
      Image(this.icon).width(30).fillColor('#fff19469')
      Text(this.name).fontSize(20)
    }
    .width('100%')
    .height(40)
    .backgroundColor('#fff3e6e6')
    .padding({left:20})
  }
}