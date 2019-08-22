using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SIE.Startup))]
namespace SIE
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
