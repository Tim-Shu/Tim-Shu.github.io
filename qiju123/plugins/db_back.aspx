<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="db_back.aspx.cs" Inherits="QJcms.Web.admin.plugins.db_back" %>


<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>数据库维护</title>
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
      <span>数据维护</span>
    </div>
    <!--/导航栏-->

    <!--工具栏-->
    <div id="floatHead" class="toolbar-wrap">
      <div class="toolbar">
        <div class="box-wrap">
          <a class="menu-btn"></a>
          <div class="l-list">
            <ul class="icon-list">
              <li>
                <asp:LinkButton ID="lbtnBack" runat="server" CssClass="save" onclick="lbtnBack_Click"><i></i><span>备份</span></asp:LinkButton></li>
              <li>
                <asp:LinkButton ID="lbtnCompr" runat="server" CssClass="compact" onclick="lbtnCompr_Click"><i></i><span>收缩</span></asp:LinkButton></li>
              <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
              <li runat="server" id="li_del" visible="false">
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','删除后不可恢复，是否继续？');" OnClick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>

            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--/工具栏-->

    <!--列表-->
    <div class="table-container">
      <asp:Repeater ID="rptList" runat="server" onitemcommand="rptList_ItemCommand">
        <HeaderTemplate>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
            <th width="8%">选择</th>
            <th align="left">文件名称</th>
            <th width="12%" align="left">文件大小</th>
            <th width="20%" align="left">备份时间</th>
            <th width="16%">操作</th>
        </HeaderTemplate>
        <ItemTemplate>
          <tr>
            <td align="center">
              <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Style="vertical-align: middle;" />
              <asp:HiddenField ID="hidFileName" Value='<%# Eval("file_name")%>' runat="server" />
            </td>
            <td><%# Eval("file_name")%></td>
            <td><%# Eval("file_size")%></td>
            <td><%# Eval("upload_date")%></td>
            <td align="center">
              <asp:LinkButton ID="lbtnRestore" CommandName="lbtnRestore" runat="server" Text="下载" />
              <asp:LinkButton ID="lbtnDelete" CommandName="lbtnDelete" runat="server" Text="删除" OnClientClick="return ExeLinkPostBack(this,'删除数据库备份文件，你确定吗?<br/>此操作不可恢复！');" />
            </td>
          </tr>
        </ItemTemplate>
        <FooterTemplate>
          <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"5\">暂无记录</td></tr>" : ""%>
        </table>
        </FooterTemplate>
      </asp:Repeater>
    </div>
    <!--/列表-->

  </form>
</body>
</html>
