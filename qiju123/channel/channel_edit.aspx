<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="channel_edit.aspx.cs" Inherits="QJcms.Web.admin.channel.channel_edit" ValidateRequest="false" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>编辑频道</title>
  <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="../../lib/scripts/jquery/Validform_v5.3.2_min.js"></script>
  <script type="text/javascript" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    $(function () {
      //初始化表单验证
      $("#form1").initValidform();
      //添加按钮(点击绑定)
      $("#itemAddButton").click(function () {
        showChannelDialog();
      });
      //关联规格相关字段
      var objMarketPrice;
      var objSellPrice;
      var objStockQuantity; //声明对象
      $("#cblAttributeField input").each(function () {
        var fieldArr = $(this).val().split(',');
        var fieldIndex = $("#cblAttributeField input").index($(this));
        if (fieldArr[0] == 'market_price') {
          objMarketPrice = $("#cblAttributeField").siblings("ul").children("li").eq(fieldIndex).children("a");
        }
        if (fieldArr[0] == 'sell_price') {
          objSellPrice = $("#cblAttributeField").siblings("ul").children("li").eq(fieldIndex).children("a");
        }
        if (fieldArr[0] == 'stock_quantity') {
          objStockQuantity = $("#cblAttributeField").siblings("ul").children("li").eq(fieldIndex).children("a");
        }
      });
      $("#cbIsSpec").on("click", function () {
        if ($(this).prop("checked") == true) {
          if (!objMarketPrice.parent().hasClass("selected")) {
            objMarketPrice.trigger("click");
          }
          if (!objSellPrice.parent().hasClass("selected")) {
            objSellPrice.trigger("click");
          }
          if (!objStockQuantity.parent().hasClass("selected")) {
            objStockQuantity.trigger("click");
          }
        }
      });
      objMarketPrice.on("click", function () {
        if (!$(this).parent().hasClass("selected") && $("#cbIsSpec").prop("checked") == true) {
          $("#cbIsSpec").trigger("click");
        }
      });
      objSellPrice.on("click", function () {
        if (!$(this).parent().hasClass("selected") && $("#cbIsSpec").prop("checked") == true) {
          $("#cbIsSpec").trigger("click");
        }
      });
      objStockQuantity.on("click", function () {
        if (!$(this).parent().hasClass("selected") && $("#cbIsSpec").prop("checked") == true) {
          $("#cbIsSpec").trigger("click");
        }
      });
    });

    //创建窗口
    function showChannelDialog(obj) {
      var objNum = arguments.length;
      var d = top.dialog({
        id: 'dialogChannel',
        title: 'URL配置信息',
        url: 'dialog/dialog_channel.aspx'
      }).showModal();
      //检查是否修改状态
      if (objNum == 1) {
        d.data = obj;  // 给窗体传入对象
      }
    }

    //删除一行
    function delItemTr(obj) {
      top.dialog({
        title: '提示',
        content: '您确定要删除这个页面吗？',
        okValue: '确定',
        ok: function () {
          $(obj).parent().parent().remove(); //删除节点
        },
        cancelValue: '取消',
        cancel: function () { }
      }).showModal();
    }
  </script>
</head>

