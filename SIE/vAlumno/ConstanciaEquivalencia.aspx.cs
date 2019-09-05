using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SIE.vAlumno
{
    public partial class ConstanciaEquivalencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.User.IsInRole("Admin"))
            {

            }
            if (HttpContext.Current.User.IsInRole("Alumno"))
            {

            }
            else
            {
                Response.Redirect("~/");
            }

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            Session["Matricula"] = user.UserName;



            if (!Page.IsPostBack)
            {
                buscar();

            }
            else
            {
     
            }

        }

        public void buscar()
        {

            //CONEXION BD
            DataView dv = (DataView)ds_alumnos.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count != 0)
            {

                string nombre = dv.Table.Rows[0][0].ToString();
                string paterno = dv.Table.Rows[0][1].ToString();
                string materno = dv.Table.Rows[0][2].ToString();
                txtAlumno.Text = nombre + " " + paterno + " " + materno;

                string matricula = dv.Table.Rows[0][3].ToString();
                txtMatricula.Text = matricula;

                string ciclo = dv.Table.Rows[0][4].ToString();
                txtCiclo.Text = ciclo;

                string carrera = dv.Table.Rows[0][7].ToString();
                txtCarrera.Text = carrera;

                string uniDest = dv.Table.Rows[0][6].ToString();
                txtUniDestino.Text = uniDest;




                //string Carrera = dv.Table.Rows[0][5].ToString();
                //ddlCarrera.SelectedValue = Carrera;


            }
            else
            {
                // No encontro
                Response.Write("<script type='text/javascript'> alert('Seleccione Alumno a editar.');window.location.href='ListadoAlumnos.aspx';</script>");

            }
            dv = null;

        }

        protected void btnGuardarMateria_Click(object sender, EventArgs e)
        {
            
            ds_materias.Insert();
            GridView1.DataBind();

        }



    }
}