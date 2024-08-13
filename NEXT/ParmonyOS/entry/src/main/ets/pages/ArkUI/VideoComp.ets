/*
 * 视频组件
 * */
import { MyDivider } from '../../view/DxComp';
import TopTitle from '../../view/TopTitle';

@Entry
@Component
struct VideoComp {
  @State title: string = 'Video';
  // 视频源
  // @State videoSrc:Resource| string = $rawfile('stick.mp4')
  @State videoSrc: Resource | string =$rawfile('zhaolei.mp4')
  @State previewUri: string = '/image/dxin.jpg'
  controller: VideoController = new VideoController()
  //总时长
  @State durationTime: number = 0
  // 当前时间
  @State currentTime: number = 0
  // 是否开启循环
  @State isLoop:boolean  = true

  // 是否开启视频自带控制条
  @State isControls: boolean = true

  build() {
    Column({ space: 5 }) {
      TopTitle({ title: this.title })
      Scroll() {
        Row() {
          Button('更换视频')
            .onClick(() => {
              this.videoSrc = $rawfile('stick.mp4')
            })
          Button('开始')
            .onClick(() => {
              this.controller.start()
            })
          Button('暂停')
            .onClick(() => {
              this.controller.pause()
            })
          Button('停止')
            .onClick(() => {
              this.controller.stop()
            })
          Button('设置时间到5秒处')
            .onClick(() => {
              this.controller.setCurrentTime(5)
            })
          Button('全屏')
            .onClick(() => {
              this.controller.requestFullscreen(true)
            })
          Button('退出全屏')
            .onClick(() => {
              this.controller.exitFullscreen()
            })
          Button('reset')
            .onClick(() => {
              this.controller.reset()
            })
        }
      }
      .width('100%')
      .height(50)
      .scrollable(ScrollDirection.Horizontal)

      Row() {
        Text(JSON.stringify(this.currentTime) + 's')
        Slider({
          value: this.currentTime,
          min: 0,
          max: this.durationTime
        })
          .onChange((value: number, mode: SliderChangeMode) => {
            this.controller.setCurrentTime(value);
          }).width("90%")
        Text(JSON.stringify(this.durationTime) + 's')
      }
      .width('90%')
      MyDivider()
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        controller: this.controller
      })
        .width('100%')
        .layoutWeight(1)
        .muted(false)// 是否静音
        .controls(this.isControls)//是否显示默认控制条
        .autoPlay(true)// 是否自动播放
        .loop(this.isLoop)// 是否循环播放
        .objectFit(ImageFit.Contain)// 适配模式
        .onPrepared((event) => {
          //获取视频总时长
          this.durationTime = event.duration
        })
        .onUpdate((event) => {
          // 更新视频时间
          if (event) {
            this.currentTime = event.time
          }
        })
        .onFinish(() => {
          // 视频正经播放结束才会出发。 点击停止按钮只是视频回溯到0秒。不算播放结束
          // 如果开启了loop 则视频不会结束。也就不回触发
          console.log('dxin => video onFinish')
        })
        .onPause(() => {
          // 暂停，停止等动作
          console.log('dxin => video onPause')
        })
        .onSeeking((event) => {
          // 拖动进度条过程触发。 注意，拖动video自身进度条才触发，自定义进度条不会触发
          console.log('dxin => video onSeeking',event.time)
        })
        .onSeeked((event) => {
          // 拖动结束
          console.log('dxin => video onSeeked',event.time)
        })
        Row(){
          Button(this.isLoop ? '不循环' : '循环')
            .onClick(() => {
              this.isLoop = !this.isLoop
            })
          Button(this.isControls ? '隐藏' : '显示')
            .onClick(() => {
              this.isControls = !this.isControls
            })
        }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}