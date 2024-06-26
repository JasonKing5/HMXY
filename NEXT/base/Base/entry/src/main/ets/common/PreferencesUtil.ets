// 首选项工具栏，提供首选项增上改查功能
import { preferences } from '@kit.ArkData'
import { Context } from '@ohos.arkui.UIContext'
import { JSON } from '@kit.ArkTS'

class PreferencesUtil {
  // 准备一个map, 用来存多个首选项对象
  preMap: Map<string, preferences.Preferences> = new Map()

  // 加载 首选项对象
  loadPreference(context: Context, name: string) {
    try {
      // 该接口 第二个参数 在next修改为配置项 而非字符串
      let pre: preferences.Preferences = preferences.getPreferencesSync(context, { name })
      // 存到首选项 map中
      this.preMap.set(name, pre)
      console.log('PreferencesUtil', `加载Preferences【${name}】成功`)
    } catch (e) {
      console.log('PreferencesUtil', `加载Preferences【${name}】失败`, JSON.stringify(e))
    }
  }

  // 保存数据
  putPreferenceVal(name: string, key: string, value: preferences.ValueType) {
    if (!this.preMap.has(name)) {
      console.log('PreferencesUtil', `加载Preferences【${name}】尚未初始化`)
      return
    }
    try {
      // 从数组中获取该首选项对象
      let pref = this.preMap.get(name)
      // 写入数据
      pref?.putSync(key, value)
      // 刷盘
      pref?.flush()
      console.log('PreferencesUtil', `保存【${name}】-【${key}】-【${value}】成功`)
    } catch (e) {
      console.log('PreferencesUtil', `保存【${name}】-【${key}】-【${value}】失败`, JSON.stringify(e))
    }
  }

  // 获取数据
  getPreferenceVal(name: string, key: string, defaultVal: preferences.ValueType){
    if (!this.preMap.has(name)) {
      console.log('PreferencesUtil', `加载Preferences【${name}】尚未初始化`)
      return
    }
    try {
      let pref = this.preMap.get(name)
      let val = pref?.getSync(key, defaultVal)
      console.log('PreferencesUtil', `读取【${name}】-【${key}】-【${val}】成功`)
      return val
    }catch (e){
      console.log('PreferencesUtil', `读取【${name}】-【${key}】失败`,JSON.stringify(e))
      // try和catch都要有返回
      return defaultVal
    }
  }
}

export default new PreferencesUtil()