using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMvc();

var app = builder.Build();
app.UseFileServer();
app.MapDefaultControllerRoute();
// app.MapGet("/", () => "Hello World!");

app.Run();
