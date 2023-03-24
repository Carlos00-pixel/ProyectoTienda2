using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;
using System.Security.Claims;
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
            var imagenDeFondo = HttpContext.Session.GetString("imagenDeFondo");
            ViewData["IMAGENFONDO"] = imagenDeFondo;
            DatosArtista artista = this.repo.DetailsArtista(idartista);
            ViewData["CONTARPRODUCT"] = artista.listaProductos.Count;
            return View(artista);
        }

        public IActionResult PerfilArtista(int idartista)
        {
            DatosArtista artista = this.repo.DetailsArtista(idartista);
            return View(artista);
        }

        [HttpPost]
        public async Task<IActionResult> PerfilArtista
            (int idartista, string? nombre, string? apellidos, string? nick, string? descripcion,
            string? email, string? password, string? imagen)
        {
            idartista = int.Parse(HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            await this.repo.PerfilArtista
                (idartista, nombre, apellidos, nick, descripcion,
                email, password, imagen);

            return View();
        }
    }
}
