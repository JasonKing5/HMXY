//  9 b

// @Entry
// @Component
// struct SpanExample {
//   build() {
//     Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent:FlexAlign.Start}){
//       Text(){
//         Span('In line')
//         Span('Component')
//         Span('!')
//       }
//     }.width('100%').height(250).padding({left:35,right:35,top:35 })
//   }
// }

// 13
// class Data{
//   num:number
//   type: string
//   constructor(num: number, type: string) {
//     this.num = num;
//     this.type = type;
//   }
// }
//
// @Reusable
// @Component
// struct Item{
//   @State data:Data | undefined =undefined;
//   aboutToAppear():void {
//     console.log("Demo log1");
//   }
//   aboutToReuse(params: ESObject): void {
//     console.log("Demo log2")
//     this.data = params.data
//   }
//
//   build() {
//     Text("num = " + this.data?.num + ", type = " + this.data?.type)
//   }
// }
//
// @Entry
// @Component
// struct Index {
//   data1: Data = new Data(1, "type1");
//   data2: Data = new Data(2, "type2");
//   @State data:Data  = this.data1
//   build() {
//     Column(){
//       if (this.data.type == "type1"){
//         Item({ data: this.data }).reuseId(this.data.type)
//       }else{
//         Item({ data: this.data }).reuseId(this.data.type)
//       }
//       Button('Change').onClick(() =>{
//         if(this.data === this.data1){
//           this.data = this.data2
//         }else {
//           this.data = this.data1
//         }
//       })
//     }
//   }
// }


// @Entry
// @Component
// struct styledStringDemo {
//   scroll: Scroller = new Scroller();
//   layout: TextLayoutManager = new  TextLayoutManager()
//
//   controller1: TextController = new TextController()
//
//   async onPageShow() {
//     this.controller1.setLayout(this.layout)
//   }
//
//   build() {
//     Column(){
//       Text(undefined,{ controller:this.controller1 })
//     }.width('100%')
//   }
// }

// @Entry
// @Component
// struct TextExample{
//   build() {
//     Column({space:8}){
//       Text('textShadow').fontSize(9).fontColor(0xcccccc).margin(15).width('95%')
//     }
//   }
// }

// 根据上面代码，以下解释正确的是
/*
 * 本例子可以运行起来，所以代码没有问题。
 *为了避免@Prop的拷贝，可以优化使用@Link，在该例子中行为和@Prop一样。
 * 在自定义组件Page的build方法里改变状态变量是非法操作，可能导致未定义的异常UI行为
 * 在ChangeMode里改变mode的值，会触发其父组件Page的Title内容的切换。
 * */
// enum Mode {
//   fullScreen,
//   halfScreen
// }
//
// @Entry
// @Component
// struct Page {
//   @State title:string  = ""
//   @State mode:Mode  = Mode.fullScreen
//
//   isShownTitle():boolean {
//     if (this.mode == Mode.fullScreen) {
//       this.title = "Title"
//       return true
//     }else {
//       this.title= "Section"
//       return false
//     }
//   }
//   build() {
//     Column(){
//       if (this.isShownTitle()){
//         Text(`${this.title}`)
//       }else {
//         Text(`${this.title}`)
//       }
//       ChangeMode({mode:this.mode})
//     }
//   }
// }
//
// @Component
// struct ChangeMode {
//   @Prop mode:Mode;
//   build() {
//     Row({space:20}){
//       Button('full screen')
//         .onClick(() => {
//           this.mode = Mode.fullScreen
//         })
//       Button('half scrtten')
//         .onClick(() => {
//           this.mode = Mode.halfScreen
//         })
//     }
//   }
// }


