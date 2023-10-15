import { Component } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router, ParamMap } from '@angular/router';
import { DataService } from 'Services/data.service';
import { EditDataService } from 'Services/edit-data.service';
import { LoginService } from 'Services/login.service';
import { IResponsibility } from 'SharedClasses/IResponsibility';

@Component({
  selector: 'app-edit-responsibility',
  templateUrl: './edit-responsibility.component.html',
  styleUrls: ['./edit-responsibility.component.scss']
})
export class EditResponsibilityComponent {
  ResponsibilityId:any;
  Responsibility!:IResponsibility;
  ResponsibilityForm!: FormGroup;
  ErrorMessage = '';
  // json_data: any[] = [];
  UserJsonString:any
  UserJsonObj:any

  constructor(private dataService:DataService,private activatedRoute:ActivatedRoute,private loginService:LoginService,private editDataService:EditDataService,private fb: FormBuilder, private router: Router) {

  }

  ngOnInit() {
    this.activatedRoute.paramMap.subscribe((params: ParamMap) => {
      this.ResponsibilityId = params.get("id");
      console.log(this.ResponsibilityId)
    }),
    this.dataService.GetResponsibilityByID(this.ResponsibilityId).subscribe({
      next: data => {
        this.Responsibility = data.data,
        console.log('*************************************************************')
        console.log(this.Responsibility)
        console.log('###################################################')
      },
      error: (erorr: string) => this.ErrorMessage = erorr
    }),
    this.UserJsonString=JSON.stringify(this.loginService.currentUser.getValue())
    this.UserJsonObj=JSON.parse(this.UserJsonString);
    this.ResponsibilityForm = this.fb.group(
      {
        id: this.fb.control(
          this.ResponsibilityId,
          [
            Validators.required
          ]
        ),
        name: this.fb.control(
          '',
          [
            Validators.required
          ]
        ),
        isDeleted: this.fb.control(
          false,
          [
            Validators.required
          ]
        )
      }
    )
  }

  get id() {
    return this.ResponsibilityForm.get('id');
  }
  get name() {
    return this.ResponsibilityForm.get('name');
  }

  submitData() {
    console.log("///////**** this.ResponsibilityId")
    console.log(this.ResponsibilityForm.value)
    if (this.ResponsibilityForm.valid) {
      this.editDataService.EditResponsibility(this.ResponsibilityId,this.ResponsibilityForm.value).subscribe({
        next: data => {
          console.log(this.ResponsibilityForm.value)
          console.log('from service')
          console.log(data)
          this.router.navigate(['Dashboard/Responsibility']);
        },
        error: error => {
          console.log("from Error")
          console.log(error)
        }
      });
    }
    else {
      console.log("E+++++====error in : ");
      console.log(this.ResponsibilityForm);
    }
  }
}
