using System;
using System.Collections.Generic;

namespace NoticiasWeb.Models
{
    public partial class Categoria
    {
        public Categoria()
        {
            Noticias = new HashSet<Noticia>();
        }

        public int Id { get; set; }
        public string? Nombre { get; set; }

        public virtual ICollection<Noticia> Noticias { get; set; }
    }
}
