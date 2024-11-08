import TaskTabs from "./TaskTabs"

@Component
export default struct Task {
  build() {
    Column() {
      TaskTabs()
    }
    .width('100%')
    .height('100%')
  }
}