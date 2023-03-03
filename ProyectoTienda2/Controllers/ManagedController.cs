using Microsoft.AspNetCore.Mvc;

namespace ProyectoTienda2.Controllers
{
    public class ManagedController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }

        public IActionResult RegisterArtista()
        {
            return View();
        }

        public IActionResult RegisterCliente()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RegisterCliente
            (string nombre, string apellidos, string email, string password)
        {
            return View();
        }
    }
}
