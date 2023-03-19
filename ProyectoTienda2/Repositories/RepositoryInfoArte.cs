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

        public List<InfoProducto> GetInfoArte()
        {
            var consulta = from datos in this.context.InfoProductos
                           select datos;
            return consulta.ToList();
        }

        public InfoProducto FindInfoArte(int idProducto)
        {
            var consulta = from datos in this.context.InfoProductos
                           where datos.IdInfoArte == idProducto
                           select datos;
            return consulta.FirstOrDefault();
        }

        public List<InfoProducto> GetInfoArteSession(List<int> ids)
        {
            var consulta = from datos in this.context.InfoProductos
                           where ids.Contains(datos.IdInfoArte)
                           select datos;
            if (consulta.Count() == 0)
            {
                return null;
            }
            return consulta.ToList();
        }
    }
}
