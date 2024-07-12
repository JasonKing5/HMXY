import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import Constants from '../common/Constants';
import { Category } from '../model/poemData';

export default class EntryAbility extends UIAbility {
  // 准备一个 收藏页面和 诗词主体页面 共用的一个布尔类型变量
  isCollectCurrentPoem: Record<string, boolean> = {
    'isCollectCurrentPoem':false
  }
  currentPoemState = new LocalStorage(this.isCollectCurrentPoem)

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 加载需要初始化的资源
    for (let i = 0; i < Constants.categoryTypeArr.length; i++) {
      Constants.categoryList.push(
        new Category(Constants.categoryTypeArr[i], [])
      )
    }
    console.log('Poem 项目初始化成功。默认list诗词：', JSON.stringify(Constants.categoryList))
  }

  onDestroy(): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    windowStage.loadContent('pages/Index', this.currentPoemState, (err) => {
      if (err.code) {
        return;
      }
    });
  }

  onWindowStageDestroy(): void {
  }

  onForeground(): void {
  }

  onBackground(): void {
  }
}
