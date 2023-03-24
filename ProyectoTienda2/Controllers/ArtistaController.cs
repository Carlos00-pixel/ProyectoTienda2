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
            DatosArtista artista = this.repo.DetailsArtista(idartista);
            ViewData["CONTARPRODUCT"] = artista.listaProductos.Count;
            return View(artista);
        }
    }
}
