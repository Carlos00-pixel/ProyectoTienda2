using Microsoft.EntityFrameworkCore;
using MvcCryptographyBBDD.Helpers;
using ProyectoTienda2.Data;
using ProyectoTienda2.Models;

namespace ProyectoTienda2.Repositories
{
    public class RepositoryCliente
    {
        private ProyectoTiendaContext context;

        public RepositoryCliente(ProyectoTiendaContext context)
        {
            this.context = context;
        }
        private int GetMaximoIdCliente()
        {
            var maximo = (from datos in this.context.Clientes
                          select datos).Max(x => x.IdCliente) + 1;
            return maximo;
        }

        public async Task RegistrarClienteAsync
            (string nombre, string apellidos, string email, string password, string imagen)
        {
            Cliente cliente = new Cliente();

            int maximo = this.GetMaximoIdCliente();

            cliente.IdCliente = maximo;
            cliente.Nombre = nombre;
            cliente.Apellidos = apellidos;
            cliente.Email = email;
            cliente.Salt =
                HelperCryptography.GenerateSalt();
            cliente.Password =
                HelperCryptography.EncryptPassword(password, cliente.Salt);
            cliente.Imagen = imagen;

            this.context.Clientes.Add(cliente);

            await this.context.SaveChangesAsync();
        }

        //public DatosArtista LogInUser(string email, string password)
        //{
        //    DatosArtista user = new DatosArtista();
        //    user.cliente = this.context.Clientes.FirstOrDefault(z => z.Email == email);
        //    if (user == null)
        //    {
        //        return null;
        //    }
        //    else
        //    {
        //        byte[] passUsuario = user.cliente.Password;
        //        string salt = user.cliente.Salt;
        //        byte[] temp =
        //            HelperCryptography.EncryptPassword(password, salt);
        //        bool respuesta =
        //            HelperCryptography.CompareArrays(passUsuario, temp);
        //        if (respuesta == true)
        //        {
        //            return user;
        //        }
        //        else
        //        {
        //            return null;
        //        }
        //    }
        //}
        public async Task<Cliente> ExisteCliente
            (string email, string password)
        {
            Cliente cliente = new Cliente();
            string salt = cliente.Salt;
            var usuario = await this.context.Clientes.Where
                (x => x.Email == email && x.Password ==
                HelperCryptography.EncryptPassword(password, salt)).FirstOrDefaultAsync();
            return usuario;
        }
    }
}
