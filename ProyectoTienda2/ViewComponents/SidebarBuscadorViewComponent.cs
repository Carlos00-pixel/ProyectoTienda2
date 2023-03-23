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

        private DatosArtista ObtenerArtistas()
        {
            DatosArtista artistas;
            artistas = this.repo.GetArtistas();
            return artistas;
        }

        //public async Task<IViewComponentResult> InvokeAsync()
        //{
        //    var datos = ObtenerArtistas(); // Aquí se obtienen los datos necesarios para la vista parcial

        //    var resultado = new PartialViewResult
        //    {
        //        ViewName = "_buscador", // Aquí se especifica el nombre de la vista parcial
        //        ViewData = new ViewDataDictionary<IEnumerable<DatosArtista>>(ViewData, datos) // Aquí se configura el modelo de la vista parcial
        //    };

        //    return (IViewComponentResult)await Task.FromResult(resultado); // Aquí se devuelve la vista parcial
        //}

    }
}
