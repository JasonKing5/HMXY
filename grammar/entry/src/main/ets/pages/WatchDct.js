"use strict";
/*
 * @Watch 修饰  状态数据
 *  函数中，不要不要不要修改被监视的状态变量。 我们要操作的是其他的业务逻辑
 * */
struct WatchDct extends   {
    constructor(/*
     * @Watch 修饰  状态数据
     *  函数中，不要不要不要修改被监视的状态变量。 我们要操作的是其他的业务逻辑
     * */ /*
 * @Watch 修饰  状态数据
 *  函数中，不要不要不要修改被监视的状态变量。 我们要操作的是其他的业务逻辑
 * */
    ) {
    }
    change() {
        // this.count = this.count + 2  无限循环
        this.res = Math.pow(this.count, this.pow);
    }
    build() {
            .height('100%');
    }
}
//# sourceMappingURL=WatchDct.js.map