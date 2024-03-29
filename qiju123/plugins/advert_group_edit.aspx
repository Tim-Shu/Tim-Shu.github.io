﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advert_group_edit.aspx.cs" Inherits="QJcms.Web.admin.plugins.advert_group_edit" ValidateRequest="false" %>
<%@ Import namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>编辑广告位</title>
<link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
    });
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="index.aspx" class="back"><i></i><span>返回列表页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>实用工具</span>
  <i class="arrow"></i>
  <span>广告管理</span>
  <i class="arrow"></i>
  <span>编辑广告位</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a class="selected" href="javascript:;">编辑广告位</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
  <dl>
    <dt>广告位名称</dt>
    <dd><asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>广告类型</dt>
    <dd>
      <div class="rule-multi-radio">
          <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True" Value="1">文字</asp:ListItem>
            <asp:ListItem Value="2">图片</asp:ListItem>
            <asp:ListItem Value="3">幻灯片</asp:ListItem>
            <asp:ListItem Value="4">动画</asp:ListItem>
            <asp:ListItem Value="5">FLV视频</asp:ListItem>
            <asp:ListItem Value="6">代码 </asp:ListItem>
           </asp:RadioButtonList>
       </div>
    </dd>
  </dl>
  <dl>
    <dt>备注说明</dt>
    <dd>
      <asp:TextBox ID="txtRemark" runat="server" maxlength="255" TextMode="MultiLine" CssClass="input"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>显示数量</dt>
    <dd>
        <asp:TextBox ID="txtViewNum" runat="server" CssClass="input small" Text="0" datatype="n" sucmsg=" " />
        <span class="Validform_checktip">*默认为0时不限制数量，视频及代码类型数量为1，不受此限制。</span>
    </dd>
  </dl>
  <dl>
    <dt>价格</dt>
    <dd>
      <asp:TextBox ID="txtPrice" runat="server" CssClass="input small" datatype="/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/" sucmsg=" ">0</asp:TextBox> 元
    </dd>
  </dl>
  <dl>
    <dt>宽度</dt>
    <dd>
        <asp:TextBox ID="txtViewWidth" runat="server" CssClass="input small" Text="0" datatype="n" sucmsg=" " /> px
        <span class="Validform_checktip">*默认为0时不限定宽度</span>
    </dd>
  </dl>
  <dl>
    <dt>高度</dt>
    <dd>
        <asp:TextBox ID="txtViewHeight" runat="server" CssClass="input small" Text="0" datatype="n" sucmsg=" " /> px
        <span class="Validform_checktip">*默认为0时不限定高度</span>
    </dd>
  </dl>
  <dl>
    <dt>链接目标</dt>
    <dd>
      <div class="rule-multi-radio">
        <asp:RadioButtonList ID="rblTarget" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True" Value="_blank">新窗口</asp:ListItem>
            <asp:ListItem Value="_self">原窗口</asp:ListItem>
        </asp:RadioButtonList>
      </div>
    </dd>
  </dl>
</div>
<!--/内容-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-list">
    <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
  </div>
  <div class="clear"></div>
</div>
<!--/工具栏-->
</form>
</body>
</html>
