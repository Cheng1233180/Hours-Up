import { INewSkeleton } from "basic"
import { INavBar } from "basic/src/main/ets/components/INavBar"

@Component
export default struct TaskDetailSkeleton{
  build() {
    Column() {
     INavBar({title:"任务详情",rightText:"取消任务"})
      Column(){
       INewSkeleton({
         customWidth:"100%",
         customHeight:320,
         bgColor:"#fff",
         bdRadius:10
       })
        INewSkeleton({
          customWidth:"100%",
          customHeight:50,
          bgColor:"#fff",
          bdRadius:10
        })
        INewSkeleton({
          customWidth:"100%",
          customHeight:50,
          bgColor:"#fff",
          bdRadius:10
        })
        INewSkeleton({
          customWidth:"100%",
          customHeight:50,
          bgColor:"#fff",
          bdRadius:10
        })
        INewSkeleton({
          customWidth:"100%",
          customHeight:50,
          bgColor:"#fff",
          bdRadius:10
        })


      }
      .padding(20)
      .layoutWeight(1)
      INewSkeleton({
        customWidth:"100%",
        customHeight:60,
        bgColor:"#fff",
      })




    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F4F4F4")
  }

}



