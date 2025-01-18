using Microsoft.AspNetCore.Mvc;

namespace PortfolioApp.Areas.Admin.Controllers
{
    [Area("Admin")] //admin areasına ait controller demek bu
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
