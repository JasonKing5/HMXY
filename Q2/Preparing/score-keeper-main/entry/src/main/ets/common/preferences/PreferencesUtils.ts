// 轻量级缓存工具类
import DataPreferences from '@ohos.data.preferences'
export class PreferencesUtils {

  // 封装一层，增加获取实例失败的日志输出
  public static getPreferences(content: any, name: string): Promise<DataPreferences.Preferences> {
    return new Promise<DataPreferences.Preferences>((resolved, rejected) => {
      DataPreferences.getPreferences(content, name)
        .then((res: any) => {
          resolved(res)
        })
        .catch((err) => {
          rejected(err)
        })
    })
  }
}