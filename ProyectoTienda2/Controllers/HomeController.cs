using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using System.Diagnostics;

namespace ProyectoTienda2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private RepositoryInfoArte repo;

        public HomeController(ILogger<HomeController> logger, RepositoryInfoArte repo)
        {
            _logger = logger;
            this.repo = repo;
        }

        public IActionResult Index()
        {
            List<InfoArte> infoArtes = this.repo.GetInfoArte();
            return View(infoArtes);
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