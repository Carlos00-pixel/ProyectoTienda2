using ProyectoTienda2.Data;
using ProyectoTienda2.Models;

namespace ProyectoTienda2.Repositories
{
    public class RepositoryArtista
    {
        private ProyectoTiendaContext context;

        public RepositoryArtista(ProyectoTiendaContext context)
        {
            this.context = context;
        }

        public Artista DetallesArtista(int idArtista)
        {
            return this.context.Artistas.FirstOrDefault(x => x.IdArtista == idArtista);
        }
    }
}
