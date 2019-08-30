<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SIE.Default" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head>
    <script type="text/javascript" src="http://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js" charset="UTF-8"></script>
    <style>
        .errorblock {
            color: #ff0000;
            background-color: #ffEEEE;
            border: 3px solid #00ffff;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inicio</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <link href="Content/login/bootstrap.css" rel="stylesheet" />
    <link href="Content/login/estilos.css" rel="stylesheet" />
    <script src="Content/login/bootstrap.js"></script>


    <script type="text/javascript" src="./resources/js/general/alertas.js"></script>


    <link href="./resources/js/general/jtable/validacion/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <!-- Import Javascript files for validation engine (in Head section of HTML) -->
    <script type="text/javascript" src="./resources/js/general/jtable/validacion/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="./resources/js/general/jtable/validacion/jquery.validationEngine-es.js"></script>
    <script type="text/javascript" src="./resources/js/general/login.js"></script>
    <script type="text/javascript" src="./resources/js/ur/guias_rapidas.js"></script>
</head>
<body>
    <div id="container">
        <div class="row" style="background: url(./Content/img/texture.png)">
            <div class="col-md-2" style="text-align: center; padding: 10px">
                <img src="/Content/img/LogoUABC.png" style="width: 40%; height: 40%;" alt="UABC" />
            </div>

            <div class="col-md-8" style="text-align: center">
                <header>
                    <h2 style="color: #0026ff">Sistema de Intercambio Estudiantil</h2>
                    <%--<h2 style="color: #007141">UNIVERSIDAD AUT&Oacute;NOMA DE BAJA CALIFORNIA</h2>--%>
                    <h4>FACULTAD DE CIENCIAS ADMINISTRATIVAS</h4>
                </header>
            </div>
        </div>
    </div>
    <div class="row" id="registrarPrincipal"></div>
    <div class="row" id="loginPrincipal">
        <div id="loginEnHome" style="display: none">abc</div>
        <div class="col-md-4"></div>
        <div class="col-md-8" style="text-align: center">
            <!--Main container-->
            <br />
            <!--CONTENT-->
            <div class="row">
                <div class="col-md-6">
                    <div class="box">

                        <div class="row ">
                            <!-- 							<p class="text-left"> -->
                            <!-- 								<a class="btn btn-xs  btn-info guiaRapida" data-guia="2"  target="_blank">Ayuda</a> -->

                            <!-- 							</p> -->
                            <%--<p class=" text-right">
								&iquest;A&uacute;n no tienes cuenta?<a href="/ur/registro_ur_externo" target="_blank"> Reg&iacute;strate</a>
							</p>--%>
                            <p class="text-right">
                                <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse como usuario nuevo</asp:HyperLink>
                            </p>
                        </div>
                        <div class="container">
                            <%--<form runat="server" class="form-horizontal" role="form" action="/j_spring_security_check" method='post'>--%>
                            <form runat="server" class="form-horizontal">
                                <div class="form-group">
                                    <%--									<h3 class="col-lg-12 control-label" style="text-align: center">Acceso</h3>--%>
                                </div>

                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                    <p class="text-danger">
                                        <asp:Literal runat="server" ID="FailureText" />
                                    </p>
                                </asp:PlaceHolder>


                                <div class="form-group">
                                    <label for="inputEmail1" class="col-lg-3 control-label">Matricula: </label>
                                    <div class="col-lg-8">
                                        <%--<input type="email" class="form-control" name='j_username' id="inputEmail1" placeholder="alguien@example.com" required/>--%>
                                        <asp:TextBox ID="inputEmail1" runat="server" class="form-control" placeholder="1100000" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword1" class="col-lg-3 control-label">Contrase&ntilde;a: </label>
                                    <div class="col-lg-8">
                                        <%--<input type="password" name='j_password' class="form-control" id="inputPassword1" placeholder="Contrase&ntilde;a" required/>--%>
                                        <asp:TextBox ID="inputPassword1" runat="server" class="form-control" placeholder="Contraseña" required TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12 text-center">
                                        <%--<button type="submit" class="btn btn-primary">Iniciar sesi&oacute;n</button>--%>
                                        <asp:Button ID="Button1" runat="server" Text="Iniciar sesion" class="btn btn-primary" OnClick="LogIn" />
                                    </div>
                                </div>

                                <div class="checkbox">
                                    <asp:CheckBox runat="server" ID="RememberMe" />
                                    <asp:Label runat="server" AssociatedControlID="RememberMe">¿Recordar cuenta?</asp:Label>
                                </div>


                            </form>
                            <%--					<a data-toggle="modal" href="#myModal">&iquest;Olvidaste tu contrase&ntilde;a?</a>--%>
                        </div>
                    </div>
                    <%--<a href="accesoUABC"><button class="btn btn-success text-center">Acceso usuarios UABC</button></a>--%>
                    <div class="clearfix">
                        <br />
                    </div>





                    <div class="col-lg-12">
                        Para mejor funcionalidad del sistema se recomienda. <a href="http://www.google.com.mx/intl/es-419/chrome/">
                            <img id="logo"
                                src="http://www.google.com.mx/intl/es-419/chrome/assets/common/images/chrome_logo_2x.png" style="width: 20%; height: 20%;" data-g-label="consumer-home"
                                data-g-event="nav-logo" alt="Chrome" />
                        </a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-offset-1 col-sm-5 col-md-offset-1 col-md-5 col-lg-offset-1 col-lg-4">
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <input id="registro_ur_status" type="hidden" value="0" />
        <input id="idUr" type="hidden" />
        <div class="col-md-12" style="text-align: center; height: 150px;">
            <footer id="footer">
                <br />
                <p>
                    <a href="http://fca.mxl.uabc.mx/Nueva-FCA/">Facultad de Ciencias Administrativas Mexicali</a>
                    <br />
                    <small>2019</small>
                </p>

            </footer>
        </div>
    </div>
    <div class="col-md-10">
        <div class="row">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Recuperar Contrase&ntilde;a</h4>
                        </div>
                        <form class="form" id="idRecuperarContrasena">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="inputEmail1" class="col-lg-4 control-label">Ingresa tu correo</label>
                                    <div class="col-lg-6">
                                        <input type="email" class="validate[required,custom[email] form-control" id="idCorreoElectronico" placeholder="alguien@example.com" />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="btnRecuperarContrasena" class="btn btn-info">Continuar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
