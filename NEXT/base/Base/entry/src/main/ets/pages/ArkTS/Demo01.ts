//ArkTS相对TS的约束示例：
// TypeScript
const area = { // ArkTS中会报错
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

// // 动态新增、删除属性 改变了运行时 对象布局
// class User{
//   name:string = ''
//   age:number = 20
// }
// let user = new User()
// (user as any).department = 'XX'
// delete (user as any).department