import { Component } from '@angular/core';
import { DataService } from 'Services/data.service';
import { IRig } from 'SharedClasses/IRig';
import { Chart, registerables } from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { LoginService } from 'Services/login.service';
import { PotentialHazardService } from 'Services/potential-hazard.service';
import { RouterTestingHarness } from '@angular/router/testing';
Chart.register(ChartDataLabels);
Chart.register(...registerables);

@Component({
  selector: 'app-potential-hazard-charts',
  templateUrl: './potential-hazard-charts.component.html',
  styleUrls: ['./potential-hazard-charts.component.scss']
})
export class PotentialHazardChartsComponent {
  

  clearChart(ID_Name:string) {
    const myElement = document.querySelector('#'+ ID_Name) as HTMLElement;
    myElement.remove();
    this.Status = [];
    this.pushingListCounthing=[]
    this.Open = [];
    //this.OpenCount= 0;
    this. Closed = [];
    //this. ClosedCount= 0;
    this. PotentialList=[];
    this. pushingList=[];
    //this. pushingListCounthing=[];
    //this.RigNames=[];
    this.Colors=[];
    this.ColorsBackground=[];
    
  }

  AddCanvas(ID_Name:string,DIV_Name:string) {
    // Create a new element
    var newElement = document.createElement('canvas');
    newElement.id=ID_Name

    // Get the parent element where you want to append the new element
    const myElement = document.querySelector('#'+DIV_Name) as HTMLElement;

    // Append the new element to the parent element
    myElement.appendChild(newElement);
  }

  temp: boolean = false;
  ColorsBackground:any[]=[]

