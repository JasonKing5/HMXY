import TopTitle from '../../view/TopTitle';
import { MyDivider } from '../../view/DxComp'

/*
 * 自定义子组件只能传递 （状态）变量数据。而如果需要定制化UI 则需要使用 @BuilderParam
 * */
@Entry
@Component
struct BuilderParamDecorators {
  @State title: string = '@BuilderParam';

  // 配合 OneBuilderParam() 传参
  @Builder
  leftColumn() {
    Column() {
      Text('后退一步')
      Image($r('app.media.ic_public_arrow_left_filled')).width(30)
    }
  }

  @Builder
  leftRow() {
    Row() {
      Image($r('app.media.ic_public_quit')).width(30)
      Text('out')
    }
  }
  @Builder
  rightRow() {
    Row() {
      Image($r('app.media.search_ocr')).width(30)
      Text('sear')
    }
  }

  build() {
    Column({ space: 10 }) {
      TopTitle({ title: this.title })
      // 先不使用 @BuilderParam 设计三种类似的自定义子组件效果
      Text('不使用 @BuilderParam 设计类似的自定义子组件')
      MyRow1()
      MyRow2()
      MyDivider()

      Text('使用 @BuilderParam 单插槽思想')
      Text('单插槽 默认数据')
      OneBuilderParam()
      Text('单插槽 尾随闭包直接调用')
      OneBuilderParam({title:'单插槽'}) {
        this.leftRow()
      }

      // 传参 ，不是调用，this.leftColumn不要()
      Text('单插槽 参数传递亦可')
      OneBuilderParam({ left: this.leftColumn })
      MyDivider()

      Text('多插槽 不可尾随闭包 否则报错 只能传参了')
      // ManyBuilderParam(){
      //   this.leftColumn()
      //   this.rightRow()
      // }
    ManyBuilderParam({left:this.leftColumn,right:this.rightRow,title:'多插槽'})

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}

@Component
struct MyRow1 {
  build() {
    Row() {
      Image($r('app.media.back')).width(30)
      Text('MyRow1').fontColor('#ff242401')
      Image($r('app.media.ai_photography')).width(30)
    }
    .rowStyle()
  }
}

@Component
struct MyRow2 {
  build() {
    Row() {
      Column() {
        Image($r('app.media.back')).width(30)
        Text('返回')
      }

      Text('MyRow2').fontColor('#ffa719bf')
      Row() {
        Text('搜索')
        Image($r('app.media.search_ocr')).width(30)
      }
    }
    .rowStyle()
  }
}

// 只有一个 BuilderParam 参数的自定义组件
@Component
struct OneBuilderParam {
  title:string = '单单单'
  // 一般会建议给 @BuilderParam 一个默认初始化值  也可不给
  @Builder
  doNothingBuilder() {
    Column() {
      Image($r('app.media.ic_contacts_allergies_reaction')).width(30)
      Text('未初始化')
    }
  }

  @BuilderParam left: Function = this.doNothingBuilder

  build() {
    Row() {
      // 调用处记得加()
      this.left()
      Text(this.title).fontColor('#ff4087cf')
      Row() {
        Text('搜索')
        Image($r('app.media.search_ocr')).width(30)
      }
    }
    .rowStyle()
  }
}

// 多个BuilderParam 参数的自定义组件
@Component
struct ManyBuilderParam {
  // 不耽误正常传递其他参数或者状态变量
  title:string = '多多多'
  // 一般会建议给 @BuilderParam 一个默认初始化值  也可不给
  @Builder
  leftDoNothingBuilder() {
    Column() {
      Image($r('app.media.ic_contacts_allergies_reaction')).width(30)
      Text('左未初始化')
    }
  }

  @Builder
  rightDoNothingBuilder() {
    Row() {
      Image($r('app.media.ic_contacts_allergies_reaction')).width(30)
      Text('右未初始化')
    }
  }

  // 参数赋值 不需要小括号调用
  @BuilderParam left: Function = this.leftDoNothingBuilder
  // 返回值是函数类型。两种不同写法
  @BuilderParam right: () => void = this.rightDoNothingBuilder

  build() {
    Row() {
      // 调用处记得加()
      this.left()
      Text(this.title).fontColor('#ffa237ef')
      this.right()
    }
    .rowStyle()
  }
}

@Extend(Row)
function rowStyle() {
  .width('95%')
  .backgroundColor('#eee')
  .borderRadius(10)
  .padding({ left: 5, right: 5 })
  .justifyContent(FlexAlign.SpaceBetween)
}
