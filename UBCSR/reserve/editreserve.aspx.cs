﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UBCSR.reserve
{
    public partial class editreserve : System.Web.UI.Page
    {
        CSRContextDataContext db = new CSRContextDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Request.QueryString["resId"] == null)
                {
                    Response.Redirect("~/reserve/default.aspx");
                }
                else
                {
                    int resId = Convert.ToInt32(Request.QueryString["resId"].ToString());

                    //load dropdown
                    bindDropdown();
                    ddlSubject.Items.Insert(0, new ListItem("Select Subject", "0"));

                    var q = (from r in db.Reservations
                             where r.Id == resId
                             select r).ToList();

                    if(q.Count < 1)
                    {
                        //no record found
                        Response.Redirect("~/reserve/default.aspx");
                    }
                    else
                    {
                        var r = q.FirstOrDefault();

                        ddlSubject.SelectedValue = r.SubjectId.ToString();
                        txtExpNo.Text = r.ExperimentNo;
                        txtDateNeeded.Text = r.DateFrom.ToString();
                        txtDateNeededTo.Text = r.DateTo.ToString();
                        txtLabRoom.Text = r.LabRoom;
                        txtDisapprovedRemarks.Text = r.DisapproveRemarks;

                        //assign Id to control
                        hfResId.Value = r.Id.ToString();

                        bindReserveItems();
                        bindTaggedGroups();
                        bindReleaseGroups();
                        bindReturnedGroups();

                        //show approval buttons
                        if(User.IsInRole("CSR Head") ||
                            User.IsInRole("Admin"))
                        {
                            //chk if approved
                            //to avoid duplication of deduction
                            if(r.ApprovalStatus != "Approved")
                            {
                                btnApprove.Visible = true;
                                btnDisapprove.Visible = true;
                            }
                        }

                        //show update button
                        if(User.IsInRole("Admin") || 
                            User.IsInRole("Instructor"))
                        {
                            btnSave.Visible = true;
                            enableFields();
                        }

                        //can edit -> admin,csr head,student assistant,instructor
                        if(User.IsInRole("Student"))
                        {
                            btnTagGroup.Visible = true;

                            //hide borrow/return button
                            gvTaggedGroups.Columns[4].Visible = false;
                            gvReleaseGroup.Columns[4].Visible = false;
                        }
                        else
                        {
                            if(!User.IsInRole("Admin") && 
                                !User.IsInRole("Student Assistant"))
                            {
                                //hide borrow/return button
                                gvTaggedGroups.Columns[4].Visible = false;
                                //gvBorrowers.Columns[5].Visible = false;
                            }
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate("vgPrimaryAdd");
            
            if(Page.IsValid)
            {
                if (btnSave.Text != "Ok")
                {
                    var q = (from r in db.Reservations
                             where r.Id == Convert.ToInt32(hfResId.Value)
                             select r).FirstOrDefault();

                    q.SubjectId = Convert.ToInt32(ddlSubject.SelectedValue);
                    q.ExperimentNo = txtExpNo.Text;
                    q.DateFrom = Convert.ToDateTime(txtDateNeeded.Text);
                    q.DateTo = Convert.ToDateTime(txtDateNeededTo.Text);
                    q.LabRoom = txtLabRoom.Text;

                    db.SubmitChanges();

                    int resId = q.Id;

                    foreach (GridViewRow row in gvReservaItems.Rows)
                    {
                        //chk if checkbox is checked
                        if (((CheckBox)row.FindControl("chkRow")).Checked == true)
                        {
                            string quantity = "";
                            int riId = Convert.ToInt32(((Label)row.FindControl("lblRowId")).Text);

                            if ((quantity = ((TextBox)row.FindControl("txtQuantityToBorrow")).Text) != String.Empty)
                            {
                                var r = (from ri in db.ReservationItems
                                         where ri.Id == riId
                                         select ri).FirstOrDefault();

                                r.Quantity = Convert.ToInt32(quantity);

                                db.SubmitChanges();
                            }
                        }
                    }
                    Response.Redirect("~/reserve/default.aspx");
                }
                else
                {
                    Response.Redirect("~/reserve/default.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/reserve/default.aspx");
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int resId = Convert.ToInt32(Request.QueryString["resId"].ToString());
            var q = (from r in db.Reservations
                     where r.Id == resId
                     select r).FirstOrDefault();

            q.ApprovalStatus = "Approved";

            db.SubmitChanges();

            //deduct in stocks
            var resItems = (from ri in db.ReservationItems
                            where ri.ReservationId == Convert.ToInt32(Request.QueryString["resId"])
                            select ri).ToList();

            foreach(var item in resItems)
            {
                var updateStocks = (from inv in db.InventoryLINQs
                                    where inv.Id == item.InventoryId
                                    select inv).FirstOrDefault();

                updateStocks.Stocks = (updateStocks.Stocks - item.Quantity);
                db.SubmitChanges();
            }

            Response.Redirect("~/reserve/default.aspx");
        }

        protected void btnDisapprove_Click(object sender, EventArgs e)
        {
            //open remarks modal
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#disapproveModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteShowModalScript", sb.ToString(), false);


            //int resId = Convert.ToInt32(Request.QueryString["resId"].ToString());
            //var q = (from r in db.Reservations
            //         where r.Id == resId
            //         select r).FirstOrDefault();

            //q.ApprovalStatus = "Disapproved";

            //db.SubmitChanges();

            //Response.Redirect("~/reserve/default.aspx");
        }

        protected void btnConfirmReturn_Click(object sender, EventArgs e)
        {
            var res = (from r in db.Reservations
                       where r.Id == Convert.ToInt32(Request.QueryString["resId"])
                       select r).FirstOrDefault();

            //update here:
            foreach(GridViewRow row in gvBreakage.Rows)
            {
                if(row.RowType == DataControlRowType.DataRow)
                {
                    //int biId = Convert.ToInt32(((Label)row.FindControl("lblRowId")).Text);
                    //int inventoryId = Convert.ToInt32(((Label)row.FindControl("lblInventoryId")).Text);
                    //int breakageQuantity = Convert.ToInt32(((TextBox)row.FindControl("txtBreakage")).Text);
                    //int quantityToBorrow = Convert.ToInt32(((Label)row.FindControl("lblBorrowedQuantity")).Text);
                    //string remarks = ((TextBox)row.FindControl("txtRemarks")).Text;

                    //var q = (from bi in db.BorrowItems
                    //         where bi.Id == biId
                    //         select bi).FirstOrDefault();

                    //q.Breakage = breakageQuantity;
                    //q.Remarks = remarks;

                    //db.SubmitChanges();

                    ////add in ReservationItem
                    //var resItems = (from ri in db.ReservationItems
                    //                where
                    //                (ri.InventoryId == inventoryId) &&
                    //                (ri.ReservationId == Convert.ToInt32(Request.QueryString["resId"]))
                    //                select ri).FirstOrDefault();

                    //resItems.Quantity = (resItems.Quantity + quantityToBorrow);


                    //return quantity to inv stocks
                    //var qu = (from i in db.InventoryLINQs
                    //         where i.Id == q.InventoryId
                    //         select i).FirstOrDefault();

                    //qu.Stocks = (qu.Stocks + q.BorrowedQuantity);
                    //db.SubmitChanges();
                 
                    ////chk if it has breakage - change status
                    //if(breakageQuantity > 0)
                    //{
                    //    res.Status = "Has Breakage";
                    //}
                }
            }

            db.SubmitChanges();

            bindReserveItems();
            bindTaggedGroups();
            bindReleaseGroups();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#showReturnModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteShowModalScript", sb.ToString(), false);
        }

        protected void btnConfirmBorrow_Click(object sender, EventArgs e)
        {
            int reservationId = Convert.ToInt32(Request.QueryString["resId"]);

            foreach(GridViewRow row in gvBorrow.Rows)
            {
                if(row.RowType == DataControlRowType.DataRow)
                {
                    int inventoryId = Convert.ToInt32(((Label)row.FindControl("lblInventoryId")).Text);
                    int quantityToBorrow = Convert.ToInt32(((TextBox)row.FindControl("txtQuantity")).Text);

                    //update borroweditems
                    //var item = (from bi in db.BorrowItems
                    //            join b in db.Borrows
                    //            on bi.BorrowId equals b.Id
                    //            where
                    //            (b.ReservationId == reservationId) &&
                    //            (bi.InventoryId == inventoryId)
                    //            select bi).FirstOrDefault();

                    //item.BorrowedQuantity = quantityToBorrow;


                    ////deduct in ReservationItem
                    //var resItems = (from ri in db.ReservationItems
                    //                where 
                    //                (ri.InventoryId == inventoryId) &&
                    //                (ri.ReservationId == Convert.ToInt32(Request.QueryString["resId"]))
                    //                select ri).FirstOrDefault();
                    //resItems.Quantity = (resItems.Quantity - quantityToBorrow);


                    ////deduct in Inventory
                    //var q = (from i in db.InventoryLINQs
                    //         where i.Id == inventoryId
                    //         select i).FirstOrDefault();
                    //q.Stocks = (q.Stocks - quantityToBorrow);

                    db.SubmitChanges();
                }
            }

            //set borrowId to In-Progress
            //int borId = Convert.ToInt32(lblBorrowId.Text);
            //var bor = (from b in db.Borrows
            //           where
            //           b.Id == borId
            //           select b).FirstOrDefault();
            //bor.Status = "In-Progress";
            //db.SubmitChanges();

            //bindReserveItems();
            //bindTaggedGroups();
            //bindReleaseGroups();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#showBorrowModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteShowModalScript", sb.ToString(), false);
        }

        protected void btnTagGroup_Click(object sender, EventArgs e)
        {
            var q = (from g in db.GroupLINQs
                     join gm in db.GroupMembers
                     on g.Id equals gm.GroupId
                     where
                     (g.ReservationId == Convert.ToInt32(Request.QueryString["resId"]))
                     select new
                     {
                         Id = g.Id
                     }).ToList();

            //chk user belongs to a group
            var group = (from g in db.GroupLINQs
                         join gm in db.GroupMembers
                         on g.Id equals gm.GroupId
                         select new
                         {
                             GroupId = g.Id
                         }).FirstOrDefault();

            if (q.Count < 1)
            {
                //Borrow b = new Borrow();
                //b.GroupId = group.GroupId;
                //b.ReservationId = Convert.ToInt32(Request.QueryString["resId"]);
                //b.Status = "Joined";
                //b.JoinedDate = DateTime.Now;

                //db.Borrows.InsertOnSubmit(b);
                //db.SubmitChanges();

                ////insert to borrowitem
                //foreach(GridViewRow row in gvReservaItems.Rows)
                //{
                //    if(row.RowType == DataControlRowType.DataRow)
                //    {
                //        int invId = Convert.ToInt32(((Label)row.FindControl("lblInventoryId")).Text);

                //        BorrowItem bi = new BorrowItem();
                //        bi.BorrowId = b.Id;
                //        bi.InventoryId = invId;
                //        bi.BorrowedQuantity = 0;
                //        bi.Breakage = 0;

                //        db.BorrowItems.InsertOnSubmit(bi);
                //        db.SubmitChanges();
                //    }
                //}
                bindTaggedGroups();
                pnlSuccessfullJoin.Visible = true;
            }
            else
            {
                //show alert
                pnlDoublejoin.Visible = true;
                pnlSuccessfullJoin.Visible = false;
            }
        }

        protected void btnConfirmDisapprove_Click(object sender, EventArgs e)
        {
            int resId = Convert.ToInt32(Request.QueryString["resId"].ToString());
            var q = (from r in db.Reservations
                     where r.Id == resId
                     select r).FirstOrDefault();

            q.ApprovalStatus = "Disapproved";
            q.DisapproveRemarks = txtDisapproveRemarks.Text;

            db.SubmitChanges();

            Response.Redirect("~/reserve/default.aspx");
        }

        protected void gvBorrowers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("showBorrow"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int borId = (int)gvTaggedGroups.DataKeys[index].Value;

                //load group info
                //var q = (from b in db.Borrows
                //         join g in db.GroupLINQs
                //         on b.GroupId equals g.Id
                //         join gm in db.GroupMembers
                //         on g.Id equals gm.GroupId
                //         join acc in db.AccountLINQs
                //         on gm.UserId equals acc.UserId
                //         where (b.ReservationId == Convert.ToInt32(Request.QueryString["resId"])) &&
                //         (b.Id == borId)
                //         select new
                //         {
                //             Id = b.Id,
                //             GroupName = g.Name,
                //             GroupLeader = acc.LastName + ", " + acc.FirstName + " " + acc.MiddleName,
                //             Status = b.Status,
                //             GroupId = g.Id
                //         }).FirstOrDefault();


                //lblBorrowId.Text = q.Id.ToString();
                //txtGroupNameBorrow.Text = q.GroupName;
                //txtGroupLeaderBorrow.Text = q.GroupLeader;

                //load related items - from BorrowItems
                var items = from i in db.Items
                            join inv in db.InventoryLINQs
                            on i.Id equals inv.ItemId
                            join ri in db.ReservationItems
                            on inv.Id equals ri.InventoryId
                            where
                            (ri.ReservationId == Convert.ToInt32(Request.QueryString["resId"]))
                            select new
                            {
                                Id = ri.Id,
                                InventoryId = ri.InventoryId,
                                ItemName = i.ItemName,
                                Stocks = inv.Stocks,
                                ReservedQuantity = ri.Quantity,
                                QuantityByGroup = ri.QuantityByGroup
                            };

                gvBorrow.DataSource = items.ToList();
                gvBorrow.DataBind();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#showBorrowModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteShowModalScript", sb.ToString(), false);
            }
        }

        protected void gvRelease_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("showReturn"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int borId = (int)gvReleaseGroup.DataKeys[index].Value;

                //load group info
                //var q = (from b in db.Borrows
                //         join g in db.GroupLINQs
                //         on b.GroupId equals g.Id
                //         join gm in db.GroupMembers
                //         on g.Id equals gm.GroupId
                //         join acc in db.AccountLINQs
                //         on gm.UserId equals acc.UserId
                //         where (b.ReservationId == Convert.ToInt32(Request.QueryString["resId"])) &&
                //         (b.Id == borId)
                //         select new
                //         {
                //             Id = b.Id,
                //             GroupName = g.Name,
                //             GroupLeader = acc.LastName + ", " + acc.FirstName + " " + acc.MiddleName,
                //             Status = b.Status,
                //             GroupId = g.Id
                //         }).FirstOrDefault();

                //lblRowId.Text = q.Id.ToString();
                //txtGroupName.Text = q.GroupName;
                //txtGroupLeader.Text = q.GroupLeader;

                //load related items and chk if it has breakage/missing
                //var items = from i in db.Items
                //            join inv in db.InventoryLINQs
                //            on i.Id equals inv.ItemId
                //            join bi in db.BorrowItems
                //            on inv.Id equals bi.InventoryId
                //            join b in db.Borrows
                //            on bi.BorrowId equals b.Id
                //            where bi.BorrowId == q.Id
                //            select new
                //            {
                //                Id = bi.Id,
                //                InventoryId = bi.InventoryId,
                //                Name = i.ItemName,
                //                Stocks = inv.Stocks,
                //                BorrowedQuantity = bi.BorrowedQuantity,
                //                Breakage = bi.Breakage,
                //                Remarks = bi.Remarks
                //            };

                //gvBreakage.DataSource = items.ToList();
                //gvBreakage.DataBind();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#showReturnModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteShowModalScript", sb.ToString(), false);
            }
        }

        protected void bindReserveItems()
        {
            var q = from i in db.Items
                    join inv in db.InventoryLINQs
                    on i.Id equals inv.ItemId
                    join ri in db.ReservationItems
                    on inv.Id equals ri.InventoryId
                    join r in db.Reservations
                    on ri.ReservationId equals r.Id
                    where r.Id == Convert.ToInt32(hfResId.Value)
                    select new
                    {
                        Id = ri.Id,
                        InventoryId = ri.InventoryId,
                        Name = i.ItemName,
                        Stocks = inv.Stocks,
                        Quantity = ri.Quantity,
                        QuantityByGroup = ri.QuantityByGroup
                    };

            gvReservaItems.DataSource = q.ToList();
            gvReservaItems.DataBind();
        }

        protected void bindTaggedGroups()
        {
            //var q = from b in db.Borrows
            //        join g in db.GroupLINQs
            //        on b.GroupId equals g.Id
            //        join gm in db.GroupMembers
            //        on g.Id equals gm.GroupId
            //        join acc in db.AccountLINQs
            //        on gm.UserId equals acc.UserId
            //        where
            //        (b.ReservationId == Convert.ToInt32(Request.QueryString["resId"])) &&
            //        (b.Status == "Joined")
            //        select new
            //        {
            //            Id = b.Id,
            //            GroupName = g.Name,
            //            GroupLeader = acc.LastName + ", " + acc.FirstName + " " + acc.MiddleName,
            //            Status = b.Status
            //        };
            //gvTaggedGroups.DataSource = q.ToList();
            //gvTaggedGroups.DataBind();
        }

        protected void bindReleaseGroups()
        {
            //var q = from b in db.Borrows
            //        join g in db.GroupLINQs
            //        on b.GroupId equals g.Id
            //        join gm in db.GroupMembers
            //        on g.Id equals gm.GroupId
            //        join acc in db.AccountLINQs
            //        on gm.UserId equals acc.UserId
            //        where
            //        (b.ReservationId == Convert.ToInt32(Request.QueryString["resId"])) &&
            //        (b.Status == "In-Progress")
            //        select new
            //        {
            //            Id = b.Id,
            //            GroupName = g.Name,
            //            GroupLeader = acc.LastName + ", " + acc.FirstName + " " + acc.MiddleName,
            //            Status = b.Status
            //        };
            //gvReleaseGroup.DataSource = q.ToList();
            //gvReleaseGroup.DataBind();
        }

        protected void bindReturnedGroups()
        {
            //var q = from b in db.Borrows
            //        join g in db.GroupLINQs
            //        on b.GroupId equals g.Id
            //        join gm in db.GroupMembers
            //        on g.Id equals gm.GroupId
            //        join acc in db.AccountLINQs
            //        on gm.UserId equals acc.UserId
            //        where
            //        (b.ReservationId == Convert.ToInt32(Request.QueryString["resId"])) &&
            //        (b.Status == "Returned")
            //        select new
            //        {
            //            Id = b.Id,
            //            GroupName = g.Name,
            //            GroupLeader = acc.LastName + ", " + acc.FirstName + " " + acc.MiddleName,
            //            Status = b.Status
            //        };

            //gvReturnedGroup.DataSource = q.ToList();
            //gvReturnedGroup.DataBind();
        }

        protected void disableFields()
        {
            txtDateNeeded.Enabled = false;
            txtDateNeededTo.Enabled = false;
            txtExpNo.Enabled = false;
            txtLabRoom.Enabled = false;
            ddlSubject.Enabled = false;
            gvReservaItems.Enabled = false;
        }

        protected void enableFields()
        {
            txtDateNeeded.Enabled = true;
            txtDateNeededTo.Enabled = true;
            txtExpNo.Enabled = true;
            txtLabRoom.Enabled = true;
            ddlSubject.Enabled = true;
            gvReservaItems.Enabled = true;
        }

        private void bindDropdown()
        {
            var q = (from s in db.SubjectLINQs
                     select s).ToList();

            ddlSubject.DataSource = q;
            ddlSubject.DataTextField = "Name";
            ddlSubject.DataValueField = "Id";
            ddlSubject.DataBind();
        }

        protected void gvReturned_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Convert.ToDateTime(txtDateNeeded.Text) >= Convert.ToDateTime(txtDateNeededTo.Text))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}