  Rigs:any[]=[];
  Status: string[] = [];
  Open: any[] = [];
  OpenCount: number = 0;
  Closed: any[] = [];
  ClosedCount: number = 0;
  PotentialList:any[]=[];
  pushingList:any[][] = []//any[]=[];
  pushingListCounthing:any[]=[];
  User:any;
  RigNames:string[]=[];
 Colors:string[]=[];
 test:string[]=['vvvv','fff','dddd']
 Year:any[]=[];
 YearsList:any[]=[];
  constructor(private dataService: DataService,private potentialHazardService: PotentialHazardService,private loginService:LoginService) { }

  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.
    this.User=this.loginService.currentUser.getValue();
    this.Status=['Open','Closed']
    this.dataService.GetRig().subscribe({
      next:data=>{
        this.Rigs=data.data;
        this.Rigs.forEach(element => {
         // var name= 'Rig-'+element.number
          this.RigNames.push('Rig-'+element.number)
          
        });
        console.log('this.RigNames')
          console.log(this.RigNames)
      }
    })
    this.potentialHazardService.GetPotentialHazards(this.User.ID,this.User.Role).subscribe({
      next:data=>{
        data.data.forEach((ele: any) => {
          this.Year.push(ele.date)
        });
        console.log('this.Year')
        console.log(this.Year)
        this.Year.forEach((ele: any) => {
          const dateObject = new Date(ele);
          const year = dateObject.getFullYear();
          this.YearsList.push(year)
          this.YearsList= Array.from(new Set(this.YearsList))

        });
        console.log('year formmaaaaaaaaate')
        console.log(this.YearsList)
        
       
      }
    })
    
  }


  onChange(event: any) {
    console.log("event")
    console.log(event)
    const myComboBox = document.getElementById('month') as HTMLSelectElement;
    const selectedOption = myComboBox.options[myComboBox.selectedIndex];
    const selectedText = selectedOption.text;
    this.temp = true;
    console.log('selectedOption')
    console.log(selectedOption)
    console.log('selectedText')
    console.log(selectedText)
    console.log('event.target.value')
    console.log(event.target.value)
    


   
    this.potentialHazardService.GetForAnalysis(event.target.value,this.User.ID,this.User.Role).subscribe({
      next: data => {
        this.clearChart("myChart")
        this.PotentialList=data.data
       
       

        console.log(data.data)
       
      
        
       


    // for (var i = 0; i < this.PotentialList.length; i++) {
    //   // Initialize pushingList[i] as an empty array
    //   this.pushingList[i] = [];
    
    //   for (var j = 0; j < this.Rigs.length; j++) {
    //     if (this.PotentialList[i].rigId == this.Rigs[j].id) {
    //       this.pushingList[i].push(this.PotentialList[i]);
    //     }
    //   }
    // }

   // Initialize pushingList as an empty 2D array

for (var i = 0; i < this.PotentialList.length; i++) {
  // Check if this item has been added to any row
  let added = false;

  for (var j = 0; j < this.pushingList.length; j++) {
    const row = this.pushingList[j];

    // Check if the item's rigId matches any item in the current row
    if (row.some(item => item.rigId === this.PotentialList[i].rigId)) {
      row.push(this.PotentialList[i]);
      added = true;
      break;
    }
  }

  // If the item wasn't added to any existing row, create a new row
  if (!added) {
    this.pushingList.push([this.PotentialList[i]]);
  }
}

    
    console.log('this.pushingList')
    console.log(this.PotentialList)
    console.log(this.pushingList)
    console.log(this.Rigs)
    



 this.pushingListCounthing = new Array(this.Rigs.length).fill(0);
 for (var i = 0; i < this.Rigs.length; i++){
  for (var j = 0; j < this.pushingList.length; j++) {
    let foundMatchInRow = false; // Flag to check if a match is found in the row
  
    for (var k = 0; k < this.pushingList[j].length; k++) {
    
        if (this.Rigs[i].id === this.pushingList[j][k].rigId) {
          foundMatchInRow = true;
          break; // Exit the inner loop once a match is found
        }
      
    }
  
    // If a match is found in the row, update the count in the result array
    if (foundMatchInRow) {
      this.pushingListCounthing[i] = this.pushingList[j].length;
    }
  }
 }

    
    
    console.log('this.pushingListCounthing')
    console.log(this.pushingListCounthing)

    for (let i = 0; i < this.pushingListCounthing.length; i++) {
      const red = Math.floor(Math.random() * 256);
      const green = Math.floor(Math.random() * 200);
      const blue = Math.floor(Math.random() * 256);
      const colorString = `rgba(${red}, ${green}, ${blue}, 1)`;
      const colorStringbackground = `rgba(${red}, ${green}, ${blue}, 0.2)`;
      this.ColorsBackground.push(colorStringbackground);
      this.Colors.push(colorString);
    }
        // data.data.forEach((element: { : string; }) => {
        //   if (element == 'Unsafe Act') {
        //     this.UnsafeAct.push(element)
        //   }
        //   else if (element.classification == 'Positive Remark') {
        //     this.PositiveRemark.push(element)
        //   }
        //   else if (element.classification == 'Unsafe Condition') {
        //     this.UnsafeCondition.push(element)
        //   }
        //   else {
        //     this.Other.push(element)
        //   }
        // });
        // this.UnsafeActCount = this.UnsafeAct.length
        // this.UnsafeConditionCount = this.UnsafeCondition.length
        // this.PositiveRemarkCount = this.PositiveRemark.length
        // this.OtherCount = this.Other.length


        this.AddCanvas("myChart","chart1")

        var myChart = new Chart("myChart", {
          type: 'bar',
          data: {
            labels: this.RigNames,
            datasets: [{
              label: selectedText,
              data: this.pushingListCounthing,
              backgroundColor: this.ColorsBackground
              // [
              //   'rgba(255, 99, 132, 0.2)',
              //   'rgba(54, 162, 235, 0.2)',
              //   'rgba(255, 206, 86, 0.2)',
              //   'rgba(75, 192, 192, 0.2)'
              // ]
              ,
              borderColor: this.Colors
              // [
              //   'rgba(255, 99, 132, 1)',
              //   'rgba(54, 162, 235, 1)',
              //   'rgba(255, 206, 86, 1)',
              //   'rgba(75, 192, 192, 1)'
              // ]
              ,
              borderWidth: 1,
              datalabels: {
                color:this.Colors
                //  [
                //   'rgba(255, 99, 132, 1)',
                //   'rgba(54, 162, 235, 1)',
                //   'rgba(255, 206, 86, 1)',
                //   'rgba(75, 192, 192, 1)'
                // ]
                ,
                font: {
                  size: 18,
                }
              }
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
      }
    });

    // this.dataService.GetStopCardsByMonth(event.target.value,this.User.ID,this.User.Role).subscribe({
    //   next: data => {
    //     console.log(data.data)
    //     this.clearChart("myChart2")

    //     data.data.forEach((element: { typeOfObservationCategory: string; }) => {
    //       if (element.typeOfObservationCategory == 'Bypassing Safety Controls') {
    //         this.BypassingSafetyControls.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Driving') {
    //         this.Driving.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Energy Isolation') {
    //         this.EnergyIsolation.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Hot Work') {
    //         this.HotWork.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Line of Fire') {
    //         this.LineofFire.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Safe Mechanical Lifting') {
    //         this.SafeMechanicalLifting.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Work Authorization') {
    //         this.WorkAuthorization.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Working at Height') {
    //         this.WorkingatHeight.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'PPE') {
    //         this.PPE.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Housekeeping') {
    //         this.Housekeeping.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Environmental') {
    //         this.Environmental.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Health Care') {
    //         this.HealthCare.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Safety Protection System') {
    //         this.SafetyProtectionSystem.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'HSE IMS') {
    //         this.HSEIMS.push(element)
    //       }
    //       else if (element.typeOfObservationCategory == 'Equipment') {
    //         this.Equipment.push(element)
    //       }
    //       else {
    //         this.OtherCategory.push(element)
    //       }
    //     });

    //     this.BypassingSafetyControlsCount = this.BypassingSafetyControls.length
    //     this.DrivingCount = this.Driving.length
    //     this.EnergyIsolationCount = this.EnergyIsolation.length
    //     this.HotWorkCount = this.HotWork.length
    //     this.LineofFireCount = this.LineofFire.length
    //     this.SafeMechanicalLiftingCount = this.SafeMechanicalLifting.length
    //     this.WorkAuthorizationCount = this.WorkAuthorization.length
    //     this.WorkingatHeightCount = this.WorkingatHeight.length
    //     this.PPECount = this.PPE.length
    //     this.HousekeepingCount = this.Housekeeping.length
    //     this.EnvironmentalCount = this.Environmental.length
    //     this.HealthCareCount = this.HealthCare.length
    //     this.SafetyProtectionSystemCount = this.SafetyProtectionSystem.length
    //     this.HSEIMSCount = this.HSEIMS.length
    //     this.EquipmentCount = this.Equipment.length
    //     this.OtherCategoryCount = this.OtherCategory.length

    //     this.AddCanvas("myChart2","chart2")

    //     var myChart2 = new Chart("myChart2", {
    //       type: 'bar',
    //       data: {
    //         labels: this.categories,
    //         datasets: [{
    //           label: selectedText,
    //           data: [
    //             this.BypassingSafetyControlsCount,
    //             this.DrivingCount,
    //             this.EnergyIsolationCount,
    //             this.HotWorkCount,
    //             this.LineofFireCount,
    //             this.SafeMechanicalLiftingCount,
    //             this.WorkAuthorizationCount,
    //             this.WorkingatHeightCount,
    //             this.PPECount,
    //             this.HousekeepingCount,
    //             this.EnvironmentalCount,
    //             this.HealthCareCount,
    //             this.SafetyProtectionSystemCount,
    //             this.HSEIMSCount,
    //             this.EquipmentCount,
    //             this.OtherCategoryCount
    //           ],
    //           backgroundColor: [
    //             'rgba(255, 99, 132, 0.2)',
    //             'rgba(54, 162, 235, 0.2)',
    //             'rgba(255, 206, 86, 0.2)',
    //             'rgba(75, 192, 192, 0.2)',
    //             'rgba(255, 99, 237, 0.2)',
    //             'rgba(166, 99, 255, 0.2)',
    //             'rgba(99, 240, 255, 0.2)',
    //             'rgba(255, 202, 99, 0.2)',
    //             'rgba(166, 255, 99, 0.2)',
    //             'rgba(57, 9, 140, 0.2)',
    //             'rgba(10, 140, 9, 0.2)',
    //             'rgba(140, 84, 9, 0.2)',
    //             'rgba(158, 10, 147, 0.2)',
    //             'rgba(47, 4, 43, 0.2)',
    //             'rgba(12, 16, 151, 0.2)',
    //             'rgba(12, 151, 132, 0.2)'
    //           ],
    //           borderColor: [
    //             'rgba(255, 99, 132, 1)',
    //             'rgba(54, 162, 235, 1)',
    //             'rgba(255, 206, 86, 1)',
    //             'rgba(75, 192, 192, 1)',
    //             'rgba(255, 99, 237, 1)',
    //             'rgba(166, 99, 255, 1)',
    //             'rgba(99, 240, 255, 1)',
    //             'rgba(255, 202, 99, 1)',
    //             'rgba(166, 255, 99, 1)',
    //             'rgba(57, 9, 140, 1)',
    //             'rgba(10, 140, 9, 1)',
    //             'rgba(140, 84, 9, 1)',
    //             'rgba(158, 10, 147, 1)',
    //             'rgba(47, 4, 43, 1)',
    //             'rgba(12, 16, 151, 1)',
    //             'rgba(12, 151, 132, 1)'
    //           ],
    //           borderWidth: 1,
    //           datalabels: {
    //             color: [
    //               'rgba(255, 99, 132, 1)',
    //               'rgba(54, 162, 235, 1)',
    //               'rgba(255, 206, 86, 1)',
    //               'rgba(75, 192, 192, 1)',
    //               'rgba(255, 99, 237, 1)',
    //               'rgba(166, 99, 255, 1)',
    //               'rgba(99, 240, 255, 1)',
    //               'rgba(255, 202, 99, 1)',
    //               'rgba(166, 255, 99, 1)',
    //               'rgba(57, 9, 140, 1)',
    //               'rgba(10, 140, 9, 1)',
    //               'rgba(140, 84, 9, 1)',
    //               'rgba(158, 10, 147, 1)',
    //               'rgba(47, 4, 43, 1)',
    //               'rgba(12, 16, 151, 1)',
    //               'rgba(12, 151, 132, 1)'
    //             ],
    //             font: {
    //               size: 14,
    //             }
    //           }
    //         }]
    //       },
    //       options: {
    //         scales: {
    //           y: {
    //             beginAtZero: true
    //           }
    //         }
    //       }
    //     });

    //     myChart2.update();

    //   }
    // });
    // this.dataService.GetStopCardsByMonth(event.target.value,this.User.ID,this.User.Role).subscribe({
    //   next: data => {
    //     console.log(data.data)
    //     this.clearChart("myChart3")

    //     data.data.forEach((element: { stopWorkAuthorityApplied: string; }) => {
    //       if (element.stopWorkAuthorityApplied == 'Yes') {
    //         this.SWA_yes.push(element)
    //       }
    //       else if (element.stopWorkAuthorityApplied == 'No') {
    //         this.SWA_no.push(element)
    //       }
    //     });
    //     this.SWA_yesCount = this.SWA_yes.length
    //     this.SWA_noCount = this.SWA_no.length

    //     console.log("this.SWA_yesCount")
    //     console.log(this.SWA_yesCount)
    //     console.log("this.SWA_noCount")
    //     console.log(this.SWA_noCount)

    //     this.AddCanvas("myChart3","chart3")

    //     var myChart3 = new Chart("myChart3", {
    //       type: 'bar',
    //       data: {
    //         labels: ["Yes", "No"],
    //         datasets: [{
    //           label: selectedText,
    //           data: [this.SWA_yesCount, this.SWA_noCount],
    //           backgroundColor: [
    //             'rgba(255, 99, 132, 0.2)',
    //             'rgba(54, 162, 235, 0.2)',
    //           ],
    //           borderColor: [
    //             'rgba(255, 99, 132, 1)',
    //             'rgba(54, 162, 235, 1)',
    //           ],
    //           borderWidth: 1,
    //           datalabels: {
    //             color: [
    //               'rgba(255, 99, 132, 1)',
    //               'rgba(54, 162, 235, 1)',
    //             ],
    //             font: {
    //               size: 18,
    //             }
    //           }
    //         }]
    //       },
    //       options: {
    //         scales: {
    //           y: {
    //             beginAtZero: true
    //           }
    //         }
    //       }
    //     });

    //     myChart3.update();

    //   }
    // });

  }
}
