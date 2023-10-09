import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UploadAndDownloadFilesService {

  constructor(private http: HttpClient) {}

  ClincUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/ClincUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllClincUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/ClincUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  DeleteClincUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/ClincUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  GetPaginatedClincUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/ClincUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }
  DownloadClincUploadFiles(fileName: string): Observable<Blob> {
    const apiUrl = 'http://localhost:5000/api/ClincUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url, { responseType: 'blob' });
  }

  PolicyUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/PolicyUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllPolicyUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/PolicyUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  DeletePolicyUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/PolicyUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  GetPaginatedPolicyUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/PolicyUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }
  DownloadPolicyUploadFiles(fileName: string): Observable<Blob> {
    const apiUrl = 'http://localhost:5000/api/PolicyUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url, { responseType: 'blob' });
  }

  QualityUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/QualityUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllQualityUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/QualityUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  DeleteQualityUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/QualityUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  GetPaginatedQualityUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/QualityUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }

  DownloadQualityUploadFiles(fileName: string): Observable<Blob> {
    const apiUrl = 'http://localhost:5000/api/QualityUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url, { responseType: 'blob' });
  }

  QHSEFormUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/QHSEFormUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllQHSEFormUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/QHSEFormUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  GetPaginatedQHSEFormUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/QHSEFormUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }

  DeleteQHSEFormUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/QHSEFormUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  DownloadQHSEFormUploadFiles(fileName: string): Observable<Blob> {
    const apiUrl = 'http://localhost:5000/api/QHSEFormUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url, { responseType: 'blob' });
  }

  EnvironmentUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/EnvironmentUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllEnvironmentUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/EnvironmentUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  GetPaginatedEnvironmentUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/EnvironmentUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }

  DeleteEnvironmentUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/EnvironmentUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  DownloadEnvironmentUploadFiles(fileName: string): Observable<Blob> {
    const apiUrl =
      'http://localhost:5000/api/EnvironmentUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url, { responseType: 'blob' });
  }

  ProcedureHealthUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/ProcedureHealthUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllProcedureHealthUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/ProcedureHealthUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  GetPaginatedProcedureHealthUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/ProcedureHealthUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }

  DeleteProcedureHealthUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/ProcedureHealthUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  DownloadProcedureHealthUploadFiles(fileName: string): Observable<Blob> {
    const apiUrl =
      'http://localhost:5000/api/ProcedureHealthUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url, { responseType: 'blob' });
  }

  ProcedureSafetyUploadFiles(formData: FormData): Observable<any> {
    const apiUrl = `http://localhost:5000/api/ProcedureSafetyUploadFiles/upload`;

    return this.http.post(apiUrl, formData);
  }

  GetAllProcedureSafetyUploadFiles(): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/ProcedureSafetyUploadFiles/GetAllUploadFiles'; // Adjust the API URL accordingly

    return this.http.get<string[]>(apiUrl);
  }

  GetPaginatedProcedureSafetyUploadFiles(pageNumber: number): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/ProcedureSafetyUploadFiles';
    const url = `${apiUrl}?pageNumber=${pageNumber}`;
    return this.http.get(url);
  }
  DeleteProcedureSafetyUploadFiles(fileName: string): Observable<any> {
    const apiUrl = 'http://localhost:5000/api/ProcedureSafetyUploadFiles';
    const url = `${apiUrl}/${fileName}`;
    return this.http.delete(url);
  }

  DownloadProcedureSafetyUploadFiles(fileName: string): Observable<any> {
    const apiUrl =
      'http://localhost:5000/api/ProcedureSafetyUploadFiles/DownloadFile';
    const url = `${apiUrl}/${fileName}`;
    return this.http.get(url);

  }


}
