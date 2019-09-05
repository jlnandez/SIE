<%@ Page Title="Constancia de Equivalencia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConstanciaEquivalencia.aspx.cs" Inherits="SIE.vAlumno.ConstanciaEquivalencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>
    <hr />

    <div class="container">

        <div class="row">
            <div class="col-sm-4">
                <asp:Label ID="lblNombre" runat="server" Text="Alumno" Style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtAlumno" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblMatricula" runat="server" Text="Matricula" Style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtMatricula" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:Label ID="lblCiclo" runat="server" Text="Ciclo Escolar" Style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCiclo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="lblCarrera" runat="server" Text="Carrera" Style="color: blue;" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtCarrera" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="lblUniDestino" runat="server" Text="Universidad Destino" Style="color: blue;" Font-Bold="True"></asp:Label>
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

    </div>

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



    <asp:SqlDataSource ID="ds_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT Alumno.Nombre, Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Matricula, Alumno.CicloEscolar, Alumno.Telefono, Alumno.UniversidadDestino, Cat_Carreras.Carrera, Cat_Genero.Genero FROM Alumno INNER JOIN Cat_Carreras ON Alumno.Carrera_Id = Cat_Carreras.Id INNER JOIN Cat_Genero ON Alumno.Genero_Id = Cat_Genero.id WHERE (Alumno.Matricula = @matricula)">
        <SelectParameters>
            <asp:SessionParameter Name="matricula" SessionField="Matricula" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_materias" runat="server" ConnectionString="<%$ ConnectionStrings:SIEConnectionString %>" SelectCommand="SELECT id, ClaveMateriaDestino, NombreMateriaDestino, ClaveMateriaLocal, NombreMateriaLocal FROM EquivalenciaMaterias WHERE (Matricula = @matricula)" InsertCommand="INSERT INTO EquivalenciaMaterias(ClaveMateriaDestino, NombreMateriaDestino, ClaveMateriaLocal, NombreMateriaLocal, Matricula) VALUES (@ClaveMateriaDestino, @NombreMateriaDestino, @ClaveMateriaLocal, @NombreMateriaLocal, @Matricula)" DeleteCommand="DELETE FROM EquivalenciaMaterias WHERE (id = @id)" UpdateCommand="UPDATE EquivalenciaMaterias SET ClaveMateriaDestino = @ClaveMateriaDestino, NombreMateriaDestino = @NombreMateriaDestino, ClaveMateriaLocal = @ClaveMateriaLocal, NombreMateriaLocal = @NombreMateriaLocal WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ClaveMateriaDestino" />
            <asp:Parameter Name="NombreMateriaDestino" />
            <asp:Parameter Name="ClaveMateriaLocal" />
            <asp:Parameter Name="NombreMateriaLocal" />
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
            <asp:Parameter Name="id" />
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
        </div

        <script>

        </script>

</asp:Content>
