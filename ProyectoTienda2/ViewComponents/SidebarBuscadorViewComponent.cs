using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;

namespace ProyectoTienda2.ViewComponents
{
    [ViewComponent(Name = "SidebarBuscador")]
    public class SidebarBuscadorViewComponent : ViewComponent
    {
        private RepositoryArtista repo;

        public SidebarBuscadorViewComponent(RepositoryArtista repo)
        {
            this.repo = repo;
        }

        public async Task<IViewComponentResult> InvokeAsync(string query)
        {
            DatosArtista artistas;
            if (!string.IsNullOrEmpty(query))
            {
                artistas = this.repo.BuscarArtistas(query);
            }
            else
            {
                artistas = this.repo.GetArtistas();
            }
            return View(artistas);
        }
    }
}
