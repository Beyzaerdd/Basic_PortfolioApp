namespace PortfolioApp.Areas.Admin.Models
{
    public class AddCategoryViewModel
    {
        // kullanıcıyla etkilişme girdiğimiz yerlerde ona uygun bir modelview tasarlamamız gerekiyıor çünkü burası kullanıcıyla etkilişime giriyor kategorı oluşturacak
        public string? Name { get; set; }
        public string? Description { get; set; }
    }
}
