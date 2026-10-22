<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="jana13211App.About" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  
    <style>
        body {
            /* 1. تحديد رابط الصورة */
            background-image: url('../img/KFMC.jpeg');
            
            /* 2. جعل الصورة تغطي كامل الشاشة */
            background-size: cover;
            
            /* 3. توسيط الصورة */
            background-position: center;
            
            /* 4. تثبيت الصورة عند السكرول */
            background-attachment: fixed;
            
            /* 5. منع تكرار الصورة */
            background-repeat: no-repeat;

         

        }
    </style>
    

        <div style="
            max-width: 850px;
            padding: 50px 60px;
            background-color: rgba(255, 255, 255, 0.6);
            border-radius: 24px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
            text-align: center;
            margin:auto;
        ">

            <h1 style="
                color: #1a1a2e;
                font-size: 48px;
                font-weight: 900;
                margin-bottom: 15px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            ">
                Task & Employee Management System
            </h1>

            <p style="
                color: #2d3436;
                font-size: 20px;
                line-height: 1.8;
                max-width: 700px;
                margin: 0 auto 10px auto;
            ">
                An integrated platform designed to simplify task management,
                track achievements, and analyze team performance efficiently and intelligently.
            </p>

            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 25px auto; width: 600px;" />

            <p style="
                color: #2d3436;
                font-size: 20px;
                line-height: 1.8;
                max-width: 700px;
                margin: 0 auto 30px auto;
            ">
                <strong>Goal:</strong> Enhance productivity, organize workflow, and support data-driven decision-making.
            </p>
            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 25px auto; width: 600px;" />

            <h3 style="color: #2c3e50; font-size: 26px; font-weight: 600; margin-bottom: 15px;">
                 Team Members👩‍💻
            </h3>

            <div style="
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 25px 40px;
                font-size: 20px;
                color: #2d3436;
                font-weight: 500;
                margin-bottom: 30px;
            ">
               
                <span>Jana Yousef Bashmail - 13211</span>
                <span>Shahad Abdullah Alkathiri - 13161</span>
                <span>Taif Saeed Bamahri - 13212</span>
            </div>
            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 25px auto; width: 600px;" />

            <p style="font-size: 18px; color: #34495e;">
                 Training Center:  <strong>King Fahad Medical City 🏥</strong>
            </p>

            <p style="font-size: 16px; color: #7f8c8d; margin-top: 5px;">
                 Development Date: Summer Semester 2026📅
            </p>

            <p style="color: #95a5a6; font-size: 14px; margin-top: 20px;">
                © All Rights Reserved
            </p>

        </div>
    </div>

</asp:Content>