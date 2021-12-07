using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Admin.Models.ViewModels;
using NoticiasWeb.Models;

namespace NoticiasWeb.Admin.Controllers
{

    [Area("Admin")]
    public class HomeController : Controller
    {

        public NoticiasContext Context { get; }

        public HomeController(NoticiasContext context)
        {
            Context = context;
        }

        [Route("/Admin")]
        [Route("/Admin/Home")]
        [Route("/Admin/Home/Index")]
        public IActionResult Index(string search)
        {
            IndexViewModel vm = new();
            vm.Search = search;
            vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
            if (string.IsNullOrWhiteSpace(search))
            {
                vm.Noticias = Context.Noticias.OrderByDescending(x => x.Fecha);
            }
            else
            {
                vm.Noticias = Context.Noticias.Where(x => EF.Functions.Like(x.Titulo, "%" + search + "%"))
                                              .OrderByDescending(x => x.Fecha);
            }
            return View(vm);
        }

        [Route("/Admin/New")]
        public IActionResult New()
        {
            EditViewModel vm = new();
            vm.Noticia = new();
            vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
            vm.Editores = Context.Editores.OrderBy(x => x.Nombre);
            return View("Edit", vm);
        }

        [Route("/Admin/Edit/{id}")]
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
            vm.Editores = Context.Editores.OrderBy(x => x.Nombre);
            return View(vm);
        }

        public bool Validate(Noticia noticia)
        {
            if (string.IsNullOrWhiteSpace(noticia.Titulo))
            {
                ModelState.AddModelError("", "Debe proporcionar un titulo para la noticia");
            }
            else
            {
                return true;
            }
            return false;
        }

        [Route("/Admin/Save")]
        public IActionResult Save(Noticia noticia, IFormFile image)
        {
            if (!Validate(noticia))
            {
                EditViewModel vm = new();
                vm.Categorias = Context.Categorias.OrderBy(x => x.Nombre);
                vm.Editores = Context.Editores.OrderBy(x => x.Nombre);
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
                original.Titulo = noticia.Titulo;
                // --------------------------------
                Context.Update(original);
                Context.SaveChanges();
            }
            // ---------------------------------
            // Guardar la imagen aqui
            // ---------------------------------
            return RedirectToAction("Index");
        }

    }

}