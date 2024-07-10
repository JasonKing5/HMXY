import Constants from '../common/Constants'
import PoemTitle from '../view/PoemTitle'
import { http } from '@kit.NetworkKit'
import { Poem } from '../model/poemData'
import { router } from '@kit.ArkUI'
import poemVM from '../viewModel/PoemVM'


@Entry
@Component
struct MainPoem {
  build() {
    Column() {
      // 1 顶部标题栏
      PoemTitle({isShowSetting:true,imgSrc:$r('app.media.logo')})
      // 2  轮播区域
      MySwiper()
      // 3 展示诗词主体区域
      PoemArea()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}

// 轮播 自定义组件
@Component
struct MySwiper {
  // 轮播时候的 索引值
  @State idx: number = 0

  build() {
    Swiper() {
      ForEach(Constants.swiperPoemArr, (item: string, index: number) => {
        // 设置文本颜色和下方的选中条颜色相同。同学们思考一下如何设计
        Text(item)
          .fontSize(22)
          .textAlign(TextAlign.Center)
          .fontColor(this.idx === index ? $r('app.color.appColor2') : $r('app.color.appColor1'))
      })
    }
    .swiperStyle()
    .onChange((idx: number) => {
      this.idx = idx
    })
  }
}

// 诗词主体展示区域 自定义组件
@Component
struct PoemArea {
  // 决定当前诗词是否收藏的一个效果
  @State isCollect: boolean = false
  // 诗词主体展示区域的旋转角度
  @State angleVal: number = 0
  // 在4.0语法。API9版本。非纯血鸿蒙中。可以使用字面量直接当对象用
  // 在NEXT版本中 使用对象，需要提前准备好类或者接口
  @State poem: Poem = new Poem('日拱一卒无有尽，功不唐捐终入海', '无题', '帝心','古诗文-抒情-默认')


  build() {

    Column() {
      Row() {
        Text(this.poem.author)
          .fontSize(20)
          .width(20)
          .alignSelf(ItemAlign.End)
          .fontColor($r('app.color.appColor2'))
        Text(this.poem.content)
          .fontSize(16)
          .width(16)
        Text(this.poem.origin)
          .fontSize(20)
          .width(20)
          .alignSelf(ItemAlign.Start)
          .fontColor($r('app.color.appColor1'))
      }
      .poemAreaContent()
      .rotate({ angle: this.angleVal })
      .onClick(async () => {

        //获取诗词内容 从API接口获取 https://v1.jinrishici.com/all
        await http.createHttp().request(Constants.URL_All)
          .then((data) => {
            this.poem = JSON.parse(data.result + '')
            console.log('1请求结束时对象：',JSON.stringify(this.poem))
          })
          .catch((err: Error) => {
            console.log('err => 获取all里面的随机诗词出错了' + err.message);
          })
        // 旋转动画
        animateTo({}, () => {
          this.angleVal = this.angleVal === 0 ? 360 : 0;
        })

        // 设置当前诗词默认是未被收藏的状态  不要取反
        this.isCollect = false
      })

      // 收藏区域
      Row() {
        Row() {
          //收藏  / 取消收藏
          Text('收藏').fontSize(18)
          Toggle({ type: ToggleType.Switch, isOn: $$this.isCollect })
            .width(70)
            .height(30)
            .selectedColor($r('app.color.appColor2'))
            .onChange((isOn: boolean) => {
              // todo 如果true。我们就把这句诗词 收录起来  向 数据库/首选项/全局变量/... 中存储起来
              if (isOn) {
                poemVM.collectPoem(this.poem)
              } else {
                console.log('2滑块取消时：',JSON.stringify(this.poem))
                // todo 如果是false 就说明你一定是先点了一下收藏过。又点了一下。此时才会出现false的执行。删除这一条
                poemVM.deletePoem(this.poem)
              }
            })
        }

        // 查看收藏的按钮
        Button({ type: ButtonType.Circle }) {
          Image($r('app.media.collect'))
            .width('40')
            .fillColor($r('app.color.appColor1'))
        }
        .width('80')
        .backgroundColor('#abc')
        .onClick(() => {
          // todo: 跳转到收藏页面去展示自己收藏过的诗句内容
          router.pushUrl({
            url: "pages/CollectPoem"
          })
        })
      }
      .width('100%')
      .height(80)
      .justifyContent(FlexAlign.SpaceEvenly)
    }
  }
}


@Extend(Row)
function poemAreaContent() {
  .width('100%')
  .aspectRatio(1)
  .justifyContent(FlexAlign.SpaceAround)
  .backgroundColor('#fff1dada')
  .borderRadius(10)
}

@Extend(Swiper)
function swiperStyle() {
  .width('100%')
  .autoPlay(true)
  .loop(true)
  .interval(2000) // 轮播的时间
  .aspectRatio(2) // 宽高比 宽度是高度的2倍
  .indicator(
    new DotIndicator()
      .itemWidth(30)
      .itemHeight(5)
      .color($r('app.color.appColor1'))
      .selectedItemWidth(50)
      .selectedItemHeight(5)
      .selectedColor($r('app.color.appColor2'))
    // new DigitIndicator()
    //   .fontColor('#ffe71684')
    //   .selectedFontColor('#ff17b856')
    //   .digitFont({
    //     size:20,
    //     weight:700
    //   })
    //   .selectedDigitFont({
    //     size:20,
    //     weight:700
    //   })
  )
}