//10
// // PageOne.ets
// @Component
// struct PageOneTmp {
//   @Consume('pageInfos') pageInfos: NavPathStack;
//
//   build() {
//     NavDestination() {
//       Column(){
//         Button('toPageTwo', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height(40)
//           .margin(20)
//           .onClick(() => {
//             this.pageInfos.pushPathByName("pageTwo", "")
//           })
//       } .width('100%').height("100%")
//     }.title('pageOne')
//     .onBackPressed(() => {
//       const popDestinationInfo = this.pageInfos.pop()
//       console.log('pop'+'返回值'+JSON.stringify(proDestinationInfo))
//       return true
//     })
//   }
// }
//
// // PageTwo.ets
// export class Pages{
//   names:string =''
//   values:NavPathStack | null = null
// }
// @Builder
// export function pageTwoTmp(info: Pages){
//   NavDestination() {
//     Column(){
//       Button('toPageOne', { stateEffect: true, type: ButtonType.Capsule })
//         .width('80%')
//         .height(40)
//         .margin(20)
//         .onClick(() => {
//           (info.values as NavPathStack).pushPathByName("pageOne", null)
//         })
//     } .width('100%').height("100%")
//   }.title('pageTwo')
//   .onBackPressed(() => {
//     (info.values as NavPathStack).pop()
//     return true
//   })
// }

//10
//A
// @Entry
// @Component
// struct styledStringDemo {
//   scroll: Scroller = new Scroller();
//   mutableStyledString: MutableStyledString = new MutableStyledString("test",[{
//     start:0,
//     length:5,
//     styledKey:StyledStringKey.FONT,
//     styledValue:new TextStyle({fontColor:Color.Pink})
//   }])
//   controller1:TextController=new TextController();
//   async onPageShow() {
//     this.controller1.setStyledString(this.mutableStyledString)
//   }
//   build() {
//     Column(){
//       Text(undefined,{controller:this.controller1})
//     }.width('100%')
//   }
// }

//11 为了使isShow参数值与半模态界面的状态同步，可以使用下列那种方式双向绑定isShow参数？
//A
// xxx.ets
// @Entry
// @Component
// struct SheetTransitionExample {
//   @State isShow: boolean = false
//   @State isShow2: boolean = false
//   @State sheetHeight: number = 300;
//
//   @Builder
//   myBuilder() {
//     Column() {
//       Button("change height")
//         .margin(10)
//         .fontSize(20)
//         .onClick(() => {
//           this.sheetHeight = 500
//         })
//     }
//     .width('100%')
//     .height('100%')
//   }
//
//   build() {
//     Column() {
//       Button("transition modal 1")
//         .onClick(() => {
//           this.isShow = true
//         })
//         .fontSize(20)
//         .margin(10)
//         // .bindSheet($$this.isShow,this.myBuilder(),{
//         .bindSheet(this.isShow,this.myBuilder(),{
//           height:this.sheetHeight
//       })
//     }
//     .justifyContent(FlexAlign.Center)
//     .width('100%')
//     .height('100%')
//   }
// }


//54  实现布局
// @Entry
// @Component
// struct Demo {
//   // 忽略其他辅助代码
//   dataSource: ItemDataSource = new ItemDataSource(100)
//   itemHeightArray: number[] = []
//   colors: number[] = [0xFFc0CB, 0xDA70D6, 0x688E23, 0x66A5ACD, 0X00FFFF, 0X00FF7f]
//   scroller: Scroller = new Scroller()
//
//   @State sections: WaterFlowSections = new WaterFlowSections()
//   sectionMargin:Margin= {top:10,left:5,bottom:10,right:5}
//
//
//
//   aboutToAppear(): void {
//     this.getItemSizeArray()
//   }
//
//   build() {
//     Scroll() {
//       Column() {
//         Grid() {
//           GridItem() {
//             Text('GoodsTypeList')
//           }
//           .backgroundColor(this.colors[0])
//
//           GridItem() {
//             Text('AppletService')
//           }
//           .backgroundColor(this.colors[1])
//
//           GridItem() {
//             Text('ReloadData')
//           }
//           .backgroundColor(this.colors[2])
//
//         }
//         .rowsGap(10)
//         .columnsTemplate('1fr')
//         .rowsTemplate('1fr 1fr 1fr')
//         .width('100%')
//         .height('100%')
//         .margin({
//           top: 10,
//           left: 5,
//           bottom: 10,
//           right: 5
//         })
//
//         Grid() {
//           LazyForEach(this.dataSource, (item: number) => {
//             GridItem() {
//               //使用可复用自定义组件
//               ReusableItem({ item: item })
//             }
//             .width('100%')
//             .height(this.itemHeightArray[item%100])
//             .backgroundColor(this.colors[item %5])
//           }, (item:number) => '' + item + this.itemHeightArray[item % 100])
//         }
//         .columnsTemplate("1fr 1fr")
//         .columnsGap(10)
//         .rowsGap(5)
//         .width('100%')
//         .nestedScroll({
//           scrollForward:NestedScrollMode.PARENT_FIRST,
//           scrollBackward:NestedScrollMode.SELF_FIRST
//         })
//       }
//     }
//   }
// }


