using System;
using Microsoft.AspNetCore.Mvc;

namespace PortfolioApp.Controllers;

public class ServiceController : Controller
{
    public ActionResult Index()
    {
        return View();
    }
}
