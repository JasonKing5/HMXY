// 诗词主体展示区域 自定义组件
import { Poem } from '../../model/poemData'
import { http } from '@kit.NetworkKit'
import Constants from '../../common/Constants'
import poemVM from '../PoemVM'
import { router } from '@kit.ArkUI'

@Component
export default struct PoemArea {
  // 当前的文字缩放倍数
  @Consume fontSizeScale: number
  // 决定当前诗词是否收藏的一个效果 也决定收藏页面是否删除
  @LocalStorageLink(Constants.isCollectCurrentPoem) isCollect: boolean = false
  // 诗词主体展示区域的旋转角度
  @State angleVal: number = 0
  @State poem: Poem = new Poem('日拱一卒无有尽，功不唐捐终入海', '无题', '帝心','古诗文-抒情-默认')

  build() {
    Column() {
      Row() {
        Text(this.poem.author)
          .fontSize((20 * this.fontSizeScale).toFixed(0) )
          .width(20)
          .alignSelf(ItemAlign.End)
          .fontColor($r('app.color.appColor2'))
        Text(this.poem.content)
          .fontSize((16 * this.fontSizeScale).toFixed(0) )
          .width(16)
        Text(this.poem.origin)
          .fontSize((20 * this.fontSizeScale).toFixed(0) )
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
            this.poem = JSON.parse(data.result + '') as Poem
            // 将当前的 this.poem 存起来  方便在 collectPoem.ets页面对比时使用。
            AppStorage.setOrCreate('currentShowPoem',this.poem)
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
              if (isOn) {
                poemVM.collectPoem(this.poem)
              } else {
                // todo 如果是false 就说明你一定是先点了一下收藏过。又点了一下。此时才会出现false的执行。删除这一条
                poemVM.deletePoem(poemVM.getCategoryPoemList(),poemVM.getPoemType(this.poem),this.poem)
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