<body class="mainbody">
  <form id="form1" runat="server">
    <!--导航栏-->
    <div class="location">
      <a href="channel_list.aspx" class="back"><i></i><span>返回列表页</span></a>
      <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
      <i class="arrow"></i>
      <a href="channel_list.aspx"><span>频道管理</span></a>
      <i class="arrow"></i>
      <span>编辑频道</span>
    </div>
    <div class="line10"></div>
    <!--/导航栏-->

    <!--内容-->
    <div id="floatHead" class="content-tab-wrap">
      <div class="content-tab">
        <div class="content-tab-ul-wrap">
          <ul>
            <li><a class="selected" href="javascript:;">基本信息</a></li>
            <li><a href="javascript:;">高级功能</a></li>
            <li><a href="javascript:;">类别权限</a></li>
            <li><a href="javascript:;">内容权限</a></li>
            <li><a href="javascript:;">URL配置</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!--基本信息-->
    <div class="tab-content">
      <dl>
        <dt>调用名称</dt>
        <dd>
          <asp:TextBox ID="txtName" runat="server" CssClass="input normal" datatype="/^[a-zA-Z0-9\-\_]{2,50}$/" errormsg="请填写正确的名称！" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">*调用名称，只允许使用英文、数字或下划线。</span>
        </dd>
      </dl>
      <dl>
        <dt>频道标题</dt>
        <dd>
          <asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">*标题备注，允许中文。</span></dd>
      </dl>
      <dl>
        <dt>所属站点</dt>
        <dd>
          <div class="rule-single-select">
            <asp:DropDownList ID="ddlSiteId" runat="server" datatype="*" errormsg="请选择所属站点！" sucmsg=" "></asp:DropDownList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>类别别名</dt>
        <dd>
          <asp:TextBox ID="txtCategoryName" runat="server" Text="栏目类别" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">*栏目类别显示别名 默认"栏目类别"。仅在类别层深大于0时有效。</span></dd>
      </dl>
      <dl>
        <dt>内容别名</dt>
        <dd>
          <asp:TextBox ID="txtContentName" runat="server" Text="内容管理" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">*内容管理显示别名 默认"内容管理"。</span></dd>
      </dl>
      <dl>
        <dt>排序数字</dt>
        <dd>
          <asp:TextBox ID="txtSortId" runat="server" CssClass="input small" datatype="n" sucmsg=" ">99</asp:TextBox>
          <span class="Validform_checktip">*数字，越小越向前</span>
        </dd>
      </dl>
      <dl>
        <dt>选择字段</dt>
        <dd>
          <div class="rule-multi-porp">
            <asp:CheckBoxList ID="cblAttributeField" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"></asp:CheckBoxList>
          </div>
        </dd>
      </dl>
    </div>
    <!--/基本信息-->
    <!--功能权限-->
    <div class="tab-content" style="display: none;">
      <dl>
        <dt>开启频道封面</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCover" runat="server" />
          </div>
          <span class="Validform_checktip">*开启频道封面功能后可上传该频道图片</span>
        </dd>
      </dl>
      <dl>
        <dt>开启频道描述</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContent" runat="server" />
          </div>
          <span class="Validform_checktip">*开启频道描述功能后可对该频道进行详细描述</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容审核</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentAudit" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可内容须审核显示，多用于多角色或者会员发布信息</span>
        </dd>
      </dl>
      <dl>
        <dt>开启批量移动</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentsMove" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可在内容列表中批量移动到其它类别，须类别层深大于0</span>
        </dd>
      </dl>
      <dl>
        <dt>开启批量上传</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentsBatch" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可批量上传内容。须开启封面图片。适用于单封面无相册产品。</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容复制</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentCopy" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可在内容列表中复制内容信息，用于快速建立信息。</span>
        </dd>
      </dl>
      <dl>
        <dt>开启评论</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsComment" runat="server" />
          </div>
          <span class="Validform_checktip">*开启内容评论功能后可对该频道内容进行评论描述</span>
        </dd>
      </dl>
      <dl>
        <dt>评论别名</dt>
        <dd>
          <asp:TextBox ID="txtCommentName" runat="server" Text="评论管理" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">*评论管理显示别名 默认"评论管理"。仅在开启内容评论后有效。</span></dd>
      </dl>
      <dl>
        <dt>开启频道关联</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="rblContentRelated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">关闭</asp:ListItem>
              <asp:ListItem Value="1">单资讯</asp:ListItem>
              <asp:ListItem Value="2">多资讯</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*开启后可选择与该内容相关的信息。</span>
        </dd>
      </dl>
      <dl>
        <dt>关联频道</dt>
        <dd>
          <asp:TextBox ID="txtRelatedChannel" runat="server" CssClass="input normal" ></asp:TextBox>
          <span class="Validform_checktip">*相互关联的频道（为空则表示所有频道）</span></dd>
      </dl>
    </div>
    <!--/功能权限-->

    <!--类别权限-->

    <div class="tab-content" style="display: none;">
      <dl>
        <dt>类别层深</dt>
        <dd>
          <asp:TextBox ID="txtCategoryLayer" runat="server" CssClass="input small" datatype="n" sucmsg=" ">0</asp:TextBox>
          <span class="Validform_checktip">*数字，分类的最大深度。0表示没有分类。</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别别名</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryCall" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可别名访问类别</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别副标题</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategorySubtitle" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑副标题</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别图标</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryIcon" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后上传类别图标，仅需要时开启。</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别跳转</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryLink" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后访问时跳转到所指向链接</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别摘要</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryAbstract" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑类别摘要</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别描述</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryDetails" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑类别描述</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别SEO</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategorySEO" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑类别SEO描述</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别价格区间</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryPrice" runat="server" />
          </div>
          <span class="Validform_checktip">*开启时必须选中销售价扩展字段，多用于高级搜索</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别属性</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryAttributes" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑类别多属性，多用于高级搜索</span>
        </dd>
      </dl>
      <dl>
        <dt>开启类别推荐</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsCategoryHot" runat="server" />
          </div>
          <span class="Validform_checktip">*分类推荐（只适用于顶层分类）</span>
        </dd>
      </dl>
      <dl>
        <dt>类别图片</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="rblCategoryImages" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">关闭</asp:ListItem>
              <asp:ListItem Value="1">单图</asp:ListItem>
              <asp:ListItem Value="2">多图</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*选择对应的图片上传组件</span>
        </dd>
      </dl>
    </div>
    <!--/类别权限-->

    <!--内容权限-->
    <div class="tab-content" style="display: none;">
      <dl>
        <dt>开启封面</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsImage" runat="server" />
          </div>
          <span class="Validform_checktip">*开启封面功能后可上传内容封面图片</span>
        </dd>
      </dl>
      <dl>
        <dt>开启相册</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsAlbums" runat="server" />
          </div>
          <span class="Validform_checktip">*开启相册功能后可上传多张图片</span>
        </dd>
      </dl>
      <dl>
        <dt>开启附件</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsAttach" runat="server" />
          </div>
          <span class="Validform_checktip">*开启附件功能后可上传多个附件。</span>
        </dd>
      </dl>
      <dl>
        <dt>开启规格</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsSpec" runat="server" />
          </div>
          <span class="Validform_checktip">*开启规格需选中市场价、销售价、库存三个扩展字段</span>
        </dd>
      </dl>
      <dl>
        <dt>开启品牌</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsBrand" runat="server" />
          </div>
          <span class="Validform_checktip">*开启品牌选择</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容别名</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentCall" runat="server" />
          </div>
          <span class="Validform_checktip">*开启可别名访问内容</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容跳转</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentLink" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后访问时跳转到所指向链接</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容摘要</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentAbstract" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑摘要</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容描述</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentDetails" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑描述</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容SEO</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentSEO" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑SEO描述</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容Tages</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentTages" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后可编辑Tages标签</span>
        </dd>
      </dl>
      <dl>
        <dt>开启内容浏览量</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsContentClick" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>推荐类型</dt>
        <dd>
          <div class="rule-multi-checkbox">
            <asp:CheckBoxList ID="cblRecomItem" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="isTop">置顶</asp:ListItem>
              <asp:ListItem Value="isRed">推荐</asp:ListItem>
              <asp:ListItem Value="isHot">热门</asp:ListItem>
              <asp:ListItem Value="isSlide">幻灯片</asp:ListItem>
            </asp:CheckBoxList>
          </div>
        </dd>
      </dl>
    </div>
    <!--/内容权限-->
    <!--URL配置-->
    <div class="tab-content" style="display: none;">
      <dl>
        <dt>URL生成配置</dt>
        <dd><a id="itemAddButton" class="icon-btn add"><i></i><span>添加页面</span></a></dd>
      </dl>
      <dl>
        <dt></dt>
        <dd>
          <div class="table-container">
            <table border="0" cellspacing="0" cellpadding="0" class="border-table" width="100%">
              <thead>
                <tr>
                  <th width="12%">类型</th>
                  <th width="16%">调用名称</th>
                  <th width="25%">生成文件名</th>
                  <th width="25%">模板文件名</th>
                  <th width="12%">分页大小</th>
                  <th width="10%">操作</th>
                </tr>
              </thead>
              <tbody id="item_box">
                <asp:Repeater ID="rptList" runat="server">
                  <ItemTemplate>
                    <tr class="td_c">
                      <td>
                        <input type="hidden" name="item_rewrite" value="<%#Eval("url_rewrite_str") %>" />
                        <input type="hidden" name="item_type" value="<%#Eval("type")%>" />
                        <span class="item_type"><%#GetPageTypeTxt(Eval("type").ToString())%></span>
                      </td>
                      <td>
                        <input type="hidden" name="old_item_name" value="<%#Eval("name")%>" />
                        <input type="hidden" name="item_name" value="<%#Eval("name")%>" />
                        <span class="item_name"><%#Eval("name")%></span>
                      </td>
                      <td>
                        <input type="hidden" name="item_page" value="<%#Eval("page")%>" />
                        <span class="item_page"><%#Eval("page")%></span>
                      </td>
                      <td>
                        <input type="hidden" name="item_templet" value="<%#Eval("templet")%>" />
                        <span class="item_templet"><%#Eval("templet")%></span>
                      </td>
                      <td>
                        <input type="hidden" name="item_pagesize" value="<%#Eval("pagesize")%>" />
                        <span class="item_pagesize"><%#Eval("pagesize").ToString() != "" ? Eval("pagesize") : "-"%></span>
                      </td>
                      <td>
                        <a title="编辑" class="img-btn edit operator" onclick="showChannelDialog(this);">编辑</a>
                        <a title="删除" class="img-btn del operator" onclick="delItemTr(this);">删除</a>
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </tbody>
            </table>
          </div>
        </dd>
      </dl>
    </div>
    <!--/URL配置-->
    <!--/内容-->

    <!--工具栏-->
    <div class="page-footer">
      <div class="btn-wrap">
        <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" OnClick="btnSubmit_Click" />
        <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript: history.back(-1);" />
      </div>
    </div>
    <!--/工具栏-->
  </form>
</body>
</html>
