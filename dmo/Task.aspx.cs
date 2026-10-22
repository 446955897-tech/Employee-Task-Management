using jana13211App.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jana13211App.dmo
{
    public partial class Task : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Add
        protected void btnInsertEmployee_Click(object sender, EventArgs e)

        {

            CRUD myCrud = new CRUD();
            string mySql = @"insert Task(empID,title,priorityID,CreatedDate,statID,dueDate)
               values(@empID,@title,@priorityID,@CreatedDate,@statID,@dueDate)";

            Dictionary<string, object> myPara = new Dictionary<string, object>();

            myPara.Add("@empID", empID.Text);
            myPara.Add("@title", title.Text);
            myPara.Add("@priorityID", DropDownList2.SelectedItem.Value);
            myPara.Add("@CreatedDate", Calendar.SelectedDate);
            myPara.Add("@statID", 1);

           

            if (Calendar.SelectedDate != DateTime.MinValue)
            {
                myPara.Add("@dueDate", Calendar.SelectedDate);
            }
            else
            {
                myPara.Add("@dueDate", DBNull.Value);
            }

            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                // إظهار النافذة المنبثقة التفاعلية عند النجاح 🎉
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Employee Added Successfully! ');", true);

                // استدعاء دالة تنظيف وتفريغ الحقول
                ClearFormFields();
            }
            else
            {
                // إظهار نافذة منبثقة تفاعلية عند الفشل ❌
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Failed to add employee! Please try again. ');", true);
            }
        }
        // دالة مخصصة لتفريغ كافة الحقول بعد الإضافة الناجحة
        private void ClearFormFields()
        {
            empID.Text = string.Empty;
            title.Text = string.Empty;

            // إعادة تعيين القائمة المنسدلة للخيار الأول
            if (DropDownList2.Items.Count > 0)
            {
                DropDownList2.SelectedIndex = 0;
            }

        }
        protected void btnGetDataEmployee1_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select  * from V_TaskDetails  ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvTask.DataSource = dr;
            gvTask.DataBind();
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            // 1. شغل كود زر Get Data أولاً لتعبئة الجدول بالبيانات
            btnGetDataEmployee1_Click(sender, e);

            // 2. كود التصدير المعتاد
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Tasks_Report.xls");
            Response.Charset = "UTF-8";
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;

            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                // تصدير الجدول بعد أن امتلاء بالبيانات
                gvTask.RenderControl(hw);

                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // أتركها فارغة، وظيفتها فقط إقناع ASP.NET بأن العنصر يقع داخل form
        }
    }
}