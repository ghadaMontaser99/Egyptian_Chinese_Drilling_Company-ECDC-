import { Component } from '@angular/core';

@Component({
  selector: 'app-policy',
  templateUrl: './policy.component.html',
  styleUrls: ['./policy.component.scss']
})
export class PolicyComponent {
  policy:any[];
  constructor()
  {
    this.policy=['1- QHSE IMS Policy issue 4-2.pdf','2- ECDC CONFINED SPACE ENTRY POLICY.pdf',
  '3- ECDC Driving POLICY.pdf','4- Stop Work Authority Policy.pdf','5-Energy Isolation Policy.pdf',
'6- Environmental Policy.pdf','7- FACIAL AND HAIR POLICY.pdf','8- Ground Disturbance Policy.pdf',
'9- Health and Safety Policy.pdf','10- Lifting Policy.pdf','11- Management of change Policy.pdf',
'12- No Smoking In Non-Permitted Area Policy.pdf','13- ECDC PTW Policy.pdf','14- ECDC INTEGRITY HSE POLICY.pdf',
'15- Working at Height Policy.pdf','16- Code of Ethical Conduct Policy.pdf','17- Alcohol and Drugs Policy.pdf',
'18- Award and Disciplinary Policy.pdf'] 
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
}
