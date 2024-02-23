---
sidebar_position: 107
---

# 08：开发者认证题库

 > 证书其实体现不了一个人的能力
 >
 > 但是有个时候一个人的能力却需要证书来体现
 >
 > 不过呢，这种开发者认证，免费不限次数，含金量自然是不如职业认证来的有用啦
 >
 > 职业认证是需要几千块，线下考场考试的，感兴趣的自行了解。或者找帝心了解
 >
 >  
 >
 > 本文档题目会有告知选项。答案也有加粗提示。如题目处和答案加粗不吻合。以题目处为准（毕竟加粗是后面手动加粗的，可能手误）



 [开发者认证指路，点击跳转去官网考试，注意不能切屏哦](https://developer.huawei.com/consumer/cn/training/dev-certification/a617e0d3bc144624864a04edb951f6c4)

## 高级

### 1. 判断题

1. 云函数打包完成后，需要到APPGallery Connect创建对应函数的触发器才可以在端侧中调用 

错

2. 每一个自定义组件都有自己的生命周期 

对

3. 基于端云一体化开发，开发者需要精通前端，后端不同的开发语言。 

错

4. 首选项preferences是以key-value形式存储数据，其中key是可以重复。 

错

5. HarmonyOS应用可以兼容OpenHarmony生态 

对

6. 每周用一次router.pushUrl()方法，默认情况下，页面栈数量会加1，页面栈支持的最大也能数量为32。

对

7. 只要使用端云一体化的云端资源就需要支付费用 

错


8. 首选项是非关系数据库，遵循ACID特性 

错

9. 在Column和Row容器组件中，alignItems用于设置子组件在主轴方向上的对齐格式，justifyContent用于设置子组件在交叉轴方向上的对齐格式 

错

10. 所有使用@Component修饰的自定义组件都支持onPageShow ，onBackPress和onPageHide生命周期函数。 

错

---



### 2 单选题



1. 应用包名不能包含一些保留字段，以下那个字段符合规范？**选A**

**A.test**

B.harmony

C.system

D.ohos

2. 认证服务支持下列哪种账号认证 **选C**

A.微信

B.QQ

**C.华为账号**

D.支付宝



3. 关于Tad组件页签的位置设置，下列描述错误的是 **选D**

A.当barPosition为Start(默认值)，vertical属性为false时（默认值），页签位于容器顶部。

B.当barPosition为Start(默认值)，vertical属性为true，页签位于容器左部。

C.当barPosition为End，vertical属性为false时（默认值），页签位于容器底部。

**D.当barPosition为End，vertical属性为true，页签位于容器底部。**



4. 跨境迁移和协同是哪个鸿蒙特征的能力？选C

A.一次性开发多端部署

B.可分可合

**C.统一生态**

D.自由流转



5. 下列哪个组件不能包含子组件：选 D

A.Row

B.Button

C.Text

**D.LoadingProgress**



6）（）模块提供了全双工通信协议 选B

A.HTTP

**B.WebSocket**

C.Socket

D.Request



7）HUKS中文全称是什么 选B

A.加解密系统

**B.通用秘钥库系统**

C.密码管理系统

D.访问控制系统




8）发布后的鸿蒙应用可以在那里获取？选A

**A.华为应用市场**

B.华为服务中心

C.华为生态市场



9）发布开放式测试版本后，怎么追加测试用户？选A

A.直接在当前版本追加新的测试用户，然后手动发送邀请

B.需要重新发布新的测试版本追加用户




10）发布应用时需要创建Profile时，类型选择什么类型？选B

A.调试

**B.发布**




11）发布开放式测试测试版本后，还需要人工审核吗？选B

A.需要

**B.不需要**

12）发布开放式测试测试版本后，还可以再追加测试用户吗？选A

**A.可以**

B.不可以




13）自定义控件的aboutToAppear()在什么时机执行？选C

A.build函数之后

B.build函数之前

**C.页面进入之时**



14）上传鸿蒙应用或原服务软件包时，软件包的格式是什么？选B

A.zip

**B.app**

C.apk

D.hap



15）Worker线程最大同时激活数 选C

A．6

B．7

**C．8**

D．9



16）开发者在DevEco Studio中，可以通过什么方式实现端云一体化？选B

A.IDE插件

**B.工程模板**

C.命令行工具

D.可视化工具



17）@State修饰的状态数据被修改时会触发组件的（）方法进行UI界面更新？选A

**A.build方法**

B.onPageShow方法

C.aboutTpAppear方法



18）关于Video组件的回调事件，下列说法错误的是：选A

**A.onStart视频播放时触发该事件，可以在这里获取视频时长。**

B.onFinish视频播放时触发该事件。

C.onPrepared视频准备完成时触发该事件。

D.onUpdate播放进度变化时触发该事件，单位为s，更新时间间隔为250ms。




19）元服务包名必须以哪个字段结尾？选A

**A.hmsservice**

B.任意字段



20）HarmonyOS提供的WebView能力是否支持与H5双向通信？选A

**A.支持**

B.不支持



21）下面哪个方法，可以田转到一个新页面，并销毁当前页面 选B

A.router.pushUrl()

**B.router.replaceUrl()**

C.router,back()

D.router.clear()



22）创建应用时，应用包名需要和config.json文件中哪个字段保持一致？ 选C

A.package

B.name

**C.bundleName**




23）添加用户信息时，如果账号使用手机号码，一下哪种输入格式正确：选A

**A．86-1981234**

B．198****1234

C．+86198****1234

D．0086-198****1234




24）关于@State状态数据特征，下列描述错误的是：选C

A．@State装饰的变量是组件内部的状态数据，当这些状态数据被修改时，将会调用所在组件的build方法进行UI刷新。

B．标记为@State的属性是私有变量。

**C．@State变量可以不用给定初始值。**

D．子组件@Link装饰的变量可以和父组件的@State变量建立双向数据绑定。




25）端云一体化当前支持最低的鸿蒙API版本是 选C

A．6

B．7

**C．8**

D．9



26）关于UIAbility的启动模式，下列说法错误的是 选C

A．UIAbility支持单实例、多实例模式和指定实例3种启动模式，在module.json中通过launchType配置。

B．singleton为单实例模式，系统中只存在唯一一个实例，startAbility时，如果已存在，则复用系统中的唯一一个实例。

**C．mulition为多实例模式，每次startAbility都会启动一个新的实例，系统默认为mutliton为模式。**

D．specified为指定实例模式，运行时由ability内部业务决定是否创建多实例。



27）HarmonyOS提供的wevView能力是否支持H5双向通信 选A

**A．支持**

B．不支持



28）元服务创建测试用户时，用户列表存储位置需要选择 选B

A．所有站点

**B．中国**

C．俄罗斯

D．德国

E．新加坡



29）关于容器组件Row和Column，下面说法错误的是 选D

A．Column容器的主轴是垂直方向，交叉轴是水平方向；Row容器的主轴是水平方向，交叉轴是垂直方向。

B．主轴和交叉轴始终是相互垂直的，Row和Column主轴的方向不一样。

C．Column的子组件在主轴方向上的对其使用justifyContent属性来设置，其参数类型 是FlexAlign。

**D．Row的子组件在主轴方向上的对其使用aliginItems属性来设置，其参数类型 是HroizontalAlign。**




30）Row组件中有两个Text组件，如果使用justifyContent对其方式，下面哪个属性可以实现左右两端对齐。选D

A．FlexAlign.Start

B．FlexAlign.SpaceEvenly

C．FlexAlign.End

**D．FlexAlign.SpaceBetween**



31）引用ohpm三方库的包依赖时在哪个配置文件中 选C

A．package.json5

B．module.json5

**C．oh-package.json5**

D．main_pages.json




31）在下面的哪个文件中可以设置页面的路径配置信息 选A

**A．main_pages.json**

B．module.json5

C．app.json5

D．package.json5



32）开发者在DevEco Studio中，可以通过什么法师使用端云一体化？选B

A．IDE插件

**B．工程模板**

C．命令行工具

D．可视化工具



33）系列哪种组合方式不能实现子组件从父组件之间双向数据同步 选D

A．@State和@Link

B．@Provider和@Consume

C．@Observed和@ObjectLink

**D．@State@Prop**



34）开放式测试版本发布后，受邀测试用户如何体验？选B

A．进入华为应用市场，搜索待体验的元服务。

**B．进入服务中心，打开“开发者测试”开关，在最下方的“服务测试”找到待体验的元服务。**

C．进入生态市场，搜索待体验的元服务。



35）自定义组件的aboutToAppear()在什么时机执行

**B. build函数之前**



36）Webview在HarmonyOS中的入口是通过什么组件体现的

**C. Web组件**



37）下面哪个组件不能包含子组件

**D. LoadingProgress**



38）跨端迁移和协同是哪个鸿蒙特征的能力 (D)

A.一次开发多端部

B.可分可合

C.统一生态

**D.自由流转**



39）发布开放式测试版本，测试时间有限制吗? (A)

**A.有**

B.没有



40）关于Tabs组件页签的位置设置，下面描述错误的是（D）

A.当barPosition为Start（默认值），vertical属性为false时（默认值），页签位于容器顶部。

B.当barPosition为Start（默认值） ，vertical属性为true时，页签位于容器左侧。

C.当barPosition为End ，vertical属性为false（默认值）时，页签位于容器底部。

**D.当barPosition为End ，vertical属性为true时，页签位于容器底部。**



41）发布应用时要创建证书，证书类型选择什么类型? (B)

A.调试证书

**B.发布证书**

---
### 2. 多选题



1）UIAbility的启动模式有哪些 选ABC

**A.singleton**

**B.specified**

**C.multition**

D.Builder



2）Entry下的moudule.json5中包含以下哪些信息 选BCD

A.应用包名和版本信息

**B.Ability的配置信息**

**C.设备类型信息**

**D.应用权限申请列表**



3）公共实践服务为应用程序提供哪些能力？选BCD

A.取消发布公共事件

**B.订阅公共事件**

**C.发布公共事件**

**D.取消订阅公共事件**



4）下面哪些容器组件可以滚动的 选ABD

**A.Scroll**

**B.List**

C.Row

**D.Grid**

E.Column




5）以下关于ArKTS声明式开发范式的基本组成说明正确的是 选ABCDEF

**A.装饰器：用来装饰类、结构体、方法以及变量、赋予其特殊的含义，列如@Entry表示这是个入口组件。**

**B.自定义组件：可复用的UI单元，可组合其它组件**

**C.UI描述：声明式的方法来描述UI的结构，列如build()方法中的代码块。**

**D.内置组件：ArkTS中默认内置的基本组件和布局组件，开发者可以直接调用，如Column、Text、Divider**

**E.属性方法：用于组件属性的配置，统一通过属性方法进行设置，如fontSize()、width()、height()、color()**

**F.事件方法：用于添加组件对事件的响应逻辑，统一通过事件方法进行设置，如给岁在Button后边的onClick()**




6）端云一体化工程目录结构分为哪些部分 选ABC

**A.端开发工程Application**

**B.云开发工程CloudProgram**

**C.端侧公共库Extrernal Libraries**

D.公共资源库 Resource



7）一次开发多端部署的三个层次有哪些 选ABC

**A.界面级一多**

**B.功能级一多**

**C.工程级一多**

D.系统级一多



8）鸿蒙应用/原服务上架过程上传软件包常见的问题有哪些 选ABCD

**A.软件包中的发布Profies文件和当前上传软件包的应用不匹配**

**B.软件包中的发布证书与发布Profies文件中的发布证书不匹配**

**C.软件包未签名导致提示非法软件包**

**D.软件包中使用证书已经失效或者过期**




9）端云一体化已经集成以下哪些服务SDK 选ABC

**A.云函数**

**B.云数据库**

**C.云存储**

D.云托管




10）下面哪些组件层次结构是正确的 选 ABE

**A.Text>Span**

**B.Button>Column>Image**

C.Button>Image>Text

D.Image>Text>Span

**E.Column>Row>Button**




11）端云一体化的中云函数支持哪些操作 选ABCD

**A．编写函数**

**B．测试函数**

**C．打包函数**

**D．部署函数**



12）UIAbility的生命周期包括哪些函数？选ABCD

**A．onCreate**

**B．onForeground**

**C . onBackground**

**D . onDestroy**




13）下面哪些是Ability的生命周期回调函数？选ABEF

**A. onCreate**

**B. onDestroy**

C. onPageShow

D. onPageHide

**E. onForeground**

**F. onBackground**



14）自定义组件的组件化特点有哪些 选ABC

**A．可组合**

**B．可重用**

**C．配置化生命周期**

D．数据驱动更新




15）元服务包由一个或多个HAP包组成，每个HAP包不得超过（），以提供秒开体验 选B

A．2GB

**B．10MB**

C．无限制




16）元服务包每个HAP包不得超过()，以提供秒开体验。（A)

