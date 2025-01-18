using Microsoft.AspNetCore.Mvc;
using PortfolioApp.Models.Repositories;

namespace PortfolioApp.Areas.Admin.Controllers
{
    [Area("admin")]
    public class CategoryController : Controller
    {

        private readonly CategoryRepository _categoryRepository; //field tanımladık
        public CategoryController(CategoryRepository categoryRepository) // const method ve içine CategoryRepository tipinde categoryRepository aldık 
        {


            _categoryRepository = categoryRepository; //dışarıda tanımladığımız o alanı dolduruyoruz
        }
        public async Task<IActionResult> Index()
        {
            var categories = await _categoryRepository.GetAllAsync(false);
            return View(categories);
        }

        //Create , create(post), edit edit(post), softdelete, harddelete işlemleri





    }
}
