using System;
using NoticiasWeb.Models;

namespace NoticiasWeb.Admin.Models.ViewModels
{

    public class EditViewModel
    {

        public Noticia Noticia { get; set; }
        public IEnumerable<Categoria> Categorias { get; set; }
        public IEnumerable<Editor> Editores { get; set; }

    }

}