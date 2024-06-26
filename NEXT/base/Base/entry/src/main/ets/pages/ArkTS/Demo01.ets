//ArkTS相对TS的约束示例：
import { image } from '@kit.ImageKit'

// ArkTS  要求所有类型在程序实际运行前都是已知的，减少运行时的类型检测，提升性能
const area:image.PositionArea = {
  pixels: new ArrayBuffer(8),
  offset: 0,
  stride: 8,
  region: {
    size: {
      height: 1,
      width: 2
    },
    x: 0,
    y: 0
  }
}

// 2、限制在运行时改变对象布局：为实现最大性能，ArkTS要求在程序执行期间不能更改对象布局。
class User{
  name:string = ''
  age:number = 20
  department?:string   // 初始声明为可选
}
let user = new User()
user.department = 'XX'    // 为可选属性复制
user.department = undefined // 置空可选属性