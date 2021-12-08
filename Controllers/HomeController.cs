using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Models;
using NoticiasWeb.Models.ViewModels;

namespace NoticiasWeb.Controllers
{

    public class HomeController : Controller
    {

        public NoticiasContext Context { get; }

        public HomeController(NoticiasContext context)
        {
            Context = context;
        }

        [Route("/")]
        [Route("/Home")]
        [Route("/Home/Index")]
        public IActionResult Index(int categoria, string search)
        {
            IndexViewModel vm = new();
            vm.Categoria = Context.Categorias.FirstOrDefault(x => x.Id == categoria);
            vm.Search = search;
            vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
            //
            IQueryable<Noticia> noticias = null;
            if(vm.Categoria == null) {
                noticias = Context.Noticias.OrderByDescending(x => x.Fecha);
            } else {
                noticias = Context.Noticias.Where(x => x.IdCategoria == categoria)
                                              .OrderByDescending(x => x.Fecha);
            }
            //
            if (!string.IsNullOrWhiteSpace(search))
            {
                noticias = noticias.Where(x => EF.Functions.Like(x.Titulo, "%" + search + "%"));
            }
            vm.Noticias = noticias;
            return View(vm);
        }

        [Route("/Ver/{id}")]
        public IActionResult Noticia(string id)
        {
            /*
                El elemento id es el titulo de la noticia.
                Esto es para la comodidad del usuario
            */
            string titulo = id.Replace("-", " ");
            var noticia = Context.Noticias.Include(x => x.IdCategoriaNavigation)
                                          .Include(x => x.IdEditorNavigation)
                                          .FirstOrDefault(x => x.Titulo == titulo);
            // ------------------------------------------------------------------------
            if (noticia == null)
            {
                return RedirectToAction("Index");
            }
            return View(noticia);
        }

    }

}