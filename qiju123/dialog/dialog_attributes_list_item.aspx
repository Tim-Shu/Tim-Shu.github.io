<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dialog_attributes_list_item.aspx.cs" Inherits="QJcms.Web.admin.dialog.dialog_attributes_list_item" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>商品属性列表</title>
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
      //加载属性分组
      $.ajax({
        type: "post",
        url: "../../tools/attributes_ajax.ashx?action=get_attributes_groups",
        data: { category_id: api.data.categoryId, category_name: api.data.categoryName },
        dataType: "json",
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          top.dialog({
            title: '提示',
            content: '加载列表失败，错误信息：' + errorThrown,
            okValue: '确定',
            ok: function () { }
          }).showModal();
        },
        success: function (data, textStatus) {
          if (data.status == 1) {
            var _count = 0;
            $.each(data.rows, function () {
              var _o = $("<option value='" + this.id + "'>" + this.name + "</option>").appendTo("#ddlGroup");
              if (_action == "edit" && api.data.groupId==this.id) {
                _o.attr("selected", "selected");
              }
            });
            $(".rule-single-select").ruleSingleSelect();
          } else {
            top.dialog({
              title: '提示',
              content: '加载列表失败：' + data.msg,
              okValue: '确定',
              ok: function () { }
            }).showModal();
          }
        }
      });
      if (_action == "edit") {
        if (api.data.isFilter == "0") {
          $("#cbIsFilter").attr("checked", false);
          $(".rule-single-checkbox").ruleSingleCheckbox();
        }
        $("#txtTitle").val(api.data.attrName);
        $("#txtSortId").val(api.data.sort);
      }
    });

    //添加选项
    function execAttributesHtml() {
      var currDocument = $(document); //当前文档
      if ($("#ddlGroup").val() == "0") {
        top.dialog({
          title: '提示',
          content: '请选择属性分组！',
          okValue: '确定',
          ok: function () { },
          onclose: function () {
            $("#ddlGroup", currDocument).focus();
          }
        }).showModal(api);
        return false;
      }
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
      var action = "add_attributes_list";
      if (_action == "edit") {
        action = "edit_attributes_list";
      }
      var filter = 1;
      if (!$("#cbIsFilter").prop('checked')) {
        filter = 0;
      }
      api.data.doAjax.sendAjaxUrl(api, { "id": api.data.attrId, "category_id": api.data.categoryId, "group_id": $("#ddlGroup").val(), "group_name": $("#ddlGroup").find("option:selected").text(), "txtTitle": $("#txtTitle").val(), "isFilter": filter, "txtSortId": $("#txtSortId").val() }, "../../tools/attributes_ajax.ashx?action=" + action);
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
        <dt>属性组</dt>
        <dd>
          <div class="rule-single-select">
            <select id="ddlGroup" name="ddlGroup">
              <option value="0" selected="selected">选择分组</option>
            </select>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>是否筛选</dt>
        <dd>
          <div class="rule-single-checkbox">
            <input type="checkbox" name="cbIsFilter" id="cbIsFilter" checked="checked">
          </div>
          <span class="Validform_checktip">*开启作为筛选条件。默认开启</span>
        </dd>
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
