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
        public IActionResult Index()
        {
            IndexViewModel vm = new();
            vm.Noticias = Context.Noticias.OrderByDescending(x => x.Fecha);
            return View(vm);
        }

        [Route("/Ver/{id}")]
        public IActionResult Noticia(string id)
        {
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