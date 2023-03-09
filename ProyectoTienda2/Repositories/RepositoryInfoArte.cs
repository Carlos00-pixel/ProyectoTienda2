﻿using ProyectoTienda2.Data;
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
    }
}
