// src/main/ets/pages/basic/Checkbox.ets
@Entry
@Component
struct CheckboxExample {
  @State dxValue: boolean = false
  @State zsValue: boolean = false
  build() {
    Column({ space: 10 }) {
      Column() {
        Text("checkbox:").fontSize(26).fontColor(0x3E3E3E).width('90%')
        Text("dxValue: " + this.dxValue).fontSize(26).fontColor(0x3E3E3E).width('90%')
        Text("zsValue: " + this.zsValue).fontSize(26).fontColor(0x3E3E3E).width('90%')
        Row() {
          Checkbox({ name: 'dx' })
            .onChange((value) => {
              console.log('帝心 value: ' + value)
              this.dxValue = value
            })
          Text("帝心").fontSize(26).fontColor(0x3E3E3E).margin({ right: 50 })

          Checkbox({ name: 'zs', group: 'boxgroup1' })
            .onChange((value) => {
              console.log('庄生 value: ' + value)
              this.zsValue = value
            })
          Text("庄生").fontSize(26).fontColor(0x3E3E3E)
        }
      }

      Column({ space: 10 }) {
        Text("checkbox group:\n帝心的特点有哪些").fontSize(26).fontColor(0x3E3E3E).width('90%')
        Row() {
          CheckboxGroup({group: 'boxgroup'})
          Text("select all").fontSize(26).fontColor(0x3E3E3E)
        }

        Row() {
          Checkbox({group: 'boxgroup'})
          Text("真诚").fontSize(26).fontColor(0x3E3E3E)
        }

        Row() {
          Checkbox({group: 'boxgroup'})
          Text("细").fontSize(26).fontColor(0x3E3E3E)
        }

        Row() {
          Checkbox({group: 'boxgroup'})
          Text("帅").fontSize(26).fontColor(0x3E3E3E)
        }
      }
    }
  }
}