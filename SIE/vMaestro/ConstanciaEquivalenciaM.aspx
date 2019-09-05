<%@ Page Title="Constancia de Equivalencia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConstanciaEquivalenciaM.aspx.cs" Inherits="SIE.vMaestro.ConstanciaEquivalenciaM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../Content/plugins/DataTables/datatables.min.js"></script>
    <link href="../Content/plugins/DataTables/datatables.min.css" rel="stylesheet" />

    <h2 style="color: #507CD1;"><%: Title %>.</h2>
    <asp:Button ID="btnRegresar" runat="server" Text="Regresar" OnClick="btnRegresar_Click" Visible="False" CssClass="btn btn-warning" />
    <hr />


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ds_alumnos2" CssClass="dataTable table table-sm table-responsive table-striped table-bordered table-hover" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="ApellidoPaterno" HeaderText="ApellidoPaterno" SortExpression="ApellidoPaterno" />
            <asp:BoundField DataField="ApellidoMaterno" HeaderText="ApellidoMaterno" SortExpression="ApellidoMaterno" />
            <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
            <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
            <asp:BoundField DataField="UniversidadDestino" HeaderText="UniversidadDestino" SortExpression="UniversidadDestino" />
            <asp:BoundField DataField="CicloEscolar" HeaderText="CicloEscolar" SortExpression="CicloEscolar" />
            <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="PasswordHash" HeaderText="PasswordHash" SortExpression="PasswordHash" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>


    <asp:Panel ID="Panel1" runat="server" Visible="false">

        <div class="row">
            <div class="col-sm-4">
                <asp:Label ID="lblNombre" runat="server" Text="Alumno" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtAlumno" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblMatricula" runat="server" Text="Matricula" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblCiclo" runat="server" Text="Ciclo Escolar" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCiclo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="lblCarrera" runat="server" Text="Carrera" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCarrera" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="lblUniDestino" runat="server" Text="Universidad Destino" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtUniDestino" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asp:Button ID="btnModal" runat="server" Text="Agregar Materia" CssClass="btn btn-success" data-toggle="modal" data-target="#ModalAgregar" OnClientClick="return false;" />
            </div>
            <div class="col-sm-4"></div>

        </div>

    </asp:Panel>

    <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_materias" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id" CssClass="table table-striped">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="ClaveMateriaDestino" HeaderText="ClaveMateriaDestino" SortExpression="ClaveMateriaDestino" />
                <asp:BoundField DataField="NombreMateriaDestino" HeaderText="NombreMateriaDestino" SortExpression="NombreMateriaDestino" />
                <asp:BoundField DataField="ClaveMateriaLocal" HeaderText="ClaveMateriaLocal" SortExpression="ClaveMateriaLocal" />
                <asp:BoundField DataField="NombreMateriaLocal" HeaderText="NombreMateriaLocal" SortExpression="NombreMateriaLocal" />
                <asp:BoundField DataField="Calificacion" HeaderText="Calificacion" SortExpression="Calificacion" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <br />
        <div class="row">
            <div class="col-sm-6">
                <asp:Label ID="Label3" runat="server" Text="Fecha" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="col-sm-6">

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-6">
                <asp:Label ID="Label1" runat="server" Text="Coordinador de Movilidad Académica" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCMA" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-6">
                <asp:Label ID="Label2" runat="server" Text="Coordinadora de la Carrera" Style="color: #507CD1;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCC" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <asp:Button ID="btnGenrarConstancia" runat="server" Text="Generar Constancia de Equivalencias" CssClass="btn btn-success" OnClick="btnGenrarConstancia_Click" />
            </div>
            <div class="col-sm-4"></div>

        </div>

    </asp:Panel>

    <asp:SqlDataSource ID="ds_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Alumno.CicloEscolar, Alumno.Telefono, Alumno.UniversidadDestino, Cat_Carreras.Carrera, Cat_Genero.Genero FROM Alumno INNER JOIN Cat_Carreras ON Alumno.Carrera_Id = Cat_Carreras.Id INNER JOIN Cat_Genero ON Alumno.Genero_Id = Cat_Genero.id WHERE (Alumno.Matricula = @matricula)">
        <SelectParameters>
            <asp:SessionParameter Name="matricula" SessionField="Matricula" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_materias" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT id, ClaveMateriaDestino, NombreMateriaDestino, ClaveMateriaLocal, NombreMateriaLocal, Calificacion FROM EquivalenciaMaterias WHERE (Matricula = @matricula)" InsertCommand="INSERT INTO EquivalenciaMaterias(ClaveMateriaDestino, NombreMateriaDestino, ClaveMateriaLocal, NombreMateriaLocal, Matricula) VALUES (@ClaveMateriaDestino, @NombreMateriaDestino, @ClaveMateriaLocal, @NombreMateriaLocal, @Matricula)" DeleteCommand="DELETE FROM EquivalenciaMaterias WHERE (id = @id)" UpdateCommand="UPDATE EquivalenciaMaterias SET ClaveMateriaDestino = @ClaveMateriaDestino, NombreMateriaDestino = @NombreMateriaDestino, ClaveMateriaLocal = @ClaveMateriaLocal, NombreMateriaLocal = @NombreMateriaLocal, Calificacion = @Calificacion WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtClaveDestino" Name="ClaveMateriaDestino" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMateriaDestino" Name="NombreMateriaDestino" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtClaveUABC" Name="ClaveMateriaLocal" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMateriaUABC" Name="NombreMateriaLocal" PropertyName="Text" />
            <asp:SessionParameter Name="matricula" SessionField="Matricula" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="matricula" SessionField="Matricula" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ClaveMateriaDestino" />
            <asp:Parameter Name="NombreMateriaDestino" />
            <asp:Parameter Name="ClaveMateriaLocal" />
            <asp:Parameter Name="NombreMateriaLocal" />
            <asp:Parameter Name="Calificacion" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="ds_alumnos2" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT Alumno.Id, Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Cat_Carreras.Carrera, Alumno.UniversidadDestino, Alumno.CicloEscolar, Cat_Genero.Genero, Alumno.Telefono, AspNetUsers.Email, AspNetUsers.UserName, AspNetUsers.PasswordHash FROM Alumno INNER JOIN AspNetUsers ON Alumno.User_Id = AspNetUsers.Id INNER JOIN Cat_Carreras ON Alumno.Carrera_Id = Cat_Carreras.Id INNER JOIN Cat_Genero ON Alumno.Genero_Id = Cat_Genero.id" DeleteCommand="DELETE FROM Alumno WHERE (Id = @id)">
        <DeleteParameters>
            <asp:SessionParameter Name="id" SessionField="id" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_carta" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" DeleteCommand="DELETE FROM ConstanciaID WHERE (id = @id)" InsertCommand="INSERT INTO ConstanciaID(Matricula) VALUES (@Matricula)" SelectCommand="SELECT id, Matricula, CoordinadorMovilidad, CoordinadorCarrera, Fecha FROM ConstanciaID WHERE (Matricula = @Matricula)" UpdateCommand="UPDATE ConstanciaID SET CoordinadorMovilidad = @CoordinadorMovilidad, CoordinadorCarrera = @CoordinadorCarrera, Fecha = @Fecha WHERE (Matricula = @Matricula)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="Matricula" SessionField="Matricula" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Matricula" SessionField="Matricula" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtCMA" Name="CoordinadorMovilidad" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCC" Name="CoordinadorCarrera" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFecha" Name="Fecha" PropertyName="Text" />
            <asp:SessionParameter Name="Matricula" SessionField="Matricula" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="modal fad" id="ModalAgregar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ingrese Clave y Materia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">


                    <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <h4>Materia UABC</h4>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtClaveUABC" runat="server" CssClass="form-control" placeholder="Clave"></asp:TextBox>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMateriaUABC" runat="server" CssClass="form-control" placeholder="Nombre Materia"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">
                            <h4>Materia Universidad Destino</h4>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtClaveDestino" runat="server" CssClass="form-control" placeholder="Clave"></asp:TextBox>
                        </div>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMateriaDestino" runat="server" CssClass="form-control" placeholder="Nombre Materia"></asp:TextBox>
                        </div>
                    </div>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarMateria" runat="server" Text="Guardar Materia!" CssClass="btn btn-success" OnClick="btnGuardarMateria_Click" />
                </div>
            </div>
        </div>
    </div>

        <script>
            $(document).ready(function () {

                var table = $('#MainContent_GridView2').DataTable({
                    order: [[1, 'desc']],
                    responsive: true,

                });

            });

        </script>



</asp:Content>
