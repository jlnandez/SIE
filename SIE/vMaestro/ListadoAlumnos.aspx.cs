using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIE.vMaestro
{
    public partial class ListadoAlumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MakeGridViewPrinterFriendly(GridView1);
            if (!IsPostBack)
            {
                //cambio GRIDVIEW 
                
            }
        }

        private void MakeGridViewPrinterFriendly(GridView gridView)
        {
            if (gridView.Rows.Count > 0)
            {
                gridView.UseAccessibleHeader = true;
                gridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //asigamos id al dar click seleccionar en gridview
            Session["id"] = GridView1.SelectedRow.Cells[1].Text;
            btnEditar.Enabled = true;

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AlumnoEditar");
        }
    }
}