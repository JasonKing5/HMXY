"use strict";
/*
 * 自定义样式函数使用装饰器：@Styles
 *  内部优先级>外部
 *  内部不需要function。
 *  外部需要function。
 *  弊端：只能写通用样式。不能传参
 * */
struct StylesFun extends   {
    constructor(/*
     * 自定义样式函数使用装饰器：@Styles
     *  内部优先级>外部
     *  内部不需要function。
     *  外部需要function。
     *  弊端：只能写通用样式。不能传参
     * */ /*
 * 自定义样式函数使用装饰器：@Styles
 *  内部优先级>外部
 *  内部不需要function。
 *  外部需要function。
 *  弊端：只能写通用样式。不能传参
 * */
    ) {
    }
    // 内部样式函数 不需要function
    commonStyle() {
        
    
            .width(200)
            .height(100)
            .backgroundColor(Color.Gray);
    }
    build() {
            .height('100%');
    }
}
// 外部通用样式函数 func
function commonStyle() {
    
  
        .width(250)
        .height(50)
        .backgroundColor(Color.Gray);
}
//# sourceMappingURL=StylesFun.js.map