import {calendar} from "./elements/calendar"

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        calendar()
      }
      .padding(12)
      .width('100%')
    }
    .height('100%')
  }
}