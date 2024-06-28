
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