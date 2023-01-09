using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace OnShop.Controllers
{
    public class HomeController : Controller
    {

       
        public IActionResult Index()
        {
            return View();
        }
    }
}
