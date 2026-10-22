<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="jana13211App.dmo.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <style>
        body {
            /* 1. تحديد رابط الصورة */
            background-image: url('../img/KFMC.jpeg');
            
            /* 2. جعل الصورة تغطي كامل الشاشة */
            background-size: cover;
            
            /* 3. توسيط الصورة */
            background-position: center;

            min-height: 100vh;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            margin: 0;
            
            /* 4. تثبيت الصورة عند السكرول */
            background-attachment: fixed;
            
            /* 5. منع تكرار الصورة */
            background-repeat: no-repeat;

        }


 
        .employee-container {
            max-width: 750px;
            margin: 20px auto;
            padding: 10px;
            font-family: Arial, sans-serif;
        }

        .employee-title {
            text-align: left;
            color: #1a1a2e;
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: #333333;
            display: block;
            margin-bottom: 5px;
        }

        .form-input {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background: #ffffff;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        .form-input:focus {
            border-color: #121526;
            outline: none;
        }

        .btn-dark-custom {
            background-color: #121526;
            color: #ffffff;
            border: none;
            padding: 9px 28px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-dark-custom:hover {
            background-color: #2b2e4a;
        }

        .custom-grid {
            width: 100%;
            margin-top: 20px;
            background-color: #ffffff;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

        .custom-grid th {
            background-color: #121526;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 14px;
        }

        .custom-grid td {
            padding: 9px;
            text-align: center;
            border-bottom: 1px solid #eee;
            font-size: 13px;
            color: #333;
        }
    </style>

    <div class="employee-container">
        <h2 class="employee-title">Employee Portal</h2>
        
        <hr style="border: none; border-top: 1px solid #ddd; margin-bottom: 20px;" />

        <div>
            <!-- قسم البحث برقم الموظف -->
            <div>
                <label class="form-label">Employee ID</label>
                <asp:TextBox ID="txtEmpID" runat="server" placeholder="Enter Employee ID" CssClass="form-input" Width="501px"></asp:TextBox>
                <asp:Button ID="btnGetTasks" runat="server" Text="Get Data" OnClick="btnGetTasks_Click" CssClass="btn-dark-custom" />
            </div>

            <div style="margin-top: 20px; text-align: center;">
             <asp:GridView ID="gvTask1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="90%" HorizontalAlign="Center">
             </asp:GridView>
        </div>

            <div style="text-align: center; margin: 10px 0 20px 0;">
            </div>

            <hr style="border: none; border-top: 1px dashed #ccc; margin: 20px 0;" />

            <!-- قسم تعديل المهمة -->
             <div>
                <label class="form-label">Task ID</label>
                <asp:TextBox ID="taskID" runat="server" placeholder="Enter Task ID" CssClass="form-input" Width="501px"></asp:TextBox>
              
            </div>
          

            <div>
                <label class="form-label">Due Date (End Date)<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </label>
                &nbsp;</div>

            <div>
                <label class="form-label">Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-input" DataSourceID="SqlDataSource1" DataTextField="statName" DataValueField="statID">
                    <asp:ListItem Value="1">New</asp:ListItem>
                    <asp:ListItem Value="2">In Progress</asp:ListItem>
                    <asp:ListItem Value="3">Completed</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jana13211ConStr %>" SelectCommand="SELECT [statID], [statName] FROM [Status]"></asp:SqlDataSource>
            </div>

            <div style="text-align: center; margin-top: 15px;">
                <asp:Button ID="btnUpdateTask" runat="server" Text="Update Task" OnClick="btnUpdateTask_Click" CssClass="btn-dark-custom" />
            </div>

            <!-- جدول المهام -->
            <div style="margin-top: 25px;">
                <asp:GridView ID="gvEmployeeTasks" runat="server" AutoGenerateColumns="true" CssClass="custom-grid">
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