**A.2MB**

B.2GB

C.无限制



17）鸿蒙特征包含哪些场景化能力 ABC

 **A. 一次开发，多端部署**

 **B. 可分可合，自由流转**

 **C. 统一生态，原生智能**




18）entry下的module.json5中包含以下哪些信息（BCD）

 A. 应用包名和版本号信息

 **B. Ability的配置信息**

 **C. 设备类型信息**

 **D. 应用权限申请列表**



19）公共事件服务为应用程序提供哪些能力 （BCD)

 A.取消发布公共事件

 **B.订阅公共事件**

 **C.发布公共事件**

 **D.取消订阅公共事件**



20）端云一体化中的云函数支持哪些操作 （ABD)

 **A.编写函数**

 **B.测试函数**

 C.打包函数

 **D.部署函数**

---
## 开发者认证-初级

### 判断题



1.Ability是系统调度应用的最小单元，是能够完成一个独立功能的组件。一个应用可以包含一个或多个Ability。

(正确)

2.Tabs组件仅可包含子组件TabsContent，每一个页签对应一个内容视图即TabContet组件。

(正确)

3.使用http模块发起网络请求时，必须要使用on(‘headersReceive’）订阅请求头，请求才会成功。

(错误)

4.Web组件对于所有的网页都可以使用zoom(factor: number)方法进行缩放。
(错误)


5.首选项preferences是以Key-Value形式存储数据，其中Key是可以重复。

(错误)


6.每一个自定义组件都有自己的生命周期。

(正确)

7.在Column和Row容器组件中，justifyContent用于设置子组件在主轴方向上的对齐格式，alignItems用于设置子组件在交叉轴方向上的对齐格式。

(正确)

8.@CustomDialog装饰器用于装饰自定义弹窗组件，使得弹窗可以动态设置内容及样式。

(正确)

9.所有使用@Component修饰的自定义组件都支持onPageShow，onBackPress和onPageHide生命周期函数。

(错误)

10.Video组件可以支持本地视频路径和网络路径播放。播放网络视频时，需要申请权限ohos.permission.INTERNET。

(正确)

11.每调用一次router.pushUrl()方法，默认情况下，页面栈数量会加1，页面栈支持的最大页面数量为32。

(正确)

---



### 单选题



12.使用Image组件加载网络图片需要如下哪种权限？(B)

A. ohos.permission.READ_MEDIA

**B. ohos.permission.INTERNET**

C. ohos.permission.GET_NETWORK_INFO

D. ohos.permission.DISTRIBUTED_DATASYNC




13.下面哪个方法，可以跳转到一个新页面，并销毁当前页面。(B)

A. router.pushUrl()

**B. router.replaceUrl()**

C. router.back()

D. router.clear()




14.用哪一种装饰器修饰的组件可作为页面入口组件？(B)

A. @Component

**B. @Entry**

C. @Preview

D. @Builder




15.下列哪种组合方式不能实现子组件从父子组件之间双向数据同步。(D)

A. @State和@Link

B. @Provide和@Consume

C. @Observed和@ObjectLink

**D. @State和@Prop**




16.关于容器组件Row和Column，下面说法错误的是：(D)

A. Column容器的主轴是垂直方向，交叉轴是水平方向；Row容器的主轴是水平方向，交叉轴是垂直方向。

B. 主轴和交叉轴始终是相互垂直的，Row和Column主轴的方向不一样。

C. Column的子组件在主轴方向上的对齐使用justifyContent属性来设置，其参数类型是FlexAlign。

**D. Row的子组件在交叉轴方向上的对齐方式使用alignItems属性来设置，其参数类型为HorizontalAlign。**




17.首选项preferences值的存储支持哪些数据类型？(D)

A. 数字型

B. 字符型

C. 布尔型

**D. 数字型、字符型、布尔型以及这3种类型的数组类型**




18.下面哪个组件不能包含子组件：(D)

A. Row

B. Button

C. Text

**D. LoadingProgress**




19.关于@State状态数据特征，下列描述错误的是：(C)

A. @State装饰的变量是组件内部的状态数据，当这些状态数据被修改时，将会调用所在组件的build方法进行UI刷新。

B. 标记为@State的属性是私有变量，只能在组件内访问。

**C. @State变量可以不用给定初始值。**

D. 子组件@Link装饰的变量可以和父组件的@State变量建立双向数据绑定。



20.关于Resource是资源引用类型描述错误的是：(C)

A. Resource是资源引用类型，用于设置组件属性的值。

B. 通过"$r(‘app.type.name’)"的形式引用应用资源，app代表是应用内resources目录中定义的资源，type代表资源类型（或资源的存放位置）。

**C. Resource支持所有的数据类型。**

D. 系统可以根据当前配置加载合适的Resource资源，例如，开发者可以根据屏幕尺寸呈现不同的布局效果，或根据语言设置提供不同的字符串。



21.页面路由需要导入以下哪个模块？(B)

A. import prompt from ‘@ohos.prompt’

**B. import router from ‘@ohos.router’**

C. import Notification from ‘@ohos.notification’

D. import window from ‘@ohos.window’




22.Row组件中有两个Text组件，如果使用justifyContent对齐方式，下面哪个属性可以实现左右两端对齐：(D)

A. FlexAlign.Start

B. FlexAlign.SpaceEvenly

C. FlexAlign.End

**D. FlexAlign.SpaceBetween**




23.关于Web组件，下面描述错误的是：(D)

A. WebController控制器可以控制Web组件各种行为，比如forward、backward、runJavaScript等。

B. Web组件支持fileAccess、javaScriptAccess等多种属性的设置，例如 .javaScriptAccess(true)表示允许执行JavaScript脚本。

C. Web组件支持onConfirm、onConsole等多种事件，例如网页调用confirm()告警时触发onConfirm回调。

**D. 使用Web组件访问在线和离线网页都需要添加ohos.permission.INTERNET权限。**




24.下面哪一个事件方法可以获取到List滑动的偏移量(A)

**A. onScroll**

B. onScrollIndex

C. onReachStart

D. onReachEnd



25.关于UIAbility的启动模式，下列说法错误的是：(C)

A. UIAbility支持单实例、标准模式和指定实例3种启动模式，在module.json中通过launchType配置。

B. singleton为单实例模式，系统中只存在唯一一个实例，startAbility时，如果已存在，则复用系统中的唯一一个实例。

**C. standard为标准模式，每次startAbility都会启动一个新的实例，系统默认为standard模式。**

D. specified为指定实例模式，运行时由Ability内部业务决定是否创建多实例。




26.首选项key的最大长度限制大小为（）字节？(C)

A. 60

B. 70

**C. 80**

D. 90




27.发起网络数据请求需要导入以下哪个模块？(A)

**A. import http from ‘@ohos.net.http’**

B. import http from ‘@ohos.net.https’

C. import request from ‘@ohos.request’

D. import request from ‘@ohos.net.request’




28.关于Video组件的回调事件，下列说法错误的是：(A)

**A. onStart视频播放时触发该事件，可以在这里获取视频时长。**

B. onFinish视频播放结束时触发该事件。

C. onPrepared视频准备完成时触发该事件。

D. onUpdate播放进度变化时触发该事件，单位为s，更新时间间隔为250ms。




29.关于Tabs组件页签的位置设置，下面描述错误的是(D)

A. 当barPosition为Start（默认值），vertical属性为false时（默认值），页签位于容器顶部。

B. 当barPosition为Start（默认值） ，vertical属性为true时，页签位于容器左侧

C. 当barPosition为End ，vertical属性为false（默认值）时，页签位于容器底部。

**D. 当barPosition为End ，vertical属性为true时，页签位于容器底部。**



30.例如现在要实现一个广告弹窗，包含图片和文本等信息，使用下面那种弹窗可以实现(B)

A. AlertDialog

**B. @CustomDialog**

C. TextPickerDialog

D. TimePickerDialog



31.关于Button组件，下面哪个样式是胶囊型按钮：(A)

**A. ButtonType.Capsule**

B. ButtonType.Normal

C. ButtonType.Circle

D. 以上都不是




32.在下面哪个文件中可以设置页面的路径配置信息？(A)

**A. main_pages.json**

B. module.json5

C. app.json5

D. package.json

---




### 多选题

33.下面哪些容器组件是可以滚动的(A,B,C)

**A. Scroll**

**B. List**

**C. Row**

D. Grid

E. Column



34.针对包含文本元素的组件，例如Text、Button、TextInput等，可以使用下列哪些属性：(A,B,C,D,E)

**A. fontColor**

**B. fontSize**

**C. fontStyle**

**D. fontWeight**

**E. fontFamily**




35.以下关于ArkTS声明式开发范式的基本组成说明正确的是(A,B,C,D,E,F)

**A. 装饰器：用来装饰类、结构体、方法以及变量，赋予其特殊的含义，例如@Entry表示这是个入口组件。**

**B. 自定义组件：可复用的 UI 单元，可组合其它组件。**

**C. UI描述：声明式的方法来描述UI的结构，例如build()方法中的代码块。**

**D. 内置组件：ArkTS中默认内置的基本组件和布局组件，开发者可以直接调用，如Column、Text、Divider、Button等。**

**E. 属性方法：用于组件属性的配置，统一通过属性方法进行设置，如fontSize()、width()、height()、color() 等。**

**F. 事件方法：用于添加组件对事件的响应逻辑，统一通过事件方法进行设置，如跟随在Button后面的onClick()。**



36.下面哪些组件层次结构是正确的。(A,B,E)

**A. Text>Span**

**B. Button>Column>Image**

C. Button>Image>Text

D. Image>Text>Span

**E. Column>Row>Button**




37.entry下的module.json5中包含以下哪些信息：(B,C,D)

A. 应用包名和版本号信息

**B. Ability的配置信息**

**C. 设备类型信息**

**D. 应用权限申请列表**




38.关于Tabs组件和TabContent组件，下列描述正确的是(A,B,C,D)

**A. TabContent组件不支持设置通用宽度属性，其宽度等于Tabs组件的barWidth属性。**

**B. TabContent组件不支持设置通用高度属性，其高度由父组件Tabs高度与TabBar组件高度决定。**

**C. TabsController用于控制Tabs组件进行页签切换，不支持一个TabsController控制多个Tabs组件。**

**D. TabContent组件的tabBar属性支持使用@Builder构造器生成的组件。**



39.下面哪些是Ability的生命周期回调函数？(A,B,E,F)

**A. onCreate**

**B. onDestroy**

C. onPageShow

D. onPageHide

**E. onForeground**

**F. onBackground**




40.关于ForEach(arr, itemGenerator, index)组件的描述正确的是：(B,C,D)

A. ForEach中可以循环遍历逻辑代码，例如console.info(‘hello’)

**B. 第一个参数必须是数组，提供循环渲染的数据源。**

**C. 第二个参数生成子组件的lambda函数，为数据源中的每个数组项生成子组件。**

**D. 第三个参数为匿名函数，用于给定数组项生成唯一且稳定的键值。**

