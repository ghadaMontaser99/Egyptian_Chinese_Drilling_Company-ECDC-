import { Component } from '@angular/core';
import { UploadAndDownloadFilesService } from 'Services/upload-and-download-files.service';

import { BehaviorSubject } from 'rxjs';
@Component({
  selector: 'app-heath',
  templateUrl: './heath.component.html',
  styleUrls: ['./heath.component.scss']
})
export class HeathComponent {
  private files = new BehaviorSubject<any[]>([]);
  readonly heathList = this.files.asObservable();
  health!:any[];
  selectedFile!: File;
  selectedFilee: File | null = null;
  fileToUpload: File|null=null;
  // files: string[] = [];

  currentPage: number = 1;
  page:number=1;
  count:number=0;
  productSize:number=5;
  indexofPages: number=1;
  countOfPage:number=0;
  TempArray:any[]=[];
  IsUser:boolean=false;
  IsRadio:boolean=false;
  IsAdmin:boolean=false;

  json_data: any[] = [];

  User:any;
  constructor(private UploadFilesService: UploadAndDownloadFilesService)

  {
//     this.health=['1.ECDC-QHSE-PR-01-Health Management Plan','2.ECDC-QHSE-PR-02-Food Hygiene Management work instruction'
//    ,'3.ECDC-QHSE-PR-03-Heat Management Plan','4.ECDC-QHSE-PR-04-Manual Handling','5.ECDC-QHSE-PR-05-PPE Procedure',
//  '6.ECDC-QHSE-PR-06-Hazardous Areas work instruction','7.ECDC-QHSE-PR-07-First Aid work instruction'] 
  }
  
  downloadFile(item:string) {
    const filePath = `/assets/managment system/Health/${item}.docx`; // Replace 'your-file-name' with the actual file name and extension
    const link = document.createElement('a');
    link.href = filePath;
    link.download = `${item}.docx`; // Replace 'your-file-name' with the actual file name and extension
    link.click();
  }


  onFileSelected(event: Event) {
    const input = event.target as HTMLInputElement;
    if (input?.files && input.files.length > 0) {
      this.selectedFile = input.files[0];
    }
  }

  

 

  onFileSelectedd(event: any): void {
    this.selectedFilee = event.target.files[0];
  }

  onUpload(): void {
    if (this.selectedFile) {
       const formData = new FormData();
       formData.append('file', this.selectedFile);
 
       // Adjust the API URL accordingly
       this.UploadFilesService.ProcedureHealthUploadFiles(formData).subscribe(
          (response) => {
             console.log('File uploaded successfully');
             console.log( response);
             this.GetPaginatedProcedureHealthUploadFiles(this.currentPage);
          },
          (error) => {
             console.error('Error uploading file', error);
             this.GetPaginatedProcedureHealthUploadFiles(this.currentPage);
          }
       );
    }
 }


 ngOnInit(): void {
  this.GetPaginatedProcedureHealthUploadFiles(this.currentPage);
  // this.UploadFilesService.GetAllProcedureHealthUploadFiles().subscribe(
  //   (response) => {
  //     this.files = response;
  //   },
  //   (error) => {
  //     console.error('Error fetching file list', error);
  //   }
  // );
}
deleteFile(fileName: string): void {
  this.UploadFilesService.DeleteProcedureHealthUploadFiles(fileName)
    .subscribe(
      () => {
        console.log('File deleted successfully.');
        this.GetPaginatedProcedureHealthUploadFiles(this.currentPage)
        // Update UI or perform other actions after successful deletion
      },
      error => {
        console.error('Error deleting file:', error);
        // Handle error and display appropriate message
        this.GetPaginatedProcedureHealthUploadFiles(this.currentPage)
      }
    );
}


GetPaginatedProcedureHealthUploadFiles(pageNumber: number): void {
  this.UploadFilesService.GetPaginatedProcedureHealthUploadFiles(pageNumber)
    .subscribe(
    {
      next: (response) => {
         console.log("pagggggggggggg")
         console.log(response.files)
        this.countOfPage=response.totalPages;
        this.TempArray= new Array(this.countOfPage);
        this.files .next( response.files);
        this.currentPage = response.currentPage;
      },
      error:err => {
        console.error('Error fetching paginated files:', err);

      }
    }
     
    );
}



gotleft()
{
  (this.indexofPages>1)?this.indexofPages-=1:this.indexofPages=1;
  this.GetPaginatedProcedureHealthUploadFiles(this.indexofPages);
  console.log("gotleft"+this.indexofPages);
}
gotoright()
{

  (this.indexofPages<this.countOfPage)?this.indexofPages+=1:this.indexofPages=this.countOfPage;
  this.GetPaginatedProcedureHealthUploadFiles(this.indexofPages);
  console.log("gotoright"+this.indexofPages);
}
}
