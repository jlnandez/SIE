using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add
using System.IO;

namespace SIE.vAlumno
{
    public partial class DocumentosSubir : System.Web.UI.Page
    {
        string user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (String)(Session["Matricula"]);



            /////////////////////////////////////////////////////////
            //VALIDACION DE ARCHIVOS EN SERVIDOR
            ////////////AVION
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/avion.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                fileUavion.Visible = false;
                btnUploadAvion.Visible = false;
                btnBorrarAvion.Visible = true;
                logolistoAvion.Visible = true;
                btnIMGPDFavion.Visible = true;


                FileInfo file = new FileInfo(validararchivo);
                long size = file.Length;
                //Label02.Text = "El tamano del archivo actual es de: " + size/1024 + " Kb";
                LabelAlertAvion.Visible = false;
            }
            //////////////RENTA
            String validararchivoRENTA = Server.MapPath("~/Documentos/" + user + "/renta.pdf");
            if (System.IO.File.Exists(validararchivoRENTA))
            {
                fileURenta.Visible = false;
                btnUploadRenta.Visible = false;
                lblAlertRenta.Visible = false;
                btnBorrarRenta.Visible = true;
                logolistoRENTA.Visible = true;
                btnIMGPDFrenta.Visible = true;
            }
            //////////////Experiencia
            String validararchivoEXP = Server.MapPath("~/Documentos/" + user + "/exp.pdf");
            if (System.IO.File.Exists(validararchivoEXP))
            {
                fileUExperiencia.Visible = false;
                btnUploadExperiencia.Visible = false;
                lblAlertExperiencia.Visible = false;
                btnBorrarExperiencia.Visible = true;
                logolistoRepDeXP.Visible = true;
                btnIMGPDFexperiencia.Visible = true;
            }
            //////////////WORD
            String validararchivoWORD = Server.MapPath("~/Documentos/" + user + "/word.pdf");
            if (System.IO.File.Exists(validararchivoWORD))
            {
                fileUWord.Visible = false;
                btnUploadWord.Visible = false;
                lblAlertWord.Visible = false;
                btnBorrarWord.Visible = true;
                logolistoWORD.Visible = true;
                btnIMGPDFword.Visible = true;
            }
            //////////////POWERPOINT
            String validararchivoPOWERPOINT = Server.MapPath("~/Documentos/" + user + "/ppoint.pdf");
            if (System.IO.File.Exists(validararchivoPOWERPOINT))
            {
                fileUPower.Visible = false;
                btnUploadPower.Visible = false;
                lblAlertPowerPoint.Visible = false;
                btnBorrarPower.Visible = true;
                logolistoPowerPoint.Visible = true;
                btnIMGPDFpowerpoint.Visible = true;
            }
            //////////////FOTOS
            String validararchivoFOTOS = Server.MapPath("~/Documentos/" + user + "/fotos.pdf");
            if (System.IO.File.Exists(validararchivoFOTOS))
            {
                fileUFotos.Visible = false;
                btnUploadFoto.Visible = false;
                lblAlertFotos.Visible = false;
                btnBorrarFoto.Visible = true;
                logolistoFotos.Visible = true;
                btnIMGPDFfotos.Visible = true;
            }
            //////////////PLATICA 3 GRUPOS
            String validararchivoPlatica = Server.MapPath("~/Documentos/" + user + "/platica.pdf");
            if (System.IO.File.Exists(validararchivoPlatica))
            {
                fileUPlatica.Visible = false;
                btnUploadPlatica.Visible = false;
                lblAlertPlatica.Visible = false;
                btnBorrarPlatica.Visible = true;
                logolistoPlatica3Grupos.Visible = true;
                btnIMGPDFplatica.Visible = true;
            }
            //////////////calificacion
            String validararchivoCalificacion = Server.MapPath("~/Documentos/" + user + "/calificacion.pdf");
            if (System.IO.File.Exists(validararchivoCalificacion))
            {
                fileUCalificacion.Visible = false;
                btnUploadCal.Visible = false;
                lblAlertCalificacion.Visible = false;
                btnBorrarCal.Visible = true;
                logolistoCalificacion.Visible = true;
                btnIMGPDFcalificacion.Visible = true;
            }
        }

        //CARRERA
        protected void btnUploadCarrera_Click(object sender, EventArgs e)
        {
            //if (Carrera.HasFile)
            //{
            //    string ext = System.IO.Path.GetExtension(Carrera.FileName);
            //    ext = ext.ToLower();

            //    int tam = Carrera.PostedFile.ContentLength;

            //    Response.Write(ext + ", " + tam);

            //    if (ext == ".pdf" && tam <= 2000000)
            //    {
            //        Carrera.SaveAs(Server.MapPath("~/Documentos/" + Carrera.FileName));
            //        Response.Write("Se Subio el Archivo");
            //    }
            //}
            //else
            //{
            //    Response.Write("Seleccione el Archivo a Subir");
            //}

        }
        protected void btnBorrarAvion_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/avion.pdf");
            System.IO.File.Delete(validararchivo);
            fileUavion.Visible = true;
            btnUploadAvion.Visible = true;
            btnBorrarAvion.Visible = false;
            //Label3.Text = "SE BORRO ARCHIVO";
            logolistoAvion.Visible = false;
            btnIMGPDFavion.Visible = false;

        }

        protected void btnUploadAvion_Click(object sender, EventArgs e)
        {
            if (fileUavion.HasFile)
            {
                //revisamos tamano del archivo
                if (fileUavion.PostedFile.ContentLength < 2000000)
                {

                    //creando path para file
                    //string vNombre = DateTime.Now.ToString("yyyMdHHmmss");

                    string nameFile = "avion";
                    String fileExtension = System.IO.Path.GetExtension(fileUavion.FileName).ToLower();
                    String path = Server.MapPath("~/Documentos/" + user + "/");
                    String validararchivo = Server.MapPath("~/Documentos/" + user + "/avion.pdf");

                    if (System.IO.File.Exists(validararchivo))
                    {
                        //Label3.Text = "YA EXISTE ARCHIVO";
                    }
                    else
                    {
                        //validar pdf 
                        if (fileExtension == ".pdf")
                        {
                            System.IO.Directory.CreateDirectory(path);
                            fileUavion.PostedFile.SaveAs(path + nameFile + fileExtension);
                            //Label3.Text = validararchivo;
                            LabelAlertAvion.Visible = false;
                            fileUavion.Visible = false;
                            btnUploadAvion.Visible = false;
                            btnBorrarAvion.Visible = true;
                            logolistoAvion.Visible = true;
                            btnIMGPDFavion.Visible = true;
                            //DSdocumentosInsert.Update();
                        }
                        else
                        {
                            Response.Write("<script type='text/javascript'> alert('El documento tiene que estar en formato PDF')</script>");
                            LabelAlertAvion.Visible = true;
                            LabelAlertAvion.Text = "Solo acepta PDF";
                        }
                    }

                }//fin tamano archivo
                else
                {
                    LabelAlertAvion.Visible = true;
                    LabelAlertAvion.Text = "Archivo Mayor a 2mb";
                }

            }
            else
            {//si no tiene archivo el upload
                LabelAlertAvion.Visible = true;
                LabelAlertAvion.Text = "Seleccione archivo";

            }

        }

        //boton pdf avion
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            //boton pdf avion
            //string pageurl = "Documentos/" + user + "/avion.pdf";
            //Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");


            //Session["file"] = "/avion.pdf";
            //Response.Redirect("VistaDocAlumno.aspx");



            //Response.Redirect("Documentos/" + user + "/avion.pdf");


            String validararchivo = Server.MapPath("~/Documentos/" + user + "/avion.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);

                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";


                // write file to browser
                Response.WriteFile(file.FullName);


                Response.End();
            }


        }

        ///////////////////////////////////////////////////////////
        /////BOTONES DE SUBIDA
        ///RENTA
        protected void btnUploadRenta_Click(object sender, EventArgs e)
        {
            if (fileURenta.HasFile)
            {
                string nameFile = "renta";
                String fileExtension = System.IO.Path.GetExtension(fileURenta.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/renta.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileURenta.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileURenta.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileURenta.Visible = false;
                        btnUploadRenta.Visible = false;
                        lblAlertRenta.Visible = false;
                        btnBorrarRenta.Visible = true;
                        logolistoRENTA.Visible = true;
                        btnIMGPDFrenta.Visible = true;

                    }
                    else
                    {
                        lblAlertRenta.Visible = true;
                        lblAlertRenta.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertRenta.Visible = true;
                    lblAlertRenta.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertRenta.Visible = true;
                lblAlertRenta.Text = "Seleccione archivo";
            }
        }
        ////////////EXPERIENCIA
        protected void btnUploadExperiencia_Click(object sender, EventArgs e)
        {
            if (fileUExperiencia.HasFile)
            {
                string nameFile = "exp";
                String fileExtension = System.IO.Path.GetExtension(fileUExperiencia.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/exp.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileUExperiencia.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileUExperiencia.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileUExperiencia.Visible = false;
                        btnUploadExperiencia.Visible = false;
                        lblAlertExperiencia.Visible = false;
                        btnBorrarExperiencia.Visible = true;
                        logolistoRepDeXP.Visible = true;
                        btnIMGPDFexperiencia.Visible = true;

                    }
                    else
                    {
                        lblAlertExperiencia.Visible = true;
                        lblAlertExperiencia.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertExperiencia.Visible = true;
                    lblAlertExperiencia.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertExperiencia.Visible = true;
                lblAlertExperiencia.Text = "Seleccione archivo";
            }
        }
        ////////////WORD
        protected void btnUploadWord_Click(object sender, EventArgs e)
        {
            if (fileUWord.HasFile)
            {
                string nameFile = "word";
                String fileExtension = System.IO.Path.GetExtension(fileUWord.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/word.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileUWord.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileUWord.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileUWord.Visible = false;
                        btnUploadWord.Visible = false;
                        lblAlertWord.Visible = false;
                        btnBorrarWord.Visible = true;
                        logolistoWORD.Visible = true;
                        btnIMGPDFword.Visible = true;

                    }
                    else
                    {
                        lblAlertWord.Visible = true;
                        lblAlertWord.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertWord.Visible = true;
                    lblAlertWord.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertWord.Visible = true;
                lblAlertWord.Text = "Seleccione archivo";
            }

        }
        //////////////POWERPOINT
        protected void btnUploadPower_Click(object sender, EventArgs e)
        {
            if (fileUPower.HasFile)
            {
                string nameFile = "ppoint";
                String fileExtension = System.IO.Path.GetExtension(fileUPower.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/ppoint.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileUPower.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileUPower.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileUPower.Visible = false;
                        btnUploadPower.Visible = false;
                        lblAlertPowerPoint.Visible = false;
                        btnBorrarPower.Visible = true;
                        logolistoPowerPoint.Visible = true;
                        btnIMGPDFpowerpoint.Visible = true;

                    }
                    else
                    {
                        lblAlertPowerPoint.Visible = true;
                        lblAlertPowerPoint.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertPowerPoint.Visible = true;
                    lblAlertPowerPoint.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertPowerPoint.Visible = true;
                lblAlertPowerPoint.Text = "Seleccione archivo";
            }

        }
        //////////////FOTOS
        protected void btnUploadFoto_Click(object sender, EventArgs e)
        {
            if (fileUFotos.HasFile)
            {
                string nameFile = "fotos";
                String fileExtension = System.IO.Path.GetExtension(fileUFotos.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/fotos.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileUFotos.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileUFotos.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileUFotos.Visible = false;
                        btnUploadFoto.Visible = false;
                        lblAlertFotos.Visible = false;
                        btnBorrarFoto.Visible = true;
                        logolistoFotos.Visible = true;
                        btnIMGPDFfotos.Visible = true;

                    }
                    else
                    {
                        lblAlertFotos.Visible = true;
                        lblAlertFotos.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertFotos.Visible = true;
                    lblAlertFotos.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertFotos.Visible = true;
                lblAlertFotos.Text = "Seleccione archivo";
            }

        }

        //////////////PLATICA
        protected void btnUploadPlatica_Click(object sender, EventArgs e)
        {
            if (fileUPlatica.HasFile)
            {
                string nameFile = "platica";
                String fileExtension = System.IO.Path.GetExtension(fileUPlatica.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/platica.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileUPlatica.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileUPlatica.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileUPlatica.Visible = false;
                        btnUploadPlatica.Visible = false;
                        lblAlertPlatica.Visible = false;
                        btnBorrarPlatica.Visible = true;
                        logolistoPlatica3Grupos.Visible = true;
                        btnIMGPDFplatica.Visible = true;

                    }
                    else
                    {
                        lblAlertPlatica.Visible = true;
                        lblAlertPlatica.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertPlatica.Visible = true;
                    lblAlertPlatica.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertPlatica.Visible = true;
                lblAlertPlatica.Text = "Seleccione archivo";
            }

        }
        //////////////CALIFICACION
        protected void btnUploadCal_Click(object sender, EventArgs e)
        {
            if (fileUCalificacion.HasFile)
            {
                string nameFile = "calificacion";
                String fileExtension = System.IO.Path.GetExtension(fileUCalificacion.FileName).ToLower();
                String path = Server.MapPath("~/Documentos/" + user + "/");
                String validararchivo = Server.MapPath("~/Documentos/" + user + "/calificacion.pdf");
                if (fileExtension == ".pdf")
                {
                    if (fileUCalificacion.PostedFile.ContentLength < 2000000)
                    {
                        System.IO.Directory.CreateDirectory(path);
                        fileUCalificacion.PostedFile.SaveAs(path + nameFile + fileExtension);

                        fileUCalificacion.Visible = false;
                        btnUploadCal.Visible = false;
                        lblAlertCalificacion.Visible = false;
                        btnBorrarCal.Visible = true;
                        logolistoCalificacion.Visible = true;
                        btnIMGPDFcalificacion.Visible = true;

                    }
                    else
                    {
                        lblAlertCalificacion.Visible = true;
                        lblAlertCalificacion.Text = "Archivo Mayor a 2mb";
                    }
                }
                else
                {
                    lblAlertCalificacion.Visible = true;
                    lblAlertCalificacion.Text = "Solo acepta PDF";
                }
            }
            else
            {
                lblAlertCalificacion.Visible = true;
                lblAlertCalificacion.Text = "Seleccione archivo";
            }

        }









        ///////////////////////////////////////////////////////////
        ///////////////////BOTONES DE BORRAR
        ////////////RENTA
        protected void btnBorrarRenta_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/renta.pdf");
            System.IO.File.Delete(validararchivo);
            fileURenta.Visible = true;
            btnUploadRenta.Visible = true;
            lblAlertRenta.Visible = false;
            btnBorrarRenta.Visible = false;
            logolistoRENTA.Visible = false;
            btnIMGPDFrenta.Visible = false;
        }
        ////////////EXPERIENCIA
        protected void btnBorrarExperiencia_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/exp.pdf");
            System.IO.File.Delete(validararchivo);
            fileUExperiencia.Visible = true;
            btnUploadExperiencia.Visible = true;
            lblAlertExperiencia.Visible = false;
            btnBorrarExperiencia.Visible = false;
            logolistoRepDeXP.Visible = false;
            btnIMGPDFexperiencia.Visible = false;
        }
        ////////////WORD
        protected void btnBorrarWord_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/word.pdf");
            System.IO.File.Delete(validararchivo);
            fileUWord.Visible = true;
            btnUploadWord.Visible = true;
            lblAlertWord.Visible = false;
            btnBorrarWord.Visible = false;
            logolistoWORD.Visible = false;
            btnIMGPDFword.Visible = false;
        }
        //////////////POWERPOINT
        protected void btnBorrarPower_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/ppoint.pdf");
            System.IO.File.Delete(validararchivo);
            fileUPower.Visible = true;
            btnUploadPower.Visible = true;
            lblAlertPowerPoint.Visible = false;
            btnBorrarPower.Visible = false;
            logolistoPowerPoint.Visible = false;
            btnIMGPDFpowerpoint.Visible = false;
        }
        //////////////FOTOS
        protected void btnBorrarFoto_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/fotos.pdf");
            System.IO.File.Delete(validararchivo);
            fileUFotos.Visible = true;
            btnUploadFoto.Visible = true;
            lblAlertFotos.Visible = false;
            btnBorrarFoto.Visible = false;
            logolistoFotos.Visible = false;
            btnIMGPDFfotos.Visible = false;
        }
        //////////////Platica 3 grupos
        protected void btnBorrarPlatica_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/platica.pdf");
            System.IO.File.Delete(validararchivo);
            fileUPlatica.Visible = true;
            btnUploadPlatica.Visible = true;
            lblAlertPlatica.Visible = false;
            btnBorrarPlatica.Visible = false;
            logolistoPlatica3Grupos.Visible = false;
            btnIMGPDFplatica.Visible = false;

        }
        //////////////borrar calificacion
        protected void btnBorrarCal_Click(object sender, EventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/calificacion.pdf");
            System.IO.File.Delete(validararchivo);
            fileUCalificacion.Visible = true;
            btnUploadCal.Visible = true;
            lblAlertCalificacion.Visible = false;
            btnBorrarCal.Visible = false;
            logolistoCalificacion.Visible = false;
            btnIMGPDFcalificacion.Visible = false;

        }






        ///////////////////////////////////////////////////////////
        ///////////////////BOTONES DE VER ARCHIVO
        ////////////RENTA
        protected void btnIMGPDFrenta_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/renta.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }
        }
        ////////////experiencia
        protected void btnIMGPDFexperiencia_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/exp.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }
        }
        ////////////WORD
        protected void btnIMGPDFword_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/word.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }

        }
        //////////////POWERPOINT
        protected void btnIMGPDFpowerpoint_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/ppoint.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }
        }
        //////////////FOTOS
        protected void btnIMGPDFfotos_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/fotos.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }
        }
        //////////////platica
        protected void btnIMGPDFplatica_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/platica.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }

        }
        //////////////PDF calificacion
        protected void btnIMGPDFcalificacion_Click(object sender, ImageClickEventArgs e)
        {
            String validararchivo = Server.MapPath("~/Documentos/" + user + "/calificacion.pdf");
            if (System.IO.File.Exists(validararchivo))
            {
                FileInfo file = new FileInfo(validararchivo);
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
            }

        }













    }
}