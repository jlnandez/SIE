<%@ Page Title="Constancia de Equivalencia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConstanciaEquivalencia.aspx.cs" Inherits="SIE.vAlumno.ConstanciaEquivalencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>
    <hr />

    <div class="container">

        <div class="row">
            <div class="col-sm-4">
                <asp:Label ID="lblNombre" runat="server" Text="Alumno" style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtAlumno" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblMatricula" runat="server" Text="Matricula" style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblCiclo" runat="server" Text="Ciclo Escolar" style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCiclo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="lblCarrera" runat="server" Text="Carrera" style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCarrera" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="lblUniDestino" runat="server" Text="Universidad Destino" style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtUniDestino" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asp:Button ID="btnAgregarMateria" runat="server" Text="Agregar Materia" CssClass="btn btn-success" /></div>
            <div class="col-sm-4"></div>

        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_materias">
            <Columns>
                <asp:BoundField DataField="ClaveMateriaDestino" HeaderText="ClaveMateriaDestino" SortExpression="ClaveMateriaDestino" />
                <asp:BoundField DataField="NombreMateriaDestino" HeaderText="NombreMateriaDestino" SortExpression="NombreMateriaDestino" />
                <asp:BoundField DataField="ClaveMateriaLocal" HeaderText="ClaveMateriaLocal" SortExpression="ClaveMateriaLocal" />
                <asp:BoundField DataField="NombreMateriaLocal" HeaderText="NombreMateriaLocal" SortExpression="NombreMateriaLocal" />
                <asp:BoundField DataField="Calificacion" HeaderText="Calificacion" SortExpression="Calificacion" />
            </Columns>
        </asp:GridView>
    </div>


    <asp:SqlDataSource ID="ds_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Alumno.CicloEscolar, Alumno.Telefono, Alumno.UniversidadDestino, Cat_Carreras.Carrera, Cat_Genero.Genero FROM Alumno INNER JOIN Cat_Carreras ON Alumno.Carrera_Id = Cat_Carreras.Id INNER JOIN Cat_Genero ON Alumno.Genero_Id = Cat_Genero.id WHERE (Alumno.Matricula = @matricula)">
        <SelectParameters>
            <asp:SessionParameter Name="matricula" SessionField="Matricula" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_materias" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT ClaveMateriaDestino, NombreMateriaDestino, ClaveMateriaLocal, NombreMateriaLocal, Calificacion FROM EquivalenciaMaterias"></asp:SqlDataSource>


</asp:Content>
