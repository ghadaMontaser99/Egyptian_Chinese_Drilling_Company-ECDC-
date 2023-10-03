using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace TempProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadFilesController : ControllerBase
    {
        private readonly IWebHostEnvironment _environment;

        public UploadFilesController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        [HttpPost]
        public async Task<IActionResult> UploadFile(IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("No file uploaded.");

            string uploadsFolder = Path.Combine(_environment.WebRootPath, "uploads");
            Directory.CreateDirectory(uploadsFolder);

            string uniqueFileName = Path.Combine(uploadsFolder, Path.GetFileName(file.FileName));
            using (FileStream fileStream = new FileStream(uniqueFileName, FileMode.Create))
            {
                await file.CopyToAsync(fileStream);
            }

            return Ok("File uploaded successfully.");
        }
    }
}
