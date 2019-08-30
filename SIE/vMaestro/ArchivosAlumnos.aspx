<%@ Page Title="Archivos de Alumnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArchivosAlumnos.aspx.cs" Inherits="SIE.vMaestro.ArchivosAlumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <h2><%: Title %>.</h2>
    <hr />


    <table style="width: 100%;">
        <tr>
            <td class="modal-sm" style="width: 88px">
                <asp:Image ID="logolistocarrera" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px">
                
                <asp:FileUpload ID="Carrera" runat="server" onchange="leer()" Visible="False" />
                <asp:Label ID="Label01" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td>             
                <asp:ImageButton ID="BtnArchivos" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" />
                <asp:Button ID="btnUploadCarrera" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadCarrera_Click" Visible="False" />
                <asp:Button ID="btnBorrarCarrera" Class="btnborrar" runat="server" Text="Borrar Archivo" Width="138px" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #808080;">
                <asp:Image ID="logolistoAvion" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #808080;">
                <p class="text-white"><strong>Avión</strong></p>
                <asp:FileUpload ID="fileUavion" runat="server" />
                <asp:ImageButton ID="btnIMGPDFavion" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="ImageButton2_Click" />
                <asp:Label ID="LabelAlertAvion" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #808080">
                
                <asp:Button ID="btnUploadAvion" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadAvion_Click" Enabled="False" />
                <asp:Button ID="btnBorrarAvion" Class="btnborrar" runat="server" Text="Borrar Archivo" Width="138px" Visible="False" OnClick="btnBorrarAvion_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #666666;">
                <asp:Image ID="logolistoRENTA" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #666666;">
                <p class="text-white"><strong>Renta</strong></p>
                <asp:FileUpload ID="fileURenta" runat="server" />
                <asp:ImageButton ID="btnIMGPDFrenta" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFrenta_Click" />
                <asp:Label ID="lblAlertRenta" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #666666">
                <asp:Button ID="btnUploadRenta" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadRenta_Click" Enabled="False" />
                <asp:Button ID="btnBorrarRenta" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" UseSubmitBehavior="False" OnClick="btnBorrarRenta_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #808080;">
                <asp:Image ID="logolistoRepDeXP" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #808080;">
                <p class="text-white"><strong>Reporte de experiencia</strong></p>
                <asp:FileUpload ID="fileUExperiencia" runat="server" />
                <asp:ImageButton ID="btnIMGPDFexperiencia" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFexperiencia_Click" />
                <asp:Label ID="lblAlertExperiencia" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>

            </td>
            <td style="background-color: #808080">
                <asp:Button ID="btnUploadExperiencia" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadExperiencia_Click" Enabled="False" />
                <asp:Button ID="btnBorrarExperiencia" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" OnClick="btnBorrarExperiencia_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #666666;">
                <asp:Image ID="logolistoWORD" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #666666;">
                <p class="text-white"><strong>Word</strong></p>
                <asp:FileUpload ID="fileUWord" runat="server" />
                <asp:ImageButton ID="btnIMGPDFword" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFword_Click" />
                <asp:Label ID="lblAlertWord" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #666666">
                <asp:Button ID="btnUploadWord" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadWord_Click" Enabled="False" />
                <asp:Button ID="btnBorrarWord" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" OnClick="btnBorrarWord_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #808080;">
                <asp:Image ID="logolistoPowerPoint" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #808080;">
                <p class="text-white"><strong>PowePoint Materia</strong></p>
                <asp:FileUpload ID="fileUPower" runat="server" />
                <asp:ImageButton ID="btnIMGPDFpowerpoint" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFpowerpoint_Click" />
                <asp:Label ID="lblAlertPowerPoint" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #808080">
                <asp:Button ID="btnUploadPower" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadPower_Click" Enabled="False" />
                <asp:Button ID="btnBorrarPower" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" OnClick="btnBorrarPower_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #666666;">
                <asp:Image ID="logolistoFotos" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #666666;">
                <p class="text-white"><strong>Fotos</strong></p>
                <asp:FileUpload ID="fileUFotos" runat="server" />
                <asp:ImageButton ID="btnIMGPDFfotos" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFfotos_Click" />
                <asp:Label ID="lblAlertFotos" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #666666">
                <asp:Button ID="btnUploadFoto" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadFoto_Click" Enabled="False" />
                <asp:Button ID="btnBorrarFoto" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" OnClick="btnBorrarFoto_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #808080;">
                <asp:Image ID="logolistoPlatica3Grupos" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #808080;">
                <p class="text-white"><strong>Platica 3 Grupos</strong></p>
                <asp:FileUpload ID="fileUPlatica" runat="server" />
                <asp:ImageButton ID="btnIMGPDFplatica" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFplatica_Click" />
                <asp:Label ID="lblAlertPlatica" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #808080">
                <asp:Button ID="btnUploadPlatica" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadPlatica_Click" Enabled="False" />
                <asp:Button ID="btnBorrarPlatica" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" OnClick="btnBorrarPlatica_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px; background-color: #666666;">
                <asp:Image ID="logolistoCalificacion" runat="server" ImageUrl="~/Content/img/listo.png" Height="53px" Width="53px" Visible="False" />
            </td>
            <td class="modal-sm" style="width: 387px; background-color: #666666;">
                <p class="text-white"><strong>Calificación</strong></p>
                <asp:FileUpload ID="fileUCalificacion" runat="server" />
                <asp:ImageButton ID="btnIMGPDFcalificacion" runat="server" class="ver" title="Click para ver archivo" ImageUrl="~/Content/img/ver.png" Height="53px" Width="53px" Visible="False" OnClick="btnIMGPDFcalificacion_Click" />
                <asp:Label ID="lblAlertCalificacion" runat="server" CssClass="text-danger" Text="Seleccione archivo" Visible="False"></asp:Label>
            </td>
            <td style="background-color: #666666">
                <asp:Button ID="btnUploadCal" Class="btncargar" runat="server" Text="Cargar Archivo" OnClick="btnUploadCal_Click" Enabled="False" />
                <asp:Button ID="btnBorrarCal" Class="btnborrar" runat="server" Text="Borrar Archivo" Visible="False" Width="138px" OnClick="btnBorrarCal_Click" Enabled="False" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px">&nbsp;</td>
            <td class="modal-sm" style="width: 387px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px">&nbsp;</td>
            <td class="modal-sm" style="width: 387px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px">&nbsp;</td>
            <td class="modal-sm" style="width: 387px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 88px">&nbsp;</td>
            <td class="modal-sm" style="width: 387px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


</asp:Content>
