<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReporteConstancia.aspx.cs" Inherits="SIE.vMaestro.ReporteConstancia" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <br />

    <asp:Button ID="btnBack" runat="server" Text="Regresar" CssClass="btn btn-warning" />

    <br />

 <rsweb:ReportViewer ID="rv_UN" runat="server" Width="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" ZoomPercent="115" Height="475px">
        <LocalReport ReportPath="Reporte\Report1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet2" />
                <rsweb:ReportDataSource DataSourceId="SqlDataSource3" Name="DataSet3" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT Alumno.Id, Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Alumno.CicloEscolar, Alumno.Telefono, Alumno.User_Id, Alumno.UniversidadDestino, Alumno.Genero_Id, Cat_Carreras.Carrera FROM Alumno INNER JOIN Cat_Carreras ON Alumno.Carrera_Id = Cat_Carreras.Id WHERE (Alumno.Matricula = @Matricula)">
        <SelectParameters>
            <asp:SessionParameter Name="Matricula" SessionField="Matricula" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT * FROM [EquivalenciaMaterias] WHERE ([Matricula] = @Matricula)">
        <SelectParameters>
            <asp:SessionParameter Name="Matricula" SessionField="Matricula" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT * FROM [ConstanciaID] WHERE ([Matricula] = @Matricula)">
        <SelectParameters>
            <asp:SessionParameter Name="Matricula" SessionField="Matricula" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>


</asp:Content>

