import router from '@ohos.router';
import { Constants } from '../common/constants/Constants';
struct Advertising extends   {
    constructor() { }
    goToHomePage() {
        clearInterval(this.intervalId);
        router.replaceUrl({ url: 'pages/Home' });
    }
    aboutToAppear() {
        this.intervalId = setInterval(() => {
            if (this.duration > 0) {
                this.duration -= 1;
            }
            else {
                this.goToHomePage();
            }
        }, Constants.DURATION_1000);
    }
    build() {
            .width(Constants.FULL_WIDTH)
            .height(Constants.FULL_HEIGHT)
            .backgroundImage($r('app.media.ic_ad_bg'))
            .backgroundImageSize({ width: Constants.FULL_WIDTH, height: Constants.FULL_HEIGHT })
            .backgroundImagePosition({ x: 0, y: 0 })
            .justifyContent(FlexAlign.SpaceBetween);
    }
}
//# sourceMappingURL=Advertising.js.map