<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dialog_attributes_list.aspx.cs" Inherits="QJcms.Web.admin.dialog.dialog_attributes_list" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>商品属性列表</title>
  <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="../../lib/scripts/jquery/jquery.nicescroll.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    var api = top.dialog.get(window); //获取父窗体对象
    //页面加载完成执行
    $(function () {
      //设置按钮及事件
      api.button([{
        value: '关闭',
        autofocus: true
      }]
        );
      //加载列表
      $.ajax({
        type: "post",
        url: "../../tools/attributes_ajax.ashx?action=get_attributes_list",
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
              _count++;
              var _odd = "";
              if (_count % 2 == 0) {
                _odd = "class=\"odd_bg\"";
              }
              var _tr = $("<tr " + _odd + ">").appendTo(".ltable");
              var _cbox = $("<td align=\"center\"><span class=\"checkall\" style=\"vertical-align: middle;\"><input type=\"checkbox\" name=\"isChecked\" value=\"" + this.id + "\"></span></td>").appendTo(_tr);
              var _id = $("<td>" + this.id + "</td>").appendTo(_tr);
              var _name = $("<td>" + this.name + "</td>").appendTo(_tr);
              var _group = $("<td>" + this.group_name + "</td>").appendTo(_tr);
              var _category = $("<td>" + this.category_name + "</td>").appendTo(_tr);
              var _sort = $("<td><input type=\"text\" class=\"sort\" name=\"sortId-" + this.id + "-" + this.sort_id + "\" value=\"" + this.sort_id + "\" onkeydown=\"return checkNumber(event);\"></td>").appendTo(_tr);
              var _is_filter = "×";
              if (this.is_filter == "1")
                _is_filter = "√";
              var _filter = $("<td align=\"center\">" + _is_filter + "</td>").appendTo(_tr);
              var _edit_td = $("<td align=\"center\"></td>").appendTo(_tr);
              var _addvalue = $("<a href=\"javascript:;\" style=\"margin-right:6px;\" attrId=\""+this.id+"\" attrName=\"" + this.name + "\">属性值</a>").appendTo(_edit_td);
              //属性值
              _addvalue.click(function () {
                var d = top.dialog({
                  width: 900,
                  height: 500,
                  title: '商品属性值列表',
                  data: { attrId: $(this).attr("attrId"), attrName: $(this).attr("attrName") },
                  url: 'dialog/dialog_attributes_values.aspx'
                }).showModal();
              });
              var _edit = $("<a href=\"javascript:;\" class=\"edit\" id=\"" + this.id + "\" groupId=\"" + this.group_id + "\" attrName=\"" + this.name + "\" sort=\"" + this.sort_id + "\">修改</a>").appendTo(_edit_td);
              //修改属性
              var isFilter = this.is_filter;
              _edit.click(function () {
                var d = top.dialog({
                  width: 620,
                  height: 285,
                  title: '修改商品属性',
                  data: { categoryId: api.data.categoryId, categoryName: api.data.categoryName, doAjax: window, action: "edit", attrName: $(this).attr("attrName"), groupId: $(this).attr("groupId"), attrId: this.id, sort: $(this).attr("sort"), isFilter: isFilter },
                  url: 'dialog/dialog_attributes_list_item.aspx'
                }).showModal();
              });

            });
            var _height = (_count + 1) * 39;
            $(".table-container").height(_height);
            if (_count > 10) {
              $("#attributes-list").niceScroll({ touchbehavior: false, cursorcolor: "#333", cursoropacitymax: 0.6, cursorwidth: 6, preservenativescrolling: false });
              $("#attributes-list").getNiceScroll().show();
            }
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

      //添加属性
      $("a.add").click(function () {
        var d = top.dialog({
          width: 620,
          height: 285,
          title: '添加商品属性',
          data: { categoryId: api.data.categoryId, categoryName: api.data.categoryName, doAjax: window, action: "add" },
          url: 'dialog/dialog_attributes_list_item.aspx'
        }).showModal();
      });
      //删除选中
      $("a.del").click(function () {
        if (!existsChecked()) {
          return;
        }
        var _checkall = $("input[type='checkbox']:checked").serialize();
        msg = "删除记录将同时删除属性值且不可恢复，您确定吗？";
        parent.dialog({
          title: '提示',
          content: msg,
          okValue: '确定',
          ok: function () {
            sendAjax({ "id_list": _checkall }, "del_attributes_list");
          },
          cancelValue: '取消',
          cancel: function () { }
        }).showModal();
      });
      //保存排序
      $("a.save").click(function () {
        var _sort = $("input[type='text']").serialize();
        var _p = "";
        var _c = _sort.split("&");
        $.each(_c, function (n, value) {
          var newValue = value.split("=")[1];
          var oldValue = value.split("=")[0].split("-")[2];
          if (newValue != oldValue) {
            var _id = value.split("=")[0].split("-")[1];
            _p += _id + "|" + newValue + ",";
          }
        })
        sendAjax({ "id_list": _p }, "save_attributes_list_sort");
      });
    });
    //判断是否有选中
    function existsChecked() {
      if ($(".checkall input:checked").size() < 1) {
        parent.dialog({
          title: '提示',
          content: "对不起，请选中您要操作的记录！",
          okValue: '确定',
          ok: function () { }
        }).showModal();
        return false;
      }
      return true;
    }
    //发送AJAX请求
    function sendAjaxUrl(winObj, postData, sendUrl) {
      $.ajax({
        type: "post",
        url: sendUrl,
        data: postData,
        dataType: "json",
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          top.dialog({
            title: '提示',
            content: '尝试发送失败，错误信息：' + errorThrown,
            okValue: '确定',
            ok: function () { }
          }).showModal(winObj);
        },
        success: function (data, textStatus) {
          if (data.status == 1) {
            winObj.close().remove();
            var d = dialog({ content: data.msg }).show();
            setTimeout(function () {
              d.close().remove();
              location.reload(); //刷新页面
            }, 2000);
          } else {
            top.dialog({
              title: '提示',
              content: '错误提示：' + data.msg,
              okValue: '确定',
              ok: function () { }
            }).showModal(winObj);
          }
        }
      });
    }
    //发送AJAX（当前页）请求
    function sendAjax(postData, action) {
      $.ajax({
        type: "post",
        url: "../../tools/attributes_ajax.ashx?action=" + action,
        data: postData,
        dataType: "json",
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          top.dialog({
            title: '提示',
            content: '尝试发送失败，错误信息：' + errorThrown,
            okValue: '确定',
            ok: function () { }
          }).showModal();
        },
        success: function (data, textStatus) {
          if (data.status == 1) {
            var d = dialog({ content: data.msg }).show();
            setTimeout(function () {
              d.close().remove();
              location.reload(); //刷新页面
            }, 2000);
          } else {
            top.dialog({
              title: '提示',
              content: '错误提示：' + data.msg,
              okValue: '确定',
              ok: function () { }
            }).showModal();
          }
        }
      });
    }
  </script>
  <style type="text/css">
  </style>
</head>

<body>
  <form id="form1" runat="server">
    <!--工具栏-->
    <div id="floatHead" class="toolbar-wrap" style="padding: 0;">
      <div class="toolbar" style="padding-top: 0;">
        <div class="box-wrap">
          <a class="menu-btn"></a>
          <div class="l-list">
            <ul class="icon-list">
              <li><a class="add" href="javascript:;"><i></i><span>新增</span></a></li>
              <li><a class="save" href="javascript:;"><i></i><span>保存</span></a></li>
              <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
              <li><a class="del" href="javascript:;"><i></i><span>删除</span></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--/工具栏-->
    <div id="attributes-list" class="div-content" style="height: 435px; overflow: hidden; padding: 0;">
      <div class="table-container">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
          <tr>
            <th width="6%">选择</th>
            <th align="left" width="6%">编号</th>
            <th align="left">属性名称</th>
            <th align="left" width="18%">属性组</th>
            <th align="left" width="18%">所属分类</th>
            <th align="left" width="8%">排序</th>
            <th align="center" width="6%">筛选</th>
            <th width="12%">操作</th>
          </tr>
        </table>
      </div>
    </div>
  </form>
</body>
</html>
