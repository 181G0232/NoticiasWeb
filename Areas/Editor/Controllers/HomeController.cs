using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Editor.Models.ViewModels;
using NoticiasWeb.Models;

namespace NoticiasWeb.Editor.Controllers
{

    [Area("Editor")]
    public class HomeController : Controller
    {

        public NoticiasContext Context { get; }

        public HomeController(NoticiasContext context)
        {
            Context = context;
        }

        public IActionResult Index(string search)
        {
            IndexViewModel vm = new();
            vm.Noticias = Context.Noticias.OrderByDescending(x => x.Fecha);
            return View(vm);
        }

        public IActionResult New()
        {
            EditViewModel vm = new();
            vm.Noticia = new();
            vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
            return View("Edit", vm);
        }

        public IActionResult Edit(int id)
        {
            var noticia = Context.Noticias.Include(x => x.IdCategoriaNavigation)
                                          .Include(x => x.IdEditorNavigation)
                                          .FirstOrDefault(x => x.Id == id);
            if (noticia == null)
            {
                return RedirectToAction("Index");
            }
            // -------------------------------------------------------------------
            EditViewModel vm = new();
            vm.Noticia = noticia;
            vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
            return View(vm);
        }

        public bool Validate(Noticia noticia)
        {
            /*
                if(...) {
                    ModelState.AddModelError("","Mensaje");
                }
                ....
                else {
                    return true;
                }
            */
            return false;
        }

        public IActionResult Save(Noticia noticia, IFormFile image)
        {
            if (!Validate(noticia))
            {
                EditViewModel vm = new();
                vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
                return View("Edit", vm);
            }
            // ----------------------------------------------------------------------
            var original = Context.Noticias.Include(x => x.IdCategoriaNavigation)
                                           .Include(x => x.IdEditorNavigation)
                                           .FirstOrDefault(x => x.Id == noticia.Id);
            if (original == null)
            {
                Context.Add(noticia);
                Context.SaveChanges();
            }
            else
            {
                // original.xxx = noticia.xxx;
                Context.Update(original);
                Context.SaveChanges();
            }
            return RedirectToAction("Index");
        }

    }

}