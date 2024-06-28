// // 通过aa工具拉起com.example.test的EntryAbility，并传参给EntryAbility，
// // 具体参数是number类型的[key1,1][key2,2]和string类型的[key3,testString][key4,''],
// //
// // 那边下面那个aa命令是正确的：
//
// // aa start -b com.example.test -a EntryAbility --pi key1 1 --pi key2 2 --ps key3 testString --psn key4
// // aa start -b com.example.test -a EntryAbility --pi key1 1 --pi key2 2 --ps key3 testString --psn key4
// // aa start -b com.example.test -a EntryAbility --pi key1 1 --pi key2 2 --ps key3 testString --ps key4
// // aa start -b com.example.test -a EntryAbility --pi key1 1 key 2 2 --ps key3 testString --psn key4
//
// // 28
// // import{hilog}from'@kit.PerformanceAnalysisKit';
// // import{UIAbility,Want,AbilityConstant} from'@kit.AbilityKit';
// //
// // const DOMAIN_NUMBER:number = 0xFF00;
// // const TAG: string ='[EventAbility]';
// // export default class EntryAbility extends UIAbility{
// //   onCreate(want:Want,launchParam:AbilityConstant.LaunchParam):void{
// //     //获取UIAbility实例的上下文
// //     let context  = this.context;
// //     //获取eventHub
// //     let eventhub=this.context.eventHub;
// //     //执行订阅操作
// //     eventhub.on('event1',this.eventFunc);
// //     eventhub.on('event2',this.eventFunc);
// //
// //     hilog.info(DOMAIN_NUMBER,TAG,'%{public}s','AbilityonCreate');
// //
// //   }
// //
// //   eventFunc(argOne:Context,argTwo:Context):void{
// //     hilog.info(DOMAIN_NUMBER,TAG,'receive.'+`${argOne},${argTwo}`);
// //     return;
// //   }
// // }
// // 2.在UI组件的click处理事件中调用如下的eventHubFunc，连续点击2次该控件后，运行日志输出是什么：
//
// import common from '@kit.AbilityKit';
// import{promptAction} from '@kit.ArkUI'
//
// @Entry
// @Component
// struct Page_EventHub {
//   private context=getContext(this) as common.UIAbilityContext;
//   eventHubFunc():void{
//     this.context.eventHub.emit('event1');
//     this.context.eventHub.emit('event2',2,'test2');
//     this.context.eventHub.off('event1');
//   }
//   build() {
//     Column(){
//       // ...
//       List({initialIndex:0}){
//         ListItem(){
//           Row(){
//             // ...
//           }
//           .onClick(() => {
//             this.eventHubFunc()
//             promptAction.showToast({
//               message:$r('app.string.EventHubFuncA')
//             })
//           })
//         }
//       }
//     }
//   }
// }