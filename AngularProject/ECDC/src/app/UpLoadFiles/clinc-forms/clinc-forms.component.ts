
import { Component } from '@angular/core';
import { GetdataByPageService } from 'Services/getdata-by-page.service';
import { LoginService } from 'Services/login.service';
import { UploadAndDownloadFilesService } from 'Services/upload-and-download-files.service';

import { BehaviorSubject } from 'rxjs';
@Component({
  selector: 'app-clinc-forms',
  templateUrl: './clinc-forms.component.html',
  styleUrls: ['./clinc-forms.component.scss']
})
export class ClincFormsComponent {
  private files = new BehaviorSubject<any[]>([]);
  readonly ClinctList = this.files.asObservable();
  clinc!:any[];
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
  constructor(private UploadFilesService: UploadAndDownloadFilesService,private getDataByPage:GetdataByPageService, private loginService:LoginService)
  {
  //   this.clinc=['8- ECDC-QHSE-FM-H008-medical report form','9- ECDC-QHSE-FM-H009-Rigs Vaccination Follow up sheet form',
  // '10- ECDC-QHSE-FM-H010-Rapid Test Results form', '11- ECDC-QHSE-FM-H011-Blood pressure & Random blood sugar test form',
  // '12-  ECDC-QHSE-FM-H012 - Medical Historyform','13- ECDC-QHSE-FM-H013-HR & SPO2 form','14-ECDC-QHSE-PR-13 Medical treatment log sheet'] 
  }
  
  downloadFile(item:string) {
    const filePath = `/assets/managment system/Forms/Medical Forms/${item}.docx`; // Replace 'your-file-name' with the actual file name and extension
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
       this.UploadFilesService.ClincUploadFiles(formData).subscribe(
          (response) => {
             console.log('File uploaded successfully');
             console.log( response);
             this.GetPaginatedClincUploadFiles(this.currentPage)
          },
          (error) => {
             console.error('Error uploading file', error);
             this.GetPaginatedClincUploadFiles(this.currentPage)
          }
       );
    }
 }


 ngOnInit(): void {
  this.User=this.loginService.currentUser.getValue();
  this.GetPaginatedClincUploadFiles(this.currentPage);

  this.loginService.isAdmin.subscribe({
    next: data => {
      this.IsAdmin=data
    }
   })
  // this.UploadFilesService.GetAllClincUploadFiles().subscribe(
  //   (response) => {
  //     this.files = response;
  //   },
  //   (error) => {
  //     console.error('Error fetching file list', error);
  //   }
  // );
}

deleteFile(fileName: string): void {
  this.UploadFilesService.DeleteClincUploadFiles(fileName)
    .subscribe(
      () => {
        console.log('File deleted successfully.');
        this.GetPaginatedClincUploadFiles(this.currentPage)
        // Update UI or perform other actions after successful deletion
      },
      error => {
        console.error('Error deleting file:', error);
        // Handle error and display appropriate message
        this.GetPaginatedClincUploadFiles(this.currentPage)
      }
    );
}


GetPaginatedClincUploadFiles(pageNumber: number): void {
  this.UploadFilesService.GetPaginatedClincUploadFiles(pageNumber)
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
  this.GetPaginatedClincUploadFiles(this.indexofPages);
  console.log("gotleft"+this.indexofPages);
}
gotoright()
{

  (this.indexofPages<this.countOfPage)?this.indexofPages+=1:this.indexofPages=this.countOfPage;
  this.GetPaginatedClincUploadFiles(this.indexofPages);
  console.log("gotoright"+this.indexofPages);
}
}
