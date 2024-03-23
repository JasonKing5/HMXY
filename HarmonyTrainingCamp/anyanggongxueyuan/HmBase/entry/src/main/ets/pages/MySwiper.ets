@Entry
@Component
struct MySwiper{
  private swiperController: SwiperController = new SwiperController()

  build(){
    Column() {
      Swiper(this.swiperController){
        Text('HarmonyOS')

        Text('dixin')

        Text('鸿蒙之父')

      }
      .loop(true)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}