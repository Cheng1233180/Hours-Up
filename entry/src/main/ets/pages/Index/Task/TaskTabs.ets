import { TabClass } from "basic"
import TaskList from "./TaskList"

@Component
export default struct TaskTabs {

  @State
  tabsData:TabClass[]=[
    {
      title: "待提货",
      name: "waiting"
    },
    {
      title: "在途",
      name: "line"
    },
    {
      title: "已完成",
      name: "finish"
    }
  ]


  @State
  currentIndex:number=0
  controller:TabsController=new TabsController()

  @Builder
  getTabBar(item:TabClass,index:number){

    Column(){
      Text(item.title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.currentIndex===index?"#2A2929":"#818181")
        .margin({bottom:10})
        .animation({duration:300})

      Divider()
        .color("#FE6A3D")
        .strokeWidth(4)
        .width(this.currentIndex===index?23:0)
        .lineCap(LineCapStyle.Round)
        .animation({duration:300})

    }
    .onClick(()=>{
      this.controller.changeIndex(index)
    })



  }




  build() {
   Stack({alignContent:Alignment.Top}){
     Tabs({controller:this.controller,index:$$this.currentIndex}){
       ForEach(this.tabsData,(item:TabClass)=>{
         TabContent(){
           if (item.name==="waiting"){
              TaskList()
           }else if (item.name==="line"){

           }else if (item.name==="finish"){

           }
         }.tabBar(item.title)
       })

       }

       Row({space:30})
       {
         ForEach(this.tabsData,(item:TabClass,index:number)=>{
           this.getTabBar(item,index)
         })
       }
       .width("100%")
     .padding({left:40,right:40})
      .height(50)
     .backgroundColor("#FFFFFF")
     }


   }


}