import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Ng2SearchPipeModule } from 'ng2-search-filter';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AccidentFormComponent } from './Reports/accident-form/accident-form.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS ,HttpClient} from '@angular/common/http';
import { NavbarComponent } from './Other_Components/navbar/navbar.component';
import { FooterComponent } from './Other_Components/footer/footer.component';
import { SidebarComponent } from './Other_Components/sidebar/sidebar.component';
import { HomeComponent } from './Other_Components/home/home.component';
import { PageNotFoundComponent } from './Other_Components/page-not-found/page-not-found.component';
import { StopcardComponent } from './Reports/stopcard/stopcard.component';
import { ReportAccidentComponent } from './Print_Reports/report-accident/report-accident.component';
import { StopCardReportComponent } from './Print_Reports/stop-card-report/stop-card-report.component';
import { StopcardTableComponent } from './Report_Data/stopcard-table/stopcard-table.component';
import { AccidentTableComponent } from './Report_Data/accident-table/accident-table.component';
import { LoginComponent } from './Other_Components/login/login.component';
import { RegisterComponent } from './Other_Components/register/register.component';
import { DashboardComponent } from './Other_Components/dashboard/dashboard.component';
import { ProfileComponent } from './Other_Components/profile/profile.component';
import { ContactUsComponent } from './Other_Components/contact-us/contact-us.component';
import { JMPFormComponent } from './Reports/jmpform/jmpform.component';
import { JMPTableComponent } from './Report_Data/jmptable/jmptable.component';
import { JMPReportComponent } from './Print_Reports/jmpreport/jmpreport.component';
import { EditAccidentComponent } from './EditReports/edit-accident/edit-accident.component';
import { AddAccidentCausesComponent } from './Add_Data/add-accident-causes/add-accident-causes.component';
import { AccidentCausesComponent } from './Items_In_SubDashboard/accident-causes/accident-causes.component';
import { AddClassificationComponent } from './Add_Data/add-classification/add-classification.component';
import { ClassificationsComponent } from './Items_In_SubDashboard/classifications/classifications.component';
import { ClassificationOfAccidentComponent } from './Items_In_SubDashboard/classification-of-accident/classification-of-accident.component';
import { AddclassificationOfAccdComponent } from './Add_Data/addclassification-of-accd/addclassification-of-accd.component';
import { AddComminucationMethodComponent } from './Add_Data/add-comminucation-method/add-comminucation-method.component';
import { ComminucationMethodComponent } from './Items_In_SubDashboard/comminucation-method/comminucation-method.component';
import { DriverComponent } from './Items_In_SubDashboard/driver/driver.component';
import { AddDriverComponent } from './Add_Data/add-driver/add-driver.component';
import { AddPassengersComponent } from './Add_Data/add-passengers/add-passengers.component';
import { PassengersComponent } from './Items_In_SubDashboard/passengers/passengers.component';
import { PreventionCategoriesComponent } from './Items_In_SubDashboard/prevention-categories/prevention-categories.component';
import { AddPreventionCategoriesComponent } from './Add_Data/add-prevention-categories/add-prevention-categories.component';
import { AddQHSEPositionsComponent } from './Add_Data/add-qhsepositions/add-qhsepositions.component';
import { QHSEPositionsComponent } from './Items_In_SubDashboard/qhsepositions/qhsepositions.component';
import { QHSENamesComponent } from './Items_In_SubDashboard/qhsenames/qhsenames.component';
import { AddQHSENamesComponent } from './Add_Data/add-qhsenames/add-qhsenames.component';
import { AddReportedByNamesComponent } from './Add_Data/add-reported-by-names/add-reported-by-names.component';
import { ReportedByNamesComponent } from './Items_In_SubDashboard/reported-by-names/reported-by-names.component';
import { ReportedByPositionsComponent } from './Items_In_SubDashboard/reported-by-positions/reported-by-positions.component';
import { AddReportedByPositionsComponent } from './Add_Data/add-reported-by-positions/add-reported-by-positions.component';
import { AddRigsComponent } from './Add_Data/add-rigs/add-rigs.component';
import { RigsComponent } from './Items_In_SubDashboard/rigs/rigs.component';
import { RouteNamesComponent } from './Items_In_SubDashboard/route-names/route-names.component';
import { AddRouteNamesComponent } from './Add_Data/add-route-names/add-route-names.component';
import { AddToolPusherPositionsComponent } from './Add_Data/add-tool-pusher-positions/add-tool-pusher-positions.component';
import { ToolPusherPositionsComponent } from './Items_In_SubDashboard/tool-pusher-positions/tool-pusher-positions.component';
import { ToolPusherNamesComponent } from './Items_In_SubDashboard/tool-pusher-names/tool-pusher-names.component';
import { AddToolPusherNamesComponent } from './Add_Data/add-tool-pusher-names/add-tool-pusher-names.component';
import { AddTypeofInjuriesComponent } from './Add_Data/add-typeof-injuries/add-typeof-injuries.component';
import { TypeofInjuriesComponent } from './Items_In_SubDashboard/typeof-injuries/typeof-injuries.component';
import { TypeofObserviationComponent } from './Items_In_SubDashboard/typeof-observiation/typeof-observiation.component';
import { AddTypeofObserviationComponent } from './Add_Data/add-typeof-observiation/add-typeof-observiation.component';
import { AddVehiclesComponent } from './Add_Data/add-vehicles/add-vehicles.component';
import { VehiclesComponent } from './Items_In_SubDashboard/vehicles/vehicles.component';
import { ViolationCategoriesComponent } from './Items_In_SubDashboard/violation-categories/violation-categories.component';
import { AddViolationCategoriesComponent } from './Add_Data/add-violation-categories/add-violation-categories.component';
import { EditStopCardComponent } from './EditReports/edit-stop-card/edit-stop-card.component';
import { EditAccidentCausesComponent } from './EditReports/edit-accident-causes/edit-accident-causes.component';
import { EditClassificationComponent } from './EditReports/edit-classification/edit-classification.component';
import { EditClassificationOfAccidentComponent } from './EditReports/edit-classification-of-accident/edit-classification-of-accident.component';
import { EditComminucationMethodComponent } from './EditReports/edit-comminucation-method/edit-comminucation-method.component';
import { EditDriverComponent } from './EditReports/edit-driver/edit-driver.component';
import { EditPassengerComponent } from './EditReports/edit-passenger/edit-passenger.component';
import { EditPreventionCategoryComponent } from './EditReports/edit-prevention-category/edit-prevention-category.component';
import { EditQHSEPositionComponent } from './EditReports/edit-qhseposition/edit-qhseposition.component';
import { EditQHSEPositionNameComponent } from './EditReports/edit-qhseposition-name/edit-qhseposition-name.component';
import { EditReportedByNameComponent } from './EditReports/edit-reported-by-name/edit-reported-by-name.component';
import { EditReportedByPositionComponent } from './EditReports/edit-reported-by-position/edit-reported-by-position.component';
import { EditRigComponent } from './EditReports/edit-rig/edit-rig.component';
import { EditRouteNameComponent } from './EditReports/edit-route-name/edit-route-name.component';
import { EditToolPusherPositionComponent } from './EditReports/edit-tool-pusher-position/edit-tool-pusher-position.component';
import { EditToolPusherPositionNameComponent } from './EditReports/edit-tool-pusher-position-name/edit-tool-pusher-position-name.component';
import { EditTypeOfInjuryComponent } from './EditReports/edit-type-of-injury/edit-type-of-injury.component';
import { EditTypeOfObservationCategoryComponent } from './EditReports/edit-type-of-observation-category/edit-type-of-observation-category.component';
import { EditVehicleComponent } from './EditReports/edit-vehicle/edit-vehicle.component';
import { EditViolationCategoryComponent } from './EditReports/edit-violation-category/edit-violation-category.component';
import { EditJMLFormComponent } from './EditReports/edit-jmlform/edit-jmlform.component';
import { TokenInterceptorService } from 'Services/token-interceptor.service';
import { ChangepasswordComponent } from './Other_Components/changepassword/changepassword.component';
import { StopCardChartComponent } from './Charts_Of_Reports/stop-card-chart/stop-card-chart.component';
import { NotificationsComponent } from './Other_Components/notifications/notifications.component';
import { ArrivalStatusSJPComponent } from './Other_Components/arrival-status-sjp/arrival-status-sjp.component';
import { SJPTodayComponent } from './Print_Reports/sjptoday/sjptoday.component';
import { StopCardCompareChartComponent } from './Charts_Of_Reports/stop-card-compare-chart/stop-card-compare-chart.component';
import { HeathComponent } from './UpLoadFiles/heath/heath.component';
import { SafetyComponent } from './UpLoadFiles/safety/safety.component';
import { EnvironmentComponent } from './UpLoadFiles/environment/environment.component';
import { QualityComponent } from './UpLoadFiles/quality/quality.component';
import { ClincFormsComponent } from './UpLoadFiles/clinc-forms/clinc-forms.component';
import { QSHEFormsComponent } from './UpLoadFiles/qsheforms/qsheforms.component';
import { PolicyComponent } from './UpLoadFiles/policy/policy.component';
import { RigMovePerformanceEvaluationComponent } from './Report_Data/rig-move-performance-evaluation/rig-move-performance-evaluation.component';
import { AddRigMovePerformanceEvaluationComponent } from './Reports/add-rig-move-performance-evaluation/add-rig-move-performance-evaluation.component';
// import { EditRigMovePerformanceEvaluationComponent } from './EditReports/edit-rig-move-performance-evaluation/edit-rig-move-performance-evaluation.component';

