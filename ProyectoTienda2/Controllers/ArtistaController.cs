using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using static System.Net.Mime.MediaTypeNames;

namespace ProyectoTienda2.Controllers
{
    public class ArtistaController : Controller
    {
        private RepositoryArtista repo;

        public ArtistaController(RepositoryArtista repo)
        {
            this.repo = repo;
        }

        public IActionResult DetallesArtista(int idartista)
        {
            DatosArtista artista = this.repo.DetailsArtista(idartista);
            return View(artista);
        }

        public IActionResult RegisterArtista()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> RegisterArtista
            (string nombre, string apellidos, string nick, string descripcion,
            string email, string password, string imagen)
        {
            await this.repo.RegistrarArtistaAsync
                (nombre, apellidos, nick, descripcion,
                email, password, imagen);
            ViewData["MENSAJE"] = "Usuario registrado correctamente";
            return View();
        }
    }
}
