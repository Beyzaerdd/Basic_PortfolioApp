using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PortfolioApp.Models;
using PortfolioApp.Models.Entities;

namespace PortfolioApp.Controllers;

public class HomeController : Controller
{


  

    public IActionResult Index()
    {

       




   return View();
    }
}

///***LÝNQ SORGULARI****/
//LINQ : LANGUAGE Integrated NO-QUERY : o anki kullandýðýnýz dile entegre edilmiþ sorgulama dili
//Siz dizimi(syntax):
//1)Query Syntax
//2)Method syntaxx


/*     Query Syntax
 * var result = from item in collection 
 *              where.item.Price>100
 *              orderby item.Price
 *              select item;

2)     Method syntax
     var result=collection
                        .Where(item=> item.price>100)
                        .orderby(item=>item.name)
                        .select(item=>item);








*/

//var categories = new List<Category>() {


//         new  Category {Id=1,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//         new  Category {Id=2,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//         new  Category {Id=3,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//         new  Category {Id=4,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=false},
//         new  Category {Id=5,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//       new  Category {Id=6,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//           new  Category {Id=7,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//       new  Category {Id=8,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=false},
//      new  Category {Id=9,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=true},
//        new  Category {Id=10,Name="kategori1" , Description="kategori1 açýklamasý" , IsDeleted=false},
//   };


//1)QUERY SYNTAX
/*    var unDeletedCategories = from Category in categories
                              where Category.IsDeleted == false
                              select Category;

 */

// 2) METHOD SYNTAX

//  var unDeletedCategories = categories.Where(c => c.IsDeleted = false).ToList();
