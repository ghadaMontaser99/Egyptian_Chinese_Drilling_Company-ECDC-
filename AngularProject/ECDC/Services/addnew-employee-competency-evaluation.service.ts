import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http';
import { IAPIResult } from 'SharedClasses/IAPIResult';
import { IEmployeeCompetencyEvaluation} from 'SharedClasses/IEmployeeCompetencyEvaluation';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class AddnewEmployeeCompetencyEvaluationService {
  //  headers = new HttpHeaders({
  //   'Content-Type': 'application/json'
  // });
  //  options = { headers: this.headers };
  constructor(private http: HttpClient) {

   }

  AddEmployeeCompetencyEvaluation(Formdata: FormData): Observable<any> {
    return this.http.post<FormData>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt`, Formdata);
  }

  // AddEmployeeCompetencyEvaluation(employeeCompetencyEvaluation: FormData): Observable<any> {
  //   return this.http.post<FormData>(`http://localhost:5000/api/Accident`, employeeCompetencyEvaluation);
  // }


  EditEmployeeCompetencyEvaluationt(employeeCompetencyEvaluation : FormData, id:number): Observable<any> {
    return this.http.put<FormData>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/${id}`, employeeCompetencyEvaluation);
  }  
////////////
  GetEmployeeCompetencyEvaluationts(userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/GetDataForExcel?UserID=${userId}&UserRole=${userRole}`);
  }
  GetEmployeeCompetencyEvaluationtByEmpCode(EmpCode:number,userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/GetDataByEmpCode/${EmpCode}?UserID=${userId}&UserRole=${userRole}`);
  }

  GetEmployeeCompetencyEvaluationtByID(Id: number,userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/${Id}?UserId=${userId}&UserRole=${userRole}`)
  }
}
