

export interface UserTaskInfoParamsModel{

  month:string

  year:string

}

export interface UserTaskInfoModel{

  completedAmounts:number

  dailyMileage:DailyMileageModel[]

  taskAmounts:number

  transportMileage:number

}

export interface DailyMileageModel{

  dateTime?:string

  mileage?:number

}