import {EditRigMovePerformanceEvaluationComponent} from './EditReports/edit-rig-move-performance-evaluation/edit-rig-move-performance-evaluation.component'
import { PrintRigPerformanceComponent } from './Print_Reports/print-rig-performance/print-rig-performance.component';
import { RigPerformanceChartComponent } from './Charts_Of_Reports/rig-performance-chart/rig-performance-chart.component';
import { SubDashboardComponent } from './Items_In_SubDashboard/sub-dashboard/sub-dashboard.component';
import { RigPerformanceCompareChartsComponent } from './Charts_Of_Reports/rig-performance-compare-charts/rig-performance-compare-charts.component';
import { AddPTSMComponent } from './Reports/add-ptsm/add-ptsm.component';
import { PTSMComponent } from './Report_Data/ptsm/ptsm.component';
import { EditPTSMComponent } from './EditReports/edit-ptsm/edit-ptsm.component';
import { PrintPTSMComponent } from './Print_Reports/print-ptsm/print-ptsm.component';
import { BOPComponent } from './Reports/bop/bop.component';
import { EditBOPComponent } from './EditReports/edit-bop/edit-bop.component';
import { BopTableComponent } from './Report_Data/bop-table/bop-table.component';
import { PrintBopComponent } from './Print_Reports/print-bop/print-bop.component';

