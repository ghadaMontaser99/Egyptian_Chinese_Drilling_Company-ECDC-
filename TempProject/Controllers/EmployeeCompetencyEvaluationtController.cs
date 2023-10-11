using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Drawing.Drawing2D;
using TempProject.DTO;
using TempProject.DTO.ExcelDTO;
using TempProject.DTO.ResponseDTO;
using TempProject.Helper;
using TempProject.Models;
using TempProject.Repository;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TempProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
	//[Authorize]
	public class EmployeeCompetencyEvaluationtController : ControllerBase
    {
        public IRepository<EmployeeCompetencyEvaluation> EmployeeCompetencyEvaluationtRepo { get; set; }
        public IEmployeeCompetencyEvaluationRepository employeeCompetencyEvaluationRepository { get; set; }

		private readonly Microsoft.AspNetCore.Identity.UserManager<IdentityUser> userManager;


		public EmployeeCompetencyEvaluationtController(Microsoft.AspNetCore.Identity.UserManager<IdentityUser> _userManager,IRepository<EmployeeCompetencyEvaluation> _EmployeeCompetencyEvaluationRepo, IEmployeeCompetencyEvaluationRepository _EmployeeCompetencyEvaluationRepository)
        {
            this.EmployeeCompetencyEvaluationtRepo = _EmployeeCompetencyEvaluationRepo;
            this.employeeCompetencyEvaluationRepository = _EmployeeCompetencyEvaluationRepository;
            this.userManager = _userManager;
        }

        [HttpGet("GetData")]
        public async Task<ResultDTO> GetAllWithData(string UserID, string UserRole)
		{
			ResultDTO result = new ResultDTO();

			try
			{
				if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluation> temp = employeeCompetencyEvaluationRepository.getall();
					List<EmployeeCompetencyEvaluationtDTO> newTemp = new List<EmployeeCompetencyEvaluationtDTO>();
					foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in temp)
					{
                        EmployeeCompetencyEvaluationtDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationtDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.RigId = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;

                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.user.Id;

                        newTemp.Add(employeeCompetencyEvaluationtDTO);
						//result.Data = prod;
					}
					if (newTemp != null)
					{
						result.Message = "Success";
						result.Statescode = 200;
						result.Data = newTemp;

						return result;
					}
				}
				else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluation> temp = employeeCompetencyEvaluationRepository.getall().Where(a => a.user.Id == UserID).ToList();
					List<EmployeeCompetencyEvaluationResponseDTO> newTemp = new List<EmployeeCompetencyEvaluationResponseDTO>();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in temp)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;

                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

                        newTemp.Add(employeeCompetencyEvaluationtDTO);
                        //result.Data = prod;
                    }
                    if (newTemp != null)
					{
						result.Message = "Success";
						result.Statescode = 200;
						result.Data = newTemp;

						return result;
					}					
				}
			}
			catch(Exception ex)
			{
				result.Statescode = 404;
				result.Message = "data not found";
			}
			return result;
		}

		[HttpGet("GetDataForExcel")]
		public ActionResult<ResultDTO> GetDataForExcel(string UserID, string UserRole)
		{
			ResultDTO result = new ResultDTO();
			try
			{
				if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluation> temp = employeeCompetencyEvaluationRepository.getall();
					List<EmployeeCompetencyEvaluationExcelDTO> newTemp = new List<EmployeeCompetencyEvaluationExcelDTO>();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in temp)
                    {
                        EmployeeCompetencyEvaluationExcelDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationExcelDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date= employeeCompetencyEvaluationt.Date;

                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

                        newTemp.Add(employeeCompetencyEvaluationtDTO);
                        //result.Data = prod;
                    }
                    if (newTemp != null)
					{
						result.Message = "Success";
						result.Statescode = 200;
						result.Data = newTemp;

						return result;
					}
				}
				else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluation> temp = employeeCompetencyEvaluationRepository.getall().Where(a => a.user.Id == UserID).ToList();
					List<EmployeeCompetencyEvaluationExcelDTO> newTemp = new List<EmployeeCompetencyEvaluationExcelDTO>();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in temp)
                    {
                        EmployeeCompetencyEvaluationExcelDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationExcelDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;

                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

                        newTemp.Add(employeeCompetencyEvaluationtDTO);
                        
                        //result.Data = prod;
                    }
                    if (newTemp != null)
					{
						result.Message = "Success";
						result.Statescode = 200;
						result.Data = newTemp;

						return result;
					}

				}

			}
			catch (Exception ex)
			{
				result.Statescode = 404;
				result.Message = "data not found";
			}

			return result;
		}

		[HttpGet("ByPage/{page:int}")]
		public PageResult<EmployeeCompetencyEvaluationResponseDTO> GettAllStoCardsByPage(string UserId,string UserRole,int? page, int pagesize = 10)
		{

			try
			{
				if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluation> temp = employeeCompetencyEvaluationRepository.getall();
					List<EmployeeCompetencyEvaluationResponseDTO> newTemp = new List<EmployeeCompetencyEvaluationResponseDTO>();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in temp)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

 
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;

                        newTemp.Add(employeeCompetencyEvaluationtDTO);
                        //result.Data = prod;
                    }

                    float countDetails = employeeCompetencyEvaluationRepository.getall().Count();
					var result = new PageResult<EmployeeCompetencyEvaluationResponseDTO>
					{
						Count = (int)Math.Ceiling(countDetails / pagesize),
						PageIndex = page ?? 1,
						PageSize = pagesize,
						Items = newTemp.Skip((page - 1 ?? 0) * pagesize).Take(pagesize).ToList()
					};

					return result;

				}
				else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluation> temp = employeeCompetencyEvaluationRepository.getall().Where(a => a.user.Id == UserId).ToList();
					List<EmployeeCompetencyEvaluationResponseDTO> newTemp = new List<EmployeeCompetencyEvaluationResponseDTO>();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in temp)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

 
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;

                        newTemp.Add(employeeCompetencyEvaluationtDTO);
                        //result.Data = prod;
                    }

                    float countDetails = employeeCompetencyEvaluationRepository.getall().Where(a => a.user.Id == UserId).Count();
					var result = new PageResult<EmployeeCompetencyEvaluationResponseDTO>
					{
						Count = (int)Math.Ceiling(countDetails / pagesize),
						PageIndex = page ?? 1,
						PageSize = pagesize,
						Items = newTemp.Skip((page - 1 ?? 0) * pagesize).Take(pagesize).ToList()
					};
					return result;
				}
			}
			catch (Exception ex)
			{
				return new PageResult<EmployeeCompetencyEvaluationResponseDTO>();

			}
			return new PageResult<EmployeeCompetencyEvaluationResponseDTO>();
		}


		[HttpGet("GetDataById/{ID:int}")]
        public ActionResult<ResultDTO> GetAllWithDataByID(int ID,string UserId,string UserRole)
        {
            ResultDTO result = new ResultDTO();


			if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
            {
                EmployeeCompetencyEvaluation temp = employeeCompetencyEvaluationRepository.getall().FirstOrDefault(a => a.Id == ID);
				if (temp != null)
				{
                    EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                    employeeCompetencyEvaluationtDTO.id = temp.Id;
                    employeeCompetencyEvaluationtDTO.Rig = temp.Rig.Number;
                    employeeCompetencyEvaluationtDTO.Date = temp.Date;
                    employeeCompetencyEvaluationtDTO.userID = temp.userID;

                    employeeCompetencyEvaluationtDTO.SubjectId= temp.SubjectId;
                    employeeCompetencyEvaluationtDTO.Description = temp.Description;

                    employeeCompetencyEvaluationtDTO.QHSEEmpName = temp.QHSEEmpName;
                    employeeCompetencyEvaluationtDTO.QHSEEmpCode = temp.QHSEEmpCode;
                    employeeCompetencyEvaluationtDTO.QHSEPositionName = temp.QHSEPositionName;

                    employeeCompetencyEvaluationtDTO.EmployeeCode = temp.EmployeeCode;
                    employeeCompetencyEvaluationtDTO.EmployeeName = temp.EmployeeName;
                    employeeCompetencyEvaluationtDTO.EmployeePositionName = temp.EmployeePositionName;


                    if (employeeCompetencyEvaluationtDTO != null)
					{

						result.Message = "Success";
						result.Statescode = 200;
						result.Data = employeeCompetencyEvaluationtDTO;

						return result;
					}
				}

			}
			else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
            {
                EmployeeCompetencyEvaluation temp = employeeCompetencyEvaluationRepository.getall().FirstOrDefault(a => a.Id == ID&&a.user.Id==UserId);
                if (temp != null)
                {
                    EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                    employeeCompetencyEvaluationtDTO.id = temp.Id;
                    employeeCompetencyEvaluationtDTO.Rig = temp.Rig.Number;
                    employeeCompetencyEvaluationtDTO.Date = temp.Date;
                    employeeCompetencyEvaluationtDTO.SubjectId = temp.SubjectId;
                    employeeCompetencyEvaluationtDTO.userID = temp.userID;

                    employeeCompetencyEvaluationtDTO.Description = temp.Description;

                    employeeCompetencyEvaluationtDTO.QHSEEmpName = temp.QHSEEmpName;
                    employeeCompetencyEvaluationtDTO.QHSEEmpCode = temp.QHSEEmpCode;
                    employeeCompetencyEvaluationtDTO.QHSEPositionName = temp.QHSEPositionName;

                    employeeCompetencyEvaluationtDTO.EmployeeCode = temp.EmployeeCode;
                    employeeCompetencyEvaluationtDTO.EmployeeName = temp.EmployeeName;
                    employeeCompetencyEvaluationtDTO.EmployeePositionName = temp.EmployeePositionName;


                    if (employeeCompetencyEvaluationtDTO != null)
                    {

                        result.Message = "Success";
                        result.Statescode = 200;
                        result.Data = employeeCompetencyEvaluationtDTO;

                        return result;
                    }
                }

			}

			result.Statescode = 404;
            result.Message = "data not found";
            return result;
        }


        [HttpGet("GetDataByDate/{date:DateTime}")]
        public ActionResult<ResultDTO> GetAllWithDataByDate(DateTime date,string UserId,string UserRole)
        {
            ResultDTO result = new ResultDTO();

			try
			{
				if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluationResponseDTO> employeeCompetencyEvaluationtDTOs = new List<EmployeeCompetencyEvaluationResponseDTO>();
					List<EmployeeCompetencyEvaluation> employeeCompetencyEvaluationts = employeeCompetencyEvaluationRepository.getall().Where(a => a.Date == date).ToList();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in employeeCompetencyEvaluationts)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
 

 
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;

                        employeeCompetencyEvaluationtDTOs.Add(employeeCompetencyEvaluationtDTO);

					}
					result.Message = "Success";
					result.Data = employeeCompetencyEvaluationtDTOs;
					result.Statescode = 200;
					return result;
				}
				else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
				{
					List<EmployeeCompetencyEvaluationResponseDTO> employeeCompetencyEvaluationtDTOs = new List<EmployeeCompetencyEvaluationResponseDTO>();
					List<EmployeeCompetencyEvaluation> employeeCompetencyEvaluationts = employeeCompetencyEvaluationRepository.getall().Where(a => a.Date == date && a.user.Id == UserId).ToList();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in employeeCompetencyEvaluationts)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

 
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;

                        employeeCompetencyEvaluationtDTOs.Add(employeeCompetencyEvaluationtDTO);

                        employeeCompetencyEvaluationtDTOs.Add(employeeCompetencyEvaluationtDTO);

					}
					result.Message = "Success";
					result.Data = employeeCompetencyEvaluationtDTOs;
					result.Statescode = 200;
					return result;
				}

			}
			catch (Exception ex)
			{
				result.Statescode = 404;
				result.Message = "data not found";
			}

			return result;

        }

        [HttpGet("GetDataByEmpCode/{EmpCode:int}")]
        public ActionResult<ResultDTO> GetAllWithDataByEmpCode(int EmpCode, string UserId,string UserRole)
        {
            ResultDTO result = new ResultDTO();

			try
			{
				if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
				{
                    List<EmployeeCompetencyEvaluationResponseDTO> employeeCompetencyEvaluationtDTOs = new List<EmployeeCompetencyEvaluationResponseDTO>();
                    List<EmployeeCompetencyEvaluation> employeeCompetencyEvaluationts = employeeCompetencyEvaluationRepository.getall().Where(a => a.EmployeeCode == EmpCode ).ToList();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in employeeCompetencyEvaluationts)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

 
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;

                        employeeCompetencyEvaluationtDTOs.Add(employeeCompetencyEvaluationtDTO);

         
					}
					result.Message = "Success";
					result.Data = employeeCompetencyEvaluationtDTOs;
					result.Statescode = 200;
					return result;
				}
				else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
				{
                    List<EmployeeCompetencyEvaluationResponseDTO> employeeCompetencyEvaluationtDTOs = new List<EmployeeCompetencyEvaluationResponseDTO>();
                    List<EmployeeCompetencyEvaluation> employeeCompetencyEvaluationts = employeeCompetencyEvaluationRepository.getall().Where(a => a.EmployeeCode == EmpCode && a.userID==UserId).ToList();
                    foreach (EmployeeCompetencyEvaluation employeeCompetencyEvaluationt in employeeCompetencyEvaluationts)
                    {
                        EmployeeCompetencyEvaluationResponseDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationResponseDTO();
                        employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluationt.Id;
                        employeeCompetencyEvaluationtDTO.Rig = employeeCompetencyEvaluationt.Rig.Number;
                        employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluationt.Date;
                        employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluationt.SubjectId;
                        employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluationt.userID;

 
                        employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluationt.Description;

                        employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluationt.QHSEEmpName;
                        employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluationt.QHSEEmpCode;
                        employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluationt.QHSEPositionName;

                        employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluationt.EmployeeCode;
                        employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluationt.EmployeeName;
                        employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluationt.EmployeePositionName;

                        employeeCompetencyEvaluationtDTOs.Add(employeeCompetencyEvaluationtDTO);

                    }
					result.Message = "Success";
					result.Data = employeeCompetencyEvaluationtDTOs;
					result.Statescode = 200;
					return result;
				}

			}
			catch (Exception ex)
			{
				result.Statescode = 404;
				result.Message = "data not found";
			}

            return result;
        }


        //[HttpGet]
        //public ActionResult<ResultDTO> GetAll()
        //{

        //    ResultDTO result = new ResultDTO();

        //    List<Accident> temp = accidentRepo.getall();
        //    List<AccidentDTO> newTemp = new List<AccidentDTO>();
        //    foreach (Accident accident in temp)
        //    {
        //        AccidentDTO accidentDTO = new AccidentDTO();
        //        accidentDTO.id = accident.id;
        //        accidentDTO.RigId = accident.RigId;
        //        accidentDTO.TimeOfEvent = accident.TimeOfEvent;
        //        accidentDTO.DateOfEvent = accident.DateOfEvent;
        //        accidentDTO.TypeOfInjuryID = accident.TypeOfInjuryID;
        //        accidentDTO.ViolationCategoryId = accident.ViolationCategoryId;
        //        accidentDTO.AccidentCausesId = accident.AccidentCausesId;
        //        accidentDTO.PreventionCategoryId = accident.PreventionCategoryId;
        //        accidentDTO.ClassificationOfAccidentId = accident.ClassificationOfAccidentId;
        //        accidentDTO.AccidentLocation = accident.AccidentLocation;
        //        accidentDTO.QHSEPositionNameId = accident.QHSEPositionNameId;
        //        accidentDTO.ToolPusherPositionNameId = accident.ToolPusherPositionNameId;
        //        accidentDTO.ToolPusherPositionId = accident.ToolPusherPositionId;
        //        accidentDTO.QHSEPositionId = accident.QHSEPositionId;
        //        accidentDTO.DrillerName = accident.DrillerName;
        //        accidentDTO.DescriptionOfTheEvent = accident.DescriptionOfTheEvent;
        //        accidentDTO.ImmediateActionType = accident.ImmediateActionType;
        //        accidentDTO.DirectCauses = accident.DirectCauses;
        //        accidentDTO.RootCauses = accident.RootCauses;
        //        accidentDTO.userID = accident.userID;
        //        accidentDTO.Recommendations = accident.Recommendations;
        //        accidentDTO.Pictures = accident.Pictures;

        //        newTemp.Add(accidentDTO);
        //        //result.Data = prod;
        //    }
        //    if (newTemp != null)
        //    {

        //        result.Statescode = 200;
        //        result.Data = newTemp;

        //        return result;
        //    }

        //    result.Statescode = 404;
        //    result.Message = "data not found";
        //    return result;
        //}

        [HttpGet("{ID:int}")]
        public ActionResult<ResultDTO> GetByID(int ID,string UserId,string UserRole)
        {
            ResultDTO result = new ResultDTO();

			try
			{
				if (string.Equals(UserRole, "Admin", StringComparison.OrdinalIgnoreCase))
				{
                    EmployeeCompetencyEvaluation employeeCompetencyEvaluation = employeeCompetencyEvaluationRepository.getall().FirstOrDefault(a => a.Id == ID);
                    EmployeeCompetencyEvaluationtDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationtDTO();
                    employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluation.Id;
                    employeeCompetencyEvaluationtDTO.RigId = employeeCompetencyEvaluation.Rig.Number;
                    employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluation.Date;
                    employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluation.SubjectId;
                    employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluation.userID;

                    employeeCompetencyEvaluationtDTO.Description = employeeCompetencyEvaluation.Description;

                    employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluation.QHSEEmpName;
                    employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluation.QHSEEmpCode;
                    employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluation.QHSEPositionName;

                    employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluation.EmployeeCode;
                    employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluation.EmployeeName;
                    employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluation.EmployeePositionName;


                    result.Message = "Success";
					result.Data = employeeCompetencyEvaluationtDTO;
					result.Statescode = 200;
					return result;

				}
				else if (string.Equals(UserRole, "User", StringComparison.OrdinalIgnoreCase))
				{
                    EmployeeCompetencyEvaluation employeeCompetencyEvaluation = EmployeeCompetencyEvaluationtRepo.getall().FirstOrDefault(a => a.Id == ID && a.userID == UserId);
                    EmployeeCompetencyEvaluationtDTO employeeCompetencyEvaluationtDTO = new EmployeeCompetencyEvaluationtDTO();
                    employeeCompetencyEvaluationtDTO.id = employeeCompetencyEvaluation.Id;
                    employeeCompetencyEvaluationtDTO.RigId = employeeCompetencyEvaluation.Rig.Number;
                    employeeCompetencyEvaluationtDTO.Date = employeeCompetencyEvaluation.Date;

                    employeeCompetencyEvaluationtDTO.SubjectId = employeeCompetencyEvaluation.SubjectId;
                    employeeCompetencyEvaluationtDTO.userID = employeeCompetencyEvaluation.userID;


                    employeeCompetencyEvaluationtDTO.QHSEEmpName = employeeCompetencyEvaluation.QHSEEmpName;
                    employeeCompetencyEvaluationtDTO.QHSEEmpCode = employeeCompetencyEvaluation.QHSEEmpCode;
                    employeeCompetencyEvaluationtDTO.QHSEPositionName = employeeCompetencyEvaluation.QHSEPositionName;

                    employeeCompetencyEvaluationtDTO.EmployeeCode = employeeCompetencyEvaluation.EmployeeCode;
                    employeeCompetencyEvaluationtDTO.EmployeeName = employeeCompetencyEvaluation.EmployeeName;
                    employeeCompetencyEvaluationtDTO.EmployeePositionName = employeeCompetencyEvaluation.EmployeePositionName;


                    result.Message = "Success";
					result.Data = employeeCompetencyEvaluationtDTO;
					result.Statescode = 200;
					return result;
				}

			}
			catch (Exception Ex)
			{
				result.Statescode = 404;
				result.Message = "data not found";
			}

			return result;
		}

        [HttpPost]
        public ActionResult<ResultDTO> AddEmployeeCompetencyEvaluation([FromForm] EmployeeCompetencyEvaluationtDTO employeeCompetencyEvaluation)
        {
            ResultDTO result = new ResultDTO();

            if (ModelState.IsValid)
            {
                try
                {
                    EmployeeCompetencyEvaluation employeeCompetencyEvaluations = new EmployeeCompetencyEvaluation();
                    employeeCompetencyEvaluations.Id = default;
                    employeeCompetencyEvaluations.RigId = employeeCompetencyEvaluation.RigId;
                    employeeCompetencyEvaluations.Date = employeeCompetencyEvaluation.Date;

                    employeeCompetencyEvaluations.SubjectId = employeeCompetencyEvaluation.SubjectId;
                   
                    //employeeCompetencyEvaluations.user = employeeCompetencyEvaluation.user; employeeCompetencyEvaluations.Description = employeeCompetencyEvaluation.Description;

                    employeeCompetencyEvaluations.QHSEEmpName = employeeCompetencyEvaluation.QHSEEmpName;
                    employeeCompetencyEvaluations.QHSEEmpCode = employeeCompetencyEvaluation.QHSEEmpCode;
                    employeeCompetencyEvaluations.QHSEPositionName = employeeCompetencyEvaluation.QHSEPositionName;
                    employeeCompetencyEvaluations.Description = employeeCompetencyEvaluation.Description;

                    employeeCompetencyEvaluations.EmployeeCode = employeeCompetencyEvaluation.EmployeeCode;
                    employeeCompetencyEvaluations.EmployeeName = employeeCompetencyEvaluation.EmployeeName;
                    employeeCompetencyEvaluations.EmployeePositionName = employeeCompetencyEvaluation.EmployeePositionName;
                    employeeCompetencyEvaluations.userID = employeeCompetencyEvaluation.userID;



                    EmployeeCompetencyEvaluationtRepo.create(employeeCompetencyEvaluations);
                    result.Message = "Success";
                    result.Data = employeeCompetencyEvaluation;
                    result.Statescode = 200;
                }
                catch (Exception ex)
                {
                    result.Message = "Error in inserting";
                    result.Statescode = 400;
                }
            }
            return result;
        }

        //[HttpGet("{date:DateTime}")]
        //public ActionResult<ResultDTO> GetByDate(DateTime date)
        //{
        //    ResultDTO result = new ResultDTO();
        //    try
        //    {
        //        List<AccidentDTO> accidentDTOs = new List<AccidentDTO>();
        //        List<Accident> accidents = accidentRepo.getall().Where(a => a.DateOfEvent == date).ToList();
        //        foreach (Accident accident in accidents)
        //        {
        //            AccidentDTO AccidentDTO = new AccidentDTO();
        //            AccidentDTO.id = accident.id;
        //            AccidentDTO.RigId = accident.RigId;
        //            AccidentDTO.TimeOfEvent = accident.TimeOfEvent;
        //            AccidentDTO.DateOfEvent = accident.DateOfEvent;
        //            AccidentDTO.TypeOfInjuryID = accident.TypeOfInjuryID;
        //            AccidentDTO.ViolationCategoryId = accident.ViolationCategoryId;
        //            AccidentDTO.AccidentCausesId = accident.AccidentCausesId;
        //            AccidentDTO.PreventionCategoryId = accident.PreventionCategoryId;
        //            AccidentDTO.ClassificationOfAccidentId = accident.ClassificationOfAccidentId;
        //            AccidentDTO.AccidentLocation = accident.AccidentLocation;
        //            AccidentDTO.QHSEPositionNameId = accident.QHSEPositionNameId;
        //            AccidentDTO.ToolPusherPositionNameId = accident.ToolPusherPositionNameId;
        //            AccidentDTO.ToolPusherPositionId = accident.ToolPusherPositionId;
        //            AccidentDTO.QHSEPositionId = accident.QHSEPositionId;
        //            AccidentDTO.DrillerName = accident.DrillerName;
        //            AccidentDTO.DescriptionOfTheEvent = accident.DescriptionOfTheEvent;
        //            AccidentDTO.ImmediateActionType = accident.ImmediateActionType;
        //            AccidentDTO.DirectCauses = accident.DirectCauses;
        //            AccidentDTO.RootCauses = accident.RootCauses;
        //            AccidentDTO.userID = accident.userID;
        //            AccidentDTO.Recommendations = accident.Recommendations;
        //            AccidentDTO.Pictures = accident.Pictures;
        //            accidentDTOs.Add(AccidentDTO);

        //        }
        //        result.Data = accidentDTOs;
        //        result.Statescode = 200;
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.Message = "Erroe Not Find";
        //        result.Statescode = 404;
        //        return result;
        //    }
        //}

        //[HttpPut("{id:int}")]
        //public ActionResult<ResultDTO> Put(int id,EmployeeCompetencyEvaluationtDTO newEmployeeCompetencyEvaluation) //[FromBody] string value)
        //{
        //    ResultDTO result = new ResultDTO();

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            EmployeeCompetencyEvaluation orgEmployeeCompetencyEvaluation = EmployeeCompetencyEvaluationtRepo.getbyid(id);
        //            newEmployeeCompetencyEvaluation.id = orgEmployeeCompetencyEvaluation.Id;
        //            orgEmployeeCompetencyEvaluation.RigId = newEmployeeCompetencyEvaluation.RigId;
        //            orgEmployeeCompetencyEvaluation.Date = newEmployeeCompetencyEvaluation.Date;

        //            orgEmployeeCompetencyEvaluation.SubjectId = newEmployeeCompetencyEvaluation.SubjectId;
        //            orgEmployeeCompetencyEvaluation.Description = newEmployeeCompetencyEvaluation.Description;

        //            orgEmployeeCompetencyEvaluation.QHSEEmpName = newEmployeeCompetencyEvaluation.QHSEEmpName;
        //            orgEmployeeCompetencyEvaluation.QHSEEmpCode = newEmployeeCompetencyEvaluation.QHSEEmpCode;
        //            orgEmployeeCompetencyEvaluation.QHSEPositionName = newEmployeeCompetencyEvaluation.QHSEPositionName;

        //            orgEmployeeCompetencyEvaluation.EmployeeCode = newEmployeeCompetencyEvaluation.EmployeeCode;
        //            orgEmployeeCompetencyEvaluation.EmployeeName = newEmployeeCompetencyEvaluation.EmployeeName;
        //            orgEmployeeCompetencyEvaluation.EmployeePositionName = newEmployeeCompetencyEvaluation.EmployeePositionName;



        //            EmployeeCompetencyEvaluationtRepo.update(orgEmployeeCompetencyEvaluation);
        //            result.Data = orgEmployeeCompetencyEvaluation;
        //            result.Statescode = 200;
        //            return result;
        //        }
        //        catch (Exception ex)
        //        {
        //            result.Message = "Error in Updating";
        //            result.Statescode = 400;
        //            return result;
        //        }
        //    }
        //    return BadRequest(ModelState);
        //}


        [HttpPut("{id:int}")]
        public ActionResult<ResultDTO> Put(int id, [FromForm] EmployeeCompetencyEvaluationtDTO newEmployeeCompetencyEvaluationt) //[FromBody] string value)
        {
            ResultDTO result = new ResultDTO();

            if (ModelState.IsValid)
            {
                try
                {
                    EmployeeCompetencyEvaluation orgEmployeeCompetencyEvaluationt = EmployeeCompetencyEvaluationtRepo.getbyid(id);
                    newEmployeeCompetencyEvaluationt.id = orgEmployeeCompetencyEvaluationt.Id;
                    orgEmployeeCompetencyEvaluationt.RigId = newEmployeeCompetencyEvaluationt.RigId;
                    orgEmployeeCompetencyEvaluationt.Date = newEmployeeCompetencyEvaluationt.Date;
                    orgEmployeeCompetencyEvaluationt.SubjectId = newEmployeeCompetencyEvaluationt.SubjectId;

                    orgEmployeeCompetencyEvaluationt.Description = newEmployeeCompetencyEvaluationt.Description;

                    orgEmployeeCompetencyEvaluationt.QHSEEmpName = newEmployeeCompetencyEvaluationt.QHSEEmpName;
                    orgEmployeeCompetencyEvaluationt.QHSEEmpCode = newEmployeeCompetencyEvaluationt.QHSEEmpCode;
                    orgEmployeeCompetencyEvaluationt.QHSEPositionName = newEmployeeCompetencyEvaluationt.QHSEPositionName;

                    orgEmployeeCompetencyEvaluationt.EmployeeCode = newEmployeeCompetencyEvaluationt.EmployeeCode;
                    orgEmployeeCompetencyEvaluationt.EmployeeName = newEmployeeCompetencyEvaluationt.EmployeeName;
                    orgEmployeeCompetencyEvaluationt.EmployeePositionName = newEmployeeCompetencyEvaluationt.EmployeePositionName;



                    EmployeeCompetencyEvaluationtRepo.update(orgEmployeeCompetencyEvaluationt);
                    result.Data = orgEmployeeCompetencyEvaluationt;
                    result.Statescode = 200;
                    return result;
                }
                catch (Exception ex)
                {
                    result.Message = "Error in Updating";
                    result.Statescode = 400;
                    return result;
                }
            }
            return BadRequest(ModelState);
        }

        [HttpPut("Delete/{id:int}")]
        public ActionResult<ResultDTO> Delete(int id) //[FromBody] string value)
        {
            ResultDTO result = new ResultDTO();
            try
            {
                EmployeeCompetencyEvaluation employeeCompetencyEvaluation = EmployeeCompetencyEvaluationtRepo.getbyid(id);
                employeeCompetencyEvaluation.IsDeleted = true;
                EmployeeCompetencyEvaluationtRepo.update(employeeCompetencyEvaluation);
                result.Data = employeeCompetencyEvaluation;
                result.Statescode = 200;
                result.Message = "Success";
            }
            catch (Exception ex)
            {
                result.Message = "Error in deleted";
                result.Statescode = 400;
            }

            return result;
        }
    }
}
