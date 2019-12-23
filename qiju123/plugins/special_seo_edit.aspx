<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="special_seo_edit.aspx.cs" Inherits="QJcms.Web.admin.plugins.special_seo_edit" %>
<%@ Import namespace="QJcms.Common" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>编辑SEO</title>
<link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../lib/scripts/webuploader/webuploader.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/uploader.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
        //初始化上传控件
        $(".upload-img").InitUploader({ sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf" });
    });
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="special_seo.aspx" class="back"><i></i><span>返回列表页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>应用工具</span>
  <i class="arrow"></i>
  <span>SEO优化</span>
  <i class="arrow"></i>
  <span>编辑SEO</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a class="selected" href="javascript:;">编辑SEO</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
  <dl>
    <dt>标题名称</dt>
    <dd><asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>调用别名</dt>
    <dd><asp:TextBox ID="txtCallIndex" runat="server" CssClass="input normal" datatype="/^\s*$|^[a-zA-Z0-9\-\_]{2,50}$/" errormsg="请填写正确的别名" sucmsg=" "></asp:TextBox>
        <span class="Validform_checktip">类别的调用别名，只允许字母、数字、下划线</span></dd>
  </dl>
  <dl>
    <dt>SEO标题</dt>
    <dd><asp:TextBox ID="txtSeoTitle" runat="server" CssClass="input normal" MaxLength="255" datatype="*0-100" sucmsg=" "></asp:TextBox></dd>
  </dl>
  <dl>
    <dt>SEO关键字</dt>
    <dd><asp:TextBox ID="txtSeoKeywords" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                <span class="Validform_checktip">以“,”逗号区分开，255个字符以内</span></dd>
  </dl>
  <dl>
    <dt>SEO描述</dt>
    <dd><asp:TextBox ID="txtSeoDescription" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                <span class="Validform_checktip">以“,”逗号区分开，255个字符以内</span></dd>
  </dl>
</div>
<!--/内容-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-wrap">
    <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
  </div>
</div>
<!--/工具栏-->
</form>
</body>
</html>