// @Entry
// @Component
// struct Demo {
//   // 忽略其他辅助代码
//   dataSource: ItemDataSource = new ItemDataSource(100)
//   itemHeightArray: number[] = []
//   colors: number[] = [0xFFc0CB, 0xDA70D6, 0x688E23, 0x66A5ACD, 0X00FFFF, 0X00FF7f]
//   scroller: Scroller = new Scroller()
//   @State sections: WaterFlowSections = new WaterFlowSections()
//   sectionMargin: Margin = {
//     top: 10,
//     left: 5,
//     bottom: 10,
//     right: 5
//   }
//   oneColumnSection: SectionOptions = {
//     itemsCount: 3,
//     crossCount: 1,
//     rowsGap: 10,
//     margin: this.sectionMargin,
//     onGetItemMainSizeByIndex: (index: number) => {
//       return this.itemHeightArray[index % 100]
//     }
//   }
//   lastSection: SectionOptions = {
//     itemsCount: 97,
//     crossCount: 2,
//     margin: this.sectionMargin,
//     onGetItemMainSizeByIndex: (index: number) => {
//       return this.itemHeightArray[index % 100]
//
//     }
//   }
//
//   aboutToAppear(): void {
//     this.setItemSizeArray()
//     //初始化瀑布流分组信息
//     let sectionOptions: SectionOptions[] = []
//     sectionOptions.push(this.oneColumnSection)
//     sectionOptions.push(this.lastSection)
//     this.sections.splice(0, 0, sectionOptions)
//   }
//
//   build() {
//     WaterFlow({ scroller: this.scroller, sections: this.sections }) {
//       LazyForEach(this.dataSource, (item: number) => {
//         FlowItem() {
//           ReusableFlowItem({item:item})
//         }
//         .width('100%')
//         .backgroundColor(this.colors[item % 5])
//       }, (item:string) => item)
//     }
//     .columnsGap(10)
//     .rowsGap(5)
//     .backgroundColor(0xfaeee0)
//     .width('100%')
//     .height('100%')
//   }
// }


// @Entry
// @Component
// struct Demo {
//   // 忽略其他辅助代码
//   dataSource: ItemDataSource = new ItemDataSource(100)
//   itemHeightArray: number[] = []
//   colors: number[] = [0xFFc0CB, 0xDA70D6, 0x688E23, 0x66A5ACD, 0X00FFFF, 0X00FF7f]
//   scroller: Scroller = new Scroller()
//
//   aboutToAppear(): void {
//     this.getItemSizeArray()
//   }
//
//   build() {
//     Scroll() {
//       List({ scroller: this.scroller, space: 10 }) {
//         ListItem() {
//           Grid() {
//             GridItem() {
//               Text('GoodsTypeList')
//             }.backgroundColor(this.colors[0])
//
//             GridItem() {
//               Text('AppletService')
//             }.backgroundColor(this.colors[1])
//
//             GridItem() {
//               Text('ReloadData'）
//             }.backgroundColor(this.colors[2])
//           }
//           .rowsGap(10)
//           .columnsTemplate('1fr')
//           .rowsTemplate('1fr 1fr 1fr')
//           .width('100%')
//           .height(100)
//         }
//
//         ListItem() {
//           WaterFlow() {
//             LazyForEach(this.dataSource, (item: number, index: number) => {
//               FlowItem(){
//                 // ...
//               }
//             })
//           }
//           .id('waterflow')
//           .columnsTemplate("1fr 1fr")
//           .columnsGap(10)
//           .rowsGap(5)
//           .width('100%')
//           .height('100%')
//           .nestedScroll({
//             scrollForward:NestedScrollMode.PARENT_FIRST,
//             scrollBackward:NestedScrollMode.SELF_FIRST
//           })
//         }
//       }
//     }
//     .scrollBar(BarState.Off)
//     .edgeEffect(EdgeEffect.None)
//     .height('100%')
//     .margin({left:10,right:10})
//   }
// }


