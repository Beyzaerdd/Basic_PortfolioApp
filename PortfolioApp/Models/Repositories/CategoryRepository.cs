using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using PortfolioApp.Areas.Admin.Models;
using PortfolioApp.Models.Entities;

namespace PortfolioApp.Models.Repositories
{
    // veritabanındaki categories tablosuna yapılacak tüm işlemlerle ılgılı operasyonlarımı burada yer alacak kaetgori sil listeleme vb
    public class CategoryRepository
    {
        private readonly AppDbContext _context;

        public CategoryRepository (AppDbContext context) { 
            
            _context = context; 
        
        }   
        //asekron yapılardan faydalınacağız
        //  asekron method hazırlıyoruz
        //multı taskıng programlama yaklaşımı
        // eğer asekron ise geri dönüş tipi Task olmak zorunda
        //asekron olması işlemi bitirmesini bekleyip öyle diğer işleme geçicek
        public async Task<List<Category>> GetAllAsync()
        {
            //MVC'de await Kullanımı
           // Veritabanı İşlemleri: Veri tabanına sorgu atarken uzun sürebileceği için await kullanarak işlemin tamamlanmasını bekleyebiliriz.
            // gelen datayı  liste halinde (Tolistasync) sorgulayıp çekiyoruz
            //Select*from Categories
            List<Category> categories = await _context.Categories.ToListAsync();
            return categories;
        }
        public async Task<List<Category>> GetAllAsync(bool isDeleted)
        { //burada silinenlerin listesini aldık önce linq sorgusu yaptık
            List<Category> categories=
                await _context
                .Categories
                .Where(c=>c.IsDeleted==isDeleted)
                .ToListAsync();  //EXECTUTE EDİLİYOR
            return categories;
        }

        public async Task<Category?> GetByIdAsync(int id,bool isDeleted)
        {
            //silinmemiş veya silinmiş kayıtların içinde arama yapacak
            Category? category = await _context
                .Categories
                .Where(c=>c.IsDeleted==isDeleted && c.Id==id)
                 .FirstOrDefaultAsync(); //TEK SATIRLIK DATA
            return category;
           
            
            // id çekiyoruz neden soru işareti koyduk boş olabilir diye findAsync tablolardakı primary key ile işlem yapar bizim primary keyimiz idler
        }

        public async Task<Category?> GetByIdAsync(int id)
        {

            Category? category=await _context
                .Categories
                .FindAsync(id);
            return category;
        }

        public async Task CreateAsync(AddCategoryViewModel addCategoryViewModel)
        {

            Category category = new() //category nesnesi oluşturduk
            {
                //catgory tipinde bir datamız var
                Name = addCategoryViewModel.Name,
                Description = addCategoryViewModel.Description
            };
            await _context.Categories.AddAsync(category); //insert into aynı anlama geliyor daha kaydetmedi kaydetmek üzere bekliyor şuan ekleme güncelleme silme operasyonlarında kaydetme işlemini bekliyor 
            await _context.SaveChangesAsync(); //şuan burada kaydetme yaptı
        
        }

        public async Task UpdateAsync(UpdateCategoryViewModel updateCategoryViewModel)
        {
            Category? updatedCategory=await GetByIdAsync(updateCategoryViewModel.Id);
            updatedCategory.Name= updateCategoryViewModel.Name;
            updatedCategory.Description= updateCategoryViewModel.Description;
            updatedCategory.UpdatedAt= DateTime.Now;
            _context.Categories.Update(updatedCategory);
            await _context.SaveChangesAsync();
            //burada güncellecek bilgileri alıp kaydettik
        }
        public async Task SoftDeleteAsync(int id)
        {
            Category? category= await GetByIdAsync(id);
            category.IsDeleted=!category.IsDeleted; //true ise false oldu false ise true oldu silinenler
           _context.Update(category);
            await _context.SaveChangesAsync();
        }

        public async Task HardDeleteAsync(int id)
        {
            Category? category = await GetByIdAsync(id);
            _context.Remove(category);
            await _context.SaveChangesAsync();


        }
    }
}
