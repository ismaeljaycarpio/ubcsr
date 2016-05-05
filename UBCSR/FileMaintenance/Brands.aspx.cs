﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UBCSR.FileMaintenance
{
    public partial class Brand : System.Web.UI.Page
    {
        DAL.FileMaintenance fm = new DAL.FileMaintenance();
        DataTable dt;
        CSRContextDataContext db = new CSRContextDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindData();
            }
        }

        protected void bindData()
        {
            gvBrand.DataSource = fm.searchBrand(txtSearch.Text);
            gvBrand.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var brands = (from b in db.ItemBrands
                          where b.BrandName == txtAddBrand.Text.Trim()
                          select b).ToList();

            if(brands.Count > 0)
            {
                lblDuplicateRecords.Text = "Brand name already exists!";
            }
            else
            {
                fm.addBrand(txtAddBrand.Text);

                bindData();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#addModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "HideShowModalScript", sb.ToString(), false);
            }   
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            fm.editBrand(txtEditBrand.Text, lblRowId.Text);

            bindData();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#updateModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);
        }

        protected void gvBrand_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBrand.PageIndex = e.NewPageIndex;
            bindData();
        }

        protected void gvBrand_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string rowId = ((Label)gvBrand.Rows[e.RowIndex].FindControl("lblRowId")).Text;
            fm.deleteBrand(rowId);

            bindData();
        }

        protected void gvBrand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            dt = new DataTable();
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                dt = fm.getBrand((int)(gvBrand.DataKeys[index].Value));
                lblRowId.Text = dt.Rows[0]["Id"].ToString();
                txtEditBrand.Text = dt.Rows[0]["BrandName"].ToString();

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#updateModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditShowModalScript", sb.ToString(), false);
            }

            else if (e.CommandName.Equals("deleteRecord"))
            {
                string rowId = ((Label)gvBrand.Rows[index].FindControl("lblRowId")).Text;
                hfDeleteId.Value = rowId;

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteShowModalScript", sb.ToString(), false);
            }
        }

        protected void btnOpenModal_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindData();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            fm.deleteBrand(hfDeleteId.Value);
            bindData();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#deleteModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);
        }
    }
}