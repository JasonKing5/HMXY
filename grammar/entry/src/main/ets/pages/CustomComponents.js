"use strict";
/*
 * todo:本套教程QQ交流群：324702418
 * todo: 代码在线地址：https://gitee.com/mayuanwei
 * todo: 自定义组件创建何使用
 * todo: Mr. Chen 陈(背景图)
 * */
/*
 * 1: 组件必须使用@Component装饰
 * 2:@Entry 装饰哪个组件，哪个就呈现在页面上，。
 * 3： 被@Entry 装饰的入口组件。 build() 中必须有且仅有一个根**容器**组件
 *    其他的自定义组件，build() 中必须有且仅有一个根组件
 * */
struct CustomComponents extends   {
    constructor(/*
     * todo:本套教程QQ交流群：324702418
     * todo: 代码在线地址：https://gitee.com/mayuanwei
     * todo: 自定义组件创建何使用
     * todo: Mr. Chen 陈(背景图)
     * */ /*
 * todo:本套教程QQ交流群：324702418
 * todo: 代码在线地址：https://gitee.com/mayuanwei
 * todo: 自定义组件创建何使用
 * todo: Mr. Chen 陈(背景图)
 * */

/*
 * 1: 组件必须使用@Component装饰
 * 2:@Entry 装饰哪个组件，哪个就呈现在页面上，。
 * 3： 被@Entry 装饰的入口组件。 build() 中必须有且仅有一个根**容器**组件
 *    其他的自定义组件，build() 中必须有且仅有一个根组件
 * */

    ) {/*
         * todo:本套教程QQ交流群：324702418
         * todo: 代码在线地址：https://gitee.com/mayuanwei
         * todo: 自定义组件创建何使用
         * todo: Mr. Chen 陈(背景图)
         * */
    }
    build() {
            .height('100%');
    }
}
struct itemComponent extends   {
    constructor(/*
     * todo:本套教程QQ交流群：324702418
     * todo: 代码在线地址：https://gitee.com/mayuanwei
     * todo: 自定义组件创建何使用
     * todo: Mr. Chen 陈(背景图)
     * */ /*
 * todo:本套教程QQ交流群：324702418
 * todo: 代码在线地址：https://gitee.com/mayuanwei
 * todo: 自定义组件创建何使用
 * todo: Mr. Chen 陈(背景图)
 * */

/*
 * 1: 组件必须使用@Component装饰
 * 2:@Entry 装饰哪个组件，哪个就呈现在页面上，。
 * 3： 被@Entry 装饰的入口组件。 build() 中必须有且仅有一个根**容器**组件
 *    其他的自定义组件，build() 中必须有且仅有一个根组件
 * */

    /*
     * 1: 组件必须使用@Component装饰
     * 2:@Entry 装饰哪个组件，哪个就呈现在页面上，。
     * 3： 被@Entry 装饰的入口组件。 build() 中必须有且仅有一个根**容器**组件
     *    其他的自定义组件，build() 中必须有且仅有一个根组件
     * */
    ) {/*
         * todo:本套教程QQ交流群：324702418
         * todo: 代码在线地址：https://gitee.com/mayuanwei
         * todo: 自定义组件创建何使用
         * todo: Mr. Chen 陈(背景图)
         * */
        /*
         * 1: 组件必须使用@Component装饰
         * 2:@Entry 装饰哪个组件，哪个就呈现在页面上，。
         * 3： 被@Entry 装饰的入口组件。 build() 中必须有且仅有一个根**容器**组件
         *    其他的自定义组件，build() 中必须有且仅有一个根组件
         * */
    }
    build() {
        //   必须有一个根组件。
            .backgroundColor(Color.Pink)
            .borderRadius(25)
            .margin({
            top: 15
        })
            .onClick(() => {
            this.isDone = !this.isDone;
        });
    }
}
//# sourceMappingURL=CustomComponents.js.map