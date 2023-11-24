using BL;
using Microsoft.AspNetCore.Mvc;
using Entities; 

namespace AvengersWebApp.Controllers
{
    public class AvengersController : Controller 
    {
        AvengersBL ABL = new AvengersBL();

        public IActionResult Index()
        {
            List<Avenger> Alist = ABL.getAllAvengers(); // Use the fully qualified type
            return View(Alist);
        }
    }
}
