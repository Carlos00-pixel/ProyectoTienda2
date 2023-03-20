using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Extensions;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using System.Diagnostics;

namespace ProyectoTienda2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private RepositoryInfoArte repo;

        public HomeController
            (ILogger<HomeController> logger, RepositoryInfoArte repo)
        {
            _logger = logger;
            this.repo = repo;
        }

        public IActionResult Index(int? idfavorito)
        {
            if(idfavorito != null)
            {
                List<int> favoritos;
                if(HttpContext.Session.GetObject<List<int>>("FAVORITOS") == null)
                {
                    favoritos = new List<int>();
                }
                else
                {
                    favoritos = HttpContext.Session.GetObject<List<int>>("FAVORITOS");
                }
                favoritos.Add(idfavorito.Value);
                HttpContext.Session.SetObject("FAVORITOS", favoritos);
            }

            List<InfoProducto> infoArtes = this.repo.GetInfoArte();
            return View(infoArtes);
        }

        public IActionResult ProductosFavoritos(int? ideliminar)
        {
            List<int> idsFavoritos =
                HttpContext.Session.GetObject<List<int>>("FAVORITOS");
            if (idsFavoritos == null)
            {
                ViewData["MENSAJE"] = "No existen favoritos almacenados";
                return View();
            }
            else
            {
                if (ideliminar != null)
                {
                    idsFavoritos.Remove(ideliminar.Value);
                    if (idsFavoritos.Count == 0)
                    {
                        HttpContext.Session.Remove("FAVORITOS");
                    }
                    else
                    {
                        HttpContext.Session.SetObject("FAVORITOS", idsFavoritos);
                    }
                }
                List<InfoProducto> infoArtes = this.repo.GetInfoArteSession(idsFavoritos);
                return View(infoArtes);
            }
        }

        public IActionResult Details(int idproducto)
        {
            InfoProducto infoProduct = this.repo.FindInfoArte(idproducto);
            return View(infoProduct);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}