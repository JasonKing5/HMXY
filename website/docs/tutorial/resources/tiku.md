---
sidebar_position: 101
---

# 开发者认证题库版本2

> [本题库源md文件](https://gitee.com/mayuanwei/harmonyOS_bilibili/blob/master/website/docs/tutorial/resources/tiku.md)
>
> > 题库逐渐更新，右上角gitee的star请三联一下，方便后期找到该仓库。
> >
> > 参考于网友，博客，视频等。对贡献者表示感谢。

### 单选

应用发生崩溃，（）接口可以获取到崩溃时调用栈

A、hiLog

B、hiTraceMeter

C、hiDebug

**D、hiAppEvent**

AppEvent +提供的watcher接口，需要订阅到OS的崩溃事件，正确的实现方式()

**A**

```
hiAppEvent.addwatcher({
    name: "watcher",
    appEventFilters: [
        {
            domain: hiAppEvent.domain.oS,
            names: [hiAppEvent.eVent.APP_CRASH]
        }
    ]，
    onReceive: (domain: string, appEventGroups:Array<hiAppEvent.AppEventGroup>) => {}
})
```

B

```
hiAppEvent.addwatcher({
    name:"watcher"，
    onReceive: (domain: string, appEventGroups:Array<hiAppEvent.AppEventGroup>) => {}
})
```

C

```
hiAppEvent.addwatcher({
    name:"watcher"，
    appEventFilters:[
        {
            names:[hiAppEvent.eVent.APP_FREEZE]
        }
    ]，
    onReceive:(domain: string, aappEventGroups:Array<hiAppEvent.AppEventGroup>)=>{}
})
```

D

```
hiAppEvent.addwatcher({
    name:"watcher"，
    appEventFilters:[
        {
            domain: hiAppEvent.domain.oS,
            names:[hiAppEvent.eVent.APP_CRASH]
        }
    ]
})
```



在`UIAbility`的`onCreate`生命周期中通过`EventHub`的on注册"`event1`"和"`event2`"事件。

```
import{hilog}from'@kit.PerformanceAnalysisKit';
import{UIAbility,Want,AbilityConstant} from'@kit.AbilityKit';

const DOMAIN_NUMBER:number = 0xFF00;
const TAG: string ='[EventAbility]';
export default class EntryAbility extends UIAbility{
  onCreate(want:Want,launchParam:AbilityConstant.LaunchParam):void{
    //获取UIAbility实例的上下文
    let context  = this.context;
    //获取eventHub
    let eventhub=this.context.eventHub;
    //执行订阅操作
    eventhub.on('event1',this.eventFunc);
    eventhub.on('event2',this.eventFunc);

    hilog.info(DOMAIN_NUMBER,TAG,'%{public}s','AbilityonCreate');

  }

  eventFunc(argOne:Context,argTwo:Context):void{
    hilog.info(DOMAIN_NUMBER,TAG,'receive.'+${argOne},${argTwo});
    return;
  }
}
```

在Ul组件的click处理事件中调用如下的`eventHubFunc`，连续点击2次该控件后，运行日志输出是什么：

```
import common from '@kit.AbilityKit';
import{promptAction} from '@kit.ArkUI'

@Entry
@Component
struct Page_EventHub {
  private context=getContext(this) as common.UIAbilityContext;
  eventHubFunc():void{
    this.context.eventHub.emit('event1');
    this.context.eventHub.emit('event2',2,'test2');
    this.context.eventHub.off('event1');
  }
  build() {
    Column(){
      // ...
      List({initialIndex:0}){
        ListItem(){
          Row(){
            // ...
          }
          .onClick(() => {
            this.eventHubFunc()
            promptAction.showToast({
              message:$r('app.string.EventHubFuncA')
            })
          })
        }
      }
    }
  }
}
```

**A、**

**[Example].[Entry].[EntryAbility]receive.[]**

**[Example].[Entry].[EntryAbility] receive.[2,"test2"]**

**[Example].[Entry].[EntryAbility] receive. [2,"test2"]**

B、

[Example].[Entry].[EntryAbility]receive.[]

[Example].[Entry].[EntryAbility]receive.[2,"test2"]

[Example].[Entry].[EntryAbility]receive.[]

C、

[Example].[Entry].[EntryAbility]receive.[]

[Example].[Entry].[EntryAbility] receive. [2,"test2"] 

D、

[Example].[Entry].[EntryAbility]receive.[]

[Example].[Entry].[EntryAbility]]receive.[2,"test2"]

[Example].[Entry].[EntryAbility]receive.[]

[Example].[Entry].[EntryAbility]]receive.[2,"test2"]



在方舟字节码的函数调用规范中，前三个参数表示的含义分别是

A.`new.Target`、函数对象本身、`this`

B．`this`、函数对象本身、new.Target

**C.  函数对象本身、\****`new.Target`** **`this`**

D. `new.Target`、`this`、函数对象本身

下关于Taskpool和worker的描述正确的是

A. 开发者需要自行管理taskpool的数量及生命周期

**B. TaskPool支持任务延时执行**

C. Worker自行管理生命周期，开发者无需关心任务负载高低

D. TaskPool和Worker的任务执行时长上限都是无限制

如果要实现Row组件内的子元素均匀排列，且第一个元素与行首对齐，最后一个元素与行尾对齐，需要使用justifycontent的哪个枚举值

**A.SpaceBetween**

B.SpaceEvenly

C.Start

D.End

下面哪种转场效果在入场动画时，表现为从透明度为0、相对于组件正常显示位置×方向平移100vp的状态，到默认的透明度为1、相对于组件不平移的状态，且透明度动画和平移动画的动画时长均为2000ms

