---
sidebar_position: 104
---

# HCCDA实验

:::tip

华为云鸿蒙实验记录

:::


# HCCDA

## 实验一

### 任务1 补全数据模型数组项
得分点：能正确对指定类中创建对象进行构造初始化。

请使用如下配置自行创建API为12的应用工程：

应用工程创建时的相关配置如下表：

* Project name : ArkTSExam

* Device Type: Phone

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

2、必须通过创建自定义组件DataCard构建页面。定义完数据模型后，请自行分析布局并优先构建组成页面Ul的自定义组件DataCard。且自定义组件DataCard中数据来源应使用任务T中创建数据源数组DataSources。

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

> 完成以上内容并截图提交后，为方便后续步骤，添加export关键字

![alt text](screenshots/image-1.png)

### 任务3：使用渲染控制语法，构建页页面
1、必须正确使用任务二中创建的DataCard组件

2、必须通过染控制语法创建页面组件DataSourcesListView.
构建完成自定义组件DataCard后，请使用渲染控制语法以及子组件DataCard构建组件DataSourcesListView

如下所示，已提供自定义组件DataSourcesListView构建过程中所需具体样式属性参数，请根据这些信息构建出正确的页面。

![alt text](screenshots/careateDataSourcesListView.png)
![alt text](screenshots/image.png)

![alt text](screenshots/image-2.png)


## 实验二：根据题目描述，使用DevEcoStudio实现启动应用内的UIAbility并获取返回结

#### 任务1：创建UIAbility并指定启动页面
本实验包含两个UIAbility，每个UIAbility关联一张Page页面。EntryAbility与其关联的Page页面Index.ets创建好HarmonyOs工程后默认提供。接下来，请自行创建好一个UIAbility命名为SecondAbility，再创建好一个页面名叫Second，使其成为SecondAbility的指定启动页面。

> 创建 SecondAbility

![alt text](screenshots/image-3.png)

![alt text](screenshots/image-4.png)
> 创建 Second页面page

![alt text](screenshots/image-5.png)
![alt text](screenshots/image-6.png)

> 设置 Second 页面为SecondAbility的启动页

![alt text](screenshots/image-7.png)

### 任务2：启动应用内的SecondAbility并传递参数
本实验代码中，已经将Index.ets页面的基本U界面提前构建完毕。接下来，请补全Apply（方法，使其可以完成启动SecondAbility并传递参数的功能。最终实现如下功能效果：
Index页面中存在一个文本输出框，当用户在其中输出文本，并点击提桥按钮，应用会将用户所输出文本在second页面上显示。
![alt text](screenshots/image-15.png)

>复制代码后，根据下图完成指定位置填空。
> 注意细节：
> 
> 1 填空1不必手动操作，直接操作后续步骤，本代码会自动导入
>
> 2 填空2，敲入 `.onC` 即可代码补全，然后在小括号中填写单词`value`，在大括号中填写 `this.newData = value`
> 
> 3 填空3的单词 `common`不必敲完，利用编辑器代码补全功能即可，但是要注意选对第几项，不要认错。
> 
> 4 填空4 为了方便让编辑器自动提示，先在=前面添加类型 `: Want`。
> 


![alt text](screenshots/image-16.png)

### 任务3 接收EntryAbility传递过来的参数

![alt text](screenshots/image-8.png)

### 任务4：参数在Second页面中展示
> 提供Second文件代码如下，请将代码补齐。`此处为整体替换`

![alt text](screenshots/image-17.png)

## 实验三 开发ArkTS卡片
### 任务1 新建ArkTS卡片

> 创建项目

![alt text](screenshots/createProject.png)
![alt text](screenshots/image-9.png)

> 创建卡片

![alt text](screenshots/image-10.png)
![alt text](screenshots/image-11.png)

> 提交对应截图

![alt text](screenshots/image-12.png)

### 任务2:使用router事件跳转到EntryAbility
> 1. 在ets\>pages目录下新建一张名为`Detail`的Page页面，> 将下列代码复制到新建的Detailets文件中，覆盖Detailets文>  件中的原有代码.

> 创建 Detail页面的步骤如下两个示意图

![alt text](screenshots/image-18.png)
![alt text](screenshots/image-19.png)

> 2. 将下列代码复制到ExamCard.ets文件中，覆盖`ExamCard.ets`文件中的原有代码。
> 
![alt text](screenshots/image-20.png)

> 3. 将下列代码复制到EntryAbility.ts文件中，覆盖
> EntryAbility.ts文件中的原有代码，并根据注释补全缺失代
> 码，实现在Entrybility中接收router事件并获取参数，根据> 传递的params不同，选择拉起不同的页面。

![alt text](screenshots/image-13.png)

### 任务3：通过message事件刷新卡片内容（8分）
> 1、将下列代码复制到EntryFormAbility.ts中，覆盖
> EntryFormAbility.ts原有的代码，并根据注释补全缺代码，> 实现通过message事件刷新卡片的内容。


![alt text](screenshots/image-14.png)



























