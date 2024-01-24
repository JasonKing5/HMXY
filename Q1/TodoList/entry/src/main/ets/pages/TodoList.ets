import router from '@ohos.router'
import TodoItem from '../view/TodoItem'
// 路由参数获取
let appName = router.getParams()['appName']

// 导入数据模型
import  DataModel from '../viewData/DataModel'
// 导入封装好的常量数据
import CommonConstant from '../common/CommonConstant'
@Entry
@Component
struct TodoList {
  @State message: string = appName
  //准备数组容器
  private totalTasks: string[] = []

  // 当组件加载完成，build构建之前
  aboutToAppear() {
    //   初始化数据
    this.totalTasks = DataModel.getData()
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Divider()

        ForEach(this.totalTasks, item => {
          TodoItem({ content: item })
        }, item => JSON.stringify(item))
        //   JSON.stringify(xxx)  将xxx序列化为字符串
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(CommonConstant.BACKGROUND)
  }
}