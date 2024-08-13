/*
 * 路由容器组件>组件导航: 切记作为页面跟容器使用。否则尺寸会被挤出去
 *    标题和内容联动，不同尺寸的设备上，自适应显示大小，自动切换分栏。
 *
 *    NavPathStack实现路由。
 * 属性方法
 *    mode：
 *        NavigationMode.Auto 自适应   页面宽度大于等于600vp时，采用分栏模式
 *        NavigationMode.Stack  单栏目
 *        NavigationMode.Split  分栏
 *
 *   title: 主标题
 *   titleMode: 主标题显示模式
 *        NavigationTitleMode.Mini  普通型标题栏，用于一级页面不需要突出标题的场景。
 *        NavigationTitleMode.Free
 *        NavigationTitleMode.Full  强调型标题栏，用于一级页面需要突出标题的场景。
 *  menus： 设置菜单栏  超出则收缩起来（横屏5个竖屏3个）
 * */
import TopTitle from '../../view/TopTitle';

@Entry
@Component
struct NavigationComp {
  @State title: string = 'Navigation';

  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: string[] = ['1','2','3'];
  @Builder
  PageMap(name: string) {
    if (name === "NavDestinationTitle1") {
      pageOneTmp()
    } else if (name === "NavDestinationTitle2") {
      pageTwoTmp()
    } else if (name === "NavDestinationTitle3") {
      pageThreeTmp()
    }
  }

  aboutToAppear(): void {
    // 关闭系统自带的转场动画  弹窗类型的页面默认无转场动画
    // this.pageInfos.disableAnimation(true)
  }

  build() {
    Column({ space: 30 }) {

      Navigation(this.pageInfos) {
        TopTitle({ title: this.title })
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')
        List({ space: 10 }) {
          // Array.from({length:4})  [undefined,undefined,undefined,undefined]
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text("NavRouter--" + item)
                .width("100%")
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  // 此处有三种跳转方式
                  // false 为单次专场动画关闭
                  this.pageInfos.pushPath({ name: "NavDestinationTitle" + item },false)
                })
            }
          }, (item:string) : string =>item )
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .mode(NavigationMode.Auto) // 分栏模式
      .title('主标题') // 标题内容
      .titleMode(NavigationTitleMode.Full) // 标题模式
      .navDestination(this.PageMap)     // 页面跳转时的目标页布局 一般是一个自定义构建函数
      //  @formatter:off
      .menus([
        {value:'搜索',icon:'/image/ic_public_search.svg',action:()=>{}},
        {value:'添加1',icon:'/image/ic_public_add.svg',action:()=>{}},
        {value:'添加2',icon:'/image/ic_public_add.svg',action:()=>{}},
        {value:'添加3',icon:'/image/ic_public_add.svg',action:()=>{}},
      ])    // 菜单栏
      .toolbarConfiguration([
        {value:'工具1',icon:'/image/ic_gallery_create.svg',action:()=>{}},
        {value:'工具2',icon:'/image/ic_public_search.svg',action:()=>{}},
        {value:'工具3',icon:'/image/ic_public_add.svg',action:()=>{}},
      ])  // 底部工具栏
      //  @formatter:on

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}


// PageOne.ets
@Component
export struct pageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Stack(){
        Column() {
          Text("NavDestinationContent1")
          Button("Close").onClick(() => {
            this.pageInfos.pop()
          }).width('30%')
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .height('30%')
        .width('80%')
      }
      .width('100%')
      .height('100%')
    }.title("NavDestinationTitle1")
    .mode(NavDestinationMode.DIALOG)  // 目标页面的显示类型：弹窗
    .backgroundColor('rgba(0,0,0,0.5)')
    .hideTitleBar(true)  // 隐藏顶部的标题栏
  }
}

// PageTwo.ets
@Component
export struct pageTwoTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent2")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle2")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}

// PageThree.ets
@Component
export struct pageThreeTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent3")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle3")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}