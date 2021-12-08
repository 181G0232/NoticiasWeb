using System;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using NoticiasWeb.Models;

namespace NoticiasWeb.Controllers {

    public class AccountController : Controller {
        
        public NoticiasContext Context { get; }

        public AccountController(NoticiasContext context)
        {
            Context = context;
        }

        [Route("Account/Login")]
        public IActionResult Login() {
            return View();
        }

        string GetHash(string password) {
            var algorithm = SHA256.Create();
            var passwordbytes = Encoding.UTF8.GetBytes(password);
            var hashbytes = algorithm.ComputeHash(passwordbytes);
            StringBuilder hash = new();
            foreach(var @byte in hashbytes) {
                hash.Append(@byte.ToString("X2"));
            }
            return hash.ToString();
        }

        [HttpPost]
        [Route("Account/Login")]
        public async Task<IActionResult> Login(string username, string password) {
            var user = Context.Administradores.FirstOrDefault(x => x.Nombre == username);
            if(user != null) {
                // var hash = GetHash(password);
                if(user.Contrasena.ToUpper() == password.ToUpper()) {
                    List<Claim> claims = new();
                    claims.Add(new(ClaimTypes.Name, "Admin"));
                    claims.Add(new(ClaimTypes.Role, "Admin"));
                    //
                    ClaimsIdentity identidad = new(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    await HttpContext.SignInAsync(new ClaimsPrincipal(identidad));
                    //
                    return RedirectToAction("Index", "Home", new { area = "Admin" });
                }
            }
            //
            ModelState.AddModelError("","Usuario o contraseña incorrectos");
            return View();
        }

    }

}