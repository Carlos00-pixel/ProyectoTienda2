using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;

namespace ProyectoTienda2.Controllers
{
    public class ManagedController : Controller
    {
        private RepositoryCliente repo;

        public ManagedController(RepositoryCliente repo)
        {
            this.repo = repo;
        }

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
        public async Task<IActionResult> RegisterCliente
            (Cliente client)
        {
            await this.repo.RegistrarClienteAsync
                (client.Nombre, client.Apellidos, client.Email, client.Password);
            return RedirectToAction("Index", "Home");
        }
    }
}
