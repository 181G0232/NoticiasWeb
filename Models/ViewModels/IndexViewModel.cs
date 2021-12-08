using System;

namespace NoticiasWeb.Models.ViewModels
{

    public class IndexViewModel
    {

        public Categoria Categoria { get; set; }
        public string Search { get; set; }
        public IEnumerable<Categoria> Categorias { get; set; }
        public IEnumerable<Noticia> Noticias { get; set; }

    }

}