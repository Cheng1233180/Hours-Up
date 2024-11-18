import { ImageListModel } from "../models";
import { fileIo } from "@kit.CoreFileKit";


export const SaveLocalFile=(dataSource:ImageListModel[])=>{

  const saveDir =getContext().filesDir

  dataSource.forEach((item:ImageListModel)=>{

    const imageName=Date.now()+".jpg"

    const file=fileIo.openSync(item.url,fileIo.OpenMode.READ_ONLY)

    fileIo.copyFileSync(file.fd,saveDir+"/"+imageName)

    fileIo.closeSync(file.fd)

  })


}