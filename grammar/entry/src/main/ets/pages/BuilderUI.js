"use strict";
/*
 * 自定义组件构建函数
 * */
struct BuilderUI extends   {
    constructor(/*
     * 自定义组件构建函数
     * */ /*
 * 自定义组件构建函数
 * */
    ) {
    }
    build() {
            .height('100%');
    }
}
// 写在外面的自定义组件构建函数  方便多组件共同调用
function item(content) {
        .backgroundColor(Color.Pink)
        .borderRadius(25)
        .margin({
        top: 15
    })
        .onClick(() => {
        this.isDone = !this.isDone;
    });
}
//# sourceMappingURL=BuilderUI.js.map