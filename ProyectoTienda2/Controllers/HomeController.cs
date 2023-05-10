using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Extensions;
using ProyectoTienda2.Filters;
using PyoyectoNugetTienda;
using ProyectoTienda2.Repositories;
using System.Diagnostics;
using System.Security.Claims;

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
            DatosArtista infoArtes = this.repo.GetInfoArte();
            return View(infoArtes);
        }

        [AuthorizeUsuarios]
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
                DatosArtista infoArtes = this.repo.GetInfoArteSession(idsFavoritos);
                return View(infoArtes);
            }
        }

        public IActionResult Details(int idproducto)
        {
            DatosArtista infoProduct = this.repo.FindInfoArte(idproducto);
            return View(infoProduct);
        }

        public IActionResult NuevoProducto()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> NuevoProducto
            (string titulo, int precio, string descripcion, string imagen, int idartista)
        {
            idartista = int.Parse(HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            await this.repo.AgregarProductoAsync(titulo, precio, descripcion, imagen, idartista);
            return RedirectToAction("Index");
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