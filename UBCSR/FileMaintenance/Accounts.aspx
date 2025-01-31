﻿<%@ Page Title="Accounts" Language="C#" MasterPageFile="~/NestedFileMaintenance.master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="UBCSR.FileMaintenance.Accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5>User Accounts</h5>
                </div>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search..."></asp:TextBox>
                            <div class="input-group-btn">
                                <asp:Button ID="btnSearch"
                                    runat="server"
                                    CssClass="btn btn-primary"
                                    Text="Go"
                                    OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="pull-right">
                            <asp:Button ID="btnExport"
                                runat="server"
                                Text="Export to Excel"
                                CssClass="btn btn-default btn-sm" 
                                OnClick="btnExport_Click" />
                        </div>
                    </div>

                    <br />
                    <div class="table-responsive">
                        <asp:UpdatePanel ID="upAccount" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvAccount"
                                    runat="server"
                                    class="table table-striped table-hover dataTable"
                                    GridLines="None"
                                    AutoGenerateColumns="false"
                                    AllowPaging="true"
                                    ShowFooter="true"
                                    ShowHeaderWhenEmpty="true"
                                    EmptyDataText="No Record(s) found"
                                    AllowSorting="true"
                                    DataKeyNames="UserId"
                                    OnSorting="gvAccount_Sorting"
                                    OnRowDataBound="gvAccount_RowDataBound"
                                    OnRowCommand="gvAccount_RowCommand"
                                    OnPageIndexChanging="gvAccount_PageIndexChanging"
                                    OnSelectedIndexChanging="gvAccount_SelectedIndexChanging">
                                    <Columns>

                                        <asp:TemplateField HeaderText="ID" SortExpression="StudentId">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStudentId" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Full Name" SortExpression="FullName">
                                            <ItemTemplate>
                                                <asp:Label ID="lnkFNAME" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="Group No" SortExpression="GroupNo">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblGroupNo" runat="server" Text='<%# Eval("GroupNo") %>' CommandName="updateGroup" CommandArgument='<%#((GridViewRow)Container).RowIndex  %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="Account Status" SortExpression="IsApproved">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblStatus"
                                                    runat="server"
                                                    OnClick="lblStatus_Click"
                                                    Text='<%# (Boolean.Parse(Eval("IsApproved").ToString())) ? "Active" : "Inactive" %>'>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Reset Password">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblReset"
                                                    runat="server"
                                                    OnClick="lblReset_Click"
                                                    Text="Reset Password">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="RoleName" HeaderText="Role" SortExpression="RoleName" />
                                        <asp:ButtonField HeaderText="" ButtonType="Link" Text="Edit" CommandName="editRecord" />

                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete"
                                                    runat="server"
                                                    CommandName="deleteRecord"
                                                    CommandArgument='<%#((GridViewRow)Container).RowIndex  %>'
                                                    Text="Delete">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <PagerStyle CssClass="pagination-ys" />
                                </asp:GridView>
                                <!-- Trigger the modal with a button -->
                                <div class="pull-right">
                                    <asp:Button ID="btnOpenModal"
                                        runat="server"
                                        CssClass="btn btn-info btn-sm"
                                        Text="Add User"
                                        OnClick="btnOpenModal_Click"
                                        CausesValidation="false" />
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gvAccount" />
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
                            <h4 class="modal-title">Add User</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form">
                                <div class="form-group">
                                    <label for="ddlAddRole">Role</label>
                                    <asp:DropDownList ID="ddlAddRole" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="ddlAddRole"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        InitialValue="0"
                                        ErrorMessage="Role is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddUserId">User Id</label>
                                    <asp:TextBox ID="txtAddUserId" runat="server" CssClass="form-control" placeholder="User ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddUserId"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="ID is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddLastName">Last Name</label>
                                    <asp:TextBox ID="txtAddLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddLastName"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddMiddleName">Middle Name</label>
                                    <asp:TextBox ID="txtAddMiddleName" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddMiddleName"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="Middle Name is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtAddFirstName">First Name</label>
                                    <asp:TextBox ID="txtAddFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtAddFirstName"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgAdd"
                                        ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblDuplicateRecord" runat="server" CssClass="label label-danger"></asp:Label>
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

    <!-- Update Modal -->
    <div id="updateModal" class="modal fade" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <asp:UpdatePanel ID="upEdit" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit User</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form">
                                <div class="form-group">
                                    <asp:Label ID="lblRowId" runat="server" Visible="false"></asp:Label>
                                </div>

                                <div class="form-group">
                                    <label for="ddlEditRole">Role</label>
                                    <asp:DropDownList ID="ddlEditRole" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                        runat="server"
                                        Display="Dynamic"
                                        InitialValue="0"
                                        ControlToValidate="ddlEditRole"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Role is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditUserId">User Id</label>
                                    <asp:TextBox ID="txtEditUserId" runat="server" CssClass="form-control" placeholder="User ID" Enabled="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditUserId"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="ID is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditLastName">Last Name</label>
                                    <asp:TextBox ID="txtEditLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditLastName"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditMiddleName">Middle Name</label>
                                    <asp:TextBox ID="txtEditMiddleName" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditMiddleName"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="Middle Name is required"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditFirstName">First Name</label>
                                    <asp:TextBox ID="txtEditFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10"
                                        runat="server"
                                        Display="Dynamic"
                                        ControlToValidate="txtEditFirstName"
                                        CssClass="label label-danger"
                                        ValidationGroup="vgEdit"
                                        ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" ValidationGroup="vgEdit" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvAccount" EventName="RowCommand" />
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
                            <asp:Label ID="lblStudentId" runat="server" CssClass="text-primary"></asp:Label>
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
</asp:Content>
