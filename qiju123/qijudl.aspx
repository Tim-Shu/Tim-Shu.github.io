﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qijudl.aspx.cs" Inherits="QJcms.Web.admin.login" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>管理员登录</title>
    <link href="skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //检测IE
            if ('undefined' == typeof (document.body.style.maxHeight)) {
                window.location.href = 'ie6update.html';
            }
        });
    </script>
</head>
<body class="loginbody">
    <form id="form1" runat="server">
        <div style="width: 100%; height: 100%; min-width: 300px; min-height: 260px;"></div>
        <div class="login-wrap">
            <div class="login-form">
                <div class="login-logo">LOGO</div>
                <div class="col">
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="login-input" placeholder="用户名" title="用户名" name="textfield" autocomplete="off"></asp:TextBox>
                    <label class="icon user" for="txtUserName">
                    </label>
                </div>
                <div class="col">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="login-input" TextMode="Password" placeholder="密码" title="密码"></asp:TextBox>
                    <label class="icon pwd" for="txtPassword">
                    </label>
                </div>
                <div class="left-group">
                    <asp:TextBox ID="txtCode" MaxLength="4" size="4" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" runat="server" CssClass="login-field small" placeholder="验证码" title="验证码" Style="ime-mode: disabled; text-transform: uppercase;"></asp:TextBox>
                    <img src="../tools/verify_code.ashx" alt="点击切换验证码" title="点击切换验证码" onclick="$(this).attr('src','../tools/verify_code.ashx?time=' + Math.random());" />
                    <asp:Button ID="btnSubmit" runat="server" Text="登录" CssClass="btn-login" OnClick="btnSubmit_Click" />
                </div>
                <span class="login-tips"><i></i><b id="msgtip" runat="server">请输入用户名和密码</b></span>
            </div>
        </div>
        <div class="copy-right">
            <p>版权所有 名炬 Copyright © 2005 - 2019 qijucn.com Inc. All Rights Reserved.</p>
        </div>
    </form>
</body>
</html>
