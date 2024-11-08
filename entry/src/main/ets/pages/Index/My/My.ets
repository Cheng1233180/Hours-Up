import { ICard, ICardItem } from "basic"
import { getUserInfoApi, getUserTaskInfoApi } from "../../../api"
import { UserInfoModel, UserTaskInfoModel, UserTaskInfoParamsModel } from "../../../models"
import { Skeleton } from "./Skeleton/Skeleton"
import { router } from "@kit.ArkUI"

@Component
export  struct My {

  @State
  userInfo:UserInfoModel={
    avatar:$r("app.media.ic_avatar_driver"),
    name:"",
    number:"",
    phone:""

  }as UserInfoModel

  @Consume
  @Watch("initUserInfo")
  currentName:string

  @State
  queryTaskParams:UserTaskInfoParamsModel={
    month:(new Date().getMonth()+1).toString(),
    year:new Date().getFullYear().toString()
  }

  @State
  userTaskInfo:UserTaskInfoModel={}as UserTaskInfoModel

  @State
  loading :boolean =false

  async initUserInfo(){

    this.loading=true
    await this.getUserInfo()
    await this.getUserTaskInfo()
    this.loading=false
  }



async  getUserTaskInfo(){
  try {
    this.userTaskInfo = await getUserTaskInfoApi(this.queryTaskParams)
  } catch (e) {
    console.log("error",e)
  }
}



  async getUserInfo(){

    try {
      if (this.currentName==="my") {
        this.userInfo=await getUserInfoApi()

      }
    }catch (e) {
      console.log("error: " ,e)
    }
  }



  build() {
    Column(){
      if (this.loading &&!this.userInfo.name &&!this.userTaskInfo.taskAmounts)
      {
        Skeleton()
      }else {
        Column(){
          Column() {
            Image(this.userInfo?.avatar)
              .width(67)
              .height(67)
              .borderRadius(33.5)

            Text(this.userInfo?.name)
              .fontSize(18)
              .fontWeight(600)
              .lineHeight(25)
              .margin({top:9,bottom:9})
              .fontColor("#FFFFFF")

            Text("司机编号: "+this.userInfo.number)
              .fontSize(14)
              .fontWeight(400)
              .lineHeight(20)
              .fontColor("#FFFFFF")

            Text("手机号: "+this.userInfo.phone)
              .fontSize(14)
              .fontWeight(400)
              .lineHeight(20)
              .margin({top:10})
              .fontColor("#FFFFFF")

          }
          .backgroundImage($r("app.media.bg_page_my"))
          .height(292)
          .width("100%")
          .backgroundImageSize(ImageSize.Cover)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)


          Column(){
            Text("- 本月任务 -")
              .fontSize(14)
              .fontColor("#818181")
              .lineHeight(20)

            Row(){
              Column(){
                Text("18")
                  .fontSize("#2A2929")
                  .lineHeight(25)
                  .margin({
                    bottom:17
                  })

                Text("任务总量")
                  .fontSize(12)
                  .fontColor("#2A2929")
                  .lineHeight(17)


              }
              Column(){
                Text(this.userTaskInfo.completedAmounts?.toString()||"")
                  .fontSize(18)
                  .fontColor("#2A2929")
                  .lineHeight(25)
                  .margin({bottom:17})

                Text("完成任务总量")
                  .fontSize(12)
                  .fontColor("#2A2929")
                  .lineHeight(17)

              }

              Column(){
                Text(this.userTaskInfo.transportMileage?.toString()||"")
                  .fontSize(18)
                  .fontColor("#2A2929")
                  .lineHeight(25)
                  .margin({bottom:17})

                Text("运输里程(KM)")
                  .fontSize(12)
                  .fontColor("#2A2929")
                  .lineHeight(17)
              }
            }
            .justifyContent(FlexAlign.SpaceAround)
            .width("100%")
            .layoutWeight(1)

          }
          .backgroundColor("#FFFFFF")
          .borderRadius(8)
          .margin({left:15,right:15,top:-45,bottom:15})
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({top:14,bottom:14})
          .height(134)

          ICard(){
            ICardItem({
              leftText:"车辆信息",
              onRightClick(){
                AlertDialog.show({
                  message:"123"
                })
              }
            })
            ICardItem({leftText:"任务数据"})
            ICardItem({
              leftText:"系统设置",
              onRightClick(){
                router.pushUrl({
                  url:"pages/Setting/Setting"
                })
              }
            })
          }
        }
        .width('100%')
        .height('100%')
        .backgroundColor("#F4F4F4")

      }

      }

    .width("100%")
    .height("100%")


  }
}