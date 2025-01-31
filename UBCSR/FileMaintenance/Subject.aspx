﻿<%@ Page Title="Subjects" Language="C#" MasterPageFile="~/NestedFileMaintenance.master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="UBCSR.FileMaintenance.Subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5>Subjects</h5>
                </div>

                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search..."></asp:TextBox>
                            <asp:Button ID="btnSearch"
                                runat="server"
                                CssClass="btn btn-primary"
                                Text="Go"
                                OnClick="btnSearch_Click" />
                        </div>
                    </div>

                    <br />

                    <div class="table-responsive">
                        <asp:UpdatePanel ID="upSubjects" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvSubjects"
                                    runat="server"
                                    class="table table-striped table-hover"
                                    GridLines="None"
                                    ShowHeaderWhenEmpty="true"
                                    AutoGenerateColumns="false"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    DataKeyNames="Id"
                                    EmptyDataText="No Record(s) found"
                                    OnRowCommand="gvSubjects_RowCommand"
                                    DataSourceID="SubjectDataSource">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Row Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Subject Code" SortExpression="SubjectCode">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCode" runat="server" Text='<%# Eval("SubjectCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("Subject") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Section"  SortExpression="Section">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSection" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="School Year" SortExpression="YearFrom">
                                            <ItemTemplate>
                                                <asp:Label ID="lblYearFrom" runat="server" Text='<%# Eval("YearFrom") %>'></asp:Label>
                                                -
                                                <asp:Label ID="lblYearTo" runat="server" Text='<%# Eval("YearTo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Semester" SortExpression="Sem">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Sem") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:ButtonField HeaderText="" ButtonType="Link" Text="Edit" CommandName="editRecord" />
                                        <asp:ButtonField HeaderText="" ButtonType="Link" Text="Delete" CommandName="deleteRecord" />

                                    </Columns>
                                    <PagerStyle CssClass="pagination-ys" />
                                </asp:GridView>
                                <!-- Trigger the modal with a button -->
                                <div class="pull-right">
                                    <asp:Button ID="btnOpenModal"
                                        runat="server"
                                        CssClass="btn btn-info btn-sm"
                                        Text="Add Subject"
                                        OnClick="btnOpenModal_Click"
                                        CausesValidation="false" />
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gvSubjects" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <asp:UpdatePanel ID="upAdd" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Subject</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form">

                                <div class="form-group">
                                    <label for="ddlAddSection">Section</label>
                                    <asp:DropDownList ID="ddlAddSection" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="ddlAddSection"
                                        CssClass="label label-danger"
                                        InitialValue="0"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Section is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddCode">Subject Code</label>
                                    <asp:TextBox ID="txtAddCode" runat="server" CssClass="form-control" placeholder="Code"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddCode"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Code is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddSubject">Subject Name</label>
                                    <asp:TextBox ID="txtAddSubject" runat="server" CssClass="form-control" placeholder="Subject Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddSubject"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Subject is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddYearFrom">Year From</label>
                                    <asp:TextBox ID="txtAddYearFrom" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddYearFrom"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Year From is required"></asp:RequiredFieldValidator>
                                </div>


                                <div class="form-group">
                                    <label for="txtAddYearTo">Year To</label>
                                    <asp:TextBox ID="txtAddYearTo" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddYearTo"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Year To is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="ddlAddSemester">Semester</label>
                                    <asp:DropDownList ID="ddlAddSemester" runat="server" CssClass="form-control" placeholder="Item">
                                        <asp:ListItem Value="First Sem">First Sem</asp:ListItem>
                                        <asp:ListItem Value="Second Sem">Second Sem</asp:ListItem>
                                        <asp:ListItem Value="Summer">Summer</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblDuplicateRecords" runat="server" CssClass="label label-danger"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" ValidationGroup="vgAdd" OnClick="btnSave_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="updateModal" class="modal fade" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <!-- Update Modal content-->
            <div class="modal-content">
                <asp:UpdatePanel ID="upEdit" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Subject</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form">
                                <div class="form-group">
                                    <asp:Label ID="lblRowId" runat="server" Visible="false"></asp:Label>
                                </div>

                                <div class="form-group">
                                    <label for="ddlEditSection">Section</label>
                                    <asp:DropDownList ID="ddlEditSection" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="ddlEditSection"
                                        CssClass="label label-danger"
                                        InitialValue="0"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Section is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditCode">Subject Code</label>
                                    <asp:TextBox ID="txtEditCode" runat="server" CssClass="form-control" placeholder="Code"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditCode"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Code is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditSubject">Subject Name</label>
                                    <asp:TextBox ID="txtEditSubject" runat="server" CssClass="form-control" placeholder="Subject Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditSubject"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Subject Name is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditYearFrom">Year From</label>
                                    <asp:TextBox ID="txtEditYearFrom" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditYearFrom"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Year From is required"></asp:RequiredFieldValidator>
                                </div>


                                <div class="form-group">
                                    <label for="txtEditYearTo">Year To</label>
                                    <asp:TextBox ID="txtEditYearTo" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditYearTo"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Year To is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="ddlEditSemester">Semester</label>
                                    <asp:DropDownList ID="ddlEditSemester" runat="server" CssClass="form-control" placeholder="Item">
                                        <asp:ListItem Value="First Sem">First Sem</asp:ListItem>
                                        <asp:ListItem Value="Second Sem">Second Sem</asp:ListItem>
                                        <asp:ListItem Value="Summer">Summer</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" ValidationGroup="vgEdit" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvSubjects" EventName="RowCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal fade" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Delete Record</h4>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete this record ?
                            <asp:HiddenField ID="hfDeleteId" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hfUserId" runat="server" />
    <asp:LinqDataSource ID="SubjectDataSource" runat="server" OnSelecting="SubjectDataSource_Selecting"></asp:LinqDataSource>
</asp:Content>
