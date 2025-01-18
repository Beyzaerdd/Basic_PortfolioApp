using Microsoft.AspNetCore.Mvc;
using PortfolioApp.Models.Repositories;

namespace PortfolioApp.Controllers
{
    public class ProjectController : Controller
    {
        private readonly CategoryRepository _categoryRepository; //containere koyduðun nesneyi verdik
        public ProjectController (CategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        public async Task<ActionResult> Index()
        { //silinmemiþleri göster
            var categories = await _categoryRepository.GetAllAsync(false);
            return View();
        }

    }
}
