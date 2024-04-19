// 这个文件是用来准备数据的。不是画UI界面的。
import Contants from '../commont/Contants'

class Todo{
  private listArr:string[] = Contants.listArr
  getData(){
    return this.listArr
  }
}

export default  new Todo()