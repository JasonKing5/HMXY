import { getToday } from './tools'
import { DateStyle, BackgroundColor, ItemHeight } from './const'

@Component
export struct day {
  @State showDate: number[] = []
  private monthDate: number[]
  @StorageLink("titleDate") titleDate: number[] = getToday()

  private getTextColor(): ResourceColor {
    if (JSON.stringify(this.showDate) == JSON.stringify(this.monthDate)) {
      if (JSON.stringify(this.showDate) == JSON.stringify(getToday()))
        return BackgroundColor
      return DateStyle.FontColor.accentColor
    } else {
      if (JSON.stringify(this.showDate) == JSON.stringify(getToday()))
        return DateStyle.FontColor.accentColor
      if (this.showDate[1] == this.monthDate[1])
        return DateStyle.FontColor.defaultColor
      return DateStyle.FontColor.unableColor
    }
  }

  private getBackgroundColor(): ResourceColor {
    if (JSON.stringify(this.showDate) == JSON.stringify(this.monthDate) &&
    JSON.stringify(this.showDate) == JSON.stringify(getToday())) {
        return DateStyle.BackgroundColor
    } else {
      return BackgroundColor
    }
  }

  private getBorderColor(): ResourceColor {
    if (JSON.stringify(this.showDate) == JSON.stringify(this.monthDate)){
      return DateStyle.BackgroundColor
    } else {
      return BackgroundColor
    }
  }

  private changeDate() {
    this.titleDate = this.showDate;
  }

  build() {
    Row() {
      Column() {
        Text(this.showDate[2].toString())
          .fontSize(DateStyle.FontSize)
          .fontWeight(DateStyle.FontWeight)
          .fontColor(this.getTextColor())
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(this.getBackgroundColor())
    .border({
      width: DateStyle.BorderWidth,
      color: this.getBorderColor()
    })
    .aspectRatio(1)
    .borderRadius(ItemHeight/2)
    .onClick(() => this.changeDate())
  }
}