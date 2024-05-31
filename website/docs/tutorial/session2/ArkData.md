---
sidebar_position: 101
---


> 本文档基于NEXT版本DevEco Studio5.0API12

# 首选项

## 场景介绍

​		用户首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。当用户希望有一个全局唯一存储的地方，可以采用用户首选项来进行存储。Preferences会将该数据缓存在内存中，当用户读取的时候，能够快速从内存中获取数据，当需要持久化时可以使用flush接口将内存中的数据写入持久化文件中。`Preferences`会随着存放的数据量越多而导致应用占用的内存越大，因此，`Preferences`不适合存放过多的数据，适用的场景一般为应用保存用户的个性化设置（字体大小，是否开启夜间模式）等。



## 运作机制

如图所示，用户程序通过`ArkTS`接口调用用户首选项读写对应的数据文件。开发者可以将用户首选项持久化文件的内容加载到`Preferences`实例，每个文件唯一对应到一个`Preferences`实例，系统会通过静态容器将该实例存储在内存中，直到主动从内存中移除该实例或者删除该文件。

![img](screenshots/Preferences.jpg)

## 约束限制

- `Key`键为`string`类型，要求非空且长度不超过80个字节。
- 如果`Value`值为`string`类型，请使用UTF-8编码格式，可以为空，不为空时长度不超过`8192`个字节。
- 内存会随着存储数据量的增大而增大，所以存储的数据量应该是轻量级的，建议存储的数据不超过一万条，否则会在内存方面产生较大的开销。

## 接口说明

以下是用户首选项持久化功能的相关接口，更多接口及使用方式请见[用户首选项](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-data-preferences-0000001813416160)。

| 接口名称                                                     | 描述                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| `getPreferencesSync(context: Context, options: Options): Preferences` | 获取`Preferences`实例。该接口存在异步接口。                  |
| `putSync(key: string, value: ValueType): void`               | 将数据写入`Preferences`实例，可通过`flush`将`Preferences`实例持久化。该接口存在异步接口。 |
| `hasSync(key: string): void`                                 | 检查`Preferences`实例是否包含名为给定`Key`的存储键值对。给定的`Key`值不能为空。该接口存在异步接口。 |
| `getSync(key: string, defValue: ValueType): void`            | 获取键对应的值，如果值为null或者非默认值类型，返回默认数据`defValue`。该接口存在异步接口。 |
| `deleteSync(key: string): void`                              | 从`Preferences`实例中删除名为给定`Key`的存储键值对。该接口存在异步接口。 |
| `flush(callback: AsyncCallback<void>): void`                 | 将当前`Preferences`实例的数据异步存储到用户首选项持久化文件中。 |
| `on(type: 'change', callback: Callback<string>): void`       | 订阅数据变更，订阅的数据发生变更后，在执行`flush`方法后，触发`callback`回调。 |
| `off(type: 'change', callback?: Callback<string>): void`     | 取消订阅数据变更。                                           |
| `deletePreferences(context: Context, options: Options, callback: AsyncCallback<void>): void` | 从内存中移除指定的`Preferences`实例。若`Preferences`实例有对应的持久化文件，则同时删除其持久化文件。 |



## 开发步骤

1. 导入`@ohos.data.preferences`模块。

   ```typescript
   import dataPreferences from '@ohos.data.preferences';
   ```

2. 获取`Preferences`实例。

`Stage`模型示例：

```typescript
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';

let preferences: dataPreferences.Preferences | null = null;

class EntryAbility extends UIAbility {  
    onWindowStageCreate(windowStage: window.WindowStage) {   
        let options: dataPreferences.Options = { name: 'myStore' };    
        preferences = dataPreferences.getPreferencesSync(this.context, options);  
    }
}
```

3. 写入数据。

​		使用`putSync()`方法保存数据到缓存的`Preferences`实例中。在写入数据后，如有需要，可使用`flush()`方法将`Preferences`实例的数据存储到持久化文件。

>  当对应的键已经存在时，`putSync()`方法会覆盖其值。可以使用`hasSync()`方法检查是否存在对应键值对。

```typescript
import util from '@ohos.util';
if (preferences.hasSync('startup')) {
  console.info("The key 'startup' is contained.");
} else {
  console.info("The key 'startup' does not contain.");
  // 此处以此键值对不存在时写入数据为例
  preferences.putSync('startup', 'auto');
  // 当字符串有特殊字符时，需要将字符串转为Uint8Array类型再存储
  let uInt8Array = new util.TextEncoder().encodeInto("~！@#￥%……&*（）——+？");
  preferences.putSync('uInt8', uInt8Array);
}
```

4. 读取数据。

​	使用`getSync()`方法获取数据，即指定键对应的值。如果值为`null`或者非默认值类型，则返回默认数据。

