// todo:本套教程QQ交流群：324702418
// todo: 代码在线地址：https://gitee.com/mayuanwei

// 数值类型
let num1: number = 3.1415
let num2: number = 0b10100
let num3: number = 0o107
let num4: number = 0x012abcf
let num5: number = 10+ 5

// 字符串
let str1:string = 'HarmonyOS' + "ArkTS"
let str2:string = "HarmonyOS"
let str3:string = `圆周率：${num1}`

// 布尔boolean
let stateOn: boolean = true
let stateOff: boolean = false

// 数组 Array 索引值0
let names1:string[] = ['帝心','庄生']
let names2:Array<string> = ['帝心','庄生']

// 枚举类型
enum myColor{
  Red = 'red',
  Green ='green'
}
@Entry
@Component
struct DataType {
  pome:string = '劝君莫惜金缕衣 劝君惜取少年时'
  build() {
    Row() {
      Column() {
        Text(names1[1])
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(myColor.Red)
        Divider()
        if (stateOff){
          Text(num1.toString())
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }else{
          Text(num2.toString())
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        Divider()
        Text(this.pome)
      }
      .width('100%')
    }
    .height('100%')
  }
}