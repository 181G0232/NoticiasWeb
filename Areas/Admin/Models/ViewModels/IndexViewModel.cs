using System;
using NoticiasWeb.Models;

namespace NoticiasWeb.Admin.Models.ViewModels
{

    public class IndexViewModel
    {

        public Categoria Categoria { get; set; }
        public string Search { get; set; }
        public IEnumerable<Categoria> Categorias { get; set; }
        public IEnumerable<Noticia> Noticias { get; set; }

    }

}