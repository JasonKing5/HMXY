"use strict";
struct StateManagement extends   {
    constructor() { }
    build() {
            .height('100%');
    }
}
// 存放一个 @Prop 装饰的状态数据。方便父子组件之间进行数据传递和同步  State ----> prop
struct StateManagement_prop extends   {
    constructor() { }
    build() {
        ;
    }
}
// 存放 link 数据
struct StateManagement_link extends   {
    constructor() { }
    build() {
        ;
    }
}
// 同样的样式记得复用 text
function StateManagement_textSty() {
    
  
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Green);
}
// button样式
function StateManagement_btnStyle(click) {
    
  
        .fontSize(30)
        .onClick(() => {
        click();
    });
}
//# sourceMappingURL=StateManagement.js.map