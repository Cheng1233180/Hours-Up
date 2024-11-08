import { Http } from "basic";
import { TaskListDataModel, TaskListParamsModel } from "../models";


export const getTaskListApi =(params:TaskListParamsModel):Promise<TaskListDataModel>=>{
	return Http.get<TaskListDataModel>("/tasks/list",params);
}







