using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using System.Diagnostics;

namespace ProyectoTienda2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private RepositoryInfoArte repo;
        private IMemoryCache memoryCache;

        public HomeController
            (ILogger<HomeController> logger, RepositoryInfoArte repo, 
            IMemoryCache memoryCache)
        {
            _logger = logger;
            this.repo = repo;
            this.memoryCache = memoryCache;
        }

        public IActionResult Index(int? idfavorito)
        {
            if(idfavorito != null)
            {
                List<InfoProducto> favoritos;
                if(this.memoryCache.Get("FAVORITOS") == null)
                {
                    favoritos = new List<InfoProducto>();
                }
                else
                {
                    favoritos = this.memoryCache.Get<List<InfoProducto>>("FAVORITOS");
                }
                InfoProducto producto = this.repo.FindInfoArte(idfavorito.Value);
                favoritos.Add(producto);
                this.memoryCache.Set("FAVORITOS", favoritos);
            }

            List<InfoProducto> infoArtes = this.repo.GetInfoArte();
            return View(infoArtes);
        }

        public IActionResult ProductosFavoritos()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AgregarFavorito(int id)
        {
            List<int> favoritos = new List<int>();
            if (memoryCache.TryGetValue("FAVORITOS", out object cacheEntry))
            {
                favoritos = (List<int>)cacheEntry;
            }
            favoritos.Add(id);
            memoryCache.Set("FAVORITOS", favoritos);
            return Ok();
        }

        [HttpPost]
        public IActionResult RemoverFavorito(int id)
        {
            List<int> favoritos = new List<int>();
            if (memoryCache.TryGetValue("FAVORITOS", out object cacheEntry))
            {
                favoritos = (List<int>)cacheEntry;
            }
            favoritos.Remove(id);
            memoryCache.Set("FAVORITOS", favoritos);
            return Ok();
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