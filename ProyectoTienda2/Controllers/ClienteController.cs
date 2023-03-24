using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using System.Numerics;
using System.Security.Claims;
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

        public IActionResult ErrorAccesoCliente()
        {
            return View();
        }
    }
}
