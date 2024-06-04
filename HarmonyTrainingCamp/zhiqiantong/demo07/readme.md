#第六章 ArkTS网络和动画

## ArkTS网络
申请网络权限
> src/main/module.json5
```harmonydatabinding
    "requestPermissions": [
      {"name": "ohos.permission.INTERNET"}
    ]
```

## 动画
### 属性动画
> 其实就是在元素上调用属性方法animation()
```harmonydatabinding
 .animation({
          duration:2000,
          curve:Curve.Linear,
          // delay:1000
          iterations:-1,
          playMode:PlayMode.Alternate
        })
```
### 显式动画
> 其实就是在事件方法中调用全局方法animateTo()
> 
```harmonydatabinding
        .onClick(()=>{
            animateTo(
              {
                duration:2000,
                curve:Curve.LinearOutSlowIn,
                iterations:-1,
                playMode:PlayMode.Alternate,
                onFinish:()=>{
                //   当动画结束的时候，触发该回调函数
                    this.color = 'gray'
                }
              },
              ()=>{
                this.rotateAngle = -45
              }
            )
        })
```
### 转场动画
> 页面转场
> 组件内转场
> 共享元素转场
### 路径动画
> 其实就是让普通动画的效果上调用motionPath()画出来一个路路径。
```harmonydatabinding
  // 执行动画
       .motionPath({
         path:'M start.x start.y L 300 200 L 400 500 L end.x end.y',
         from:0,
         to:1,
         rotatable:true
       })
       .onClick(()=>{
          animateTo({duration:4000,curve:Curve.Linear,iterations:-1,playMode:PlayMode.Alternate}, () => {
            this.toggle = !this.toggle
          })
       })
```
