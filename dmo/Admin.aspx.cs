using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using jana13211App.App_Code;
using System.Collections.Generic;

namespace jana13211App.dmo
{
    public partial class Admin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Add
        protected void btnSaveEmployee_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtFullName.Text) || string.IsNullOrEmpty(txtEmail.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please fill in the Full Name and Email fields! ⚠️');", true);
                return;
            }

            CRUD myCrud = new CRUD();
            string mySql = @"insert Employee(empName,email,phone,depID,genderID,IsActive)
               values(@empName,@email,@phone,@depID,@genderID,@IsActive)";

            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@empName", txtFullName.Text);
            myPara.Add("@email", txtEmail.Text);
            myPara.Add("@phone", txtPhone.Text);
            myPara.Add("@depID", DropDownList1.SelectedItem.Value);
            myPara.Add("@genderID", rblGender.SelectedItem.Value);
            myPara.Add("@IsActive", chkActive.Checked ? 1 : 2);



            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn >= 1)
            {
                // إظهار الرسالة التفاعلية عند النجاح
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Employee Added Successfully!');", true);

                // إرسال البريد الإلكتروني للموظف الجديد
                SendWelcomeEmail(txtEmail.Text.Trim(), txtFullName.Text.Trim(), txtID.Text.Trim());

                // استدعاء دالة تفريغ الحقول
                ClearFormFields();
            }
            else
            {
                // إظهار رسالة الفشل
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Failed to add employee! Please try again.');", true);
            }
        }

        // دالة مخصصة لتفريغ كافة الحقول بعد الإضافة الناجحة
        private void ClearFormFields()
        {
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;

            // إعادة تعيين القائمة المنسدلة للخيار الأول
            if (DropDownList1.Items.Count > 0)
            {
                DropDownList1.SelectedIndex = 0;
            }

            // إلغاء الاختيار من قائمة الجنس
            rblGender.ClearSelection();

            // إلغاء تفعيل صندوق الاختيار النشط
            chkActive.Checked = false;
        }
        private void SendWelcomeEmail(string userEmail, string userName, string empID)
        {
            try
            {
                string host = System.Configuration.ConfigurationManager.AppSettings["HostsmtpAddress"];
                int port = int.Parse(System.Configuration.ConfigurationManager.AppSettings["PortNumber"]);
                string senderEmail = System.Configuration.ConfigurationManager.AppSettings["emailUserName"];
                string password = System.Configuration.ConfigurationManager.AppSettings["emailPassword"];
                bool enableSSL = bool.Parse(System.Configuration.ConfigurationManager.AppSettings["EnableSSL"]);

                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = new System.Net.Mail.MailAddress(senderEmail, "نظام إدارة المهام - KFMC");
                mail.To.Add(userEmail);
                mail.Subject = "تمت إضافتك بنجاح إلى نظام إدارة المهام";

                mail.Body = $@"
               <h3>أهلاً بك {userName}!</h3>
               <p>تمت إضافتك بنجاح كـ موظف جديد في النظام.</p>
               <p><b>رقم الموظف:</b> {empID}</p>
               <br/><p>إدارة النظام</p>";

                mail.IsBodyHtml = true;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(host, port);
                smtp.Credentials = new System.Net.NetworkCredential(senderEmail, password);
                smtp.EnableSsl = enableSSL;

                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error sending email: " + ex.Message);
            }
        }

        // delet 

        protected void btnDeleteEmployee_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtID.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please enter the Employee ID to delete! ⚠️');", true);
                return;
            }

            CRUD myCrud = new CRUD();
            string mySql = @"delete Employee
            where empID = @empID ";

            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@empID", int.Parse(txtID.Text));



            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            // دالة مخصصة لتفريغ كافة الحقول بعد الإضافة الناجحة

            if (rtn >= 1)
            {
                // رسالة منبثقة تفاعلية عند نجاح الحذف 🎉
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Employee Deleted Successfully! ');", true);

                // تفريغ الحقول بعد الحذف
                ClearFormFields();
                txtID.Text = string.Empty;
            }
            else
            {
                // رسالة منبثقة في حال لم يعثر على الـ ID في قاعدة البيانات
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Employee ID not found or deletion failed! ');", true);
            }
        }

        // get data

        protected void btnGetDataEmployee_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select  * from V_EmployeeDetails order by empID asc ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvEmployee.DataSource = dr;
            gvEmployee.DataBind();
        }


        //Update

        protected void btnUpdateEmployee_Click(object sender, EventArgs e)
        {
            // 1. التحقق من إدخال رقم الـ ID
            if (string.IsNullOrWhiteSpace(txtID.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('يرجى إدخال رقم المعرف (ID)');", true);
                return;
            }

            CRUD myCrud = new CRUD();
            int activeStatus = chkActive.Checked ? 1 : 2;

            // 2. استعلام التحديث الآمن باستخدام Parameters (UPDATE فقط)
            string mySql = "UPDATE Employee SET IsActive = @IsActive WHERE empID = @empID";

            try
            {
                if (myCrud.con.State == System.Data.ConnectionState.Open)
                {
                    myCrud.con.Close();
                }

                using (SqlCommand cmd = new SqlCommand(mySql, myCrud.con))
                {
                    cmd.Parameters.AddWithValue("@IsActive", activeStatus);
                    cmd.Parameters.AddWithValue("@empID", txtID.Text.Trim());

                    myCrud.con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    myCrud.con.Close();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('تم تحديث حالة الموظف بنجاح!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('لم يتم العثور على موظف بهذا الـ ID، تأكد من الرقم');", true);
                    }
                }

                // 3. إعادة عرض البيانات في الـ GridView
                BindEmployeeGrid();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('حدث خطأ: {ex.Message.Replace("'", "")}');", true);
            }
        }

        // 4. دالة إعادة عرض البيانات الصحيحة (تأكدي من استبدال القديمة بها)
        private void BindEmployeeGrid()
        {
            CRUD myCrud = new CRUD();
            string refreshSql = "SELECT * FROM V_EmployeeDetails ORDER BY empID ASC";

            gvEmployee.DataSource = myCrud.getDrPassSql(refreshSql);
            gvEmployee.DataBind();
        }
    }



}
    


