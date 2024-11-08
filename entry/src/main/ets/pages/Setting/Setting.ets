import { ICard, ICardItem, IConfirm, INavBar, UserSettingClass } from 'basic'
import { router } from '@kit.ArkUI'


@Entry
@Component
struct Setting {

  controller:CustomDialogController =new CustomDialogController({
    builder:IConfirm({
      buttonList:[
        {
          text:"取消",
          fontColor:"#FE6A3D",
          fontSize:18,
        },
        {
          text:"确定",
          fontColor:"#FE6A3D",
          action:()=>{
            this.logout()
          },
          fontSize:18
        }
      ]
    }),
    customStyle:true
  })

  logout(){
    const  setting=new UserSettingClass(getContext())
    setting.deleteUserToken()

    router.replaceUrl({
      url:"pages/Login/Login"
    })

  }





  build() {
    Column(){
      INavBar({
        title:"系统设置"
      })
        .margin({bottom:20})

      ICard(){
        ICardItem({
          leftText:"换绑手机"
        })
        ICardItem({
          leftText:"修改密码"
        })
        ICardItem({
          leftText:"消息通知设置"
        })
        ICardItem({
          leftText:"清理缓存"
        })
      }

      Row(){

        Button("退出",{type:ButtonType.Normal})
          .width("100%")
          .backgroundColor("#FFFFFF")
          .fontColor("#2A2929")
          .height(60)
          .borderRadius(8)
          .onClick(()=>{
            this.controller.open()
          })
      }
      .width("100%")
      .padding({left:15,right:15})
      .margin({top:20})

    }
    .height('100%')
    .width('100%')
  }
}