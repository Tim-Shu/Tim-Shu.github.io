<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dialog_channel_details.aspx.cs" Inherits="QJcms.Web.admin.dialog.dialog_channel_details" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>频道描述</title>
  <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery.nicescroll.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/webuploader/webuploader.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../editor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../editor/ueditor.all.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../editor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/uploader.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    var api = top.dialog.get(window); //获取父窗体对象
    $(function () {
      //初始化上传控件
      $(".upload-img").InitUploader({ filesize: "<%=siteConfig.imgsize %>", sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf", filetypes: "<%=siteConfig.fileextension %>" });
        //初始化编辑器
        $(".editor").each(function (i) {
            var objId = $(this).attr("id");
            if (objId != "undefined") {
                var editor = UE.getEditor(objId, {
                    serverUrl: '../../../tools/upload_ajax.ashx',
                    initialFrameWidth: '100%',
                    initialFrameHeight: 350,
                    scaleEnabled: true
                });
            }
        });
    });
  </script>
</head>

<body>
  <form id="form1" runat="server">
    <div class="div-content">
      <dl runat="server" id="dl_img">
        <dt>封面图片</dt>
        <dd>
          <asp:TextBox ID="txtImgUrl" runat="server" CssClass="input normal upload-path" />
          <div class="upload-box upload-img"></div>
        </dd>
      </dl>
      <dl runat="server" id="dl_content">
        <dt>内容描述</dt>
        <dd>
          <textarea id="txtContent" class="editor" style="visibility: hidden;" runat="server"></textarea>
        </dd>
      </dl>
    </div>
    <div class="page-footer">
      <div class="btn-wrap">
        <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" OnClick="btnSubmit_Click" />
      </div>
    </div>
  </form>
</body>
</html>
