// src/main/ets/pages/basic/DatePicker.ets
@Entry
@Component
struct DatePickerExample {
  @State isLunar: boolean = true
  private selectedDate: Date = new Date('2023-11-21')

  build() {
    Column({ space: 10 }) {
      Button('切换 阳历/阴历').margin(20)
        .onClick(() => {
          this.isLunar = !this.isLunar
        })
      DatePicker({selected: this.selectedDate})
        .lunar(this.isLunar)
        .onChange((value) => {
          console.log(JSON.stringify(value))
          this.selectedDate.setFullYear(value.year, value.month, value.day)
        })
    }
  }
}