using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMvc();
builder.Services.AddDbContext<NoticiasContext>(options =>
{
    options.UseMySql("server=localhost;user=root;password=root;database=Noticias", ServerVersion.Parse("10.5.12-mariadb"));
});

var app = builder.Build();
app.UseFileServer();
app.MapDefaultControllerRoute();

app.Run();
