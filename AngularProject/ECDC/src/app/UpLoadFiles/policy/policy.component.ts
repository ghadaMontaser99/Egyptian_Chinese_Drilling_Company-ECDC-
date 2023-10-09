import { Component } from '@angular/core';
import { UploadAndDownloadFilesService } from 'Services/upload-and-download-files.service';
import { BehaviorSubject } from 'rxjs';
@Component({
  selector: 'app-policy',
  templateUrl: './policy.component.html',
  styleUrls: ['./policy.component.scss']
})
export class PolicyComponent {
  policy!:any[];
  private files = new BehaviorSubject<any[]>([]);
  readonly  policyList = this.files.asObservable();

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
//     this.policy=['1- QHSE IMS Policy issue 4-2.pdf','2- ECDC CONFINED SPACE ENTRY POLICY.pdf',
//   '3- ECDC Driving POLICY.pdf','4- Stop Work Authority Policy.pdf','5-Energy Isolation Policy.pdf',
// '6- Environmental Policy.pdf','7- FACIAL AND HAIR POLICY.pdf','8- Ground Disturbance Policy.pdf',
// '9- Health and Safety Policy.pdf','10- Lifting Policy.pdf','11- Management of change Policy.pdf',
// '12- No Smoking In Non-Permitted Area Policy.pdf','13- ECDC PTW Policy.pdf','14- ECDC INTEGRITY HSE POLICY.pdf',
// '15- Working at Height Policy.pdf','16- Code of Ethical Conduct Policy.pdf','17- Alcohol and Drugs Policy.pdf',
// '18- Award and Disciplinary Policy.pdf'] 
  }

 
  
  isPDFFile(fileName: string): boolean {
    const extension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
    console.log(extension==='pdf')
    return extension === 'pdf' ;
  }

 
 
  downloadFile(item:string) {
    if(this.isPDFFile(item)){
      const filePath = `/assets/managment system/Policies/Policies/${item}`; // Replace 'your-file-name' with the actual file name and extension
      const link = document.createElement('a');
      link.href = filePath;
      link.download = `${item}`; // Replace 'your-file-name' with the actual file name and extension
      link.click();
    }
   
   
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
       this.UploadFilesService.PolicyUploadFiles(formData).subscribe(
          (response) => {
             console.log('File uploaded successfully');
             console.log( response);
             this.GetPaginatedPolicyUploadFiles(this.currentPage);
          },
          (error) => {
             console.error('Error uploading file', error);
             this.GetPaginatedPolicyUploadFiles(this.currentPage);
          }
       );
    }
 }


 ngOnInit(): void {
  this.GetPaginatedPolicyUploadFiles(this.currentPage);
  // this.UploadFilesService.GetAllPolicyUploadFiles().subscribe(
  //   (response) => {
  //     this.files = response;
  //   },
  //   (error) => {
  //     console.error('Error fetching file list', error);
  //   }
  // );
}


deleteFile(fileName: string): void {
  this.UploadFilesService.DeletePolicyUploadFiles(fileName)
    .subscribe(
      () => {
        console.log('File deleted successfully.');
        this.GetPaginatedPolicyUploadFiles(this.currentPage)
        // Update UI or perform other actions after successful deletion
      },
      error => {
        console.error('Error deleting file:', error);
        // Handle error and display appropriate message
        this.GetPaginatedPolicyUploadFiles(this.currentPage)
      }
    );
}


GetPaginatedPolicyUploadFiles(pageNumber: number): void {
  this.UploadFilesService.GetPaginatedPolicyUploadFiles(pageNumber)
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
  this.GetPaginatedPolicyUploadFiles(this.indexofPages);
  console.log("gotleft"+this.indexofPages);
}
gotoright()
{

  (this.indexofPages<this.countOfPage)?this.indexofPages+=1:this.indexofPages=this.countOfPage;
  this.GetPaginatedPolicyUploadFiles(this.indexofPages);
  console.log("gotoright"+this.indexofPages);
}
}
