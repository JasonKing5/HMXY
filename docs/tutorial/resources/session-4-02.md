---
sidebar_position: 104
---

# HCCDA实验

:::tip

华为云鸿蒙实验记录
:::


# HCCDA

## 实验一

### 任务1

![image-20250612151515524](screenshots/hccda/image-20250612151515524.png)

创建成功后，请打开默认生成的index.ets文件，并复制如下代码。此时文件中已经创建好了DataSources类，请对该类使用正确的构造方法进行对象初始化。

```
class DataSources {
  id: string; //ID
  title: string; //标题
  brief: string; //具体描述

  // 请填写正确代码块：
  constructor(id: string, title: string, brief: string) {
    this.id = id;
    this.title = title;
    this.brief = brief;
  }
}
```

> 无需编写代码，按照下图操作即可补全代码

![image-20250612151916461](screenshots/hccda/image-20250612151916461.png)

### 任务2：创建自定义组件，并补全代码

得分点：
1、自定义组件DataCard中数据来源应使用任务一中创建数据源数组DataSources。
2、必须通过创建自定义组件DataCard构建页面。定义完数据模型后，请自行分析布局并优先构建组成
页面Ul的自定义组件DataCard。且自定义组件DataCard中数据来源应使用任务T中创建数据源数组DataSources。
DataCard自定义组件布局如下图所示：

![image-20250612151007591](screenshots/hccda/image-20250612151007591.png)



1. `@Component`
2. `struct`
3. `@Prop dataSources : DataSources` 
4. `build()`
5. `Colunm()`
6. `this.dataSources.title`
7. `this.dataSources.brief`

```
@Component
struct DataCard {
  //使用 @Prop 装饰器连接数据源 DataSources
  @Prop dataSources: DataSources
  build() {
    Row() {
      Image($r('app.media.startIcon'))//系统自动提供图标
        .width(80)
        .height(80)
        .margin({ right: 20 })
      //清根据提供UI页面图样式·选择正纳的容器组件
      Column() {
        //Text组件零数空缺处请补全
        Text(this.dataSources.title)
          .fontSize(20)
          .margin({ bottom: 8 })
        Text(this.dataSources.brief)
          .fontSize(16)
          .fontColor(Color.Gray)
          .margin({ bottom: 8 })
      }
      .alignItems(HorizontalAlign.Start)
      .width('80%')
    }
  }
}
```



## **拉起UIAbility**

#### 1.导入

> 本步不必手动操作，直接操作后续步骤，本代码会自动导入

```
import {common ,Want} from '@kit.AbilityKit'
```



#### 2.添加正确事件从而完善TextInput组件，确保将用户输入信息

```
.onChange((value） =>{
	this.newData = value
}
```



#### 3.获取上下文

```
let context : common.UIAbilityContext = getContext(this) as common.UIAbilityContext
```

#### 4. 创建建want对象，将要传递的自定义参数放入其中

```
let wantInfo = {
	deviceId:'',	//为空代表本设备
	bundleName:getContext(context).applicationInfo.name,	//应用名
	abilityName:'SecondAblity',		//目标Ability
	parameters:{	// 传递的参数
		info: this.newData
	}
}
```



#### 接收EntryAbility传递过来的参数

```
let SecondAbilityInfo = want
```

#### 将解析好的参数信息存到中AppStorage，方便在批假页面中使用

```
Appstorage.setorcreate('info',info)
```



## 实验三卡片

#### 如果UIAbility是首次启动，在收到卡片Router事件后会触发onCreate生命周期回调

```
	// let params:Record<string,Object> = JsoN.parse(___________as string）：//补全代码，
let params:Record<string,Object> = JsoN.parse(want.parameters.params as string)
	// this.selectPage = _________ as string：//补全代码，以实现获取获取router事件中传递的target
this.selectPage =params.targetPage as string：//补全代码·以实现获联获取router事件中
```







```
	//补全代码，绑定要刷新的内容
 	// let formInfo = formBindingData.createFormBindingData(__________)
let formInfo = formBindingData.createFormBindingData(formData)
	// 补全代码，调用相关接口刷新卡月内容
	// formProvider.___________(formId, formInfo).then((data) =>{
formProvider.updateForm (formId, formInfo).then((data)=>{
	console.info('FormAbility updateForm success.+ JsoN.stringify(data));
}).catch((error:BusinessError) =>{
	
}
```

