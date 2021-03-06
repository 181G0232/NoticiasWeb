using System;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Admin.Models.ViewModels;
using NoticiasWeb.Models;

namespace NoticiasWeb.Admin.Controllers
{

    [Area("Admin")]
    [Authorize]
    public class HomeController : Controller
    {

        public NoticiasContext Context { get; }
        public IWebHostEnvironment Environment { get; }

        public HomeController(NoticiasContext context, IWebHostEnvironment environment)
        {
            Context = context;
            Environment = environment;
        }

        [Route("/Admin")]
        [Route("/Admin/Home")]
        [Route("/Admin/Home/Index")]
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

        [Route("/Admin/New")]
        public IActionResult New()
        {
            EditViewModel vm = new();
            vm.Noticia = new();
            vm.Noticia.Fecha = DateTime.Now;
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
            // La fecha no se valida, se establece
            if (noticia.IdCategoria == 0)
            {
                ModelState.AddModelError("", "Por favor seleccione una categoria");
            }
            else if (noticia.IdEditor == 0)
            {
                ModelState.AddModelError("", "Por favor seleccione un editor");
            }
            else if (string.IsNullOrWhiteSpace(noticia.Titulo))
            {
                ModelState.AddModelError("", "Debe proporcionar un titulo para la noticia");
            }
            else if (string.IsNullOrEmpty(noticia.Contenido))
            {
                ModelState.AddModelError("", "No puede crear una noticia vacia");
            }
            else if (Context.Noticias.Any(x => x.Titulo == noticia.Titulo))
            {
                ModelState.AddModelError("", "Este titulo ya esta siendo utilizado por otra noticia");
            }
            else
            {
                noticia.Fecha = DateTime.Now;
                return true;
            }
            return false;
        }

        [HttpPost]
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
                // -----------------------
                if (image == null)
                {
                    string nophotopath = $"{Environment.WebRootPath}/Images/nophoto.jpg";
                    using FileStream nophotofs = new(nophotopath, FileMode.Open);
                    //
                    string imagepath = $"{Environment.WebRootPath}/Images/{noticia.Id}.jpg";
                    using FileStream imagefs = new(imagepath, FileMode.Create);
                    nophotofs.CopyTo(imagefs);
                }
                if (image != null)
                {
                    if (image.ContentType != "image/jpeg")
                    {
                        ModelState.AddModelError("", "Tiene que ser jpeg prro");
                        return View(noticia);
                    }
                    if (image.Length > 1024 * 1024 * 10)
                    {
                        ModelState.AddModelError("", "La vas a matar prro");
                        return View(noticia);
                    }
                    else
                    {
                        var path = Environment.WebRootPath + "/images/" + noticia.Id + ".jpg";

                        FileStream fs = new FileStream(path, FileMode.Create);
                        image.CopyTo(fs);
                        fs.Close();
                    }
                }
            }
            else
            {
                original.Titulo = noticia.Titulo;
                original.Contenido = noticia.Contenido;
                original.Fecha = noticia.Fecha;
                original.IdCategoria = noticia.IdCategoria;
                original.IdEditor = noticia.IdEditor;
                // --------------------------------
                Context.Update(original);
                Context.SaveChanges();
            }
            // ---------------------------------
            if (image != null)
            {
                string imagepath = $"{Environment.WebRootPath}/Images/{noticia.Id}.jpg";
                using FileStream imagefs = new(imagepath, FileMode.Create);
                image.CopyTo(imagefs);
            }
            // ---------------------------------
            return RedirectToAction("Index");
        }

        [Route("Admin/Delete/{id}")]
        public IActionResult Delete(int id)
        {
            var noticia = Context.Noticias.FirstOrDefault(x => x.Id == id);
            if (noticia == null)
            {
                return RedirectToAction("Index");
            }
            return View(noticia);
        }

        [HttpPost]
        [Route("Admin/Delete")]
        public IActionResult Delete(int? id)
        {
            var noticia = Context.Noticias.FirstOrDefault(x => x.Id == id);
            if (noticia != null)
            {
                Context.Remove(noticia);
                Context.SaveChanges();
            }
            return RedirectToAction("Index");
        }

    }

}