using Microsoft.EntityFrameworkCore;
using ProyectoTienda2.Models;

namespace ProyectoTienda2.Data
{
    public class ProyectoTiendaContext: DbContext
    {
        public ProyectoTiendaContext
            (DbContextOptions<ProyectoTiendaContext> options)
            : base(options) { }

        public DbSet<Cliente> Clientes { get; set; }
    }
}
