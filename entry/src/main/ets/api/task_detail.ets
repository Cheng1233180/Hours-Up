import { Http } from "basic"
import { TaskDetailInfoModel } from "../models/task_detail"


export const getTaskDetailInfoApi=(jobId:string):Promise<TaskDetailInfoModel>=>{
  return Http.get<TaskDetailInfoModel>(`/tasks/details/${jobId}`)
}



