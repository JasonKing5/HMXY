// 轮播 自定义组件
import Constants from '../../common/Constants'

@Component
export default struct MySwiper {

  // 当前的文字缩放倍数
  @Consume fontSizeScale: number

  // 轮播时候的 索引值
  @State idx: number = 0

  build() {
    Swiper() {
      ForEach(Constants.swiperPoemArr, (item: string, index: number) => {
        // 设置文本颜色和下方的选中条颜色相同。同学们思考一下如何设计
        Text(item)
          .fontSize((22 * this.fontSizeScale).toFixed(0) )
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