// 55 
// @Entry
// @Component
// struct ImageAnimatorExample {
//   @State iterations: number = 1
//
//   build() {
//     Column({ space: 10 }) {
//       ImageAnimator()
//         .images([
//           {
//             src: $r('app.media.img1')
//           },
//           {
//             src: $r('app.media.img2')
//           },
//           {
//             src: $r('app.media.img3')
//           },
//           {
//             src: $r('app.media.img4')
//           },
//         ])
//         .duration(2000)
//         .fillMode(FillMode.None)
//         .iterations(this.iterations)
//         .width(340)
//         .height(240)
//         .margin({ top: 100 })
//     }
//     .width('100%')
//     .height('100%')
//   }
// }

// @Entry
// @Component
// struct ImageExample {
//   build() {
//     Column({space:10}){
//       Image($r('app.media.earth'))//对应资源图片名后缀为gif()
//         .width(100)
//         .height(100)
//     }
//   }
// }

// import { AnimatedDrawableDescriptor, AnimationOptions } from '@ohos.arkui.drawableDescriptor';
// import { image } from '@kit.ImageKit';
//
// @Entry
// @Component
// struct ImageExample {
//   pixelmaps: Array<PixelMap> = [];
//   options: AnimationOptions = { duration: 2000, iterations: 1 };
//   @State animated: AnimatedDrawableDescriptor | undefined = undefined;
//
//   async aboutToAppear() {
//     this.pixelmaps = await this.getPixelMaps();
//     this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
//   }
//
//   private async getPixmapListFromMedia(resource: Resource) {
//     let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
//       bundleName: resource.bundleName,
//       moduleName: resource.moduleName,
//       id: resource.id
//     })
//     let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
//     let createPixelMap: Array<image.PixelMap> = await imageSource.createPixelMapList({
//       desiredPixelFormat:image.PixelMapFormat.RGBA_8888
//     })
//     imageSource.release()
//     return createPixelMap
//   }
//
//   private async getPixelMaps() {
//     let Mypixelmaps: Array<PixelMap> = await this.getPixmapListFromMedia($r('app.media.icon')) //对应资源图片名后缀为gif
//     return Mypixelmaps;
//   }
//
//   build() {
//     Column() {
//       Row() {
//         Image(this.animated).width('500px').height('280px')
//       }.height('50%')
//
//       Row() {
//         Button('once').width(100).padding(5).onClick(() => {
//           this.options = { duration: 2000, iterations: 1 };
//           this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
//         }).margin(5)
//       }
//     }
//   }
// }


// import { AnimationOptions, AnimatedDrawableDescriptor } from '@ohos.arkui.drawableDescriptor'
//
// import image from '@ohos.multimedia.image'
//
// @Entry
// @Component
// struct mageExampl {
//   pixelmaps: Array<PixelMap> = [];
//   options: AnimationOptions = { duration: 2000, iterations: 1 };
//   @State animated: AnimatedDrawableDescriptor | undefined = undefined;
//
//   async aboutToAppear() {
//     this.pixelmaps = await this.getPixelMaps();
//     this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
//   }
//
//   build() {
//     Column() {
//       Row() {
//         Image(this.animated).width('500px').height('280px')
//       }.height('50%')
//
//       Row() {
//         Button('once').width(100).padding(5).onClick(() => {
//           this.options = { duration: 2000, iterations: 1 };
//           this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
//         }).margin(5)
//       }.width('50%')
//     }
//   }
//
//   private async getPixmapFromMedia(resource: Resource) {
//     let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
//       bundleName: resource.bundleName,
//       moduleName: resource.moduleName,
//       id: resource.id
//     })
//     let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
//     let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
//       desiredPixelFormat:image.PixelMapFormat.RGBA_8888
//     })
//     await imageSource.release()
//     return createPixelMap
//   }
//   private async getPixelMaps() {
//     Mypixelmaps.push(await this.getPixmapFromMedia($r('app.media.icon'))) //对应资源图片名后缀为gif
//     return Mypixelmaps;
//   }
// }