@NgModule({
  declarations: [

    AppComponent,
    AccidentFormComponent,
    NavbarComponent,
    FooterComponent,
    SidebarComponent,
    HomeComponent,
    PageNotFoundComponent,
    StopcardComponent,
    ReportAccidentComponent,
    StopCardReportComponent,
    StopcardTableComponent,
    AccidentTableComponent,
    LoginComponent,
    RegisterComponent,
    DashboardComponent,
    ProfileComponent,
    ContactUsComponent,
    EditRigMovePerformanceEvaluationComponent,
    JMPFormComponent,
    JMPTableComponent,
    JMPReportComponent,
    EditAccidentComponent,
    AddAccidentCausesComponent,
    AccidentCausesComponent,
    AddClassificationComponent,
    ClassificationsComponent,
    ClassificationOfAccidentComponent,
    AddclassificationOfAccdComponent,
    AddComminucationMethodComponent,
    ComminucationMethodComponent,
    DriverComponent,
    AddDriverComponent,
    AddPassengersComponent,
    PassengersComponent,
    PreventionCategoriesComponent,
    AddPreventionCategoriesComponent,
    AddQHSEPositionsComponent,
    QHSEPositionsComponent,
    QHSENamesComponent,
    AddQHSENamesComponent,
    AddReportedByNamesComponent,
    ReportedByNamesComponent,
    ReportedByPositionsComponent,
    AddReportedByPositionsComponent,
    AddRigsComponent,
    RigsComponent,
    RouteNamesComponent,
    AddRouteNamesComponent,
    AddToolPusherPositionsComponent,
    ToolPusherPositionsComponent,
    ToolPusherNamesComponent,
    AddToolPusherNamesComponent,
    AddTypeofInjuriesComponent,
    TypeofInjuriesComponent,
    TypeofObserviationComponent,
    AddTypeofObserviationComponent,
    AddVehiclesComponent,
    VehiclesComponent,
    ViolationCategoriesComponent,
    AddViolationCategoriesComponent,
    EditStopCardComponent,
    EditAccidentCausesComponent,
    EditClassificationComponent,
    EditClassificationOfAccidentComponent,
    EditComminucationMethodComponent,
    EditDriverComponent,
    EditPassengerComponent,
    EditPreventionCategoryComponent,
    EditQHSEPositionComponent,
    EditQHSEPositionNameComponent,
    EditReportedByNameComponent,
    EditReportedByPositionComponent,
    EditRigComponent,
    EditRouteNameComponent,
    EditToolPusherPositionComponent,
    EditToolPusherPositionNameComponent,
    EditTypeOfInjuryComponent,
    EditTypeOfObservationCategoryComponent,
    EditVehicleComponent,
    EditViolationCategoryComponent,
    EditJMLFormComponent,
    ChangepasswordComponent,
    StopCardChartComponent,
    NotificationsComponent,
    ArrivalStatusSJPComponent,
    SJPTodayComponent,
    StopCardCompareChartComponent,
    HeathComponent,
    SafetyComponent,
    EnvironmentComponent,
    QualityComponent,
    ClincFormsComponent,
    QSHEFormsComponent,
    PolicyComponent,
    RigMovePerformanceEvaluationComponent,
    AddRigMovePerformanceEvaluationComponent,
    PrintRigPerformanceComponent,
    RigPerformanceChartComponent,
    SubDashboardComponent,
    RigPerformanceCompareChartsComponent,
    AddPTSMComponent,
    PTSMComponent,
    EditPTSMComponent,
    PrintPTSMComponent,
    BOPComponent,
    EditBOPComponent,
    BopTableComponent,
    PrintBopComponent,


  ],
  imports: [
    BrowserModule,
    Ng2SearchPipeModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    FormsModule
  ],

  providers: [{provide:HTTP_INTERCEPTORS,
    useClass:TokenInterceptorService,
    multi:true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
