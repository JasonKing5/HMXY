// import AbilityStage from'@ohos.app.ability.AbilityStage';
// import type Want from '@ohos.app.ability.Want';
// import { hilog } from '@kit.PerformanceAnalysisKit';
// import { BusinessError } from '@kit.BasicServicesKit';
//
// export default class MyAbilityStage extends AbilityStage{
//   this.instanceIndex= 0;
//   onAcceptWant(want: Want): string {
//       if (want.abilityName === 'UIAbilityA'){
//         if(want.parameters && want.parameters.instancekey ==='test'){
//           return `test_instance_`+this.instanceIndex++;
//         }else {
//           return 'test_instance'
//         }
//       }
//     return 'MyAbilityStage'
//   }
// }
//
// // 依次调用如下方法4次启动uIAbilityA，value分别是"test”“test”“testA”“testA"，则当前运行
//
// function testSpecified(context,value){
//   let want:Want = {
//     deviceId:'',
//     bundleName:'com.samples.stagemodelabilitydevelop',
//     abilityName:'UIAbilityA',moduleName:'entry',
//     parameters:{
//       instanceKey : value
//     }
//   }
//   context.startAbility(want)
//     .then(()=>{
//     // hilog.info(DOMAIN_NUMBER,TAG,'Succeeded in starting UIAbilityA.');
//   })
//     .catch((err:BusinessError) => {
//       hilog.error(DOMAIN_NUMBER, TAG,`Failed to start UIAbilityA.Code is ${err.code}`)
//     })
// }
//
//
//
//
