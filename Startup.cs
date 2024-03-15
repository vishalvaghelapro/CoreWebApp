using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.IdentityModel.Tokens;
using System.Configuration;
using System.Text;

namespace CoreWebApp
{
    public class Startup
    {
        public IConfiguration configRoot
        {
            get;
        }
        public Startup(IConfiguration configuration)
        {
            configRoot = configuration;

        }
        public void ConfigureServices(IServiceCollection services, WebApplicationBuilder builder)
        {
            var jwtIssuer = builder.Configuration.GetSection("Jwt:Issuer").Get<string>();
            var jwtKey = builder.Configuration.GetSection("Jwt:Key").Get<string>();
            builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = builder.Configuration["Jwt:Issuer"],
                    ValidAudience = builder.Configuration["Jwt:Audience"],

                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))

                };
            });
            //Jwt configuration ends here    
            services.AddMvc()
            .AddSessionStateTempDataProvider();
            services.AddSession();
            services.AddControllersWithViews();

            services.Configure<RazorViewEngineOptions>(o =>
            {
                o.ViewLocationFormats.Clear();
                o.ViewLocationFormats.Add("/Views/{1}/{0}" + RazorViewEngine.ViewExtension);
            });
            services.AddHttpClient();

        }

        public void Configure(WebApplication app, IWebHostEnvironment env)
        {

            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseSession();
            app.Use(async (context, next) =>
            {
                var JWToken = context.Session.GetString("JWToken");
                if (!string.IsNullOrEmpty(JWToken))
                {
                    context.Request.Headers.Add("Authorization", "Bearer " + JWToken);
                }
                await next();
            });
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
                {
                    //endpoints.MapControllerRoute(
                    //name: "default",
                    //pattern: "{controller=Customer}/{action=Customer}"
                    //);

                    //endpoints.MapControllerRoute(
                    // name: "default",
                    // pattern: "{controller=Charts}/{action=Charts}"
                    // );
                    endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Core}/{action=Login}"
                    );
                    endpoints.MapControllerRoute(
                   name: "Home",
                   pattern: "{controller=Home}/{action=Home}"
                    );
                    endpoints.MapControllerRoute(
                    name: "Charts",
                    pattern: "{controller=Charts}/{action=Charts}"
                    );
                    endpoints.MapControllerRoute(
                    name: "Productlist",
                    pattern: "{controller=Product}/{action=Productlist}"
                    );
                    endpoints.MapControllerRoute(
                    name: "Login",
                    pattern: "{controller=Core}/{action=Login}"
                    );
                    endpoints.MapControllerRoute(
                    name: "Registration",
                    pattern: "{controller=Core}/{action=Registration}"
                    );



                }
            );
            app.Run();
        }

    }
}