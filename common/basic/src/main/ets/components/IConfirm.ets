import { CustomDialogModel } from "../models"


@CustomDialog
@Component
export  struct IConfirm {

  controller:CustomDialogController
  message:string="确定要退出登录吗"
  buttonList:CustomDialogModel[]=[
    {text: "取消"}
  ]




  build() {

    Row(){
      Column() {
        Row(){
          Text(this.message)
            .fontSize(16)
            .fontColor("#2A2929")
            .fontWeight(6)
        }
        .width("100%")
        .height(88)
        .justifyContent(FlexAlign.Center)
        .border({
          width:{bottom:1},
          color:"#EEEEEE"
        })

        Row(){
          ForEach(this.buttonList,(item:CustomDialogModel,index:number)=>{

            Text(item.text)
              .fontSize(item.fontSize||116)
              .textAlign(TextAlign.Center)
              .layoutWeight(1)
              .fontColor(item.fontColor||"#818181")
              .height("100%")
              .border({width:{
                right:this.buttonList.length>1&&index!==this.buttonList.length-1?1:0
              },
                color:"#EEEEEE"})
              .onClick(()=>{
                if (item.action) {
                  item.action()
                }
                this.controller.close()
              })

          })

        }
        .width("100%")
        .height(49)

      }
      .width('100%')
      .borderRadius(12)
      .backgroundColor("#FFFFFF")
    }
      .width("100%")
    .padding({left:25,right:25})
  }
}