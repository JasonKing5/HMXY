import Constants from '../common/Constants'
import PoemTitle from '../view/PoemTitle'

@Entry
@Component
struct MainPoem {

  build() {
    Column() {
      // 1 顶部标题栏
      PoemTitle()
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
  @State idx:number = 0
  build() {
    Swiper() {
      ForEach(Constants.swiperPoemArr, (item:string,index:number) => {
        // 设置文本颜色和下方的选中条颜色相同。同学们思考一下如何设计
        Text(item)
          .fontSize(22)
          .textAlign(TextAlign.Center)
          .fontColor( this.idx === index ? $r('app.color.appColor2') : $r('app.color.appColor1'))
      })
    }
    .swiperStyle()
    .onChange((idx: number) => {
       this.idx = idx
    })
  }
}

// 诗词主题展示区域 自定义组件
@Component
struct  PoemArea{
  @State angleVal:number  = 0
  build() {
    Row(){
      Text('帝心')
        .fontSize(20)
        .width(20)
        .alignSelf(ItemAlign.End)
        .fontColor($r('app.color.appColor2'))
      Text('日拱一卒无有尽，功不唐捐终入海')
        .fontSize(16)
        .width(16)
      Text('无题')
        .fontSize(20)
        .width(20)
        .alignSelf(ItemAlign.Start)
        .fontColor($r('app.color.appColor1'))
    }
    .width('100%')
    .aspectRatio(1)
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor('#fff1dada')
    .borderRadius(10)
    .rotate({angle:this.angleVal})
    .onClick(() => {
        animateTo({}, () => {
          this.angleVal = this.angleVal === 0 ? 360: 0
        })
    })
  }
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


