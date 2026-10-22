using jana13211App.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jana13211App.dmo
{
    public partial class Employee : System.Web.UI.Page
    {
        private object gvTask;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetTasks_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = $"select  * from V_TaskDetails WHERE empID='{txtEmpID.Text.Trim()}' ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvTask1.DataSource = dr;
            gvTask1.DataBind();
        }

      
        protected void btnUpdateTask_Click(object sender, EventArgs e)
        {
            // 1. التحقق من اختيار/إدخال رقم المهمة المراد تحديثها
            if (string.IsNullOrWhiteSpace(taskID.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please enter Task ID');", true);
                return;
            }

            CRUD myCrud = new CRUD();

            // 2. استعلام التحديث الخاص بعمودي State و DueDate فقط
            string mySql = @"UPDATE Task 
                    SET StatID = @StatID, 
                        dueDate = @dueDate 
                    WHERE taskID = @taskID";

            try
            {
                if (myCrud.con.State == System.Data.ConnectionState.Open)
                {
                    myCrud.con.Close();
                }

                using (SqlCommand cmd = new SqlCommand(mySql, myCrud.con))
                {
                    // إسناد القيمة المختارة من قائمة Status (DropDownList)
                    cmd.Parameters.AddWithValue("@StatID", ddlStatus.SelectedValue);

                    // إسناد تاريخ الاستحقاق من التقويم (Calendar) أو مربع النص (TextBox)
                    // إذا كنتِ تستخدمين Calendar1:
                    cmd.Parameters.AddWithValue("@dueDate", Calendar1.SelectedDate != DateTime.MinValue ? Calendar1.SelectedDate : (object)DBNull.Value);

                    // إذا كنتِ تستخدمين TextBox للتقويم استخدمي السطر التالي بدلاً من Calendar1:
                    // cmd.Parameters.AddWithValue("@DueDate", txtDueDate.Text.Trim());

                    cmd.Parameters.AddWithValue("@taskID", taskID.Text.Trim());

                    myCrud.con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    myCrud.con.Close();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert(' Update Successfully!!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Failed to Update ! Please try again');", true);
                    }
                }

                // 3. إعادة تحديث جدول الـ GridView للـ Tasks
                BindTaskGrid();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Erorr: {ex.Message.Replace("'", "")}');", true);
            }
        }

        // دالة تحديث العرض بالـ GridView
        private void BindTaskGrid()
        {
            CRUD myCrud = new CRUD();
            string refreshSql = "SELECT * FROM Task ORDER BY taskID ASC";

            gvTask1.DataSource = myCrud.getDrPassSql(refreshSql);
            gvTask1.DataBind();
        }
    }
}