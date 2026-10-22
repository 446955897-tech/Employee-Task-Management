<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="jana13211App.dmo.Task" %>
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
          Task
    </h2>

    <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.06); margin-bottom: 15px;" />

    <div style="display: flex; flex-direction: column; gap: 10px; align-items: center;">

           <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Employee ID </label>

            <asp:TextBox ID="empID" runat="server" placeholder="Employee ID" 
                style="width: 100%; padding: 6px 10px; font-size: 13px; border-radius: 6px; border: none; background: #f5f6fa;" />
        </div> 

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;"> Task Title </label>
            <asp:TextBox ID="title" runat="server" placeholder="Task Title" 
                style="width: 100%; padding: 6px 10px; font-size: 13px; border-radius: 6px; border: none; background: #f5f6fa;" />
        </div>

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">Created Date<asp:Calendar ID="Calendar" runat="server"></asp:Calendar>
            </label>&nbsp;</div>

       

        <div style="width: 90%;">
            <label style="font-size: 15px; font-weight: 600; color: #2d3436; display: block; margin-bottom: 3px;">priority <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="priName" DataValueField="priorityID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jana13211ConStr %>" SelectCommand="SELECT [priorityID], [priName] FROM [Priority]"></asp:SqlDataSource>
            </label> &nbsp;</div>


            <div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: center; margin-top: 15px;">

        
            <asp:Button ID="btnInsertEmployee" runat="server" Text=" Insert " 
              
                style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold; 
                       padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer; " OnClick="btnInsertEmployee_Click"/>
        

            <asp:Button ID="btnGetDataEmployee1" runat="server" Text=" Get Data" 
              
                style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold; 
                       padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer;" OnClick="btnGetDataEmployee1_Click"  />

                <asp:Button ID="btnExportExcel" runat="server" Text=" Export Data " 
              
                style="background: #1a1a2e; color: white; font-size: 14px; font-weight: bold; 
                       padding: 10px 30px; border: none; border-radius: 20px; cursor: pointer; " OnClick="btnExportExcel_Click"/>
        </div>

         <div style="margin-top: 20px; text-align: center;">
             <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="90%" HorizontalAlign="Center">
             </asp:GridView>
        </div>

        <div style="margin-top: 20px; text-align: center;">
             <asp:GridView ID="gvTask" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="90%" HorizontalAlign="Center">
             </asp:GridView>
        </div>

    </div>
</div>
</asp:Content>
