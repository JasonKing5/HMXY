import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import Constants from '../common/Constants';
import PreferencesUtil from '../common/PreferencesUtil';

export default class EntryAbility extends UIAbility {
   para:Record<string, boolean> = { 'flag': false };
   storage: LocalStorage = new LocalStorage(this.para);

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 获取UIAbility实例的上下文
    let context = this.context
    // 页面初始化
    // 加载首选项对象
    PreferencesUtil.loadPreference(context,Constants.PreferencesFileName)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    // 设置WindowStage的事件订阅（获焦/失焦、可见/不可见）
    try {
      windowStage.on('windowStageEvent', (data) => {
        let stageEventType: window.WindowStageEventType = data;
        switch (stageEventType) {
          case window.WindowStageEventType.SHOWN: // 切到前台
            console.info('windowStage foreground.');
            break;
          case window.WindowStageEventType.ACTIVE: // 获焦状态
            console.info('windowStage active.');
            break;
          case window.WindowStageEventType.INACTIVE: // 失焦状态
            console.info('windowStage inactive.');
            break;
          case window.WindowStageEventType.HIDDEN: // 切到后台
            console.info('windowStage background.');
            break;
          default:
            break;
        }
      });
    } catch (exception) {
      console.error('Failed to enable the listener for window stage event changes. Cause:' + JSON.stringify(exception));
    }
    // 设置UI加载
    windowStage.lentoadCont('pages/ArkTS/Local1',this.storage,(err, data) => {
      // ...
    });
  }


  onForeground(): void {
    // 申请系统需要的资源，或者重新申请在onBackground()中释放的资源
  }

  onBackground(): void {
    // 释放UI不可见时无用的资源，或者在此回调中执行较为耗时的操作
    // 例如状态保存等
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 更新资源、数据
  }

  onWindowStageDestroy(): void {
    // 释放UI资源
  }
  onDestroy(): void {
    // 系统资源的释放、数据的保存等
  }
}
