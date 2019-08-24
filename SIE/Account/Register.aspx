<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SIE.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h2><%: Title %>.</h2>

    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Crear una nueva cuenta</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />


        <!----------------AGREGAMOS MATRICULA-->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMatricula" CssClass="col-md-2 control-label">Matricula</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMatricula" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMatricula"
                    CssClass="text-danger" ErrorMessage="El campo matricula es obligatorio." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Correo electrónico</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
            </div>
        </div>


        <!------------------------- DATOS PERSONALES  ---------------->

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNombre" CssClass="col-md-2 control-label">Nombre</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre"
                    CssClass="text-danger" ErrorMessage="El campo Nombre es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtApellidoPaterno" CssClass="col-md-2 control-label">Apellido Paterno</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtApellidoPaterno" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtApellidoPaterno"
                    CssClass="text-danger" ErrorMessage="El campo Apellido Paterno es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtApellidoMaterno" CssClass="col-md-2 control-label">Apellido Materno</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtApellidoMaterno" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtApellidoMaterno"
                    CssClass="text-danger" ErrorMessage="El campo Apellido Materno es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlCarrera" CssClass="col-md-2 control-label">Carrera</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlCarrera" runat="server" CssClass="form-control" DataSourceID="cat_carreras" DataTextField="Carrera" DataValueField="Id"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCarrera"
                    CssClass="text-danger" ErrorMessage="El campo Carrera es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCiclo" CssClass="col-md-2 control-label">Ciclo Escolar</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtCiclo" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCiclo"
                    CssClass="text-danger" ErrorMessage="El campo Ciclo Escolar es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtTelefono" CssClass="col-md-2 control-label">Telefono
            </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono"
                    CssClass="text-danger" ErrorMessage="El campo Telefono es obligatorio." />
            </div>
        </div>



        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="ds_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" InsertCommand="INSERT INTO Alumno(Nombre, ApellidoPaterno, ApellidoMaterno, Matricula, Carrera_Id, CicloEscolar, Telefono, User_Id) VALUES (@nombre, @apellidoPaterno, @apellidoMaterno, @matricula, @carrera, @ciclo, @telefono, @userId)" SelectCommand="SELECT Alumno.* FROM Alumno">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtApellidoMaterno" Name="apellidoPaterno" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtApellidoMaterno" Name="apellidoMaterno" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMatricula" Name="matricula" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlCarrera" Name="carrera" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtCiclo" Name="ciclo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtTelefono" Name="telefono" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtAux" Name="userId" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="cat_carreras" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT * FROM [Cat_Carreras]"></asp:SqlDataSource>

    <asp:TextBox ID="txtAux" runat="server" Visible="False"></asp:TextBox>

</asp:Content>
