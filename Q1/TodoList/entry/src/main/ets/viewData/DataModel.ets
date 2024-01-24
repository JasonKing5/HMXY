// 导入封装好的常量数据
import CommonConstant from '../common/CommonConstant'


export  class DataModel {
  private tasks: Array<string> = CommonConstant.TASKS

  //   提供一个非私有化的方法用来提供数据
  getData(){
    return this.tasks
  }
}

export default  new DataModel()