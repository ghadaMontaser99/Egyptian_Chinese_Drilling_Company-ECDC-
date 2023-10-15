import { Component } from '@angular/core';
import { AddNewAccidentService } from 'Services/add-new-accident.service';
import { DataService } from 'Services/data.service';
import { LoginService } from 'Services/login.service';
import { PotentialHazardService } from 'Services/potential-hazard.service';

@Component({
  selector: 'app-print-potential-hazard',
  templateUrl: './print-potential-hazard.component.html',
  styleUrls: ['./print-potential-hazard.component.scss']
})
export class PrintPotentialHazardComponent {
  PotentialHazard: any[] = [];
  ErrorMessage: string = '';
  Classification!: string;
  PotentialHazardRecord: any[] = [];
  Data: boolean = false;
  User:any;
  date!: Date;

  constructor(private loginService:LoginService,private PotentialHazardService: PotentialHazardService, private dataService: DataService) { }

  ngOnInit() {
    this.User=this.loginService.currentUser.getValue();
    this.PotentialHazardService.GetPotentialHazards(this.User.ID,this.User.Role).subscribe({
      next: data => {


        data.data.forEach((ele: any) => {
          this.PotentialHazard.push(ele.rigId)
        });
        console.log(this.PotentialHazard)
        // this.Accident = data.data;
        this.PotentialHazard = Array.from(new Set(this.PotentialHazard))
        // this.Accident = data.data
        // console.log(this.Accident)
      },
      error: error => this.ErrorMessage = error
    })
  }

 RigIdSelected(event: any) {
    console.log()
    this.PotentialHazardService.GetPotentialHazardByRigNumber(event.target.value,this.User.ID,this.User.Role).subscribe({
      next: data => {
        this.PotentialHazardRecord = data.data;
        this.Data = true;
        console.log("done");
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
