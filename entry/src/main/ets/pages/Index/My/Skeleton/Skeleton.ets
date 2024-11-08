import { INewSkeleton } from "basic"


@Preview
@Component
export  struct Skeleton {
  build() {
    Column() {
      Row(){

        INewSkeleton({
          customWidth:"100%",
          customHeight:"100%",
          bdRadius:{
            bottomLeft:20,
            bottomRight:20
          }
        })

      }
      .width("100%")
      .height(292)

      Row(){
        INewSkeleton({
          customWidth:"100%",
          customHeight:"100%",
            bgColor:"#efefef",
          bdRadius:10
        })
      }
      .width("100%")
      .height(134)
      .padding({
        left:15,
        right:15
      })
      .margin({top:-20})

      Column({space:3})
      {
        INewSkeleton({customWidth:"100%", customHeight:50,bdRadius:8 })
        INewSkeleton({customWidth:"100%", customHeight:50,bdRadius:8 })
        INewSkeleton({customWidth:"100%", customHeight:50,bdRadius:8 })
      }
      .margin({top:20})
      .padding({left:15,right:15})


    }
    .width('100%')
    .height('100%')
    .backgroundColor("#FFFFFF")
  }
}