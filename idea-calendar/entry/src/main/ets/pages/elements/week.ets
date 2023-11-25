import { day } from './day';
import { getNextNDay } from './tools';

@Component
export struct week {
  @State @Watch("aboutToAppear") showDate:number[] = []

  @State data: number[][] = []
  private monthDate: number[]

  aboutToAppear() {
    let temp = this.showDate
    for (let i = 0; i < 7;i++)
      this.data[i] = getNextNDay(temp, i)
  }

  build() {
    Row() {
      ForEach(this.data, (item: number[], index: number) => {
        Row() {
          day({
            showDate: item,
            monthDate: this.monthDate
          })
        }
        .height('100%')
        .layoutWeight(1)
      })
    }
    .height('100%')
    .width('100%')
  }
}