<%@ Page Title="Editar Alumnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlumnoEditar.aspx.cs" Inherits="SIE.vAlumno.AlumnoEditar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="form-horizontal">
        <h2><%: Title %>.</h2>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <!----------------AGREGAMOS MATRICULA-->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMatricula" CssClass="col-md-2 control-label">Matricula</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMatricula" CssClass="form-control" MaxLength="7" placeholder="1100123" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMatricula"
                    CssClass="text-danger" ErrorMessage="El campo matricula es obligatorio." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Correo electrónico</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="usuario@uabc.edu.mx" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="El campo de correo electrónico es obligatorio." />
            </div>
        </div>



        <!------------------------- DATOS PERSONALES  ---------------->

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNombre" CssClass="col-md-2 control-label">Nombre</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" MaxLength="49" placeholder="Nombre" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre"
                    CssClass="text-danger" ErrorMessage="El campo Nombre es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtApellidoPaterno" CssClass="col-md-2 control-label">Apellido Paterno</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtApellidoPaterno" CssClass="form-control" MaxLength="49" placeholder="Apellido Paterno" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtApellidoPaterno"
                    CssClass="text-danger" ErrorMessage="El campo Apellido Paterno es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtApellidoMaterno" CssClass="col-md-2 control-label">Apellido Materno</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtApellidoMaterno" CssClass="form-control" MaxLength="49" placeholder="Apellido Materno" />
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
                <asp:TextBox runat="server" ID="txtCiclo" CssClass="form-control" MaxLength="6" placeholder="2019-2" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCiclo"
                    CssClass="text-danger" ErrorMessage="El campo Ciclo Escolar es obligatorio." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtTelefono" CssClass="col-md-2 control-label">Telefono
            </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" MaxLength="10" TextMode="Phone" placeholder="6861231234" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelefono"
                    CssClass="text-danger" ErrorMessage="El campo Telefono es obligatorio." />
            </div>
        </div>



        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Cancelar" CssClass="btn btn-default" />

                <asp:Button runat="server" Text="Guardar Cambios" CssClass="btn btn-success" />
            </div>
        </div>

    </div>

    <asp:SqlDataSource ID="ds_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" InsertCommand="INSERT INTO Alumno(Nombre, ApellidoPaterno, ApellidoMaterno, Matricula, Carrera_Id, CicloEscolar, Telefono, User_Id) VALUES (@nombre, @apellidoPaterno, @apellidoMaterno, @matricula, @carrera, @ciclo, @telefono, @userId)" SelectCommand="SELECT Alumno.Id, Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Alumno.Carrera_Id, Alumno.CicloEscolar, Alumno.Telefono, AspNetUsers.UserName, AspNetUsers.Email FROM Alumno INNER JOIN AspNetUsers ON Alumno.User_Id = AspNetUsers.Id WHERE (Alumno.Id = @id)" UpdateCommand="UPDATE Alumno SET Nombre = @nombre, ApellidoPaterno = @paterno, ApellidoMaterno = @materno, Matricula = @matricula, Carrera_Id = @carrera, CicloEscolar = @ciclo, Telefono = @telefono WHERE (Id = @id)">
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
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="paterno" />
            <asp:Parameter Name="materno" />
            <asp:Parameter Name="matricula" />
            <asp:Parameter Name="carrera" />
            <asp:Parameter Name="ciclo" />
            <asp:Parameter Name="telefono" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="cat_carreras" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT * FROM [Cat_Carreras]"></asp:SqlDataSource>



</asp:Content>
