<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="jana13211App.dmo.Admin" %>
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

         </style>

<div style="
    max-width: 750px;
    margin: 30px auto;
    padding: 20px 25px;
    background-color: rgba(255,255,255,0.6);
    border-radius: 14px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
">

    <h2 style="
        text-align: left;
        color: #1a1a2e;
        font-size: 22px;
        font-weight: 800;
        margin-bottom: 15px;
    ">
         Add Employee
    </h2>

    <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.06); margin-bottom: 15px;" />

    <div style="display: flex; flex-direction: column; gap: 10px; align-items: center;">

           <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">ID</label>

            <asp:TextBox ID="txtID" runat="server" placeholder="ID" 
                style="width: 100%; padding: 6px 10px; font-size: 13px; border-radius: 6px; border: none; background: #f5f6fa;" />
        </div> 

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" placeholder="Full name" 
                style="width: 100%; padding: 6px 10px; font-size: 13px; border-radius: 6px; border: none; background: #f5f6fa;" />
        </div>

       <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" 
                style="width: 100%; padding: 6px 10px; font-size: 13px; border-radius: 6px; border: none; background: #f5f6fa;" />
            <asp:RegularExpressionValidator 
           ID="revEmail" 
           runat="server" 
           ControlToValidate="txtEmail" 
           ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
           ErrorMessage="صيغة البريد الإلكتروني غير صحيحة!" 
           ForeColor="Red" 
           Display="Dynamic" 
           style="font-size: 13px; display: block; margin-top: 5px; font-weight: bold;">
            </asp:RegularExpressionValidator>
        </div>

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Phone</label>
            <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone" 
                style="width: 100%; padding: 6px 10px; font-size: 13px; border-radius: 6px; border: none; background: #f5f6fa;" />
        </div>

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Department<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="depName" DataValueField="depID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jana13211ConStr %>" SelectCommand="SELECT [depID], [depName] FROM [Department]"></asp:SqlDataSource>
            </label>
            &nbsp;</div>

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Gender</label>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" 
                style="font-size: 15px; margin-top: 3px;">
                <asp:ListItem Value="1">Male</asp:ListItem>
                <asp:ListItem Value="2">Female</asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <div style="width: 90%; display: flex; align-items: center; gap: 6px; margin-top: 3px;">
            <asp:CheckBox ID="chkActive" runat="server" style="width: 14px; height: 14px;" />
            <label for="chkActive" style="font-size: 15px; font-weight: 600; color: #2d3436;"> Activate</label>

          </div>

            <div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: center; margin-top: 15px;">

        
            <asp:Button ID="btnSaveEmployee" runat="server" Text=" Add " 
              
                style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold; 
                       padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer; " OnClick="btnSaveEmployee_Click"/>

            <asp:Button ID="btnDeleteEmployee" runat="server" Text="Delete"
    style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold;  padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer;" 
     OnClientClick="return confirm('Are you sure you want to delete this employee?');"
     OnClick="btnDeleteEmployee_Click" />


            <asp:Button ID="btnGetDataEmployee" runat="server" Text=" Get Data" 
              
                style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold; 
                       padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer;" OnClick="btnGetDataEmployee_Click"  />

                <asp:Button ID="btnUpdateEmployee" runat="server" Text=" Update " 
              
                style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold; 
                       padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer; " OnClick="btnUpdateEmployee_Click"/>
        </div>

        <div style="margin-top: 20px; text-align: center;">
             <asp:GridView ID="gvEmployee" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="90%" HorizontalAlign="Center">
             </asp:GridView>
        </div>

    </div>
</div>
</asp:Content>