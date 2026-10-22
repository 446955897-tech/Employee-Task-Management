<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="jana13211App.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <style>
        body {
            background-image: url('../img/KFMC.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
    </style>

    <div style="
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    ">

        <div style="
            max-width: 850px;
            padding: 50px 60px;
            background-color: rgba(255, 255, 255, 0.6);
            border-radius: 24px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
            text-align: left;
            margin: auto;
        ">

            <h1 style="
                color: #1a1a2e;
                font-size: 40px;
                font-weight: 900;
                margin-bottom: 10px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                text-align: center;
            ">
                </i> Contact Us
            </h1>

            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 20px 0; width: 100%;" />

            <p style="
                color: #2d3436;
                font-size: 19px;
                line-height: 1.8;
                margin: 0 0 25px 0;
                text-align: center;
            ">
                We’d love to hear from you! Reach out to us for any inquiries, feedback, or support.
            </p>

            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 25px 0; width: 100%;" />

            <!-- معلومات التواصل (محاذاة يسار) -->
            <div style="
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                max-width: 500px;
                gap: 20px;
                font-size: 19px;
                color: #2d3436;
                text-align: left;
                margin: 30px auto;
            ">
                <span><i class="fas fa-envelope" style="width: 30px; color: black;"></i> Email: <strong>support@kfmc.med.sa</strong></span>
                <span><i class="fas fa-phone-alt" style="width: 30px; color: black;"></i> Phone: <strong>+966 112 889 999</strong></span>
                <span><i class="fas fa-map-marker-alt" style="width: 30px; color: black;"></i> Location: <strong>King Fahad Medical City, Riyadh</strong></span>
                <span><i class="fas fa-clock" style="width: 30px; color: black;"></i> Working Hours: <strong>8:00 AM – 3:00 PM (Sun–Thu)</strong></span>
            </div>

            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 25px 0; width: 100%;" />

            <p style="font-size: 18px; color: #34495e; text-align: center;">
                <i class="fas fa-hospital" style="width: 30px; color: black;"></i> Training Center: <strong>King Fahad Medical City</strong>
            </p>

            

            <hr style="border: none; border-top: 2px solid rgba(0,0,0,0.08); margin: 25px 0; width: 100%;" />

            <p style="color: #95a5a6; font-size: 14px; margin-top: 10px; text-align: center;">
                <i class="fas fa-copyright" style="color: #95a5a6;"></i> All Rights Reserved
            </p>

        </div>
    </div>

</asp:Content>