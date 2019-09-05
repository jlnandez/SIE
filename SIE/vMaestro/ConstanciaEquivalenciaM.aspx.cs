using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIE.vMaestro
{
    public partial class ConstanciaEquivalenciaM : System.Web.UI.Page
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
                //Response.Redirect("~/");
            }

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            //Session["Matricula"] = user.UserName;



            if (!Page.IsPostBack)
            {
                
                MakeGridViewPrinterFriendly(GridView2);
            }
            MakeGridViewPrinterFriendly(GridView2);

        }

        private void MakeGridViewPrinterFriendly(GridView gridView)
        {
            if (gridView.Rows.Count > 0)
            {
                gridView.UseAccessibleHeader = true;
                gridView.HeaderRow.TableSection = TableRowSection.TableHeader;
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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Matricula"] = GridView2.SelectedRow.Cells[5].Text;
            //Buscamos si ya existe la matricula en la BD
            DataView dv = (DataView)ds_carta.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count != 0)
            {
                //Buscamos los datos ya registrados
                string CMA = dv.Table.Rows[0][2].ToString();
                txtCMA.Text = CMA;

                string CC = dv.Table.Rows[0][3].ToString();
                txtCC.Text = CC;

                string valDate = dv.Table.Rows[0][4].ToString();
                if (valDate != "")
                {
                    DateTime date = Convert.ToDateTime(dv.Table.Rows[0][4]);
                    string FechaCreado = date.ToString("yyyy-MM-dd");
                    txtFecha.Text = FechaCreado;
                }

                
            }
            else
            {
                //lo creamos en caso de que no exista
                ds_carta.Insert();


            }dv = null;
                
            GridView2.Visible = false;
            Panel1.Visible = true;
            Panel2.Visible = true;
            
            buscar();
            GridView1.DataBind();
            btnRegresar.Visible = true;


        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            Panel1.Visible = false;
            Panel2.Visible = false;
            Session["Matricula"] = "";
            btnRegresar.Visible = false;
            //GridView1.DataBind();
        }

        protected void btnGenrarConstancia_Click(object sender, EventArgs e)
        {
            ds_carta.Update();
            Response.Redirect("ReporteConstancia");

        }
    }
}