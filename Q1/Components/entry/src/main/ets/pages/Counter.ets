@Entry
@Component
struct CounterExample {
  @State value: number = 0
  build() {
    Counter() {
      Text(this.value.toString())
    }.margin(100)
    .onInc(() => { //监听数值增加事件
      this.value++
    })
    .onDec(() => { //监听数值减少事件
      this.value--
    })
  }
}