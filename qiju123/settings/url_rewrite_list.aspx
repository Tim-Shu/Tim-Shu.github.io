﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="url_rewrite_list.aspx.cs" Inherits="QJcms.Web.admin.settings.url_rewrite_list" %>
<%@ Import namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>URL配置管理</title>
<link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>系统管理</span>
  <i class="arrow"></i>
  <span>URL配置</span>
</div>
<!--/导航栏-->

<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
  <div class="toolbar">
    <div class="box-wrap">
      <a class="menu-btn"></a>
      <div class="l-list">
        <ul class="icon-list">
          <li><a class="add" href="url_rewrite_edit.aspx?action=<%=QJEnums.ActionEnum.Add %>"><i></i><span>新增</span></a></li>
          <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
          <li><asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','本操作会导致网站前台无法运作，是否继续？');" onclick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
        </ul>
        <div class="menu-list">
          <div class="rule-single-select">
            <asp:DropDownList ID="ddlChannel" runat="server" AutoPostBack="True" onselectedindexchanged="ddlChannel_SelectedIndexChanged"></asp:DropDownList>
          </div>
          <div class="rule-single-select">
            <asp:DropDownList ID="ddlPageType" runat="server" AutoPostBack="True" onselectedindexchanged="ddlPageType_SelectedIndexChanged">
              <asp:ListItem Selected="True" Value="">所有类型</asp:ListItem>
              <asp:ListItem Value="index">首页</asp:ListItem>
              <asp:ListItem Value="list">列表页</asp:ListItem>
              <asp:ListItem Value="category">栏目页</asp:ListItem>
              <asp:ListItem Value="detail">详细页</asp:ListItem>
              <asp:ListItem Value="plugin">插件页</asp:ListItem>
              <asp:ListItem Value="other">其它页</asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--/工具栏-->

<!--列表-->
<div class="table-container">
  <asp:Repeater ID="rptList" runat="server">
  <HeaderTemplate>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
    <tr>
      <th width="8%" style="white-space:nowrap;word-break:break-all;">选择</th>
      <th align="left">调用名称</th>
      <th width="20%" align="left">源页面名称</th>
      <th width="18%" align="left">继承类名</th>
      <th width="15%" align="left">模板名称</th>
      <th width="10%" align="left" style="white-space:nowrap;word-break:break-all;">归属频道</th>
      <th width="8%" align="left" style="white-space:nowrap;word-break:break-all;">分页数量</th>
      <th width="8%" style="white-space:nowrap;word-break:break-all;">操作</th>
    </tr>
  </HeaderTemplate>
  <ItemTemplate>
    <tr>
      <td align="center">
        <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" style="vertical-align:middle;" />
        <asp:HiddenField ID="hideName" Value='<%#Eval("name")%>' runat="server" />
      </td>
      <td><%#Eval("name")%></td>
      <td><%#Eval("page")%></td>
      <td><%#Eval("inherit")%></td>
      <td><%#Eval("templet")%></td>
      <td><%#Eval("channel").ToString() != "" ? Eval("channel") : "-"%></td>
      <td><%#Eval("pagesize").ToString() != "" ? Eval("pagesize") : "-"%></td>
      <td align="center"><a href="url_rewrite_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&name=<%#Eval("name")%>">修改</a></td>
    </tr>
  </ItemTemplate>
  <FooterTemplate>
    <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"8\">暂无记录</td></tr>" : ""%>
  </table>
  </FooterTemplate>
  </asp:Repeater>
</div>
<!--/列表-->

</form>
</body>
</html>
