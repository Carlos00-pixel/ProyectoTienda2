using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoTienda2.Models
{
    [Table("Cliente")]
    public class Cliente
    {
        [Key]
        [Column("IdCliente")]
        public int IDCliente { get; set; }

        [Column("IdCliente")]
        public string Nombre { get; set; }

        [Column("Apellidos")]
        public string Apellidos { get; set; }

        [Column("Email")]
        public string Email { get; set; }

        [Column("Contraseña")]
        public string Password { get; set; }
    }
}
