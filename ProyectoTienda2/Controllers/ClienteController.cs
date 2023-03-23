using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using static System.Net.Mime.MediaTypeNames;

namespace ProyectoTienda2.Controllers
{
    public class ClienteController : Controller
    {
        private RepositoryCliente repo;

        public ClienteController(RepositoryCliente repo)
        {
            this.repo = repo;
        }

        public IActionResult RegisterCliente()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> RegisterCliente
            (string nombre, string apellidos, string email, string password, string imagen)
        {
            await this.repo.RegistrarClienteAsync
                (nombre, apellidos, email, password, imagen);
            ViewData["MENSAJE"] = "Usuario registrado correctamente";
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string email, string password)
        {
            DatosArtista user = this.repo.LogInUser(email, password);
            if (user == null)
            {
                ViewData["MENSAJE"] = "Credenciales incorrectas";
                return View();

            }
            else
            {
                HttpContext.Session.SetString("USUARIO", email);
                HttpContext.Session.SetString("PASS", password);
                return RedirectToAction("Index", "Home");
            }
        }
        public IActionResult CerrarSesion()
        {
            HttpContext.Session.Remove("USUARIO");
            HttpContext.Session.Remove("PASS");
            return RedirectToAction("Index", "Home");
        }
    }
}
