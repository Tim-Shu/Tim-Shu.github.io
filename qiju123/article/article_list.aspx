﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_list.aspx.cs" Inherits="QJcms.Web.admin.article.article_list" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>内容管理</title>
  <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <link href="../../lib/css/pagination.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="../../lib/scripts/jquery/jquery.lazyload.min.js"></script>
  <script type="text/javascript" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    $(function () {
      //图片延迟加载
      $(".pic img").lazyload({ effect: "fadeIn" });
      //点击图片链接
      $(".pic img").click(function () {
        var linkUrl = $(this).parent().parent().find(".foot a").attr("href");
        if (linkUrl != "") {
          location.href = linkUrl; //跳转到修改页面
        }
      });
      //点击频道描述
      $("#li_channel a.list").click(function () {
        var d = top.dialog({
          width: 900,
          height: 480,
          title: '频道描述',
          url: 'dialog/dialog_channel_details.aspx?channel_id=<%=this.channel_id%>'
        }).showModal();
      });
    });
  </script>
</head>

<body class="mainbody">
  <form id="form1" runat="server">
    <!--导航栏-->
    <div class="location">
      <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
      <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
      <i class="arrow"></i>
      <span>内容列表</span>
    </div>
    <!--/导航栏-->

    <!--工具栏-->
    <div id="floatHead" class="toolbar-wrap">
      <div class="toolbar">
        <div class="box-wrap">
          <a class="menu-btn"></a>
          <div class="l-list">
            <ul class="icon-list">
              <li runat="server" id="li_add" visible="false"><a class="add" href="article_edit.aspx?action=<%=QJEnums.ActionEnum.Add %>&channel_id=<%=this.channel_id %><%=list %>"><i></i><span>新增</span></a></li>
              <li>
                <asp:LinkButton ID="btnSave" runat="server" CssClass="save" OnClick="btnSave_Click"><i></i><span>保存</span></asp:LinkButton></li>
              <li runat="server" id="li_audit" visible="false">
                <asp:LinkButton ID="btnAudit" runat="server" CssClass="lock" OnClientClick="return ExePostBack('btnAudit','审核后前台将显示该信息，确定继续吗？');" OnClick="btnAudit_Click"><i></i><span>审核</span></asp:LinkButton></li>
              <li runat="server" id="li_check_box" visible="false"><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
              <li runat="server" id="li_del" visible="false">
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete');" OnClick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
              <li runat="server" id="li_channel"><a class="list" href="javascript:;"><i></i><span>频道</span></a></li>
              <li runat="server" id="li_contents_batch"><a class="add" href="article_multi_add.aspx?action=<%=QJEnums.ActionEnum.Add %>&channel_id=<%=this.channel_id %><%=list %>"><i></i><span>批量上传</span></a></li>
            </ul>
            <div class="menu-list">
              <div class="rule-single-select" runat="server" id="div_category" visible="false">
                <asp:DropDownList ID="ddlCategoryId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoryId_SelectedIndexChanged" Visible="false"></asp:DropDownList>
              </div>
              <div class="rule-single-select">
                <asp:DropDownList ID="ddlProperty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProperty_SelectedIndexChanged">
                  <asp:ListItem Value="" Selected="True">所有属性</asp:ListItem>
                  <asp:ListItem Value="unIsLock">正常</asp:ListItem>
                  <asp:ListItem Value="isLock">下线</asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
          </div>
          <div class="r-list">
            <asp:TextBox ID="txtKeywords" runat="server" CssClass="keyword" />
            <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn-search" OnClick="btnSearch_Click">查询</asp:LinkButton>
            <asp:LinkButton ID="lbtnViewImg" runat="server" CssClass="img-view" OnClick="lbtnViewImg_Click" ToolTip="图像列表视图" Visible="false" />
            <asp:LinkButton ID="lbtnViewTxt" runat="server" CssClass="txt-view" OnClick="lbtnViewTxt_Click" ToolTip="文字列表视图" Visible="false" />
          </div>
        </div>
      </div>
    </div>
    <!--/工具栏-->

    <!--列表-->
    <div class="table-container">
      <!--文字列表-->
      <asp:Repeater ID="rptList1" runat="server" OnItemCommand="rptList_ItemCommand">
        <HeaderTemplate>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
            <tr>
              <th width="6%">选择</th>
               <%if (channel_model.is_content_call == 1)
                  { %>
              <th align="left" width="12%">调用名称</th>
              <%} %>
              <th align="left">标题</th>
              <%if (channel_model.is_category_layer > 0)
                  { %>
              <th align="left" width="12%">所属类别</th>
              <%} %>
              <th align="left" width="16%">发布时间</th>
              <th align="left" width="65">排序</th>
                <%if(this.channel_model.is_comment == 1 || !string.IsNullOrEmpty(this.channel_model.recom_type)){%>
              <th align="left" width="120">属性</th>
                 <%} %>
              <th width="10%">操作</th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
          <tr>
            <td align="center">
              <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Enabled='<%#bool.Parse((Convert.ToInt32(Eval("is_sys"))==0 ).ToString())%>' Style="vertical-align: middle;" />
              <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
            </td>
             <%if (channel_model.is_content_call == 1)
                { %>
            <td><%#Eval("call_index")%></td>
            <%} %>
            <td><a href="article_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%><%=list %>"><%#Eval("title")%><br /><%#getChannelField(Convert.ToInt32(Eval("id")),"sub_title") %></a></td>
            <%if (channel_model.is_category_layer > 0)
                { %>
            <td><%#new QJcms.BLL.article_category().GetTitle(Convert.ToInt32(Eval("category_id")))%></td>
            <%} %>
            <td><%#string.Format("{0:g}",Eval("add_time"))%></td>
            <td>
              <asp:TextBox ID="txtSortId" runat="server" Text='<%#Eval("sort_id")%>' CssClass="sort" onkeydown="return checkNumber(event);" /></td>
              <%if(this.channel_model.is_comment == 1 || !string.IsNullOrEmpty(this.channel_model.recom_type)){%>
            <td>
              <div class="btn-tools">
                <asp:LinkButton ID="lbtnIsMsg" CommandName="lbtnIsMsg" runat="server" Visible='<%#bool.Parse((this.channel_model.is_comment==1).ToString()) %>' CssClass='<%# Convert.ToInt32(Eval("is_msg")) == 1 ? "msg selected" : "msg"%>' ToolTip='<%# Convert.ToInt32(Eval("is_msg")) == 1 ? "取消评论" : "设置评论"%>' />
                <asp:LinkButton ID="lbtnIsTop" CommandName="lbtnIsTop" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isTop") %>' CssClass='<%# Convert.ToInt32(Eval("is_top")) == 1 ? "top selected" : "top"%>' ToolTip='<%# Convert.ToInt32(Eval("is_top")) == 1 ? "取消置顶" : "设置置顶"%>' />
                <asp:LinkButton ID="lbtnIsRed" CommandName="lbtnIsRed" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isRed") %>' CssClass='<%# Convert.ToInt32(Eval("is_red")) == 1 ? "red selected" : "red"%>' ToolTip='<%# Convert.ToInt32(Eval("is_red")) == 1 ? "取消推荐" : "设置推荐"%>' />
                <asp:LinkButton ID="lbtnIsHot" CommandName="lbtnIsHot" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isHot") %>' CssClass='<%# Convert.ToInt32(Eval("is_hot")) == 1 ? "hot selected" : "hot"%>' ToolTip='<%# Convert.ToInt32(Eval("is_hot")) == 1 ? "取消热门" : "设置热门"%>' />
                <asp:LinkButton ID="lbtnIsSlide" CommandName="lbtnIsSlide" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isSlide") %>' CssClass='<%# Convert.ToInt32(Eval("is_slide")) == 1 ? "pic selected" : "pic"%>' ToolTip='<%# Convert.ToInt32(Eval("is_slide")) == 1 ? "取消幻灯片" : "设置幻灯片"%>' />
              </div>
            </td>
              <%} %>
            <td align="center">
              <%if (channel_model.is_contents_copy == 1)
                  { %><a href="article_edit.aspx?action=<%#QJEnums.ActionEnum.Copy %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%><%=list %>">复制</a><%} %>
              <a href="article_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%><%=list %>">修改</a>
            </td>
          </tr>
        </ItemTemplate>
        <FooterTemplate>
          <%#rptList1.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"8\">暂无记录</td></tr>" : ""%>
  </table>
        </FooterTemplate>
      </asp:Repeater>
      <!--/文字列表-->

      <!--图片列表-->
      <asp:Repeater ID="rptList2" runat="server" OnItemCommand="rptList_ItemCommand">
        <HeaderTemplate>
          <div class="imglist">
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
          <li>
            <div class="details<%#Eval("img_url").ToString() != "" ? "" : " nopic"%>">
              <div class="check">
                <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" />
                <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
              </div>
              <%#Eval("img_url").ToString() != "" ? "<div class=\"pic\"><img src=\"../skin/default/loadimg.gif\" data-original=\"" + Eval("img_url") + "\" /></div><i class=\"absbg\"></i>" : ""%>
              <h1><span><a href="article_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%><%=list %>"><%#Eval("title")%></a></span></h1>
              <div class="remark">
                <%#Eval("zhaiyao").ToString() == "" ? "暂无内容摘要说明..." : Eval("zhaiyao").ToString()%>
              </div>
              <div class="tools">
                <asp:LinkButton ID="lbtnIsMsg" CommandName="lbtnIsMsg" runat="server" Visible='<%#bool.Parse((this.channel_model.is_comment==1).ToString()) %>' CssClass='<%# Convert.ToInt32(Eval("is_msg")) == 1 ? "msg selected" : "msg"%>' ToolTip='<%# Convert.ToInt32(Eval("is_msg")) == 1 ? "取消评论" : "设置评论"%>' />
                <asp:LinkButton ID="lbtnIsTop" CommandName="lbtnIsTop" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isTop") %>' CssClass='<%# Convert.ToInt32(Eval("is_top")) == 1 ? "top selected" : "top"%>' ToolTip='<%# Convert.ToInt32(Eval("is_top")) == 1 ? "取消置顶" : "设置置顶"%>' />
                <asp:LinkButton ID="lbtnIsRed" CommandName="lbtnIsRed" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isRed") %>' CssClass='<%# Convert.ToInt32(Eval("is_red")) == 1 ? "red selected" : "red"%>' ToolTip='<%# Convert.ToInt32(Eval("is_red")) == 1 ? "取消推荐" : "设置推荐"%>' />
                <asp:LinkButton ID="lbtnIsHot" CommandName="lbtnIsHot" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isHot") %>' CssClass='<%# Convert.ToInt32(Eval("is_hot")) == 1 ? "hot selected" : "hot"%>' ToolTip='<%# Convert.ToInt32(Eval("is_hot")) == 1 ? "取消热门" : "设置热门"%>' />
                <asp:LinkButton ID="lbtnIsSlide" CommandName="lbtnIsSlide" runat="server" Visible='<%#this.channel_model.recom_type.Contains("isSlide") %>' CssClass='<%# Convert.ToInt32(Eval("is_slide")) == 1 ? "pic selected" : "pic"%>' ToolTip='<%# Convert.ToInt32(Eval("is_slide")) == 1 ? "取消幻灯片" : "设置幻灯片"%>' />
                <asp:TextBox ID="txtSortId" runat="server" Text='<%#Eval("sort_id")%>' CssClass="sort" onkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)));" />
              </div>
              <div class="foot">
                <p class="time"><%#string.Format("{0:yyyy-MM-dd HH:mm:ss}", Eval("add_time"))%></p>
                <a href="article_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%><%=list %>" title="编辑" class="edit">编辑</a>
                <%if (channel_model.is_contents_copy == 1)
                    { %>
                <a href="article_edit.aspx?action=<%#QJEnums.ActionEnum.Copy %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%><%=list %>" title="复制" class="copy">复制</a><%} %>
              </div>
            </div>
          </li>
        </ItemTemplate>
        <FooterTemplate>
          <%#rptList2.Items.Count == 0 ? "<div align=\"center\" style=\"font-size:12px;line-height:30px;color:#666;\">暂无记录</div>" : ""%>
    </ul>
  </div>
        </FooterTemplate>
      </asp:Repeater>
      <!--/图片列表-->
    </div>
    <!--/列表-->

    <!--内容底部-->
    <div class="line20"></div>
    <div class="pagelist">
      <div class="l-btns">
        <span>显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);"
          OnTextChanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
      </div>
      <div id="PageContent" runat="server" class="default"></div>
    </div>
    <!--/内容底部-->

  </form>
</body>
</html>
