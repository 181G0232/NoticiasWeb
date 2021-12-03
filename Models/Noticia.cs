using System;
using System.Collections.Generic;

namespace NoticiasWeb.Models
{
    public partial class Noticia
    {
        public int Id { get; set; }
        public int IdCategoria { get; set; }
        public int IdEditor { get; set; }
        public string Titulo { get; set; } = null!;
        public DateTime Fecha { get; set; }
        public string Contenido { get; set; } = null!;

        public virtual Categoria IdCategoriaNavigation { get; set; } = null!;
        public virtual Editor IdEditorNavigation { get; set; } = null!;
    }
}
