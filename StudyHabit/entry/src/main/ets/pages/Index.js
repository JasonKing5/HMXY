import router from '@ohos.router';
import { Constants } from '../common/constants/Constants';
struct Index extends   {
    constructor() { }
    jumpAdPage() {
        setTimeout(() => {
            router.replaceUrl({ url: 'pages/Advertising' });
        }, Constants.LAUNCHER_DELAY_TIME);
    }
    aboutToAppear() {
        this.jumpAdPage();
    }
    build() {
            .width(Constants.FULL_WIDTH)
            .height(Constants.FULL_HEIGHT)
            .backgroundColor(Constants.BG_COLOR);
    }
}
//# sourceMappingURL=Index.js.map