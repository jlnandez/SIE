<%@ Page Title="Listado de Alumnos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoAlumnos.aspx.cs" Inherits="SIE.vMaestro.ListadoAlumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../Content/plugins/DataTables/datatables.min.js"></script>
    <link href="../Content/plugins/DataTables/datatables.min.css" rel="stylesheet" />

    <h2><%: Title %>.</h2>
    <hr />

    <div style="float:right">
        <div class="btn-group" role="group" aria-label="Basic example">
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary"/>
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" Enabled="False" OnClick="btnEditar_Click"/>
            <asp:Button ID="btnBorrar1" runat="server" Text="Borrar" CssClass="btn btn-danger" data-toggle="modal" data-target="#ModalBorrar" Enabled="False"/>
            
        </div>
    </div>

    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ds_alumnos" CssClass="dataTable table table-sm table-responsive table-striped table-bordered table-hover" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="ApellidoPaterno" HeaderText="ApellidoPaterno" SortExpression="ApellidoPaterno" />
            <asp:BoundField DataField="ApellidoMaterno" HeaderText="ApellidoMaterno" SortExpression="ApellidoMaterno" />
            <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
            <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
            <asp:BoundField DataField="CicloEscolar" HeaderText="CicloEscolar" SortExpression="CicloEscolar" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="PasswordHash" HeaderText="PasswordHash" SortExpression="PasswordHash" />
        </Columns>
    </asp:GridView>




    <asp:SqlDataSource ID="ds_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT Alumno.Id, Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Cat_Carreras.Carrera, Alumno.CicloEscolar, Alumno.Telefono, AspNetUsers.Email, AspNetUsers.UserName, AspNetUsers.PasswordHash FROM Alumno INNER JOIN AspNetUsers ON Alumno.User_Id = AspNetUsers.Id INNER JOIN Cat_Carreras ON Alumno.Carrera_Id = Cat_Carreras.Id" DeleteCommand="DELETE FROM Alumno WHERE (Id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
    </asp:SqlDataSource>


    <div class="modal fade" id="ModalBorrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">¿Desea continuar?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Atención! Se eliminara el Alumno.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger">Si, Borrar Registro!</button>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">




        $(document).ready(function () {





            //window.onbeforeunload = function() { return "Your work will be lost."; };





            //DATATABLE
            //$('#MainContent_GridView1 thead tr').clone(true).appendTo('#MainContent_GridView1 thead');
            //$('#MainContent_GridView1 thead tr:eq(1) th').each(function (i) {
            //    var title = $(this).text();
            //    $(this).html('<input type="text" placeholder="Buscar: ' + title + '" />');

            //    $('input', this).on('keyup change', function () {
            //        if (table.column(i).search() !== this.value) {
            //            table
            //                .column(i)
            //                .search(this.value)
            //                .draw();
            //        }
            //    });
            //});

            var table = $('#MainContent_GridView1').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'excelHtml5',
                    'pdfHtml5'
                ],
                order: [[0, 'desc']],
                orderCellsTop: true,
                fixedHeader: true,
                responsive: true,

            });

        });

        //function nobackbutton() {
        //    window.location.hash = "no-back-button";
        //    window.location.hash = "Again-No-back-button" //chrome
        //    window.onhashchange = function () { window.location.hash = "no-back-button"; }
        //}


    </script>



</asp:Content>
