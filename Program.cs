using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using NoticiasWeb.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMvc();
builder.Services.AddDbContext<NoticiasContext>();
builder.Services.AddDbContext<NoticiasContext>(options => {
    options.UseMySql(ServerVersion.AutoDetect("server=localhost;user=root;password=root;database=noticias"));
});

var app = builder.Build();
app.UseFileServer();
app.MapDefaultControllerRoute();

app.Run();
