import { week } from './week';
import { getNextNDay, getStartDate } from './tools';
import { BackgroundColor, ItemHeight } from './const'

@Component
export struct month {
  @State @Watch("aboutToAppear") showDate: number[] = []
  @State data: number[][] = []
  @Prop offsetY: number;
  @State topIndex: number = 0;

  aboutToAppear() {
    let temp = getStartDate(this.showDate)
    this.data = new Array(5).fill([])
    for (let i = 0; i < 5; i++)
      this.data[i] = getNextNDay(temp, i * 7)
    if (getNextNDay(temp, 35)[1] == this.showDate[1])
      this.data.push(getNextNDay(temp, 35));
    for (let i = 0; i < this.data.length; i++)
      if(!this.checkNeedClose(this.data[i])) {
        this.topIndex = i;
        break;
      }
  }

  /**
   * 检查是否显示在这一天
   * @param index
   * @returns
   */
  private checkNeedClose(startDate: number[]): boolean {
    for (let i = 0;i < 7; i++) {
      let temp: number[] = getNextNDay(startDate, i)
      if (temp[1] == this.showDate[1] && temp[2] == this.showDate[2])
        return false
    }
    return true
  }

  build() {
    Stack() {
      Column() {
        ForEach(this.data, (item: number[], index: number) => {
          Column() {
            if (this.topIndex != index && this.offsetY > -(index + 1) * ItemHeight)
              week({
                showDate: item,
                monthDate: this.showDate
              })
          }
          .height(ItemHeight)
          .width('100%')
          .backgroundColor(BackgroundColor)
        })
      }
      .height('100%')
      .width('100%')
      .translate({y: this.offsetY})
      Column() {
        week({
          showDate: this.data[this.topIndex],
          monthDate: this.showDate
        })
      }
      .height(ItemHeight)
      .width('100%')
      .backgroundColor(BackgroundColor)
      .position({ x: 0, y: this.topIndex * ItemHeight })
      .translate({y: Math.max(this.offsetY, -this.topIndex * ItemHeight)})
    }
  }
}