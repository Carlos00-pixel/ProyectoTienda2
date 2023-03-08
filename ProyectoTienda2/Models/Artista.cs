using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoTienda2.Models
{
    [Table("Artista")]
    public class Artista
    {
        [Key]
        [Column("IdArtista")]
        public int IdArtista { get; set; }

        [Column("Nombre")]
        public string Nombre { get; set; }

        [Column("Apellidos")]
        public string Apellidos { get; set; }

        [Column("Nick")]
        public string Nick { get; set; }

        [Column("Descripcion")]
        public string Descripcion { get; set; }

        [Column("Email")]
        public string Email { get; set; }

        [Column("Password")]
        public string Password { get; set; }

        [Column("Imagen")]
        public string Imagen { get; set; }
    }
}
