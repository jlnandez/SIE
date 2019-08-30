using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIE.vAlumno
{
    public partial class AlumnoEditar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //validacion de sessiones
            string user = (string)(Session["user"]);

            if (Page.IsPostBack)
            {
                //funcionamiento para la session con update data source
            }
            else
            {
                buscar();
            }

        }

        public void buscar()
        {

            //CONEXION BD
            DataView dv = (DataView)ds_alumnos.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count != 0)
            {

                string Matricula = dv.Table.Rows[0][8].ToString();
                txtMatricula.Text = Matricula;
                string Nombre = dv.Table.Rows[0][1].ToString();
                txtNombre.Text = Nombre;
                string Paterno = dv.Table.Rows[0][2].ToString();
                txtApellidoPaterno.Text = Paterno;
                string Materno = dv.Table.Rows[0][3].ToString();
                txtApellidoMaterno.Text = Materno;
                string Carrera = dv.Table.Rows[0][5].ToString();
                ddlCarrera.SelectedValue = Carrera;
                string Ciclo = dv.Table.Rows[0][6].ToString();
                txtCiclo.Text = Ciclo;
                string telefono = dv.Table.Rows[0][7].ToString();
                txtTelefono.Text = telefono;
                string email = dv.Table.Rows[0][9].ToString();
                Email.Text = email;

            }
            else
            {
                // No encontro
                Response.Write("<script type='text/javascript'> alert('Seleccione Alumno a editar.');window.location.href='ListadoAlumnos.aspx';</script>");

            }
            dv = null;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ds_alumnos.Update();
            Response.Redirect("ListadoAlumnos");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoAlumnos");
        }
    }
}