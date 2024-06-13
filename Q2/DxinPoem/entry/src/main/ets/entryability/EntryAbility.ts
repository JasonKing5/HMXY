import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import preferences from '@ohos.data.preferences';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {

    let pf: Promise<preferences.Preferences> = preferences.getPreferences(this.context, 'DxinPoem')
  }

  onDestroy(): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    windowStage.loadContent('pages/LauncherPage', (err, data) => {
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
