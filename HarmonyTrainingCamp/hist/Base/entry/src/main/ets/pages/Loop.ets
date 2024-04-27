@Entry
@Component
struct Loop {
  pmArr:string[] = [
    '日拱一卒无有尽，功不唐捐终入海',
    '何事人间频乞食物，此心已是负彩霞',
    '峨眉山月半轮秋，影入平羌江水流',
    '我到新乡不作诗，满城柳絮即文章'
  ]
  build() {
    Column({ space: 30 }) {
      ForEach(this.pmArr, (item:string,index:number) => {
        if (index % 2 ==0) {
          Text(item).fontColor(Color.Red)
        }else{
          Text(item).fontColor(Color.Green)
        }

      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}