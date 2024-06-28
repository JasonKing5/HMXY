// @Entry
// @Component
// struct Ti {
//   build() {
//     Column({ space: 30 }) {
//       // Web(...).enableNativeEmbedMode(true)
//         // <object id="view" type="native/contents"width="100%" height="100%" style="background-color:red"/>
//       // Web(...).enableNativeEmbedMode(true).registerNativeEmbedRule('object','test')
//       // <object id="view" type="test/contents" width="100%" height="100%" style="background-color:red"/>
//
// // Web(...).enableNativeEmbedMode(true).registerNativeEmbedRule('native','test')
// //   <object id="view" type="native/contents" width="100%" height="100%" style="background-color:red"/>
//
//     }
//     .width('100%')
//     .height('100%')
//     .backgroundColor($r('app.color.theme_color'))
//     .justifyContent(FlexAlign.Center)
//   }
// }
// let condition:boolean = true
// 41 下面代码符合ArkTS编程规范的是
// if (condition) {
//   console.log('success');
// }

// for (let idx=  0 ; idx <5 ; ++idx)
//   console.log(idx);

// let maxCount = 10,isCompleted=false;
// let pointX,pointY;
// pointX = 10;pointY = 0

// let maxCount = 10;
// let isCompleted= false;
// let pointX = 0;
// let pointY = 0;

// 45
// let flag =false
// let isJedi =false
// if (flag){
//   // ...
// }else {
//   // ...
// }
//
//
// function fight():void{
//   console.log('Swooosh!')
// }
//
// if (isJedi){
//   fight()
// }
//
// const arr = [1,2,3]

// 46
// function foo1(value1?:number,value2:number){
//   if (value1== undefined) {
//     return value2
//   }
//   return value1 + value2
// }
// function foo2(value1:number,value2?:number){
//   if (value2== undefined) {
//     return value1
//   }
//   return value1 + value2
// }
//
// function foo3(value:number,...array:number[]){
//   return value
// }
//
// function foo4(...array:number[],value:number){
//   return value
// }



//48

// static napi_value Demo1(napi_env env, napi_callback_info info){
//   size_t argc;
//   napi_value argv[10]={nullptr};
//   napi_get_cb_info(env, info,&argc, argv, nullptr, nullptr);
//   return nullptr;
// }

// static napi_value Demo4(napi_env env,napi_callback_info info){
//   size_t argc =5;
//   napi_value argv[3]={nullptr};
//   napi_get_cb_info(env, info,&argc,argv,nullptr,nullptr);
//   return nullptr;
// }

// static napi_value Demo3(napi_env env,napi_callback_info info){
//   size_t argc =2;
//   napi_value argv[2]={nullptr};
//   napi_get_cb_info(env,info,&argc,nullptr，nullptr,nullptr);
//   //业务代码
//   // return nullptr;
// }
// static napi_value Demo2(napi_env env,napi_callback_info info){
//   size_t argc=0;
//   napi_get_cb_info(env,info,&argc,nullptr,nullptr,nullptr);
//   if （argc =θ）{
//     return nullptr;
//   }
//   napi_value* argv = new napi_value[argc];
// }

// 49

// import{taskpool,worker}from'@kit.ArkTS';
// @Sendable
// class A{}
// let a:A=new A()
// @Concurrent
// function foo(a:A){}
// let task: taskpool.Task = new taskpool.Task(foo,a)
// let w = new worker.Threadworker("entry/ets/workers/Worker.ets")
// taskpool.execute(task).then(() =>{});
// w.postMessageWithSharedSendable(a);
// task.setCloneList([a]);
// taskpool.execute(task).then(()=>{});
// w.postMessage(a);

// class  C{
//   value1:number = 0;
//   value2?:number = null;
//   value3:number| undefined = undefined;
//   value4?:number;
// }



