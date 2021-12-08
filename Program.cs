using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMvc();
builder.Services.AddDbContext<NoticiasContext>(options =>
{
    options.UseMySql("server=localhost;user=root;password=root;database=Noticias", ServerVersion.Parse("10.5.12-mariadb"));
});
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(options => {
                    options.ExpireTimeSpan = TimeSpan.FromMinutes(20);
                    options.SlidingExpiration = true;
                    options.LoginPath = "/Account/Login";
                    options.LogoutPath = "/Home/Index";
                    options.Cookie.Name = "SesionNoticias";
                });

var app = builder.Build();
app.UseFileServer();

app.UseAuthentication();
app.UseAuthorization();

app.MapDefaultControllerRoute();

app.Run();
