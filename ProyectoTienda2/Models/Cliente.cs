﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoTienda2.Models
{
    [Table("Cliente")]
    public class Cliente
    {
        [Key]
        [Column("IdCliente")]
        public int IdCliente { get; set; }

        [Column("Nombre")]
        public string Nombre { get; set; }

        [Column("Apellidos")]
        public string Apellidos { get; set; }

        [Column("Email")]
        public string Email { get; set; }

        [Column("Password")]
        public string Password { get; set; }

        [Column("Imagen")]
        public string Imagen { get; set; }
    }
}
