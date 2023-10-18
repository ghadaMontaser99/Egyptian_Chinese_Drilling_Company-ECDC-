import { Component } from '@angular/core';
import { LoginService } from 'Services/login.service';
import { PPEReceivingService } from 'Services/ppereceiving.service';

@Component({
  selector: 'app-print-ppereceiving',
  templateUrl: './print-ppereceiving.component.html',
  styleUrls: ['./print-ppereceiving.component.scss']
})
export class PrintPPEReceivingComponent {
  PPEReceiving: any[] = [];
  ErrorMessage: string = '';
  //  QHSECodeList: any;
  EmpCodeLists: any[]=[];
  EmpCode!:any;
  PPEReceivingRecord: any[] = [];
  Data: boolean = false;
  User:any;
  date!: Date;
  ppEs:any[]=[];


  constructor(private loginService:LoginService,private PPEReceivingService: PPEReceivingService) { }
  ngOnInit() {
    this.User=this.loginService.currentUser.getValue();
    console.log()
   

    this.PPEReceivingService.GetPPEReceivings(this.User.ID,this.User.Role).subscribe({
      next: data => {
        data.data.forEach((ele: any) => {
          this.PPEReceiving.push(ele.employeeCode)
          console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44")

          console.log(data.data)
          console.log(this.PPEReceiving)


        });
        // this.Accident = data.data;
       this.PPEReceiving = Array.from(new Set(this.PPEReceiving))
        console.log(this.PPEReceiving)
      },
      error: error => this.ErrorMessage = error
    })
  }

  EmpCodeSelected(event: any) {
    console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44")
    console.log(this.EmpCode)
    console.log(event.target.value);

    this.PPEReceivingService.GetPPEReceivingtByEmpCodeNew(this.EmpCode, this.User.ID, this.User.Role).subscribe({
      next: data => {
        this.PPEReceivingRecord = data.data as any; // Use "as any" to bypass type checking
        this.ppEs = data.data.ppEs ;
      },
      error: error => {
        this.ErrorMessage = error;
      }
    });
    

  }
 
  print(): void {
    const elements = Array.from(document.getElementsByClassName("print-section"));

    const iframe = document.body.appendChild(document.createElement("iframe"));
    iframe.style.display = "none";
    const idoc = iframe.contentDocument;

    if (idoc != null) {
      idoc.head.innerHTML = document.head.innerHTML;
      elements.forEach(element => {
        idoc.body.appendChild(element.cloneNode(true));
      });

      const pageStyles = window.getComputedStyle(document.body);

      const style = document.createElement('style');
      style.textContent = pageStyles.cssText;
      idoc.head.appendChild(style);

      const breakRule = `@media print {
    .print-section {
      page-break-before: always;
    }
  }`;

      style.textContent += breakRule;

      window.setTimeout(() => {
        iframe.contentWindow?.print();
        document.body.removeChild(iframe);
      }, 1000);
    }
  }

}
