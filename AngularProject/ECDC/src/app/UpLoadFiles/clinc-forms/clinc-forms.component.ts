import { Component } from '@angular/core';
import { UploadFilesService } from 'Services/upload-files.service';
@Component({
  selector: 'app-clinc-forms',
  templateUrl: './clinc-forms.component.html',
  styleUrls: ['./clinc-forms.component.scss']
})
export class ClincFormsComponent {
  
  selectedFile!: File;
  clinc:any[];
  constructor(private UploadFilesService: UploadFilesService)
  {
    this.clinc=['8- ECDC-QHSE-FM-H008-medical report form','9- ECDC-QHSE-FM-H009-Rigs Vaccination Follow up sheet form',
  '10- ECDC-QHSE-FM-H010-Rapid Test Results form', '11- ECDC-QHSE-FM-H011-Blood pressure & Random blood sugar test form',
  '12-  ECDC-QHSE-FM-H012 - Medical Historyform','13- ECDC-QHSE-FM-H013-HR & SPO2 form','14-ECDC-QHSE-PR-13 Medical treatment log sheet'] 
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

  onSubmit() {
    
    if (this.selectedFile) {
      const formData = new FormData();
      formData.append('file', this.selectedFile, this.selectedFile.name);

      this.UploadFilesService.uploadFile(formData)
      .subscribe(
        response => {
          console.log('File uploaded successfully:', response);
        },
        error => {
          console.error('Error uploading file:', error);
        }
      );
    } 
    else {
      console.log('No file selected.');
    }
  }
}
