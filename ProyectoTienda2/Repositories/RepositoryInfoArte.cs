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

        public DatosArtista GetInfoArte()
        {
            DatosArtista datosInfoArte= new DatosArtista();

            var consulta = (from datos in this.context.InfoProductos
                            select datos).OrderByDescending(x => x.IdInfoArte);
            datosInfoArte.listaProductos = consulta.ToList();
            return datosInfoArte;
        }

        public DatosArtista FindInfoArte(int idProducto)
        {
            DatosArtista datosInfoArte = new DatosArtista();

            var consulta = from datos in this.context.InfoProductos
                           where datos.IdInfoArte == idProducto
                           select datos;
            datosInfoArte.infoProducto = consulta.FirstOrDefault();
            return datosInfoArte;
        }

        public DatosArtista GetInfoArteSession(List<int> ids)
        {
            DatosArtista datosInfoArte = new DatosArtista();

            var consulta = from datos in this.context.InfoProductos
                           where ids.Contains(datos.IdInfoArte)
                           select datos;
            if (consulta.Count() == 0)
            {
                return null;
            }
            datosInfoArte.listaProductos = consulta.ToList();
            return datosInfoArte;
        }
    }
}
