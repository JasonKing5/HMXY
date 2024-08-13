/*
 * 基础使用太简单。本案例主要演练 arkts和web互相调用彼此方法
 *    this.controller.runJavaScript('web侧方法名(参数)')
 *      this.controller.refresh()   // 向web注册函数时，记得刷新
 *      this.controller.clearHistory()
 *      this.controller.forward()
 *      this.controller.backward()
 *      this.controller....
 * */
import TopTitle from '../../view/TopTitle';
import { webview } from '@kit.ArkWeb';
import { MyDivider } from '../../view/DxComp';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct WebComp {
  @State title: string = 'Web';
  controller: WebviewController = new webview.WebviewController()

  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      Web({
        src: $rawfile('WebComp.html'),
        controller: this.controller
      })
        .width('100%')
        .layoutWeight(1)
        .javaScriptAccess(true)// 是否允许运行js脚本
        .domStorageAccess(true)//文档对象模型存储权限 有些文档不开启会看不到，例如公众号文字
          // .textZoomRatio(140)
        .darkMode(WebDarkMode.On)// 开启深色模式

        .onConsole((event) => {
          console.log('dxin => arkts调用web侧输出', event?.message.getMessage())
          return false
        })

      Button('调用web侧函数 runJavaScript')
        .onClick(() => {
          // 参数为函数名称。如果有参数。则传递参数。
          this.controller.runJavaScript('changeLoginColor("red")')
          // 如果无参数。则不传递参数。如果有返回值，可以在回调中获取
          this.controller.runJavaScript('login()', (err, data) => {
            if (!err) {
              console.log(`dxin => 运行web侧函数并获取返回数据,${data}`)
            }
          })
        })

      Button('注册函数给web侧进行使用')
        .onClick(() => {
          // 参数一：对象，其中可以有多个函数。
          // 参数二：字符串， 在web侧调放到window身上的对象。类似于参数一的对象名
          // 参数三：数组，传递的多个函数名
          this.controller.registerJavaScriptProxy({
            // 给web一个用户信息
            writeUserInfo: () => JSON.stringify({ username: '帝心', password: 666 })
          }, 'fromArkTS', ['writeUserInfo'])
          // 注册完成后，记得刷新一下，否则web组件还是之前的web
          this.controller.refresh()
          console.log(`dxin => 向web侧写入了fromArkTS =>writeUserInfo`)
        })

      // Web({
      //   src:'https://mp.weixin.qq.com/s?__biz=MzI0NDQ4MjE4MQ==&mid=2247484670&idx=1&sn=bc0acd8865a6e197a8c12c5fb7b25468&scene=19',
      //   controller:this.controller
      // })
      //   .domStorageAccess(true)   // 文档对象模型存储权限
      //   .zoomAccess(true)  //开启手势缩放
      //   .copyOptions(CopyOptions.InApp)   // 剪切板赋值范围选项
      //   .textZoomRatio(150)   //页面文本缩放百分比。默认100 取值为整数
      //   .darkMode(WebDarkMode.On)  // 开启深色模式
      //   .width('100%')
      //   .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}