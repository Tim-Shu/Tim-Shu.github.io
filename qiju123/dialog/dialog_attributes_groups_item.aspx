<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dialog_attributes_groups_item.aspx.cs" Inherits="QJcms.Web.admin.dialog.dialog_attributes_groups_item" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>商品属性组</title>
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    var api = top.dialog.get(window); //获取父窗体对象
    var _action = api.data.action;
    //页面加载完成执行
    $(function () {
      //设置按钮及事件
      api.button([{
        value: '确定',
        callback: function () {
          execAttributesHtml();
        },
        autofocus: true
      }, {
        value: '取消',
        callback: function () { return true; }
      }
      ]);
      $("#categoryName").html(api.data.categoryName);
      if (_action == "edit") {
        $("#txtTitle").val(api.data.groupName);
        $("#txtSortId").val(api.data.groupSort);
      }
    });

    //创建选项节点
    function execAttributesHtml() {
      var currDocument = $(document); //当前文档
      if ($("#txtTitle").val() == "") {
        top.dialog({
          title: '提示',
          content: '分组名称不可为空！',
          okValue: '确定',
          ok: function () { },
          onclose: function () {
            $("#txtTitle", currDocument).focus();
          }
        }).showModal(api);
        return false;
      }
      if ($("#txtSortId").val() == "") {
        top.dialog({
          title: '提示',
          content: '排序数字不可为空！',
          okValue: '确定',
          ok: function () { },
          onclose: function () {
            $("#txtSortId", currDocument).focus();
          }
        }).showModal(api);
        return false;
      }
      //发送AJAX请求
      var action = "add_attributes_groups";
      if (_action == "edit") {
        action = "edit_attributes_groups";
      }
      api.data.doAjax.sendAjaxUrl(api, { "group_id": api.data.groupId, "category_id": api.data.categoryId, "txtTitle": $("#txtTitle").val(), "txtSortId": $("#txtSortId").val() }, "../../tools/attributes_ajax.ashx?action=" + action);
      return false;
    }
  </script>
</head>

<body>
  <form id="form1" runat="server">
    <div class="div-content" style="padding-top: 0;">
      <dl>
        <dt>所属分类</dt>
        <dd><span id="categoryName"></span></dd>
      </dl>
      <dl>
        <dt>分组名称</dt>
        <dd>
          <input type="text" id="txtTitle" class="input txt" value="" /></dd>
      </dl>
      <dl>
        <dt>排序数字</dt>
        <dd>
          <input type="text" id="txtSortId" value="99" class="input txt small" onkeydown="return checkNumber(event);" /></dd>
      </dl>
    </div>
  </form>
</body>
</html>
