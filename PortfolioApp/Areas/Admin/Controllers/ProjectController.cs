using Microsoft.AspNetCore.Mvc;

namespace PortfolioApp.Areas.Admin.Controllers
{
    public class ProjectController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
