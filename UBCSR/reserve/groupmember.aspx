﻿<%@ Page Title="Group Members" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="groupmember.aspx.cs" Inherits="UBCSR.reserve.groupmember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h5>
                            <asp:Label ID="lblTitle" runat="server">My Group (as a Group Lead)</asp:Label></h5>
                    </div>

                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnSearch"
                                                runat="server"
                                                CssClass="btn btn-primary"
                                                Text="Go"
                                                OnClick="btnSearch_Click" />
                                        </span>
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search..."></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <asp:UpdatePanel ID="upTeam" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvTeam"
                                        runat="server"
                                        CssClass="table table-striped table-hover dataTable"
                                        GridLines="None"
                                        AutoGenerateColumns="false"
                                        EmptyDataText="No Record(s) found"
                                        ShowHeaderWhenEmpty="true"
                                        DataKeyNames="Id"
                                        OnRowCommand="gvTeam_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Row Id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:ButtonField HeaderText="Action" ButtonType="Button" Text="Edit" CommandName="editRecord" />

                                            <asp:TemplateField HeaderText="Group Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Year">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblYearFrom" runat="server" Text='<%# Eval("YearFrom") %>'></asp:Label>
                                                    -
                                                <asp:Label ID="lblYearTo" runat="server" Text='<%# Eval("YearTo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Semester">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Sem") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <PagerStyle CssClass="pagination-ys" />
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Borrow Modal -->
    <div id="updateModal" class="modal fade" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <!-- Return Modal content-->
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Group Members</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form">
                                <div class="form-group">
                                    <asp:Label ID="lblGroupId" runat="server" Visible="false"></asp:Label>
                                </div>

                                <div class="form-group">
                                    <label for="txtGroupName">Group Name: </label>
                                    <asp:TextBox ID="txtGroupName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="txtGroupLeader">Group Leader: </label>
                                    <asp:TextBox ID="txtGroupLeader" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label for="gvMembers"></label>
                                    <div class="table table-responsive">
                                        <asp:GridView ID="gvMembers"
                                            runat="server"
                                            CssClass="table table-striped table-hover dataTable"
                                            GridLines="None"
                                            AutoGenerateColumns="false"
                                            EmptyDataText="No Record(s) found"
                                            ShowHeaderWhenEmpty="true"
                                            DataKeyNames="UserId">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkRow" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Row Id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="FullName" HeaderText="Name" />
                                            </Columns>
                                            <PagerStyle CssClass="pagination-ys" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnAddGroup"
                                runat="server"
                                CssClass="btn btn-primary"
                                Text="Save"
                                CausesValidation="true"
                                ValidationGroup="vgConfirmBorrow"
                                OnClick="btnAddGroup_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvMembers" EventName="RowCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnAddGroup" EventName="Click" />
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
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Delete Confirmation</h4>
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

</asp:Content>
