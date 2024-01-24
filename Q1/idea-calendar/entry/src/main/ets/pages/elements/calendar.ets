import { month } from './month';
import { getNextNMonth, getNextNDay, getStartDate, getToday } from './tools';
import { TitleStyle, SubTitleStyle, ItemHeight, callback, ItemSpace, Animate } from './const';

@Component
export struct calendar {
  @StorageLink("titleDate") @Watch('titleDateChanged') titleDate: number[] = getToday()
  @State index: number = 1;
  @State data: number[][] = [
  getNextNMonth(this.titleDate, -1),
  this.titleDate,
  getNextNMonth(this.titleDate, 1)
  ]
  @State offsetY: number = 0;
  @State positionY: number = 0;
  @State @Watch('changeView') showMonth: boolean = true;
  @State @Watch('onGestureEnd') thisMonthLength: number = (getNextNDay(this.titleDate, 35)[1] == this.titleDate[1]) ? 6 : 5;

  private titleDateChanged() {
    callback(new Date(this.titleDate[0], this.titleDate[1] - 1, this.titleDate[2]))
    this.changeView()
  }

  private changeView() {
    this.data[this.index] = this.titleDate;
    this.indexChanged();
    this.refreshIndex();
  }

  private refreshIndex() {
    this.changeIndex(this.index);
  }

  private changeIndex(index: number) {
    if (this.showMonth) {
      this.data[(index + 2) % 3] = getNextNMonth(this.data[index], -1);
      this.data[(index + 1) % 3] = getNextNMonth(this.data[index], 1);
    } else {
      this.data[(index + 2) % 3] = getNextNDay(this.data[index], -7);
      this.data[(index + 1) % 3] = getNextNDay(this.data[index], 7);
    }
  }

  private indexChanged() {
    this.thisMonthLength = (getNextNDay(getStartDate(this.titleDate), 35)[1] == this.titleDate[1]) ? 6 : 5;
  }

  private onGestureEnd() {
    this.positionY = this.showMonth ? 0 : (-(this.thisMonthLength - 1) * ItemHeight)
    this.offsetY = this.positionY;
  }

  build() {
    Column() {
      Column() {
        Row() {
          Text(this.titleDate[0].toString() + "年" + this.titleDate[1].toString() + "月")
            .fontColor(TitleStyle.FontColor)
            .fontSize(TitleStyle.FontSize)
            .fontWeight(TitleStyle.FontWeight)
        }
        .height('100%')
      }
      .margin({ bottom: 12 })
      .width('100%')
      .height(TitleStyle.Height)

      Row() {
        ForEach(["日", "一", "二", "三", "四", "五", "六"], (item: string, index: number) => {
          Column() {
            Text(item)
              .fontColor(SubTitleStyle.FontColor)
              .fontSize(SubTitleStyle.FontSize)
              .fontWeight(SubTitleStyle.FontWeight)
          }
          .layoutWeight(1)
          .height('100%')
        })
      }
      .width('100%')
      .height(SubTitleStyle.Height)

      Column() {
        Swiper() {
          ForEach(this.data, (item: number[], index: number) => {
            month({
              showDate: item,
              offsetY: this.offsetY
            });
          })
        }
        .cachedCount(3)
        .loop(true)
        .index(this.index)
        .indicator(false)
        .width('100%')
        .itemSpace(ItemSpace)
        .onChange((index) => {
          this.index = index;
          this.titleDate = this.data[this.index];
          this.refreshIndex()
        })
        .gesture(
          PanGesture({ direction: PanDirection.Vertical })
            .onActionStart(() => {
              this.indexChanged()
            })
            .onActionUpdate((event: GestureEvent) => {
              this.offsetY = Math.min(this.positionY + event.offsetY, 0);
              this.showMonth = (event.offsetY > 0);
            })
            .onActionEnd(() => {
              animateTo({
                duration: 300,
                curve: Curve.EaseInOut,
                onFinish: ()=> {
                  this.thisMonthLength = 6
                  this.onGestureEnd()
                }
              }, () => {this.onGestureEnd()})
            })
        )
      }
      .width('100%')
      .layoutWeight(1)
    }
    .height('100%')
  }
}
