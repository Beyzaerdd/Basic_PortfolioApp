using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using PortfolioApp.Models.Entities;

namespace PortfolioApp.Models
{
    public class AppDbContext : DbContext
    {

        public AppDbContext(DbContextOptions<AppDbContext>options) : base(options) { }
        // operasyonların yapıldığı yer burası
        //optionu burdan aldık ve dbcontexte verdik
       

        #region Dbset:

        public DbSet<About> Abouts { get; set; } // veritabının da abouts diye bir tablo var, o tablodaki kolonlar aboutun içerisindekiler olacak demiş oluyoruz.,
        public DbSet<Category> Categories { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<HomeBanner> HomeBanners { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Service> Services { get; set; }

        public DbSet<ServiceInfo> ServiceInfos { get; set; }
        public DbSet<Setting> Settings { get; set; }

        public DbSet<SocialMediaAccount> SocialMediaAccounts { get; set; }
        #endregion


    }
}