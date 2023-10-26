import { Component } from '@angular/core';
import { AddNewDrillServiceService } from 'Services/add-new-drill-service.service';
import { DataService } from 'Services/data.service';
import { LoginService } from 'Services/login.service';
import { IEmergencyResponseTeamMembers } from 'SharedClasses/IEmergencyResponseTeamMembers';

@Component({
  selector: 'app-print-drill',
  templateUrl: './print-drill.component.html',
  styleUrls: ['./print-drill.component.scss']
})
export class PrintDrillComponent {
  Drill: any[] = [];
  ErrorMessage: string = '';



  DrillType!: string;
  DrillRecord: any[] = [];
  Data: boolean = false;
  User:any;
  date!: Date;

  constructor(private loginService:LoginService,private AddNewDrill: AddNewDrillServiceService, private dataService: DataService) { }
  ngOnInit() {
    this.User=this.loginService.currentUser.getValue();
    console.log()
    this.dataService.GetDrills(this.User.ID,this.User.Role).subscribe({
      next: data => {
        data.data.forEach((ele: any) => {
          this.Drill.push(ele.drillTypeName)
          console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44")
          console.log(data.data)
          console.log(this.Drill)
        });
        // this.Accident = data.data;
       this.Drill = Array.from(new Set(this.Drill))
        console.log(this.Drill)
      },
      error: error => this.ErrorMessage = error
    })
  }

  // DrillTypeSelected(event: any) {
  //   console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$44")
  //   console.log(event.target.value);

  //   this.AddNewDrill.GetDrillByDrillType(event.target.value,this.User.ID,this.User.Role).subscribe({
  //     next: data => {
  //       console.log('',this.DrillRecord)
       
  //       this.DrillRecord = data.data;
  //       // this.Data = true;
  //     },
  //     error: error => {
  //       this.ErrorMessage = error;
  //       console.log("Error");
  //     }
  //   })

  // }

  DrillTypeSelected(event: any) {
    console.log(event.target.value)
    this.AddNewDrill.GetDrillByDrillType(event.target.value,this.User.ID,this.User.Role).subscribe({
      next: data => {
        this.DrillRecord = data.data;
        this.Data = true;
        console.log("dtoooooooo");

        console.log(this.DrillRecord[0])

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
