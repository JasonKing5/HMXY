/*
 * 变量和数据类型
 * */
@Entry
@Component
struct Grammar02 {
  _name$123:string    //变量声明
  // _name$123:string ="123"    // 变量声明且初始化

  // 数字类型
  count1:number = 0b110011
  count2:number = 0o12345670
  count3 :number = 6
  count4:number = 0x0123456789abcdef

  // 字符串类型  单引号、双引号、三引号都可以
  name1:string ="HarmonyOS"
  name2:string ='ArkTS'
  name3:string =`马老师`

  // 布尔类型
  stateON:boolean = true
  stateOFF:boolean = false

  // 数组
  names:string[]  = ['HarmonyOS','小鸿','鸿蒙']
  counts:number[]  = [5,0b01,0xa2,123]

  // 元组
  person:[string,number,number] = ['小鸿',20,180]

 //  任意类型
  data:any = 123
 build(){
   Column(){
     Text(this.name1)
     Divider()
     Text('count:' + (this.count3 + 4))
     Text(`count1:${this.count3 * 2}`)
     Divider()
     if (this.stateOFF){
       Text(this.names[0])
     }else{
       Text(this.names[2])
     }
   }
   .width('100%')
   .height('100%')
   .justifyContent(FlexAlign.Center)
 }
}