import UIAbility from '@ohos.app.ability.UIAbility';
import Logger from '../common/utils/Logger';
export default class EntryAbility extends UIAbility {
    onCreate(want, launchParam) {
        Logger.info('Ability onCreate');
    }
    onDestroy() {
        Logger.info('Ability onDestroy');
    }
    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        Logger.info('Ability onWindowStageCreate');
        windowStage.loadContent('pages/Index', (err, data) => {
            var _a, _b;
            if (err.code) {
                Logger.error('Failed to load the content. Cause: %{public}s', (_a = JSON.stringify(err)) !== null && _a !== void 0 ? _a : '');
                return;
            }
            Logger.info('Succeeded in loading the content. Data: %{public}s', (_b = JSON.stringify(data)) !== null && _b !== void 0 ? _b : '');
        });
    }
    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        Logger.info('Ability onWindowStageDestroy');
    }
    onForeground() {
        // Ability has brought to foreground
        Logger.info('Ability onForeground');
    }
    onBackground() {
        // Ability has back to background
        Logger.info('Ability onBackground');
    }
}
//# sourceMappingURL=EntryAbility.js.map