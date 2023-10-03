import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UploadFilesService {

  constructor(private http: HttpClient) { }

  uploadFile(formData: FormData):Observable<any> {
    return this.http.post(`http://localhost:5000/api/UploadFiles`, formData);
  }
}
