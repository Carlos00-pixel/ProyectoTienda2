using ProyectoTienda2.Data;
using ProyectoTienda2.Models;
using System.Numerics;

namespace ProyectoTienda2.Repositories
{
    public class RepositoryInfoArte
    {
        private ProyectoTiendaContext context;

        public RepositoryInfoArte(ProyectoTiendaContext context)
        {
            this.context = context;
        }

        public List<InfoArte> GetInfoArte()
        {
            var consulta = (from datos in this.context.InfoArtes
                           join artist in this.context.Artistas
                           on datos.IdArtista equals artist.IdArtista
                           select new
                           {
                               datos.Titulo,
                               datos.Precio,
                               datos.Imagen,
                               artist.Nick
                           });

            List<InfoArte> infoarts = new List<InfoArte>();

            foreach (var row in consulta)
            {
                InfoArte infart = new InfoArte
                {

                    Titulo = row.Titulo,

                    Precio = row.Precio,

                    Imagen = row.Imagen,

                    IdArtista = int.Parse(row.Nick)


                };
                infoarts.Add(infart);
            }
            return infoarts;
        }
    }
}