A.TransitionEffect.translate(( x:100 ).combine(TransitionEffect.OPACITY.animation(( duration: 2000 )

**B.TransitionEffect.OPACITY.animation(( duration: 2000 ).combine(TransitionEffect.translate( x:100 )**

C.TransitionEffect.OPACiTY.combine(TransitionEffect.translate({x:100}).animation((duration:2000})

D. TransitionEffect.asymmetric(TransitionEffect.OPACITY.animation(t duration:2000 ), TransitionEffectranslate(f x:100).animation(( duration:2000 })

如果想让outer button响应事件，hitTestBehavior该怎么配

A.HitTestMode.None

B.HitTestMode.Default

**C.HitTestMode.Transparent**

D.HitTestMode.Block

依次点击A、B、C、D四个按钮，其中不会触发UI刷新的是

```
class Info {
    name: string;
    constructor(name: string) {
        this.name = name;
    }
 }
 ...
```

**A. C**

B.B

C. D

D.A

下关于ArkUI NavDestination组件的生命周期执行顺序中正确的是

**A. onWillappear->onAppear->onWillShow->onShow->onWillHide->onHidden->onWilIDisappear->onDisappear** 

B. onWillappear->onAppear->onWillShow->onShow->onWillHide->onWillDisappear->onHiden->onDisappear

C.onWillappear->onWillShow->onShow->onAppear->onWillHide->onHidden->onWillDisappear->onDisappear 

D. onWillappear->onAppear->onWilShow->onShow->onWilIDisappear->onWillHide->onHidden->onDisappear

开发者小李遇到了一个复杂的问题，该问题仅在特定的代码执行路径上出现，且难以复现。他使用的是c++进行核心算法开发，代码的逻辑密集且对性能要求极高，DevEcostudio为c/C++开发者提供的高级调试能力，以下哪个能力可以帮助小李查看代码历史执行路径，回溯到关键的变量状态

A.实时代码修改与运行时效果查看：支持在调试过程中修改代码并立即查看修改效果，适用于快速迭代，但不聚焦于问题追溯

**B.反向调试能力：允许开发者在调试过程中回退回到之前的代码行或\****断点，不仅查看过去的堆栈信息，还能重现历史的全局、静态和局部变量状态，帮助深入理解代码历史行为，特别是对于复杂逻辑和难以复现的bug定位至关重要**

C.代码静态分析：提供静态代码检查工具，通过语法和逻辑分析帮助预防潜在错误，但不涉及运行时问题定位

D.传统调试模式：仅允许在当前断点暂停代码执行，查看调用堆栈和当前变量信息，但无法追溯历史执行状态

目前您在开发一个ArkTS、Stage 模型的 Harmonyos工程，关于当前ArkTs 工程目录结构，下列选项说法错误的是？

A.oh-packagejson5:描述依赖配置，如:依赖覆盖盖(overides)、依赖关系重写(overideDependencyMap)和参数化配置(parameterFle)等

**B.build-profilejson5:应用级编译构建任务脚本。**

C.AppScope>appjson5:应用的全局配置信息。

D.entry> src> main >moduejson5：Stage 模型模块配置文件，主要包含 HAP 的配置信息、应用在具体设备上的配置信息以及应用的全局配置信息

EcoStudio提供Harmonyos应用/服务的ui预览界面与源代码文件间的双向预览功能，支持ets文件与预览器界面的双向预览。关于双向预览，下列选项说法错误的是

A.选中预览器ui界面中的组件，则组件树上对应的组件将被选中，同时代码编辑器中的布局文件中对应的代码块高亮显示。

**B.双向预览不支持通过组件的属性面板实时修改属性或样式。**

C.选中布局文件中的代码块，则在u界面会高亮显示，组件树上的组件节点也会呈现被选中的状态

D.选中组件树中的组件，则对应的代码块和u界面也会高亮显示。

HAR(Harmony Archive)是Harmonyos提供的共享包，以下关于 HAR的描述错误的是

**A.HAR 不支持使用 page 页面。**

B.HAR 不支持引用 AppScope 目录中的资源。在编译构建时,AppScope中的内容不会打包到HAR 中，因此会导致HAR 资源引I用失败。

C.HAR可以作为二方库和三方库提供给其他应用使用，如果需要对代码资产进行保护时，建议开启混淆能力。

D.HAR不支持在设备上单独安装/运行，只能作为应用模块的依赖项被引用。

want参数的entities匹配规则错误的是

**A、调用方传入的want参数的entities为空，待匹配应用组件的skills配置中的entities不为空，则entities匹配失败。**

B、调用方传入的want参数的entities为空，待匹配应用组件的skills配置中的entities为空，则entities匹配成功。

C、调用方传入的want参数的entities不为空，待匹配应用组件的skills配置中的entities为空，则entities匹配失败。

D、调用方传入的want参数的entities不为空，待匹配应用组件的skills配置中的entities不为空且包含调用方传入的want参数的entities，则entities匹配成功。

作为一个应用开发者，想搭建运维平台，想在应用内定时读取当前的内存信息，可以通过（）接口来实现。

A. hiChecker

**B. hiDebug**

C. hiAppEvent

D.hiLog

关于ArkUI的ForEach和LazyForEach，下列说法错误的是？

A、LazyForEach需要配合cachedCount和组件复用一起使用，以达到性能的最优表现。

B、ForEach和LazyForEach会根据定义的键值生成规则为数据源的每个数组项生成唯一键值，并创建相应的组件。

**C、长列表滚动场景，优先使用\****ForEach。**

D、当在滚动容器中使用了LazyForEach，框架会根据滚动容器可视区域按需创建组件，当组件滑出可视区域外时，框架会进行组件销毁回收以降低内存占用。

根据上面代码，以下解释正确的是

```
enum Mode{
    fullScreen,
    halfScreen
}

@Entry
@Component
struct Page {
  @State title:string  = ""
  @State mode:Mode  = Mode.fullScreen

  isShownTitle():boolean {
    if (this.mode == Mode.fullScreen) {
      this.title = "Title"
      return true
    }else {
      this.title= "Section"
      return false
    }
  }
  build() {
    Column(){
      if (this.isShownTitle()){
        Text(${this.title})
      }else {
        Text(${this.title})
      }
      ChangeMode({mode:this.mode})
    }
  }
}

@Component
struct ChangeMode {
  @Prop mode:Mode;
  build() {
    Row({space:20}){
      Button('full screen')
        .onClick(() => {
          this.mode = Mode.fullScreen
        })
      Button('half scrtten')
        .onClick(() => {
          this.mode = Mode.halfScreen
        })
    }
  }
}
```



> 本道题目A确实没毛病。也有人选C。

**A、本例子可以运行起来，所以代码没有问题。**

B、为了避免`@Prop`的拷贝，可以优化使用`@Lin`k，在该例子中行为和`@Prop`一样。

C、在自定义组件`Page`的`build`方法里改变状态变量是非法操作，可能导致未定义的异常UI行为

D、在`ChangeMode`里改变`mode`的值，会触发其父组件`Page`的Title`内容`的切换。

下示例代码中可以进行动画的属性有哪些？

```
@component
struct Mycomponent{
    @state compwidth:number = 100;
    @stalecompHeight: number = 100;
    @state compRadius: number = 32;
    build() {
        Column(){}.width(this.compwidth)//1
        .height(this.compHeight)//2
        .animation({curve:Curve.Ease，duration: 200 })
        .borderRadius(this.compRadius)//3
        .onclick(O=>{
            this.compwidth+=10;   
            this.compHeightt += 10;
            this.compRadius5+=4；
        })
    }
}
```

A.1、3

B.2、3

**C.1、2、3**

D.1、2

以下哪些赋值语句在ArkTS中是合法

```
classc{}
let valuel: number= null;
let value2:string | null = nul1;
let value3: string | undefined= null;
let value4:C =  nul1;
```

A. value3

**B. value2**

C. value1

D.value4

以下哪些赋值语句在ArkTS中是合法的

```
class A {
    V: number = 0;
}
class B extendsA{
    u: string = '' 
 }
class c{
    v: number = 0;
}
let al: A = new C();
let a2: A = new B();
let a3: B = new A();
let a4: C = new B();
```

**A. a2**

B. a1

C. a4

D. a3

singleton模式的ulAbility，在冷启动时生命周期的执行顺序是：

A. onCreate -> onForeground -> onWindowStageCreate

B. onCreate -> onBackground -> onForeground

C. onCreate -> onBackground -> onWindowStageCreate

**D. onCreate -> onWindowStageCreate -> onForeground**

以通过下面那个接口拉起导航类的垂域面板

A. startAbility

**B. startAbilityByType**

C.startAbilityForResult

D. startAbilityByCall

为了提高性能，所以List组件支持懒加载，可以通过配置cachedCount属性设置缓存列表项的数量。当我们不设置List的属性生cachedcount时，该属性的默认值是？

A.3

B.0

C.2

**D.1**

应用程序开发调试过程中经常需要安装新应用进行调测，下面安装应用操作错误的是+

**A. hdc install -p ohosapp.hap** 

B. bm install -p /data/app/

C. bm install -p ohosapp.hap

D. bm install -p ohosapp.hap -r

关于短时任务开发使用的接口是

A.使用 startWork 申请任务，使用 stopWork取消任务，使用getWorkStatus 获取任务状态

**B.使用requestSuspendDelay申请任务，使用 getRemainingDelayTime 获取任务剩余时间**

C.使用publishReminder发布一个提醒类通知，使用cancelReminder取消一个指定的提醒类通知

D.使用 startBackgrcondRunning 申请任务，使用 stopBackgroundRunning取消任务

list组件onScrolllndex事件触发时机是

**A.List组件首次加载完成时触发**

B.List组件列表滚动时每帧触发

C.List组件滚动停止时触发

D.List组件显示区域内第一个子组件或最后一个子组件或中间位置子组件索引值变化时触发

下关于垂直滚动Grid组件使用cachedCount属性的说明正确的是

**A.设置cachedCount为1，则\****Grid在显示范围上下各缓存1个Gridltem**

B.设置cachedCount为1，则Grid在显示范围上下各缓存1行Gridltem

C.设置cachedCount为1，则Grid在显示范围下方缓存1个Gridltem

D.设置cachedCount为1，则Grid在显示范围下方缓存1行Gridltem

下哪份代码可以实现下图Grid布局

![](![img](data:image/png;base64,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))

A.通过设置Gridltem的columnStart和columnEnd

**B.通过GridLayoutOptions**

C.通过设置不同Gridltem的宽度

开发者小林正在使用DevEcoStudio开发一款Harmonyos应用，并在真机上进行调试。他在运行应用的过程中突然发现一处ui布局需要微调，希望在不中断当前应用运行的情况下看到调整效果，基于DevEcoStudio提供的Hot Reload（热重载）能力，以下哪种做法能让小林最有效地实现他的需求

**A.在不关闭应用的情况下，直接修改代码并保存，借助HotReload功能在真机上实时查看布局调整的效果**

B.使用模拟器替代真机进行调试，因为HotReload仅在模拟器上支持代码改动的即时生效

C.继续运行应用，手动重启应用后检查布局是否符合预期

D.立即停止应用、修改代码后重新编译并部署到真机上

小华正在使用DevEco studio开发一款基于Harmonyos的Arkun应用，该应用需要实现一个功能，即当用户点击按钮时，通过ArkTS/JSAPI调用系统的分享功能。小华对具体的Api调用细节不太熟悉，如何通过DevEcoStudio快速查阅相关的API文档。

A.小华在代码编辑区直接键入分享功能相关的APi调用代码，如 arkuilgetShareO，然后按F1键，期望编辑器能自动跳转到该API的文档页面。

B.小华右键点击代码编辑区，选择“Find Usages"选项，试图从其他地放引l用该API的实例中学习如何使用分享功能

C.小华应该先停止编码工作，打开浏览器，手动搜索关键词“HarmonyOs ArkUI分享AP"，，在官方网站的文档页面中寻找相关API的使用方法。

**D.小华将鼠标悬停在编辑器中已经键入或打算键入的\****API调用（例如@system.router.push )上等待编辑器自动弹出悬浮提示框，显示该API的简要信息和不同版本参数说明。随后，点击提示框右下角的“ShowinAPI Reference”链接。直接跳转到详尽的API参考文档页面。**

用DevEcoStudio进行复杂的跨设备功能开发与调试工作，_期间频繁依赖本地模拟器来模拟多样化的设备环境。在这样的背景下，以下关于DevEcoStudio本地模拟器所支持的规格与功能，哪一项描述是准确的

A.本地模拟器当前不支持单元测试框架和UI测试框架的运行

**B.本地模拟器上运行的应用无需进行签名，简化了调试过程**

C.本地模拟器和真机的能力没有任何差异，真机上可以支持的能力在模拟器上都可以

D.本地模拟器当前不支持查看HiLog以及FaultLog

### 多选

以下代码片段哪几处违反了ArkTS语法规范

```
function foo(valuel:number, value2?：number){
return valuel + value2;
}
foo();
foo(1, 2);
foo(1,2,3);
foo(1,2,3,4) ;
```

**A. fo0(1,2,3,4);** 

**B.foo();**

C.foo(1,2);

**D.foo(1,2,3);** 

下面关于Node-API数据类型描述正确的是

**A、napi_env:用于表示Node-API执行时的上下文**

**B、napi_status:是一个枚举\****数据类型，表示Node-APl接口返回的状态信息**

C、napi_threadsafe_function_call_mode：该枚举类型定义了两个常量，用于指定在何时释放线程安全函数的回调函数

D、napi_threadsafe_function_release_mode：该枚举类型定义了两个常量，用于指定线程安全函数的调用模式

ArkTS是鸿蒙生态的应用开发语言。下列说法正确的是

**A.ArKTS提供了声明式\****UI范式、状态管理支持等相应的能力，让开发者可以以更简洁、更自然的方式开发应用。**

**B.ArKTS在保持TypeScrpt(简称TS)基本语法风格的基础上，进一步通过规范强化静态检查和分析，使得在程序运行之前的开发期能检测更多错误，提升代码健壮性，并实现更好的运行性能。**

C.TS/JS代码支持import ArkTS代码。

**D.针对\****JavaScript(简称JS)/TS并发能力支持有限的问题，ArkTS对并发编程API和能力进行了**

关于动态import描述正确的是

**A.动态import根据入参是否为常量字符串分为常量动态import和变量动态import两种**

**B.动态导入import(是个异步接口，调用后将返回一个promise**

**C.HAR模块间只有变量动态import时可以进行模块\****解耦**

D.常量动态import也必须配置runtimeOnly选项

hiAPPEvent提供Watcher接口，订阅到的系统事件，那些包含HiLog日志

**A.卡死事件**

**B.崩溃事件**

**C.启动耗时事件**

**D.CPU高负载事件**

用户购买商品后，你需要及时发放相关权益。但实际应用场景中，若出现异常将导致应用无法知道用户实际是否支付成功，从而无法及时发放权益，即出现调单情况，为了确保权益发放，你需要在以下那些场景检查用户是否存在已购未发货商品：

A. finishPurchase请求返回1001860052-由于未拥有该商品，发货失败时

**B. createPurchase请求返回1001860051-由于已经拥有该商品，购买失败时**

**C. 应用启动时**

**D createPurchase请求返回1001860001-内部错误时**

以下哪些方式可以实现ArkWeb同层渲染能力

A、

```
Web(...).enableNativeEmbedMode(true)
<object id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
```

B、

```
Web(...).enableNativeEmbedMode(true).registerNativeEmbedRule('object','test')
<object id="view" type="test/contents" width="100%" height="100%" style="background-color:red"/>
```

**C、**

```
Web(...).enableNativeEmbedMode(true).registerNativeEmbedRule('native','test')
  <object id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
```

**D、**

```
Web(...).enableNativeEmbedMode(true)
<embed id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
```

以下关于Taskpool和Worker的描述正确的是

A.Worker支持取消已发起的任务

**B.Worker的任务执行时长上限是无限制**

C.TaskPool不支持线程复用

**D.TaskPool支持设置任务的优先级**

ArkTS是鸿蒙生态的应用开发语言。以下哪些选项是ArkTs的设计理念

A.ArkTS不支持null-satety特性。

**B.通过规范强化静态检查和分析，减少运行时的类型检查，从而降低了运行时负载，提升执行性能。**

**C.通过规范强化静态检查和分析，使得许多错误在编译时可以被检测出来，降低代码运行错误的风险。**

**D .ArkTS保留了\****TS大部分的语法特性，帮助开发者更容易上手ArkTS。**



## 待校验答案







---

## 单选题

---

1. ArkTS支持以下哪些函数

A、`Object.isPrototypeOf();`

B、`Object.getOwnPropertySymbols()`

**C、 `Object.keys();`**

D、`Object.isExtensible();`

---

2. 以下哪个装饰器用来表示并发共享对象

A、`@Shared`

**B、`@Sendable`**

C、`@Style`

D、`@State`

---

3. ArkTS支持以下哪个函数？

A、`Object.getOwnPropertyDescriptors();`

**B、`Object.values();`**

C、`Object.hasOwnProperty();`

D、`Object.getOwnPropertyDescriptor();`

---

4. 下面关于方舟字节码格式IMM16_ID16_IMM8描述正确的是

**A、8位操作码，16位立即数，16位id，8位立即数**

B、8位操作码，16位立即数，2个8位寄存器

C、8位操作码，16位立即数，16位id，8位寄存器

D、16位前缀操作码，16位立即数，8位寄存器



5. 下面关于方舟字节码格式`PREF_IMM16_V8_V8`描述正确的是

A、16位前缀操作码，16位立即数，8位寄存器

**B、16位前缀操作码，16位立即数，2个8位寄存器**

C、8位操作码，8位立即数，16位id，8位寄存器

D、8位操作码，8位立即数，2个8位寄存器

---

6. 已知下列代码`PageOne`页面为`navigation`中的某一子页面，依次点击`PageOne`页面中`toPageTwo`按钮，`PageTwo`页面中`toPageOne`按钮，此时点击`get`按钮获取全部名为`name`的`NavDestination`页面的位置索引为

```typescript
@Component
export struct PageOneTmp {
  @Consume('pageInfos') pageInfos:NavPathStack;
  build() {
    NavDestination(){
      Column(){
        Button('toPageTwo',{stateEffect:true,type:ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick( ()=>{
            this.pageInfos.pushPathByName('pageTwo',"")
          })
        Button('get',{stateEffect:true,type:ButtonType.Capsule})
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            console.log('取全部名为name的NavDestination页面的位置索',JSON.stringify(this.pageInfos))
          })
      }.width('100%').height('100%')
    }
    .title('pageOne')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop()
      console.log('pop'+'返回值'+JSON.stringify(popDestinationInfo))
      return true
    })
  }
}
//PageTwo.ets
export class Pages{
  name:string = ""
  values:NavPathStack | null = null
}

@Builder
export function pageTwoTmp(info:Pages){
  NavDestination(){
    Column(){
      Button('toPageOne',{stateEffect:true,type:ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick( ()=>{
         (info.values as NavPathStack).pushPathByName('pageOne',"")
        })
    }.width('100%').height('100%')
  }
  .onBackPressed(() => {
    (info.values as NavPathStack).pop()
    return true
  })
}
```

A、[1,2]

B、[0,2]

C、[2,1]    

D、[0,1]

---

7. 根据上面代码，以下解释正确的是

```
enum Mode{
	fullScreen,
	halfScreen
}

@Entry
@Component
struct Page {
  @State title:string  = ""
  @State mode:Mode  = Mode.fullScreen

  isShownTitle():boolean {
    if (this.mode == Mode.fullScreen) {
      this.title = "Title"
      return true
    }else {
      this.title= "Section"
      return false
    }
  }
  build() {
    Column(){
      if (this.isShownTitle()){
        Text(`${this.title}`)
      }else {
        Text(`${this.title}`)
      }
      ChangeMode({mode:this.mode})
    }
  }
}

@Component
struct ChangeMode {
  @Prop mode:Mode;
  build() {
    Row({space:20}){
      Button('full screen')
        .onClick(() => {
          this.mode = Mode.fullScreen
        })
      Button('half scrtten')
        .onClick(() => {
          this.mode = Mode.halfScreen
        })
    }
  }
}
```

A、本例子可以运行起来，所以代码没有问题。

B、为了避免`@Prop`的拷贝，可以优化使用`@Lin`k，在该例子中行为和`@Prop`一样。

**C、在自定义组件`Page`的`build`方法里改变状态变量是非法操作，可能导致未定义的异常UI行为**

D、在`ChangeMode`里改变`mode`的值，会触发其父组件`Page`的Title`内容`的切换。

---

8. 使用promptAction.showToast如何设置显示在其他应用之上？

A、ToastShowMode.DEFAULT

B、ToastShowMode.SYSTEM_TOP_MOST

C、无需配置，默认显示在其他应用之上

**D、ToastShowMode.TOP_MOAST**

---

9. Text组件不支持以下哪种使用方式？

A、

```typescript
@Entry
@Component
struct styledStringDemo {
  scroll: Scroller = new Scroller();
  mutableStyledString: MutableStyledString = new MutableStyledString("test",[{
    start:0,
    length:5,
    styledKey:StyledStringKey.FONT,
    styledValue:new TextStyle({fontColor:Color.Pink})
  }])
  controller1:TextController=new TextController();
  async onPageShow() {
    this.controller1.setStyledString(this.mutableStyledString)
  }
  build() {
    Column(){
      Text(undefined,{controller:this.controller1})
    }.width('100%')
  }
}
```

B、

```typescript
@Entry
@Component
struct SpanExample {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent:FlexAlign.Start}){
      Text(){
        Span('In line')
        Span('Component')
        Span('!')
      }
    }.width('100%').height(250).padding({left:35,right:35,top:35 })
  }
}
```

C、

```typescript
@Entry
@Component
struct styledStringDemo {
  scroll: Scroller = new Scroller();
  layout: TextLayoutManager = new  TextLayoutManager()

  controller1: TextController = new TextController()

  async onPageShow() {
    this.controller1.setLayout(this.layout)
  }

  build() {
    Column(){
      Text(undefined,{ controller:this.controller1 })
    }.width('100%')
  }
}
```

D、

```typescript
@Entry
@Component
struct TextExample{
  build() {
    Column({space:8}){
      Text('textShadow').fontSize(9).fontColor(0xcccccc).margin(15).width('95%')
    }
  }
}
```

---

10. 已知下列代码PageOne页面为navigation中的某一子页面，依次点击PageOne页面中toPageTwo按钮，PageTwo页面中toPageOne按钮，此时获取当前页面的路由栈数量为多少

```typescript
// PageOne.ets
@Component
struct PageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column(){
        Button('toPageTwo', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.pushPathByName("pageTwo", "")
          })
      } .width('100%').height("100%")
    }.title('pageOne')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop()
      console.log('pop'+'返回值'+JSON.stringify(proDestinationInfo))
      return true
    })
  }
}

// PageTwo.ets
export class Pages{
  names:string =''
  values:NavPathStack | null = null
}
@Builder
export function pageTwoTmp(info: Pages){
  NavDestination() {
    Column(){
      Button('toPageOne', { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          (info.values as NavPathStack).pushPathByName("pageOne", null)
        })
    } .width('100%').height("100%")
  }.title('pageTwo')
  .onBackPressed(() => {
    (info.values as NavPathStack).pop()
    return true
  })
}
```

A、4

B、2 

C、3

D、1

---

11. 为了使`isShow`参数值与半模态界面的状态同步，可以使用下列那种方式双向绑定`isShow`参数？

A、`&&`

```typescript
@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 300;

  @Builder
  myBuilder() {
    Column() {
      Button("change height")
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet(&&this.isShow,this.myBuilder(),{
          height:this.sheetHeight
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
```

B、`@@`

```typescript
@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 300;

  @Builder
  myBuilder() {
    Column() {
      Button("change height")
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet(@@this.isShow,this.myBuilder(),{
          height:this.sheetHeight
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
```

**C、正确`$$`**

```typescript
// xxx.ets
@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 300;

  @Builder
  myBuilder() {
    Column() {
      Button("change height")
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow,this.myBuilder(),{
          height:this.sheetHeight
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
```

D、

```typescript
// xxx.ets
@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State sheetHeight: number = 300;

  @Builder
  myBuilder() {
    Column() {
      Button("change height")
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet(this.isShow,this.myBuilder(),{
          height:this.sheetHeight
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
```

---

12. 现有一个宽高分别为200px的`xcomponent`组件，其绑定了一个`xComponentController（xcController）`，依次进行如下操作：

1、`xcController.setxComponentSurfaceRect( {surfaceWidth:150,surfaceHeight:500})`

2、设置`xcomponent`组件的`padding`为 `{top：5px，left：10px，bottom:15px,right:20px}`

3、将`xComponent`组件大小改为300px x 300px

4、给`xComponent`组件设置一个宽度为2px的边框

5、`xcController.setxcomponentSurfaceRect({offsetx:-20,offsetY:50,surfaceWidth:200,surfaceHeight:-100})`

    之后，调用xcController·getXComponentSurfaceRect（)的返回值为

**A、`{offsetX:75,offsetY:-100,surfaceWidth:150,surfaceHeight:500}`**

B、`{offsetX:81,offsetY:-89,surfaceWidth:150,surfaceHeight:500}`

C、 `{offsetX:81,offsetY:-89,surfaceWidth:200,surfaceHeight:0}`

D、`{offsetX:-20,offsetY:50,surfaceWidth:200,surfaceHeight:500}`



---

13. 从桌面冷启动如下应用代码，点击`Change`按钮`5`次，整个过程中，代码中的2条`log`依次出现的次数是：

    ```typescript
    class Data{
      num:number
      type: string
      constructor(num: number, type: string) {
        this.num = num;
        this.type = type;
      }
    }
    
    @Reusable
    @Component
    struct Item{
      @State data:Data | undefined =undefined;
      aboutToAppear():void {
        console.log("Demo log1");
      }
      aboutToReuse(params: ESObject): void {
        console.log("Demo log2")
        this.data = params.data
      }
    
      build() {
        Text("num = " + this.data?.num + ", type = " + this.data?.type)
      }
    }
    
    @Entry
    @Component
    struct Index {
      data1: Data = new Data(1, "type1");
      data2: Data = new Data(2, "type2");
      @State data:Data  = this.data1
      build() {
        Column(){
          if (this.data.type == "type1"){
            Item({ data: this.data }).reuseId(this.data.type)
          }else{
            Item({ data: this.data }).reuseId(this.data.type)
          }
          Button('Change').onClick(() =>{
            if(this.data === this.data1){
              this.data = this.data2
            }else {
              this.data = this.data1
            }
          })
        }
      }
    }
    
    ```

A、1,5

**B、1,0**

C、2,4

D、6,0

---

14. 小李正在使用DevEco Studio进行Harmonyos应用的开发工作，他需要对一个频繁被调用的函数calculateData()进行重构，为了帮助小李高效地找到calculateData（)函数的所有引用位置，并确保重构时考虑周全，以下哪个步骤是正确的使用DevEcoStudio的"FindUsages"功能的操作方法

**A、小李只需将光标定位在calculateData()函数名上，右键点击并选择“Find Usages”，或者直接使用快捷键Alt+F7（macOS为Option+F7），DevEco Studio会自动列出该函数在项目中的所有引用位置。**

B、小李应该在菜单栏中选择“Navigate”>“Class"来打开类浏览器，从中找到calculateData()函数，并在此界面中手动检查所有引用。

C、小李应将光标置于calculateDataO函数的名称上，按下Ctrl+Shift+F（macOS为Command+Shift+F）全局搜索该函数名，然后在搜索结果中筛选出真正的调用位置。

D、小李应当在项目目录树中找到calculateDataO函数所在的文件，直接双击打开文件然后逐行扫描代码以手动查找该函数的所有调用位置。

---

15.   项目中包含多个模块和数千行代码。随着开发的深入，项目中的ArkTS源代码文件逐渐积累了大量import语句，其中不乏未使用的import以及不规范的排序情况，关于DevEcoStudio的编辑器的“optimizeImports”，以下说法正确的是

A、在DevEcoStudio中，没有直接的“OptimizeImports"功能，需要安装第三方插件来实现这个需求。

**B、可以在菜单栏中依次点击“Code”>“ReformatCode”来达到优化import的目的，因为“OptimizeImports”功能已整合进“ReformatCode”中。**

C、应该手动遍历每个ArkTS文件，逐一检查并删除未使用的import语句，然后按照字母顺序手动排序剩余的import。

D、为了快速清理未使用的import，可以选中项目根目录，按下快捷键Ctrl+Alt+O（在macOS上为Control+Option+O），让DevEcoStudio自动识别并移除所有未使用的impor，并自动按照预设规则排序和合并import。

---

16. 在一个包含多个模块（如entry、feature、har、hsp等）的大型Harmonyos应用项目中，如果要对某个静态共享模块构建出静态构建包产物，如何通过DevEcoStudio进行构建

A、选中hsp模块，点击通过菜单栏`make module 'hsp'`

B、选中hap模块，点击通过菜单栏`make module 'hsp'`

C、选中har模块，点击build菜单栏`build hap（s）`

**D、选中har模块，点击build菜单栏`make module 'har'`**

---

17. 在Harmonyos应用开发中，当开发者遇到需要分析Release版本应用的崩溃或异常堆栈信息时，为了准确地将堆栈追踪信息对应到源代码的具体位置，以下哪个描述是正确的做法或理解

**A、DevEcoStudio提供的Release应用堆栈解析功能，要求开发者在遇到问题时，需上传构建产物中的特定文件（如so、sourcemap、nameCache等）到指定工具或界面，借助这些文件辅助解析堆栈信息，实现从Release堆栈到源码的映射，便于快速定位问题**

B、开发者需手动将Release构建生成的so文件与源代码进行映射，配合第三方工具进行堆栈信息还原，虽然过程繁琐，但最终能定位到问题代码位置

C、DevEcoStudio通过集成的Release应用堆栈解析功能，自动利用构建时产生的so文件、sourcemap文件、nameCache文件等，无需额外操作即可直接在Release应用中提供详细的源码级堆栈追踪信息

D、因为Release应用经过优化和去除Debug信息，直接从堆栈跟踪到源代码行号是不可能的，开发者只能依靠日志信息手工推测问题所在

---

18. Harmonyos应用开发团队正着手优化一款面向全球市场的在线教育应用，该应用在特定课程直播环节出现了性能波动和响应延迟的问题，严重影响用户体验。打算利用DevEco Profiler来进行性能优化。DevEco Profiler其设计核心和主要优势是什么

A、DevEco Profiler主要是一个自动化修复工具，能自动检测并解决所有HarmonyOS应用的性能问题

B、DevEco Profiler专注于用户界面设计的美化，使开发者操作更为直观

C、DevEco Profiler采用Bottom-Up设计原则，从底层代码细节开始逐步构建性能模型

**D、DevEco Profiler依据Top-Down设计理念，通过高度整合的数据展示范式，提供从宏观到微观的性能数据分析，加速开发者定位和解决问题的过程**

---

19. 在一个包含多个模块（如`entry`、`feature`、`service`、`library`等）的大型Harmonyos应用项目中，如果某个模块`feature`对另外一个公共库模块`library`有依赖，如何通过`DevEcoStudio`正确配置项目依赖关系

A、在library的oh-package.json5文件的dependencies字段中配置feature的依赖

**B、在`feature`的`oh-package.json5`文件的`dependencies`字段中配置`library`的依赖**

C、在feature的build-profile.json5文件的dependencies字段中配置library的依赖

D、无需配置，直接在代码中编写importxxxfrom 'library'

---

20. 在使用DevEcoStudio的Profiler进行Harmonyos应用性能优化的流程中，以下哪个步骤最恰当地描述了开发者利用Profiler工具进行性能问题识别、定位、优化及验证的完整过程

**A、利用“Realtime Monitor”初步识别性能瓶颈，创建深度分析任务定位根因，根据分析结果优化代码，再用“RealtimeMmmor”验证优化效果**

B、首先使用“RealtimeMonitor"实时监控，观察应用资源消耗，一旦发现CPU或内存异常，直接修改代码并重新编译

C、仅通过创建深度分析任务，利用perf数据详细分析性能瓶颈，修改代码后，不需再进行验证直接发布应用

D、在发现应用性能不佳时，直接查看代码逻辑，凭经验修改后，利用Profiler的“RealtimeMonitor”确认资源消耗是否降低

---

21. 开发者在编写ArkUI代码时，想要提前预览下所编写的
21. ，下述哪个组件可以使用`DevEcoStudio Previewer`正常预览？

A、`@Preview @Component struct TitleSample{@StorageProp('title）)title: string =PlaceHolder';buildO{Text（this.title）}}`

B、`@Preview@Component structLinkSample{@Linkmessage:string;build0{Text(this.message)}}`

C、`@Preview@Component struct ConsumeSample{@Consume name:string;build0{Text(this.name)}}`

D、`import{add}fromlibnative.so';@Preview@ComponentstructNativeSample{count:number=add（1,2);build0{Text（current count is${this.count}）}}`

---

22. 下面的配置存在有几处错误

    ```json
    {
      "module": {
        "name": "entry",
        // ...
        "abilities": [
          {
            "name": "EntryAbility",
            "srcEntry": "./ets/entryability/EntryAbility.ets",
              // ...
            "skills": [
              {
                "entities": [
                  "entity.system.home"
                ],
                "actions": [
                  "action.want.action.home"
                ]
              }
            ],
            "metadata": [
              {
                "name":"ohos.entry.shortcuts",
                "resource":"$profile:shortcuts_config"
              }
            ]
          }
        ]
      }
    }
    ```

    在/resources/base/profile/目录下配置shortcuts_config·json配置文件：

    ```json
    {
      "shortcuts":[
        {
          "shortcutId":"id_test1",
          "label":"shortcutLabel",
          "icon":"$media:shortcutIcon",
          "wants": [
            {
              "bundleName":"com.ohos.hello",
              "moduleName":"entry",
              "abilityName":"EntryAbility"
            }
          ]
        }
      ]
    }
    ```

A、3

**B、1**  

C、4

D、2

---

23. want参数的entities匹配规则错误的是

**A、调用方传入的want参数的entities为空，待匹配应用组件的skills配置中的entities不为空，则entities匹配失败。**

B、调用方传入的want参数的entities为空，待匹配应用组件的skills配置中的entities为空，则entities匹配成功。

C、调用方传入的want参数的entities不为空，待匹配应用组件的skills配置中的entities为空，则entities匹配失败。

D、调用方传入的want参数的entities不为空，待匹配应用组件的skills配置中的entities不为空且包含调用方传入的want参数的entities，则entities匹配成功。

---

24. 应用开发中使用的各类资源文件，需要放入特定子目录中存储管理，以下关于资源说法错误的是

A、base目录是默认存在的目录，二级子目录element用于存放字符串、颜色、布尔值等基础元素，media、profile存放媒体、动画、布局等资源文件。

B、resfile目录，应用安装后，resfile资源会被解压到应用沙箱路径，通过Context属性resourceDir获取到resfile资源目录后，可通过文件路径访问。

**C、rawfile目录，支持创建多层子目录，子目录名称可以自定义，文件夹内可以自由放置各类资源文件。目录中的资源文件会被编译成二进制文件，并赋予资源文件ID。**

D、D.stage模型多工程情况下，共有的资源文件放到AppScope下的resources目录。

---

25. 在组件中，经常需要使用字符串、图片等资源。HSP中的组件需要使用资源时，一般将其所用资源放在HSP包内，而非放在HSP的使用方处，以符合高内聚低耦合的原则。下面访问HSP资源错误的是

A、使用相对路径的方式，访问HSP中的资源。`Image("././resources/base/media/example.png").id('example).borderRadius(48px)`

B、通过$r访问HSP中的资源。`Image（$r（app.media.example).id（example).borderRadius("48px")`

C、跨包访问HSP内资源时，推荐实现一个资源管理类，以封装对外导出的资源。将需要对外提供的资源封装为一个资源管理类：

```typescript
export class ResManager{
  staticgetPic():Resource{
    return $r('app.media.pic');
  }
  staticgetDesc():Resource{
    return $r('app.string.shared_desc');
  }
}
```

对外暴露的接口，需要在入口文件`index.ets`中声明：

```ty
//library/index.ets
export{ResManager}from'/src/main/ets/ResManager'
```

---

26. ```
    通过aa工具拉起com.example.test的EntryAbility，并传参给EntryAbility，
    具体参数是number类型的[key1,1][key2,2]和string类型的[key3,testString][key4,''],
    
    那边下面那个aa命令是正确的：（AB选项重复了）
    ```

答案：**`aa start -b com.example.test -a EntryAbility --pi key1 1 --pi key2 2 --ps key3 testString – psn key4`**

---

27.  在`UIAbility`的`onCreate`生命周期中通过`EventHub`的on注册"`event1`"和"`event2`"事件。

    ```typescript
    import{hilog}from'@kit.PerformanceAnalysisKit';
    import{UIAbility,Want,AbilityConstant} from'@kit.AbilityKit';
    
    const DOMAIN_NUMBER:number = 0xFF00;
    const TAG: string ='[EventAbility]';
    export default class EntryAbility extends UIAbility{
      onCreate(want:Want,launchParam:AbilityConstant.LaunchParam):void{
        //获取UIAbility实例的上下文
        let context  = this.context;
        //获取eventHub
        let eventhub=this.context.eventHub;
        //执行订阅操作
        eventhub.on('event1',this.eventFunc);
        eventhub.on('event2',this.eventFunc);
    
        hilog.info(DOMAIN_NUMBER,TAG,'%{public}s','AbilityonCreate');
    
      }
    
      eventFunc(argOne:Context,argTwo:Context):void{
        hilog.info(DOMAIN_NUMBER,TAG,'receive.'+`${argOne},${argTwo}`);
        return;
      }
    }
    ```

    在Ul组件的click处理事件中调用如下的`eventHubFunc`，连续点击2次该控件后，运行日志输出是什么：

    ```typescript
    import common from '@kit.AbilityKit';
    import{promptAction} from '@kit.ArkUI'
    
    @Entry
    @Component
    struct Page_EventHub {
      private context=getContext(this) as common.UIAbilityContext;
      eventHubFunc():void{
        this.context.eventHub.emit('event1');
        this.context.eventHub.emit('event2',2,'test2');
        this.context.eventHub.off('event1');
      }
      build() {
        Column(){
          // ...
          List({initialIndex:0}){
            ListItem(){
              Row(){
                // ...
              }
              .onClick(() => {
                this.eventHubFunc()
                promptAction.showToast({
                  message:$r('app.string.EventHubFuncA')
                })
              })
            }
          }
        }
      }
    }
    ```

A、

```
[Example].[Entry].[EntryAbility]receive.[]
[Example].[Entry].[EntryAbility] receive.[2,"test2"]
[Example].[Entry].[EntryAbility] receive. [2,"test2"]
```

B、

```
[Example].[Entry].[EntryAbility]receive.[]
[Example].[Entry].[EntryAbility]receive.[2,"test2"]
[Example].[Entry].[EntryAbility]receive.[]
```

C、

```
[Example].[Entry].[EntryAbility]receive.[]
[Example].[Entry].[EntryAbility] receive. [2,"test2"] 
```

D、

```
[Example].[Entry].[EntryAbility]receive.[]
[Example].[Entry].[EntryAbility]]receive.[2,"test2"]
[Example].[Entry].[EntryAbility]receive.[]
[Example].[Entry].[EntryAbility]]receive.[2,"test2"]
```

---

28. 某个应用开发了一个UIAbilityA，其启动模式是specified，并且对应的AbilityStage的实现如下：

```typescript
import AbilityStage from'@ohos.app.ability.AbilityStage';
import type Want from '@ohos.app.ability.Want';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default class MyAbilityStage extends AbilityStage{
  this.instanceIndex= 0;
  onAcceptWant(want: Want): string {
      if (want.abilityName === 'UIAbilityA'){
        if(want.parameters && want.parameters.instancekey ==='test'){
          return `test_instance_`+this.instanceIndex++;
        }else {
          return 'test_instance'
        }
      }
    return 'MyAbilityStage'
  }
}
```

```
依次调用如下方法4次启动uIAbilityA，value分别是"test”“test”“testA”“testA"，则当前运行
```

```typescript
function testSpecified(context,value){
  let want:Want = {
    deviceId:'',
    bundleName:'com.samples.stagemodelabilitydevelop',
    abilityName:'UIAbilityA',moduleName:'entry',
    parameters:{
      instanceKey : value
    }
  }
  context.startAbility(want)
    .then(()=>{
    // hilog.info(DOMAIN_NUMBER,TAG,'Succeeded in starting UIAbilityA.');
  })
    .catch((err:BusinessError) => {
      hilog.error(DOMAIN_NUMBER, TAG,`Failed to start UIAbilityA.Code is ${err.code}`)
    })
}
```

A、2个

B、1个

**C、3个**

D、4个

---

30. 应用发生崩溃，（）接口可以获取到崩溃时调用栈

A、hiLog

B、hiTraceMeter

C、hiDebug

**D、hiAppEvent**

---

31. hiAppEvent提供的watcher接口，（）属性不配置，会导致编译报错，产生"ArkTS Compiler Error"

A、onTrigger

**B、name**

C、triggerCondition

D、onReceive

---

32. 当使用状态变量进行ArkUI组件间数据通信的时候，如果两个组件间没有直接的嵌套关系（非父子和祖孙关系组件），但是他们又属于同一页面，最佳的装饰器应该选用哪个？

**A、@Provide+@Consume**

B、@State+@Link

C、LocalStorage

D、AppStorage

---

33. 关于ArkUI的ForEach和LazyForEach，下列说法错误的是？

A、LazyForEach需要配合cachedCount和组件复用一起使用，以达到性能的最优表现。

B、ForEach和LazyForEach会根据定义的键值生成规则为数据源的每个数组项生成唯一键值，并创建相应的组件。

C、长列表滚动场景，优先使用ForEach。

D、当在滚动容器中使用了LazyForEach，框架会根据滚动容器可视区域按需创建组件，当组件滑出可视区域外时，框架会进行组件销毁回收以降低内存占用。

---

34. 我们需要避免在逐帧调用的接口中执行耗时操作，下面哪个选项不属于上述的接口？

**A、aboutToReuse**

B、onAreaChange

C、onScroll

D、onTouch

---

35. 下面持续交付&持续部署描述哪个是正确的：

A、持续交付（CD，ContinuousDelivery)：指的是，频繁的将软件的新版本，交付给质量团队或者用户，以供评审。如果评审通过，代码就进入生产阶段。它强调的是，不管怎么更新，软件是随时随地可以交付的。

B、持续交付可以随时随地部署到生产环境

**C、在持续交付实践中，要考虑处理故障回滚和紧急修复，以确保系统在出现问题时能够快速恢复和修复。**

D、持续部署是将代码库中的任何更改都应该自动且快速地投入生产环境。持续部署等同于持续交付。

---

36. 在moduleA（HAP类型）中有一个图片名为image.png，在moduleB（HAR类型）也存在一个图片名为image.png，而moduleA依赖于moduleB，那么在moduleA的编译产物hap包中，image.png存在情况是：

A、两者都存在

B、仅存在moduleA的image.png

C、两者都不存在

**D、仅存在moduleB的image.png**

---

37. 某App依赖了3个ohpm库，这3个库占用的体积都比较大。在App的技术架构中，有多个hap和多个hsp均依赖这3个库，为了减少app的首包大小，以下哪些做法是无效的？

A、将这3个ohpm库封装到har包中，并对外提供必要的接口。

B、将某些特性做成按需加载模块，若这3个ohpm仅在按需加载模块里面使用，则将其打包在按需加载模块中。

C、将3个ohpm库分别封装成3个hsp，并对外提供必要的接口。

D、将3个ohpm库封装成1个hsp，并对外提供必要的接口。

---

38. 以下关于HAP（HarmonyAbilityPackage）说法正确的是（）

A、DevEcoStudio会在编译构建时，不需要对HAP进行一致性校验。

**B、应用工程如果包含多个Module，在应用市场上架时，会将多个.hap文件打包成一个.app文件。**

C、HAP是应用安装和运行的基本单位，在DevEcoStudio工程目录中，一个HAP对应一个Module。应用打包时，所有的Module都只能生成.hap文件。

D、应用工程编出的app文件中，只能包含一个hap文件。

---

39. 以下关于应用架构技术选型说法不正确的是（)

A、一些应用的扩展能力，比如备份、服务卡片，可以采用ExtensionAbility做成单独的featureHAP包，独立分发。

**B、随着业务的发展，应用功能会越来越多，某些功能可以做成动态加载，动态加载的模块采用HAR工程来构建，方便复用和共享。**

C、对于初始版本的应用，功能比较简单，可以考虑采用单HAP加上多个HAR工程构建代码工程。

D、元服务和应用可以共用一个代码工程，采用多目标产物构建方式，构建出应用和元服务两个产物，用于上架。

---

40. 关于代理提醒开发使用的接口是

A、使用startWork申请任务，使用stopWork取消任务，使用getWorkStatus获取任务状态

**B、使用publishReminder发布一个提醒类通知，使用cancelReminder取消一个指定的提醒类通知**

C、使用startBackgroundRunning申请任务，使用stopBackgroundRunning取消任务

D、使用requestSuspendDelay申请任务，使用getRemainingDelayTime获取任务剩余时间

---

## 多选题

41. 以下哪些方式可以实现ArkWeb同层渲染能力

A、

```
Web(...).enableNativeEmbedMode(true)
<object id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
```

**B、**

```
Web(...).enableNativeEmbedMode(true).registerNativeEmbedRule('object','test')
<object id="view" type="test/contents" width="100%" height="100%" style="background-color:red"/>
```

C、

```
Web(...).enableNativeEmbedMode(true).registerNativeEmbedRule('native','test')
  <object id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
```

**D、**

```
Web(...).enableNativeEmbedMode(true)
<embed id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
```

---

42. 使用ArkUI组件复用之后，还是没有显著提升列表滑动场景的性能，属于组件复用未生效可能的原因有？

A、没有在aboutToReuse更新关联的状态变量数据。

**B、在aboutToReuse回调函数中更新了冗余的状态变量**

**C、复用的自定义组件中使用if等条件染语句导致结构不相同，未使用reuseld标记。**

**D、页面嵌套了过多自定义组件。**

---

43. Navigation组件是路由导航的根视图容器，一般作为Page页面的根容器使用，以下关于Navigation组件说法正确的是（)

A、Navigation子页面的根容器可以采用如Column、Row这些容器组件。

**B、Navigation的子页面可以来自不同的Module**

C、Navigation只能在entry类型的Module中使用

**D、Navigation的页面显示模式有单页面、分栏和自适应三种显示模式**

---

44. 下面代码符合ArkTS编程规范的是

**A、**

```
if (condition) {
  console.log('success');
}
```

B、

```
for (let idx=  0 ; idx <5 ; ++idx)
  console.log(idx);
```

C、

```
let maxCount = 10,isCompleted=false;
let pointX,pointY;
pointX = 10;pointY = 0
```

**D、**

```
let maxCount = 10;
let isCompleted= false;
let pointX = 0;
let pointY = 0;
```

---

45. 下面代码符合ArkTS编程规范的是

**A、**

```
if (flag){
  // ...
}else {
  // ...
}
```

**B、**

```
function fight():void{
  console.log('Swooosh!')
}
```

**C、**

```
if (isJedi){
  fight()
}
```

**D、**

```
const arr = [1,2,3]
```

---

46. 以下代码片段哪几个函数违反了ArkTS语法规范。

```typescript
function foo1(value1?:number,value2:number){
  if (value1== undefined) {
    return value2
  }
  return value1 + value2
}
function foo2(value1:number,value2?:number){
  if (value2== undefined) {
    return value1
  }
  return value1 + value2
}

function foo3(value:number,...array:number[]){
  return value
}

function foo4(...array:number[],value:number){
  return value
}
```

A、foo2

B、foo3

**C、foo4**

**D、foo1**



---

47. 下面关于ArkTS中export用法，正确的是

**A、`export * from "ets file name"`**

**B、`export * as name from "ets file name"`**

**C、`export { export1 } from "ets file name";`**

**D、`export { export1 as alias1 } from "ets file name";`**

---

48. 下面代码符合Node-API开发规范的是

A、

```
static napi_value Demo1(napi_env env, napi_callback_info info){
  size_t argc;
  napi_value argv[10]={nullptr};
  napi_get_cb_info(env, info,&argc, argv, nullptr, nullptr);
  return nullptr;
}
```

B、

```
static napi_value Demo4(napi_env env,napi_callback_info info){
  size_t argc =5;
  napi_value argv[3]={nullptr};
  napi_get_cb_info(env, info,&argc,argv,nullptr,nullptr);
  return nullptr;
}
```

**C、**

```
static napi_value Demo3(napi_env env,napi_callback_info info){
  size_t argc =2;
  napi_value argv[2]={nullptr};
  napi_get_cb_info(env,info,&argc,nullptr，nullptr,nullptr);
  //业务代码
  // return nullptr;
}
```

**D、**

```
static napi_value Demo2(napi_env env,napi_callback_info info){
  size_t argc=0;
  napi_get_cb_info(env,info,&argc,nullptr,nullptr,nullptr);
  if （argc =θ）{
    return nullptr;
  }
  napi_value* argv = new napi_value[argc];
}
```



---

49. 以下关于ArkTS线程实例间传输实现方式描述正确的是

```typescript
import{taskpool,worker}from'@kit.ArkTS';
@Sendable
class A{}
let a:A=new A()
@Concurrent
function foo(a:A){}
let task: taskpool.Task = new taskpool.Task(foo,a)
let w = new worker.Threadworker("entry/ets/workers/Worker.ets")
taskpool.execute(task).then(() =>{});
w.postMessageWithSharedSendable(a);
task.setCloneList([a]);
taskpool.execute(task).then(()=>{});
w.postMessage(a);
```

**A、`taskpool.execute(task).then(()=>{});`，TaskPool共享传输实现方式**

B、`w.postMessage(a);`，Worker共享传输实现方式

**C、`w.postMessageWithSharedSendable(a);`，Worker共享传输实现方式**

D、

`task.setCloneList([a]);`

`taskpool.execute(task).then(()=>{});`，TaskPool共享传输实现方式

---

50. 下面关于Node-API数据类型描述正确的是

**A、napi_env:用于表示Node-API执行时的上下文**

**B、napi_status:是一个枚举数据类型，表示Node-APl接口返回的状态信息**

C、napi_threadsafe_function_call_mode：该枚举类型定义了两个常量，用于指定在何时释放线程安全函数的回调函数

D、napi_threadsafe_function_release_mode：该枚举类型定义了两个常量，用于指定线程安全函数的调用模式

---

51. 在ArkTS中，以下哪些属性的声明是正确的。

```
class  C{
  value1:number = 0;
  value2?:number = null;
  value3:number| undefined = undefined;
  value4?:number;
}
```

**A、value4**

B、value2

**C、value1**

**D、value3**

---

52. 以下哪些是可以在Navigation中使用pushPathByName接口传递的params的参数类型

**A、`arrayBuffer`**

**B、`record<string,string>`**

C、`map<string,string>`

**D、`string`**

---

53. 依次点击A、B、C、D四个按钮，其中不会触发UI刷新的是：

```typescript
@Entry
@Component
struct Index {
  @State count:number=0;
  @State @Watch('onValueChange') value:number=50;
  onValueChange() {
    this.count = this.value
  }
  build() {
    Column(){
      Text(`${this.count}`)
      Button('A')
        .onClick(() => {
          this.count = 0
        })
      Button('B')
        .onClick(() => {
          for (let i = 0; i < 1000; i++) {
            this.count = i
          }
          for (let i = 1000; i > 0; i--) {
            this.count = i
          }
          this.count--
        })
      Button('C')
        .onClick(() => {
          this.value = 100
        })
      Button('D')
        .onClick(() => {
          setInterval(() => {
            this.count++
          },1000)
        })
    }
  }
}
```

**A、B**

B、C

**C、A**

D、D

---

54. 如何实现类似下图布局

![image-20240628101242865](screenshots/tiku/image-20240628101242865.png)

A、

```
@Entry
@Component
struct Demo {
  // 忽略其他辅助代码
  dataSource: ItemDataSource = new ItemDataSource(100)
  itemHeightArray: number[] = []
  colors: number[] = [0xFFc0CB, 0xDA70D6, 0x688E23, 0x66A5ACD, 0X00FFFF, 0X00FF7f]
  scroller: Scroller = new Scroller()

  aboutToAppear(): void {
    this.getItemSizeArray()
  }

  build() {
    Scroll() {
      Column() {
        Grid() {
          GridItem() {
            Text('GoodsTypeList')
          }
          .backgroundColor(this.colors[0])

          GridItem() {
            Text('AppletService')
          }
          .backgroundColor(this.colors[1])

          GridItem() {
            Text('ReloadData')
          }
          .backgroundColor(this.colors[2])

        }
        .rowsGap(10)
        .columnsTemplate('1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .width('100%')
        .height('100%')
        .margin({
          top: 10,
          left: 5,
          bottom: 10,
          right: 5
        })

        Grid() {
          LazyForEach(this.dataSource, (item: number) => {
            GridItem() {
              //使用可复用自定义组件
              ReusableItem({ item: item })
            }
            .width('100%')
            .height(this.itemHeightArray[item%100])
            .backgroundColor(this.colors[item %5])
          }, (item:number) => '' + item + this.itemHeightArray[item % 100])
        }
        .columnsTemplate("1fr 1fr")
        .columnsGap(10)
        .rowsGap(5)
        .width('100%')
        .nestedScroll({
          scrollForward:NestedScrollMode.PARENT_FIRST,
          scrollBackward:NestedScrollMode.SELF_FIRST
        })
      }
    }
  }
}
```

**B、**

```
@Entry
@Component
struct Demo {
  // 忽略其他辅助代码
  dataSource: ItemDataSource = new ItemDataSource(100)
  itemHeightArray: number[] = []
  colors: number[] = [0xFFc0CB, 0xDA70D6, 0x688E23, 0x66A5ACD, 0X00FFFF, 0X00FF7f]
  scroller: Scroller = new Scroller()
  @State sections: WaterFlowSections = new WaterFlowSections()
  sectionMargin: Margin = {
    top: 10,
    left: 5,
    bottom: 10,
    right: 5
  }
  oneColumnSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 1,
    rowsGap: 10,
    margin: this.sectionMargin,
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100]
    }
  }
  lastSection: SectionOptions = {
    itemsCount: 97,
    crossCount: 2,
    margin: this.sectionMargin,
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100]

    }
  }

  aboutToAppear(): void {
    this.setItemSizeArray()
    //初始化瀑布流分组信息
    let sectionOptions: SectionOptions[] = []
    sectionOptions.push(this.oneColumnSection)
    sectionOptions.push(this.lastSection)
    this.sections.splice(0, 0, sectionOptions)
  }

  build() {
    WaterFlow({ scroller: this.scroller, sections: this.sections }) {
      LazyForEach(this.dataSource, (item: number) => {
        FlowItem() {
          ReusableFlowItem({item:item})
        }
        .width('100%')
        .backgroundColor(this.colors[item % 5])
      }, (item:string) => item)
    }
    .columnsGap(10)
    .rowsGap(5)
    .backgroundColor(0xfaeee0)
    .width('100%')
    .height('100%')
  }
}
```

**C、**

```
@Entry
@Component
struct Demo {
  // 忽略其他辅助代码
  dataSource: ItemDataSource = new ItemDataSource(100)
  itemHeightArray: number[] = []
  colors: number[] = [0xFFc0CB, 0xDA70D6, 0x688E23, 0x66A5ACD, 0X00FFFF, 0X00FF7f]
  scroller: Scroller = new Scroller()

  aboutToAppear(): void {
    this.getItemSizeArray()
  }

  build() {
    Scroll() {
      List({ scroller: this.scroller, space: 10 }) {
        ListItem() {
          Grid() {
            GridItem() {
              Text('GoodsTypeList')
            }.backgroundColor(this.colors[0])

            GridItem() {
              Text('AppletService')
            }.backgroundColor(this.colors[1])

            GridItem() {
              Text('ReloadData'）
            }.backgroundColor(this.colors[2])
          }
          .rowsGap(10)
          .columnsTemplate('1fr')
          .rowsTemplate('1fr 1fr 1fr')
          .width('100%')
          .height(100)
        }

        ListItem() {
          WaterFlow() {
            LazyForEach(this.dataSource, (item: number, index: number) => {
              FlowItem(){
                // ...
              }
            })
          }
          .id('waterflow')
          .columnsTemplate("1fr 1fr")
          .columnsGap(10)
          .rowsGap(5)
          .width('100%')
          .height('100%')
          .nestedScroll({
            scrollForward:NestedScrollMode.PARENT_FIRST,
            scrollBackward:NestedScrollMode.SELF_FIRST
          })
        }
      }
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
    .height('100%')
    .margin({left:10,right:10})
  }
}
```

---

55. 如下哪些方式可实现图片动态播放？

**A、**

```
@Entry
@Component
struct ImageAnimatorExample {
  @State iterations: number = 1

  build() {
    Column({ space: 10 }) {
      ImageAnimator()
        .images([
          {
            src: $r('app.media.img1')
          },
          {
            src: $r('app.media.img2')
          },
          {
            src: $r('app.media.img3')
          },
          {
            src: $r('app.media.img4')
          },
        ])
        .duration(2000)
        .fillMode(FillMode.None)
        .iterations(this.iterations)
        .width(340)
        .height(240)
        .margin({ top: 100 })
    }
    .width('100%')
    .height('100%')
  }
}
```

**B、**

```
@Entry
@Component
struct ImageExample {
  build() {
    Column({space:10}){
      Image($r('app.media.earth'))//对应资源图片名后缀为gif
        .width(100)
        .height(100)
    }
  }
}
```

**C、**

```
import { AnimatedDrawableDescriptor, AnimationOptions } from '@ohos.arkui.drawableDescriptor';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct ImageExample {
  pixelmaps: Array<PixelMap> = [];
  options: AnimationOptions = { duration: 2000, iterations: 1 };
  @State animated: AnimatedDrawableDescriptor | undefined = undefined;

  async aboutToAppear() {
    this.pixelmaps = await this.getPixelMaps();
    this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
  }

  private async getPixmapListFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: Array<image.PixelMap> = await imageSource.createPixelMapList({
      desiredPixelFormat:image.PixelMapFormat.RGBA_8888
    })
    imageSource.release()
    return createPixelMap
  }

  private async getPixelMaps() {
    let Mypixelmaps: Array<PixelMap> = await this.getPixmapListFromMedia($r('app.media.icon')) //对应资源图片名后缀为gif
    return Mypixelmaps;
  }

  build() {
    Column() {
      Row() {
        Image(this.animated).width('500px').height('280px')
      }.height('50%')

      Row() {
        Button('once').width(100).padding(5).onClick(() => {
          this.options = { duration: 2000, iterations: 1 };
          this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
        }).margin(5)
      }
    }
  }
}
```

D、

```
import { AnimationOptions, AnimatedDrawableDescriptor } from '@ohos.arkui.drawableDescriptor'

import image from '@ohos.multimedia.image'

@Entry
@Component
struct mageExampl {
  pixelmaps: Array<PixelMap> = [];
  options: AnimationOptions = { duration: 2000, iterations: 1 };
  @State animated: AnimatedDrawableDescriptor | undefined = undefined;

  async aboutToAppear() {
    this.pixelmaps = await this.getPixelMaps();
    this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
  }

  build() {
    Column() {
      Row() {
        Image(this.animated).width('500px').height('280px')
      }.height('50%')

      Row() {
        Button('once').width(100).padding(5).onClick(() => {
          this.options = { duration: 2000, iterations: 1 };
          this.animated = new AnimatedDrawableDescriptor(this.pixelmaps, this.options)
        }).margin(5)
      }.width('50%')
    }
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat:image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }
  private async getPixelMaps() {
    Mypixelmaps.push(await this.getPixmapFromMedia($r('app.media.icon'))) //对应资源图片名后缀为gif
    return Mypixelmaps;
  }
}
```

---

56. 在使用DevEcoStudio进行HarmonyoS应用开发和调试过程中，开发者小张遇到应用运行时意外终止的情况，他需要快速定位并解决导致应用崩溃的问题。以下哪些做法可以帮助小张有效分析和处理这些问题

A、查看DevEcoStudiolog工具栏输出的错误日志，根据日志提示分析应用崩溃的具体原因及代码位置

B、当怀疑问题是由于C++代码中的内存错误（如数组越界、内存泄露、重复释放内存）引起时，进入“Run/DebugConfigurations"设置界面，勾选启用AddressSanitizer(ASan)，然后重新部署应用进行测试以获取更详细的内存问题报告

C、利用系统自动生成的FaultLog，包括AppFreeze、CPPCrash、JS Crash、SystemFreeze和ASan报告，这些报告会详细记录故障发生时的环境、堆栈信息和可能的故障原因，是排查问题的重要参考

D、若遇到App运行卡顿或系统整体无响应（AppFreeze，SystemFreeze）的情况，可以通过性能分析工具中的FrameInsight和AllocationInsight功能，分析应用的资源消耗情况，寻找可能的瓶颈

---

57. 在大型软件工程中，一般会伴随着多团队开发，各团队开发自己的业务模块，最后再由集成交付团队集成到一起，下面哪些是大型应用模块化开发最佳实践

**A、若多个模块依赖了不同版本的HAR，使用OHPM的overrides机制配置指定使用哪个版本的HAR，以减少包大小。**

**B、避免用户首次下载应用耗时过长，及过多占用用户空间，不常用功能做成按需加载。**

**C、一次上架多端部署。**

**D、使用路由表进行模块间解耦。**

---

58. 一个应用通常会包含多种功能，将不同的功能特性按模块来划分和管理是一种良好的设计方式。在开发过程中，我们可以将每个功能模块作为一个独立的Module进行开发，下面关于Module的说法正确的是

**A、Library类型的Module，用于实现代码和资源的共享，有两种类型，分别为Static Library和SharedLibrary两种类型。**

B、entry类型的Module，是应用的主模块，一个应用只能包含唯一一个entry类型的HAP。

**C、feature类型的Module，应用的动态特性模块，一个应用中可以包含一个或多个feature类型的模块，也可以不包**

**D、Ability类型的Module，用于实现应用的功能和特性，有两种类型，分别为entry和feature。**

---

59. 某个应用的启动框架配置文件详细信息如下，以下说法正确的是：

```json
{
  "startupTasks": [
    {
      "name":"StartupTask_001",
      "srcEntry":"./ets/startup/StartupTask_001.ets",
      "dependencies":[
        "StartupTask_002",
        "StartupTask_003"
      ],
      "runOnThread":"taskpool",
      "waitOnMainThread":false
    },
    {
      "name":"StartupTask_002",
      "srcEntry":"./ets/startup/StartupTask_002.ets",
      "dependencies":[
        "StartupTask_004"
      ],
      "runOnThread":"taskpool",
      "waitOnMainThread":false
    },
    {
      "name":"StartupTask_003",
      "srcEntry":"./ets/startup/StartupTask_003.ets",
      "runOnThread":"taskpool",
      "waitOnMainThread":false
    },
    {
      "name":"StartupTask_004",
      "srcEntry":"./ets/startup/StartupTask_004.ets",
      "runOnThread":"taskpool",
      "waitOnMainThread":false
    },
    {
      "name":"StartupTask_005",
      "srcEntry":"./ets/startup/StartupTask_005.ets",
      "runOnThread":"mainThread",
      "waitOnMainThread":true
    },
    {
      "name":"StartupTask_006",
      "srcEntry":"./ets/startup/StartupTask_006.ets",
      "runOnThread":"mainThread",
      "waitOnMainThread":true,
      "excludeFromAutoStart":true
    }
  ],
  "configEntry":"./ets/startup/StartupConfig.ets"
}
```

**A、StartupTask_005会在主线程执行**

**B、StartupTask_006会在AbilityStage的onCreate前初始化完成**

**C、StartupTask_001会在StartupTask_004之后执行；**

D、StartupTask_003会在StartupTask_004之后执行

---

60. 在基于Stage模型开发的应用项目代码下，都存在一个app.json5配置文件，用于配置应用的全局信息，以下app.json5配置文件错误的是

A、

```
{
  "app": {
    "bundleName":"com.example.myapplication",
    "vendor":"example",
    "versionCode":1000000,
    "versionName":"1.0.2",
    "icon":"$media:app_icon",
    "label":"$string:app_name"
  }
} 
```

B、

```
{
  "app": {
    "bundleName":"com.example.myapplication",
    "vendor":"example",
    "versionCode":1000000,
    "versionName":"1.0.2",
    "icon":"$media:app_icon",
    "label":"$string:app_name",
    "bundleType":"app"
  }
}
```

**C、**

```
{
  "app": {
    "bundleName":"com.example.myapplication",
    "vendor":"example",
    "versionCode":1000000,
    "versionName":"1.0.2",
    "icon":"$media:app_icon",
    "label":"app_name",
    "bundleType":"app"
  }
}
```

**D、**

```
{
  "app": {
    "bundleName":"com.example.myapplication",
    "vendor":"example",
    "versionCode":1000000,
    "icon":"$media:app_icon",
    "label":"$string:app_name",
    "bundleType":"app"
  }
}
```