```typescript
import util from '@ohos.util';
let val = preferences.getSync('startup', 'default');
console.info("The 'startup' value is " + val);
// 当获取的值为带有特殊字符的字符串时，需要将获取到的Uint8Array转换为字符串
let uInt8Array : dataPreferences.ValueType = preferences.getSync('uInt8', new Uint8Array(0));
let textDecoder = util.TextDecoder.create('utf-8');
val = textDecoder.decodeWithStream(uInt8Array as Uint8Array);
console.info("The 'uInt8' value is " + val);
```

5. 删除数据。

使用`deleteSync()`方法删除指定键值对，示例代码如下所示：

```typescript
preferences.deleteSync('startup');
```

6. 数据持久化。

应用存入数据到`Preferences`实例后，可以使用flush()方法实现数据持久化。示例代码如下所示：

```typescript
preferences.flush((err: BusinessError) => {  
    if (err) {   
        console.error(`Failed to flush. Code:${err.code}, message:${err.message}`);    
        return;  
    } 
    console.info('Succeeded in flushing.');
})
```

7. 订阅数据变更。

​		应用订阅数据变更需要指定`observer`作为回调方法。订阅的`Key`值发生变更后，当执行`flush()`方法时，`observer`被触发回调。示例代码如下所示：

```typescript
let observer = (key: string) => {  
    console.info('The key' + key + 'changed.');
}
preferences.on('change', observer);
// 数据产生变更，由'auto'变为'manual'
preferences.put('startup', 'manual', (err: BusinessError) => {  
    if (err) {    
        console.error(`Failed to put the value of 'startup'. Code:${err.code},message:${err.message}`);   
        return;  
    }  
    console.info("Succeeded in putting the value of 'startup'.");  
    if (preferences !== null) {    
        preferences.flush((err: BusinessError) => {    
            if (err) {      
                console.error(`Failed to flush. Code:${err.code}, message:${err.message}`);       
                return;     
            }      
            console.info('Succeeded in flushing.');   
        }) 
    }
})
```

8. 删除指定文件。

​		使用`deletePreferences`()方法从内存中移除指定文件对应的`Preferences`实例，包括内存中的数据。若该`Preference`存在对应的持久化文件，则同时删除该持久化文件，包括指定文件及其备份文件、损坏文件。

说明

- 调用该接口后，应用不允许再使用该`Preferences`实例进行数据操作，否则会出现数据一致性问题。
- 成功删除后，数据及文件将不可恢复。

示例代码如下所示：

```typescript
let options: dataPreferences.Options = { name: 'myStore' };  
dataPreferences.deletePreferences(this.context, options, (err: BusinessError) => {    
    if (err) {      
        console.error(`Failed to delete preferences. Code:${err.code}, message:${err.message}`);      
        return;    
    }    
    console.info('Succeeded in deleting preferences.');
})
```

---

## 工具类抽取

### 1. 准备一个类型，方便封装数据

> `src/main/ets/model/MyPreferenceData.ets`

```typescript
import { preferences } from '@kit.ArkData'

export  default class MyPreferenceData{
  name:string
  key:string
  value:preferences.ValueType
  constructor(name: string, key: string, value: preferences.ValueType) {
    this.name = name
    this.key = key
    this.value = value
  }
}
```

---

### 2. 封装常量数据方便工具类使用

> `src/main/ets/common/Constants.ets`

```typescript
import MyPreferenceData from '../model/MyPreferenceData'
export default class Constants {
  // 首选项 沙箱文件名 当前项目用
  static readonly PreferencesFileName: string ='base'
  // 首选项 首页字体 对象
  static readonly prefFontSizeObj :MyPreferenceData = new MyPreferenceData(this.PreferencesFileName,'indexFontSize',22)
}
```

---

### 3. 封装工具类

> `src/main/ets/common/PreferencesUtil.ets`

```typescript
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
```

---

### 4. 在入口类中初始化首选项对象

> `src/main/ets/entryability/EntryAbility.ets`

```typescript
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 获取UIAbility实例的上下文
    let context = this.context
    // 页面初始化
    // 加载首选项对象
    PreferencesUtil.loadPreference(context,Constants.PreferencesFileName)
  }
```

---

### 5 . 在业务处设置首选项数据

```typescript
Slider({
    min: 14,
    max: 20,
    step: 2,
    value:this.fontSize
})
    .onChange((val:number) => {
    this.fontSize = val
    // 将设置的数据持久化到首选项
    PreferencesUtil.putPreferenceVal(Constants.prefFontSizeObj.name,Constants.prefFontSizeObj.key,val)
})
```

---

### 6. 在业务处读取首选项数据

```typescript
  aboutToAppear(): void {
    this.fontSize = PreferencesUtil.getPreferenceVal(
      Contants.prefFontSizeObj.name,
      Contants.prefFontSizeObj.key,
      Contants.prefFontSizeObj.value
    ) as number
  }
```

