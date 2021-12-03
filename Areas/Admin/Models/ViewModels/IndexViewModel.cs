using System;
using NoticiasWeb.Models;

namespace NoticiasWeb.Admin.Models.ViewModels
{

    public class IndexViewModel
    {

        public IEnumerable<Noticia> Noticias { get; set; }

    }

}