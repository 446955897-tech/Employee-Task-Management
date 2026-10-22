<%@ Page Title="الرئيسية" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="jana13211App.dmo.Home" %>

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
            
         
            background-attachment: fixed;
            
           
            background-repeat: no-repeat;
        }
    </style>

        
    <div style="text-align: center; margin-top: 80px; padding: 40px; background-color: rgba(255 , 255 ,255 ,0.6 ) ; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.05);">

        <h1 style="color: #000000; font-size: 48px; font-weight: 900 ;margin-bottom: 20px;  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-weight: bold;">
             Welcome to the Task & Employee Management System
        </h1>
        
        <p style="color: #000000; font-size: 22px; font-weight: 500 ; max-width: 800px; margin: 0 auto 40px auto; line-height: 1.8;">
            An intelligent solution for task management, work organization and real-time reports that boost productivity and support decision-making.
        </p>
        
    </div>

</asp:Content>