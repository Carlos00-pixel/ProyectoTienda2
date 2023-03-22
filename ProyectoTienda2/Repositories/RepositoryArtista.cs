using MvcCryptographyBBDD.Helpers;
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
        public DatosArtista GetArtistas()
        {
            DatosArtista datosArtista = new DatosArtista();

            var consulta = from datos in this.context.Artistas
                           select datos;
            datosArtista.listaArtistas = consulta.ToList();

            return datosArtista;
        }

        public DatosArtista DetailsArtista(int idArtista)
        {
            DatosArtista datosArtista = new DatosArtista();

            var consulta = from datos in this.context.InfoProductos
                           where datos.IdArtista == idArtista
                           select datos;
            datosArtista.listaProductos = consulta.ToList();
            datosArtista.artista = this.context.Artistas.FirstOrDefault(x => x.IdArtista == idArtista);

            return datosArtista;
        }

        private int GetMaximoIdArtista()
        {
            var maximo = (from datos in this.context.Artistas
                          select datos).Max(x => x.IdArtista) + 1;
            return maximo;
        }

        public async Task RegistrarArtistaAsync
            (string nombre, string apellidos, string nick, string descripcion,
            string email, string password, string imagen)
        {
            Artista artista = new Artista();

            int maximo = this.GetMaximoIdArtista();

            artista.IdArtista = maximo;
            artista.Nombre = nombre;
            artista.Apellidos = apellidos;
            artista.Nick = nick;
            artista.Descripcion = descripcion;
            artista.Email = email;
            artista.Salt =
                HelperCryptography.GenerateSalt();
            artista.Password =
                HelperCryptography.EncryptPassword(password, artista.Salt);
            artista.Imagen = imagen;

            this.context.Artistas.Add(artista);

            await this.context.SaveChangesAsync();
        }
    }
}
