using Microsoft.EntityFrameworkCore;
using PortfolioApp.Models;
using PortfolioApp.Models.Repositories;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<AppDbContext>(option=>option.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));
// veritabanýmýmýz için bir seçenek oluþturdu
//db context option builder var onu kullanarak oluþturduk þimdi onu appdbcontext sayfasýnda kullanacaðýz
// nesne oluþturduk connection string içeren option oluþturduj

builder.Services.AddScoped<CategoryRepository>();

    // add scoped : söyleyeceðimiz tipte bir nesne yaratacak bunu her istekte yapacak
    //catgory repository tipinde bir nesne yaratýp containerin içine koyucak 

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapAreaControllerRoute( //admin sayfasý için rota oluþturduk
    name: "admin",
    pattern: "admin/{controller=Home}/{action=Index}/{id?}",
    areaName: "Admin"
    );


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");



app.Run();
