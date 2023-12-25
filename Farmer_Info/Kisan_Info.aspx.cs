using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Farmer_Info
{
    public partial class Kisan_Info : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-FIT812I\SQLEXPRESS;Initial Catalog=Kisan_Portal;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {                
                fnDistrictInfo();
                ShowData();
            }            
        }
        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            fnBranchInfo();
        }

        void fnDistrictInfo()
        {
            SqlCommand cmd = new SqlCommand("select * from District_tbl", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            ddlDistrict.DataSource = cmd.ExecuteReader();
            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictId";
            ddlDistrict.DataBind();
            ddlDistrict.Items.Insert(0, new ListItem("---Select District---"));
            //ddlDistrict.Items.Insert(1, new ListItem("Ad new District"));
            con.Close();
        }

        void fnBranchInfo()
        {
            string District = ddlDistrict.SelectedValue;
            SqlCommand cmd = new SqlCommand("select * from branch_tbl where DistrictId=" + District + "", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            ddlBranch.DataSource = cmd.ExecuteReader();
            ddlBranch.DataTextField = "BranchName";
            ddlBranch.DataValueField = "BranchId";
            ddlBranch.DataBind();
            ddlBranch.Items.Insert(0, new ListItem("Select Branch"));
            con.Close();
        }

        void fnSocietyInfo()
        {
            SqlCommand cmd = new SqlCommand("select * from Society_tbl where SocId="+ ddlBranch.SelectedValue +"", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            ddlSociety.DataSource = cmd.ExecuteReader();
            ddlSociety.DataTextField = "SocName";
            ddlSociety.DataValueField = "SocId";
            ddlSociety.DataBind();
            ddlSociety.Items.Insert(0, new ListItem("Select Society"));
            con.Close();
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            fnSocietyInfo();
        }

        protected void Insert_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Farmersetup_sp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("FarmerName", FarmerNametxt.Text);
            cmd.Parameters.AddWithValue("FatherName", FatherNametxt.Text);
            cmd.Parameters.AddWithValue("VillageName", Villagetxt.Text);
            cmd.Parameters.AddWithValue("Gender", rblGender.Text);
            cmd.Parameters.AddWithValue("Caste", ddlCaste.Text);
            cmd.Parameters.AddWithValue("DistrictId", ddlDistrict.SelectedValue);
            cmd.Parameters.AddWithValue("BranchId", ddlBranch.SelectedValue);
            cmd.Parameters.AddWithValue("SocId", ddlSociety.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            Label1.Text = "Record Inserted Succesfully into the Database";
            Label1.ForeColor = System.Drawing.Color.Red;
            con.Close();
            ShowData();
            ClearData();
        }
        void ShowData()
        {
            SqlCommand cmd = new SqlCommand("GetData", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            if (row != null)
            {
                // Assuming the first cell contains the ID and the second cell contains the Name
                //hfFarmerId1.Value = row.Cells[0].FindControl("hfFarmerID");
                FarmerNametxt.Text = row.Cells[0].Text;
                FatherNametxt.Text = row.Cells[1].Text;
                Villagetxt.Text = row.Cells[2].Text;
                rblGender.Text = row.Cells[3].Text;
                ddlCaste.SelectedValue = row.Cells[4].Text;
                ddlDistrict.SelectedItem.Text = row.Cells[5].Text;
                //ddlBranch.SelectedItem.Text = row.Cells[6].Text;
                //fnBranchInfo();
                //ddlSociety.SelectedItem.Text = row.Cells[7].Text;
                // Add code to populate other TextBoxes if needed
                HiddenField hfFarmerID = row.FindControl("hfFarmerID") as HiddenField;
                if (hfFarmerID != null)
                {
                    // Store the Farmer ID in a hidden field
                    hfFarmerId1.Value = hfFarmerID.Value;
                }
            }            
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Farmerupdate_sp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("FarmerId", Convert.ToInt32(hfFarmerId1.Value));
            cmd.Parameters.AddWithValue("FarmerName", FarmerNametxt.Text);
            cmd.Parameters.AddWithValue("FatherName", FatherNametxt.Text);
            cmd.Parameters.AddWithValue("VillageName", Villagetxt.Text);
            cmd.Parameters.AddWithValue("Gender", rblGender.Text);
            cmd.Parameters.AddWithValue("Caste", ddlCaste.SelectedValue);
            //cmd.Parameters.AddWithValue("DistrictId", ddlDistrict.SelectedValue);
            //cmd.Parameters.AddWithValue("BranchId", ddlBranch.SelectedValue);
            //cmd.Parameters.AddWithValue("SocId", ddlSociety.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            Label1.Text = "Record Updated Succesfully into the Database";
            Label1.ForeColor = System.Drawing.Color.DarkBlue;
            con.Close();
            ShowData();
            ClearData();
        }

        void ClearData()
        {
            FarmerNametxt.Text = "";
            FatherNametxt.Text = "";
            Villagetxt.Text = "";
            rblGender.ClearSelection();
            ddlCaste.SelectedIndex = 0;
            //ddlBranch.SelectedIndex = 0;
            //ddlSociety.SelectedIndex = 0;
            ddlDistrict.SelectedIndex = 0;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            if (row != null)
            {
                // Access the hidden field to get the Farmer ID
                HiddenField hfFarmerID = row.FindControl("hfFarmerID") as HiddenField;
                if (hfFarmerID != null)
                {
                    // Store the Farmer ID in a hidden field
                    hfSelectedFarmerID.Value = hfFarmerID.Value;
                }
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM Farmer_Info where FarmerId='" + Convert.ToInt32(hfSelectedFarmerID.Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            Label1.Text = "Record Deleted Succesfully into the Database";
            Label1.ForeColor = System.Drawing.Color.MediumVioletRed;
            con.Close();
            ShowData();
        }        
    }
}