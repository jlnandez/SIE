using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIE.vMaestro
{
    public partial class ReporteConstancia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("Admin"))
            {

            }
            else
            {
                Response.Redirect("~/");
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConstanciaEquivalenciaM");
        }
    }
}