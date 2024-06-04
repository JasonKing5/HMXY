/*
 * 组件定义装饰器
 *    1. @Entry
 *    2. @Component
 *    3. @priview
 *
 * */

@Entry
@Component
struct Grammar04 {
  build() {
    Column() {

    }
  }
}

@Preview
@Component
struct grammar04_test1 {
  build() {
    Column() {
      Text('test1')
    }
  }
}

@Component
struct grammar04_test2 {
  build() {
    Column() {
      Text('test2')
    }
  }
}