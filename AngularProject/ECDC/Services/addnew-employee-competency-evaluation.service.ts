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

  EditEmployeeCompetencyEvaluationt(employeeCompetencyEvaluation : FormData, id:number): Observable<any> {
    return this.http.put<FormData>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/${id}`, employeeCompetencyEvaluation);
  }  

  // EditDrill(drill : FormData, id:number): Observable<any> {
  //   return this.http.put<FormData>(`http://localhost:5000/api/Drill/${id}`, drill);
  // } 
  // GetDrills(userId:string,userRole:string): Observable<IAPIResult> {
  //   return this.http.get<IAPIResult>(`http://localhost:5000/api/Drill/GetDataForExcel?UserID=${userId}&UserRole=${userRole}`);
  // }
////////////
  GetEmployeeCompetencyEvaluationts(userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/GetDataForExcel?UserID=${userId}&UserRole=${userRole}`);
  }
  GetEmployeeCompetencyEvaluationtByEmpCode(EmpCode:number,userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/GetDataByEmpCode/${EmpCode}?UserID=${userId}&UserRole=${userRole}`);
  }
  GetEmployeeCompetencyEvaluationtByEmpCodeNew(EmpCode:number,userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/GetDataByEmpCode/New/${EmpCode}?UserID=${userId}&UserRole=${userRole}`);
  }

  GetEmployeeCompetencyEvaluationtByID(Id: number,userId:string,userRole:string): Observable<IAPIResult> {
    return this.http.get<IAPIResult>(`http://localhost:5000/api/EmployeeCompetencyEvaluationt/${Id}?UserId=${userId}&UserRole=${userRole}`)
  }
  // GetDrillByID(Id: number,userId:string,userRole:string): Observable<IAPIResult> {
  //   return this.http.get<IAPIResult>(`http://localhost:5000/api/Drill/${Id}?UserId=${userId}&UserRole=${userRole}`)
  // }
}
