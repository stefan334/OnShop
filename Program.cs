using Microsoft.AspNetCore.Authentication;

using OnShop.Services;
using System.Security.Claims;

using OnShop.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddScoped<IDbService, DbService>();
builder.Services.AddScoped<IUtilizatorService, UtilizatorService>();
builder.Services.AddScoped<IProdusService, ProdusService>();
builder.Services.AddAuthentication().AddCookie("default", options =>
{
    options.Cookie.Name = "onShop_cookie";
    options.Cookie.SameSite = SameSiteMode.Strict;
});
var app = builder.Build();

var cookiePolicyOptions = new CookiePolicyOptions
{
    MinimumSameSitePolicy = SameSiteMode.Strict,
};

// Configure the HTTP request pipeline.

app.UseStaticFiles();
app.UseHttpsRedirection();
app.UseCookiePolicy(cookiePolicyOptions);
app.UseAuthentication();
app.UseAuthorization();


app.MapPost("/login", async (HttpContext ctx) =>
{

    var scope = app.Services.CreateScope();
    var service = scope.ServiceProvider.GetService<IUtilizatorService>();
    

    string email = ctx.Request.Headers.FirstOrDefault(x => x.Key == "email").Value
                                      .FirstOrDefault() ?? "";
    string password = ctx.Request.Headers.FirstOrDefault(x => x.Key == "password").Value.FirstOrDefault() ?? "";

    Utilizator user = await service.GetUtilizatorByEmail(email);

    if(user != null && user.parola == password)
    {
        await ctx.SignInAsync("default", new ClaimsPrincipal(

                  new ClaimsIdentity(
                      new Claim[]
                      {
                        new Claim(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()),
                      },
                      "default"
                      )
                  
                  ), new AuthenticationProperties()
                  {
                      IsPersistent = true
                  });

    }
   
    return true;
});

app.MapPost("/register", async (HttpContext ctx) =>
{

    var scope = app.Services.CreateScope();
    var service = scope.ServiceProvider.GetService<IUtilizatorService>();

    Utilizator utilizator = new Utilizator();
    utilizator.rol = "inregistrat";
    utilizator.email = ctx.Request.Headers.FirstOrDefault(x => x.Key == "email").Value;
    utilizator.parola = ctx.Request.Headers.FirstOrDefault(x => x.Key == "parola").Value;
    utilizator.prenume = ctx.Request.Headers.FirstOrDefault(x => x.Key == "prenume").Value;
    utilizator.nume = ctx.Request.Headers.FirstOrDefault(x => x.Key == "nume").Value;
    utilizator.username = ctx.Request.Headers.FirstOrDefault(x => x.Key == "username").Value;
    bool registered = await service.CreateUtilizator(utilizator);

    await ctx.SignInAsync("default", new ClaimsPrincipal(

                  new ClaimsIdentity(
                      new Claim[]
                      {
                        new Claim(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()),
                      },
                      "default"
                      )

                  ), new AuthenticationProperties()
                  {
                      IsPersistent = true
                  });

    

    return registered;
});

app.MapGet("/logout", async (HttpContext ctx) =>
{

   
        await ctx.SignOutAsync("default", 
            new AuthenticationProperties()
            {
                IsPersistent=true
            }
                  );

    

    return true;
});


app.MapControllers();

app.Run();
