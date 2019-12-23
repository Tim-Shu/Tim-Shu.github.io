<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="category_list.aspx.cs" Inherits="QJcms.Web.admin.article.category_list" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>类别管理</title>
  <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    $(function () {
      $(".folder-open").click(function () {
        var state = $(this).attr("class");
        var layer = parseInt($(this).parent().parent().attr("layer"));
        $(".ltable tr[class^='data" + $(this).attr("data") + "'").each(function () {
          var flag = parseInt($(this).attr("layer"));
          if (flag > layer && state == "folder-open") {
            $(this).hide();
          }
          else if (state == "folder-close" && flag - 1 == layer) {
            $(this).find(".folder-open").attr("class", "folder-close")
            $(this).show();
          }
        });
        $(this).toggleClass("folder-open");
        $(this).toggleClass("folder-close");
      });
      $(".attributes-group").click(function () {
        showAttributesGroupDialog(this);
      });
      $(".attributes-list").click(function () {
        showAttributesDialog(this);
      });
    });

    //创建属性组窗口
    function showAttributesGroupDialog(obj) {
      var _categoryName = $(obj).attr("data");
      var _categoryId = $(obj).attr("id");
      var d = top.dialog({
        width: 850,
        height: 480,
        title: '商品属性组',
        data: { categoryName: _categoryName, categoryId: _categoryId, dAjax: window },
        url: 'dialog/dialog_attributes_groups.aspx'
      }).showModal();
    }
    //创建属性列表窗口
    function showAttributesDialog(obj) {
      var _categoryName = $(obj).attr("data");
      var _categoryId = $(obj).attr("id");
      var d = top.dialog({
        width: 850,
        height: 480,
        title: '商品属性列表',
        data: { categoryName: _categoryName, categoryId: _categoryId, dAjax: window },
        url: 'dialog/dialog_attributes_list.aspx'
      }).showModal();
    }
  </script>
</head>

<body class="mainbody">
  <form id="form1" runat="server">
    <!--导航栏-->
    <div class="location">
      <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
      <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
      <i class="arrow"></i>
      <span>内容类别</span>
    </div>
    <!--/导航栏-->

    <!--工具栏-->
    <div id="floatHead" class="toolbar-wrap">
      <div class="toolbar">
        <div class="box-wrap">
          <a class="menu-btn"></a>
          <div class="l-list">
            <ul class="icon-list">
              <li runat="server" id="li_add" visible="false"><a class="add" href="category_edit.aspx?action=<%=QJEnums.ActionEnum.Add %>&channel_id=<%=this.channel_id %>"><i></i><span>新增</span></a></li>
              <li>
                <asp:LinkButton ID="btnSave" runat="server" CssClass="save" OnClick="btnSave_Click"><i></i><span>保存</span></asp:LinkButton></li>
              <li runat="server" id="li_check_box" visible="false"><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
              <li runat="server" id="li_del" visible="false">
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','本操作会删除本类别及下属子类别，是否继续？');" OnClick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
              
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--/工具栏-->

    <!--列表-->
    <div class="table-container">
      <asp:Repeater ID="rptList" runat="server" OnItemDataBound="rptList_ItemDataBound">
        <HeaderTemplate>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
            <tr>
              <%if (is_check_box)
                  { %>
              <th width="4%">选择</th>
              <%} %>
              <th align="center" width="4%">编号</th>
              <th align="left">类别名称</th>
              <%if (this.channel_model.is_category_call == 1)
                  { %>
              <th align="left" width="12%">调用别名</th>
              <%} %>
              <%if (this.channel_model.is_category_price == 1)
                  { %>
              <th align="left">价格区间<%if (this.channel_model.is_category_layer > 1)
                                       { %>（仅最底层有效） <%} %></th>
              <%} %>
              <th align="left" width="6%">排序</th>
              <%if (this.channel_model.is_category_hot == 1)
                  { %>
              <th align="center" width="4%">推荐</th>
              <%} %>
              <%if (this.channel_model.is_category_attributes == 1)
                  { %>
              <th width="12%">属性 <%if (this.channel_model.is_category_layer > 1)
                                     { %>（仅最底层有效） <%} %></th>
              <%} %>
              <th width="8%">操作</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
          <tr class='data<%#Eval("class_list").ToString().Replace(',','_') %>' layer='<%#Eval("class_layer").ToString()%>'>
            <%if (is_check_box)
                { %>
            <td align="center">
              <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Enabled='<%#bool.Parse((Convert.ToInt32(Eval("is_sys"))==0 ).ToString())%>' Style="vertical-align: middle;" />
            </td>
            <%} %>
            <td align="center"><%#Eval("id")%>
              <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
              <asp:HiddenField ID="hidSort" Value='<%#Eval("sort_id") %>' runat="server" />
              <asp:HiddenField ID="hidLayer" Value='<%#Eval("class_layer") %>' runat="server" />
              <asp:HiddenField ID="hidList" Value='<%#Eval("class_list") %>' runat="server" />
              <asp:HiddenField ID="hidIsParent" Value='<%#Eval("is_parent") %>' runat="server" />
            </td>
            <td>
              <asp:Literal ID="LitFirst" runat="server"></asp:Literal>
              <a href="category_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%>" style="display: inline-flex;"><%#Eval("title")%>
                <%#!string.IsNullOrEmpty(Eval("sub_title").ToString())?"<br/>"+Eval("sub_title"):"" %></a>
            </td>
            <%if (this.channel_model.is_category_call == 1)
                { %><td><%#Eval("call_index")%></td>
            <%} %>
            <%if (this.channel_model.is_category_price == 1)
                { %>
            <td><%#Eval("price_range")%></td>
            <%} %>
            <td>
              <asp:TextBox ID="txtSortId" runat="server" Text='<%#Eval("sort_id")%>' CssClass="sort" onkeydown="return checkNumber(event);" /></td>

            <%if (this.channel_model.is_category_hot == 1)
                { %>
            <td align="center"><%#Convert.ToInt32(Eval("is_hot")) == 0 ? "×" : "<span class=\"col-red\">√</span>"%></td>
            <%} %>
            <%if (this.channel_model.is_category_attributes == 1)
                { %>
            <td align="center">
              <%#Convert.ToInt32(Eval("class_layer"))==this.channel_model.is_category_layer?"<a href=\"javascript:;\" class=\"attributes-group\" id=\""+Eval("id")+"\" data=\""+Eval("title")+"\">属性分组</a>":"属性分组" %>
              <%#Convert.ToInt32(Eval("class_layer"))==this.channel_model.is_category_layer?"<a href=\"javascript:;\" class=\"attributes-list\" id=\""+Eval("id")+"\" data=\""+Eval("title")+"\">属性列表</a>":"属性列表" %>
            </td>
            <%} %>
            <td align="center">
              <%#Convert.ToInt32(Eval("class_layer"))<this.channel_model.is_category_layer?"<a href=\"category_edit.aspx?action="+QJEnums.ActionEnum.Add +"&channel_id="+this.channel_id +"&id="+Eval("id")+"\">添加子类</a>":this.channel_model.is_category_layer>1?"添加子类":"" %>
              <a href="category_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%>">修改</a>
            </td>
          </tr>
        </ItemTemplate>
        <FooterTemplate>
          <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"6\">暂无记录</td></tr>" : ""%>
  </table>
        </FooterTemplate>
      </asp:Repeater>
    </div>
    <!--/列表-->

  </form>
</body>
</html>
