import { TaskListItemDataModel } from "../../../models"
import { router } from "@kit.ArkUI"

@Entry
@Component
export default struct TaskItemCard {

  @Prop
  taskItem:TaskListItemDataModel={}as TaskListItemDataModel

  toPickUp(){
    router.pushUrl({
      url:"pages/TaskDetail/TaskDetail",
      params:{
        id:this.taskItem.id,
      }
    })
  }

  build() {
    Column() {
     Row(){
       Text("任务编号: "+this.taskItem.transportTaskId)
         .fontSize(16)
         .fontWeight(500)
         .lineHeight(22)
         .fontColor("#2A2929")
     }
     .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
       Text("起")
         .width(22)
         .height(22)
         .backgroundColor("#2A2929")
         .fontColor("#FFFFFF")
         .borderRadius(11)
         .textAlign(TextAlign.Center)
         .fontSize(12)

        Text(this.taskItem.startAddress)
          .fontSize(14)
          .margin({left:12})
          .fontColor("#818181")
      }
      .alignItems(VerticalAlign.Center)
      .width("100%")
      .margin({top:20})

     Row(){
       Text("止")
         .width(22)
         .height(22)
         .backgroundColor("#FE6A3D")
         .fontColor("#FFFFFF")
         .borderRadius(11)
         .textAlign(TextAlign.Center)
         .fontSize(12)

       Text(this.taskItem.endAddress)
         .fontSize(14)
         .margin({left:12})
         .fontColor("#818181")
     }
     .alignItems(VerticalAlign.Center)
      .width("100%")
      .margin({top:20})

      Divider()
        .strokeWidth(1)
        .color("#EEEEEE")
        .margin({top:20,bottom:20})

      Row(){
       Column({space:5}){
         Text("提货时间")
           .fontSize(14)
           .fontColor("#818181")
         Text(this.taskItem.planDepartureTime)
           .fontColor("#2A2929")
           .fontSize(14)
       }
       .alignItems(HorizontalAlign.Start)

        Button("提货",{type:ButtonType.Capsule})
          .backgroundColor(this.taskItem.enablePickUp?"#FE6A3D":"#FADCD9")
          .fontColor("#FFFFFF")
          .fontSize(14)
          .height(32)
          .enabled(this.taskItem.enablePickUp)
          .onClick(()=>{
            AlertDialog.show({
              message:"aaa"
            })
          })
      }
     .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .backgroundColor("#FFFFFF")
    .borderRadius(10)
    .padding(20)
    .onClick(()=>{
      this.toPickUp()
    })
    .width('100%')

  }
}