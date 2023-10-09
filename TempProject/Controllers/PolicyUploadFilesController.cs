using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Drawing.Printing;

namespace TempProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PolicyUploadFilesController : ControllerBase
    {
        private readonly IWebHostEnvironment _environment;
        private readonly string _fileDirectory = "E:\\هدير\\ITI\\ECDC\\ECDC\\TempProject\\wwwroot\\uploads\\PolicyUploadFiles";
        private const int PageSize = 10;
        public PolicyUploadFilesController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }



        [HttpPost("upload")]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            if (file != null && file.Length > 0)
            {
                var filePath = Path.Combine(_fileDirectory, file.FileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                return Ok("File uploaded successfully.");
            }

            return BadRequest("Invalid file.");
        }



        [HttpGet("GetAllUploadFiles")]
        public IActionResult GetAllUploadFiles()
        {
            var fileNames = Directory.GetFiles(_fileDirectory)
                                       .Select(Path.GetFileName)
                                       .ToList();

            return Ok(fileNames);
        }



        [HttpDelete("{fileName}")]
        public IActionResult DeleteFile(string fileName)
        {
            try
            {
                var filePath = Path.Combine(_fileDirectory, fileName);
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                    return Ok("File deleted successfully.");
                }
                else
                {
                    return NotFound("File not found.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred while deleting the file: {ex.Message}");
            }




        }

        [HttpGet]
        public IActionResult GetPaginatedFiles(int pageNumber = 1)
        {
            try
            {
                var allFiles = Directory.GetFiles(_fileDirectory);
                var totalFiles = allFiles.Length;
                var totalPages = (int)Math.Ceiling((double)totalFiles / PageSize);
                var paginatedFiles = allFiles
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .Select(Path.GetFileName);

                var response = new
                {
                    TotalFiles = totalFiles,
                    TotalPages = totalPages,
                    CurrentPage = pageNumber,
                    PageSize = PageSize,
                    Files = paginatedFiles
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred while fetching paginated files: {ex.Message}");
            }


        }

        [HttpGet("DownloadFile")]
        public IActionResult DownloadFile(string fileName)
        {
            try
            {
                var filePath = Path.Combine(_fileDirectory, fileName);
                if (System.IO.File.Exists(filePath))
                {
                    var fileBytes = System.IO.File.ReadAllBytes(filePath);
                    return File(fileBytes, "application/octet-stream", fileName);
                }
                else
                {
                    return NotFound("File not found.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred while downloading the file: {ex.Message}");
            }
        }
    }
}


