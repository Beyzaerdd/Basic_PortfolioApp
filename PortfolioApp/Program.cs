using Microsoft.EntityFrameworkCore;
using PortfolioApp.Models;
using PortfolioApp.Models.Repositories;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<AppDbContext>(option=>option.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection")));
// veritaban�m�m�z i�in bir se�enek olu�turdu
//db context option builder var onu kullanarak olu�turduk �imdi onu appdbcontext sayfas�nda kullanaca��z
// nesne olu�turduk connection string i�eren option olu�turduj

builder.Services.AddScoped<CategoryRepository>();

    // add scoped : s�yleyece�imiz tipte bir nesne yaratacak bunu her istekte yapacak
    //catgory repository tipinde bir nesne yarat�p containerin i�ine koyucak 

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

app.MapAreaControllerRoute( //admin sayfas� i�in rota olu�turduk
    name: "admin",
    pattern: "admin/{controller=Home}/{action=Index}/{id?}",
    areaName: "Admin"
    );


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");



app.Run();
