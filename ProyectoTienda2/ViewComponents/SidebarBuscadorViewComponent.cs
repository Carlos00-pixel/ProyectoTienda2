using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
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
                artistas = this.repo.GetArtistas();
            return View(artistas);
        }

    }
}
