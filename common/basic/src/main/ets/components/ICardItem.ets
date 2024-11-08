@Component
export  struct ICardItem {

  leftText:string=""

  showRightIcon:boolean=true

  rightIcon:ResourceStr=$r("app.media.ic_btn_more")

  @Prop
  rightText:string=""

  showBottomBorder:boolean=true

  onRightClick:()=>void=()=>{

  }




  build() {
    Row(){
      Text(this.leftText)
        .fontSize(16)
        .fontWeight(400)
        .fontColor("#2A2929")

      Row(){
        if (this.rightText){
          Text(this.rightText)
            .fontColor("#818181")
            .fontSize(14)
            .fontWeight(400)
            .margin({right:5})
        }

        if (this.showRightIcon){
          Image(this.rightIcon)
            .width(24)
            .height(24)

        }

      }
      .onClick(()=>{
        this.onRightClick()
      })

    }
    .width('100%')
    .height(60)
    .border({width:{bottom:this.showBottomBorder?1:0},color:"#EEEEEE"})
    .justifyContent(FlexAlign.SpaceBetween)

  }
}