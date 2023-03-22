using Microsoft.AspNetCore.Mvc;
using ProyectoTienda2.Models;
using ProyectoTienda2.Repositories;

namespace ProyectoTienda2.ViewComponents
{
    public class SidebarBuscadorViewComponent
    {
        [ViewComponent(Name = "SidebarBuscador")]
        public class MenuDepartamentosViewComponent : ViewComponent
        {
            private RepositoryArtista repo;

            public MenuDepartamentosViewComponent(RepositoryArtista repo)
            {
                this.repo = repo;
            }

            public async Task<IViewComponentResult> InvokeAsync()
            {
                DatosArtista artistas = this.repo.GetArtistas();
                return View(artistas);
            }
        }
    }
}
