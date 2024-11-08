import { IList } from "basic"
import { getTaskListApi } from "../../../api/task"
import { TaskListDataModel, TaskListItemDataModel, TaskListParamsModel, TaskTypeEnum } from "../../../models/task"
import TaskItemCard from "./TaskItemCard"

@Component
export default struct TaskList {

  @State
  taskList:TaskListItemDataModel[]=[]

  @State
  queryParams:TaskListParamsModel={
    page:1,
    pageSize:10,
    status:TaskTypeEnum.Waiting
  }

  @State
  loading:boolean=false

  @State
  finished:boolean=false

  @State
  refreshIng:boolean=false

  @State
  refreshStatus:number=RefreshStatus.Inactive

  onLoad=async (flag?:boolean)=>{

    try {
      this.loading = true
      const res:TaskListDataModel =await getTaskListApi(this.queryParams)
      if (flag) {
        this.taskList=res.items
      }else {
        this.taskList.push(...res.items)
      }

      if (this.queryParams.page >= res.pages) {
        this.finished=true
      }
      this.queryParams.page++
      this.loading=false

    }catch (e){
      console.log("error",e)
    }

  }
    onRefresh =async ()=>{
    this.queryParams.page=1
      this.finished=false
      await this.onLoad(true)
    }

    @Builder
    renderItem(item:object){
    TaskItemCard({
      taskItem:item as TaskListItemDataModel
    })

    }



  build() {
    IList({
      finishedText: "没有了",
      loadingText: "加载中123",
      dataSource: this.taskList,
      renderItem: this.renderItem,
      onLoad: this.onLoad,
      finished: this.finished,
      onRefresh: this.onRefresh,
      loading: this.loading,
      refreshIng: this.refreshIng
    })
  }
}