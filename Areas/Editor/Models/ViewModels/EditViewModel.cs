using System;
using NoticiasWeb.Models;

namespace NoticiasWeb.Editor.Models.ViewModels
{

    public class EditViewModel
    {

        public Noticia Noticia { get; set; }
        public IEnumerable<Categoria> Categorias { get; set; }

    }

}