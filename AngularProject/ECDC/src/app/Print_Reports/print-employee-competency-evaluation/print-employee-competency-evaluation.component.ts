import { Component } from '@angular/core';
import { AddnewEmployeeCompetencyEvaluationService } from 'Services/addnew-employee-competency-evaluation.service';
import { DataService } from 'Services/data.service';
import { LoginService } from 'Services/login.service';

@Component({
  selector: 'app-print-employee-competency-evaluation',
  templateUrl:'./print-employee-competency-evaluation.component.html',
  styleUrls: ['./print-employee-competency-evaluation.component.scss']
})
export class PrintEmployeeCompetencyEvaluationComponent {


  EmployeeCompetencyEvaluation: any[] = [];
  ErrorMessage: string = '';
  //  QHSECodeList: any;
  EmpCodeLists: any[]=[];
  EmpCode!:any;
  EmployeeCompetencyEvaluationRecord: any[] = [];
  Data: boolean = false;
  User:any;
  date!: Date;


  constructor(private loginService:LoginService,private AddNewEmployeeCompetencyEvaluation: AddnewEmployeeCompetencyEvaluationService, private dataService: DataService) { }
  ngOnInit() {
    this.User=this.loginService.currentUser.getValue();
    console.log()
    // this.AddNewEmployeeCompetencyEvaluation.GetEmployeeCompetencyEvaluationts(this.User.ID,this.User.Role).subscribe({
    //   next: data => {
    //     console.log('',this.EmployeeCompetencyEvaluationRecord)
    //     this.EmpCodeLists = data.data;
    //     this.Data = true;
    //     console.log("done");
    //   },
    //   error: error => {
    //     this.ErrorMessage = error;
    //     console.log("Error");
    //   }
    // })

    this.dataService.GetEmployeeCompetencyEvaluationts(this.User.ID,this.User.Role).subscribe({
      next: data => {
        data.data.forEach((ele: any) => {
          this.EmployeeCompetencyEvaluation.push(ele.employeeCode)
          console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44")

          console.log(data.data)
          console.log(this.EmployeeCompetencyEvaluation)


        });
        // this.Accident = data.data;
       this.EmployeeCompetencyEvaluation = Array.from(new Set(this.EmployeeCompetencyEvaluation))
        console.log(this.EmployeeCompetencyEvaluation)
      },
      error: error => this.ErrorMessage = error
    })
  }

  EmpCodeSelected(event: any) {
    console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44")
    console.log(this.EmpCode)
    console.log(event.target.value);

    this.AddNewEmployeeCompetencyEvaluation.GetEmployeeCompetencyEvaluationtByEmpCodeNew(this.EmpCode,this.User.ID,this.User.Role).subscribe({
      next: data => {
        console.log('',this.EmployeeCompetencyEvaluationRecord)
       
        this.EmployeeCompetencyEvaluationRecord = data.data;
        // this.Data = true;
      },
      error: error => {
        this.ErrorMessage = error;
        console.log("Error");
      }
    })

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
