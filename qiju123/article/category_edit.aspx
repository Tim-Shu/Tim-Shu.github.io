<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="category_edit.aspx.cs" Inherits="QJcms.Web.admin.article.category_edit" ValidateRequest="false" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>编辑类别</title>
  <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
  <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/Validform_v5.3.2_min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../../lib/scripts/webuploader/webuploader.min.js"></script>
  <script src="../../editor/ueditor.config.js"></script>
  <script src="../../editor/ueditor.all.min.js"></script>
  <script src="../../editor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/uploader.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
  <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
  <script type="text/javascript">
    $(function () {
      //初始化表单验证
      $("#form1").initValidform();
      //初始化上传控件
      $(".upload-img").InitUploader({ sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf" });
      $(".upload-album").InitUploader({ btntext: "批量上传", multiple: true, water: true, thumbnail: true, filesize: "<%=siteConfig.imgsize %>", sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf" });
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
        $(".editor-mini").each(function (i) {
            var objId = $(this).attr("id");
            if (objId != "undefined") {
                var editorMini = UE.getEditor(objId, {
                    serverUrl: '../../../tools/upload_ajax.ashx',
                    initialFrameWidth: '50%',
                    initialFrameHeight: 250,
                    scaleEnabled: true,
                    toolbars: [[
                        'fullscreen', 'source', '|', 'undo', 'redo', '|',
                        'bold', 'italic', 'underline', 'strikethrough', 'removeformat', 'pasteplain', '|', 'forecolor', 'insertorderedlist', 'insertunorderedlist', '|',
                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
                     'link', 'unlink', 'anchor', '|',
                     'simpleupload', 'insertimage', 'scrawl', 'insertvideo'
                    ]]
                });
            }
        });
    });
  </script>
</head>

<body class="mainbody">
  <form id="form1" runat="server">
    <!--导航栏-->
    <div class="location">
      <a href="category_list.aspx?channel_id=<%=this.channel_id %>" class="back"><i></i><span>返回列表页</span></a>
      <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
      <i class="arrow"></i>
      <a href="category_list.aspx?channel_id=<%=this.channel_id %>"><span>内容类别</span></a>
      <i class="arrow"></i>
      <span>编辑分类</span>
    </div>
    <div class="line10"></div>
    <!--/导航栏-->

    <!--内容-->
    <div id="floatHead" class="content-tab-wrap">
      <div class="content-tab">
        <div class="content-tab-ul-wrap">
          <ul>
            <li><a class="selected" href="javascript:;">基本信息</a></li>
            <li><a href="javascript:;">扩展选项</a></li>
            <li runat="server" id="li_details" visible="false"><a href="javascript:;">详细描述</a></li>
            <li runat="server" id="li_seo" visible="false"><a href="javascript:;">SEO选项</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="tab-content">
      <dl runat="server" id="dl_parent" visible="false">
        <dt>所属父类别</dt>
        <dd>
          <div class="rule-single-select">
            <asp:DropDownList ID="ddlParentId" runat="server"></asp:DropDownList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>类别名称</dt>
        <dd>
          <asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*1-100" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">*类别中文名称，100字符内</span></dd>
      </dl>
      <dl runat="server" id="dl_subtitle" visible="false">
        <dt>副标题</dt>
        <dd>
          <asp:TextBox ID="txtSubtitle" runat="server" CssClass="input normal" datatype="*0-200" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">类别的副标题，200字以内</span>
        </dd>
      </dl>
      <dl runat="server" id="dl_callindex" visible="false">
        <dt>调用别名</dt>
        <dd>
          <asp:TextBox ID="txtCallIndex" runat="server" CssClass="input normal" datatype="/^\s*$|^[a-zA-Z0-9\-\_]{2,50}$/" errormsg="请填写正确的别名" sucmsg=" "></asp:TextBox>
          <span class="Validform_checktip">类别的调用别名，只允许字母、数字、下划线</span>
        </dd>
      </dl>
      <dl runat="server" id="dl_linkurl" visible="false">
        <dt>URL链接</dt>
        <dd>
          <asp:TextBox ID="txtLinkUrl" runat="server" MaxLength="255" CssClass="input normal" />
          <span class="Validform_checktip">填写后直接跳转到该网址</span>
        </dd>
      </dl>
      <dl>
        <dt>排序数字</dt>
        <dd>
          <asp:TextBox ID="txtSortId" runat="server" CssClass="input small" datatype="n" sucmsg=" ">99</asp:TextBox>
          <span class="Validform_checktip">*数字，越小越向前</span>
        </dd>
      </dl>
      <dl runat="server" id="dl_abstracts" visible="false">
        <dt>类别摘要</dt>
        <dd>
          <textarea id="txtAbstracts" class="editor-mini" runat="server"></textarea>
        </dd>
      </dl>
    </div>

    <div class="tab-content" style="display: none">
      <dl runat="server" id="dl_issys" visible="false">
        <dt>系统类别</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsSys" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后不可删除</span>
        </dd>
      </dl>
      <dl runat="server" id="dl_ishot" visible="false">
        <dt>热门推荐</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsHot" runat="server" />
          </div>
          <span class="Validform_checktip">*是否推荐类别</span>
        </dd>
      </dl>
      <dl>
        <dt>是否停用</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="cbIsLock" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后该类别停止使用。</span>
        </dd>
      </dl>
      <dl runat="server" id="dl_pricerange" visible="false">
        <dt>价格区间</dt>
        <dd>
          <asp:TextBox ID="txtPricerange" runat="server" CssClass="input" TextMode="MultiLine" Height="180"></asp:TextBox>
          <span class="Validform_checktip">*用回车分隔，格式：“开始价格-结束价格”用"-"分隔；或“开始价格”</span>
        </dd>
      </dl>
      <dl runat="server" id="dl_icon" visible="false">
        <dt>显示图标</dt>
        <dd>
          <asp:TextBox ID="txtIcon" runat="server" CssClass="input normal upload-path" />
          <div class="upload-box upload-img"></div>
        </dd>
      </dl>
      <dl runat="server" id="dl_images" visible="false">
        <dt>显示图片</dt>
        <dd>
          <asp:TextBox ID="txtImgUrl" runat="server" CssClass="input normal upload-path" />
          <div class="upload-box upload-img"></div>
        </dd>
      </dl>
      <dl id="dl_albums" runat="server" visible="false">
        <dt>图片相册</dt>
        <dd>
          <div class="upload-box upload-album"></div>
          <input type="hidden" name="hidFocusPhoto" id="hidFocusPhoto" runat="server" class="focus-photo" />
          <div class="photo-list">
            <ul>
              <asp:Repeater ID="rptAlbumList" runat="server">
                <ItemTemplate>
                  <li>
                    <input type="hidden" name="hid_photo_name" value="<%#Eval("id")%>|<%#Eval("original_path")%>|<%#Eval("thumb_path")%>" />
                    <input type="hidden" name="hid_photo_remark" value="<%#Eval("remark")%>" />
                    <div class="img-box" onclick="setFocusImg(this);">
                      <img src="<%#Eval("thumb_path")%>" bigsrc="<%#Eval("original_path")%>" />
                      <span class="remark"><i><%#Eval("remark").ToString() == "" ? "暂无描述..." : Eval("remark").ToString()%></i></span>
                    </div>
                    <a href="javascript:;" onclick="setRemark(this);">描述</a>
                    <a href="javascript:;" onclick="delImg(this);">删除</a>
                  </li>
                </ItemTemplate>
              </asp:Repeater>
            </ul>
          </div>
        </dd>
      </dl>
    </div>
    <div class="tab-content" style="display: none" runat="server" id="div_details" visible="false">
      <dl>
        <dt>类别描述</dt>
        <dd>
          <textarea id="txtContent" class="editor"  runat="server"></textarea>
        </dd>
      </dl>
    </div>
    <div class="tab-content" style="display: none" runat="server" id="div_seo" visible="false">
      <dl>
        <dt>SEO标题</dt>
        <dd>
          <asp:TextBox ID="txtSeoTitle" runat="server" MaxLength="255" CssClass="input normal" datatype="s0-100" sucmsg=" " />
          <span class="Validform_checktip">255个字符以内</span>
        </dd>
      </dl>
      <dl>
        <dt>SEO关健字</dt>
        <dd>
          <asp:TextBox ID="txtSeoKeywords" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
          <span class="Validform_checktip">以“,”逗号区分开，255个字符以内</span>
        </dd>
      </dl>
      <dl>
        <dt>SEO描述</dt>
        <dd>
          <asp:TextBox ID="txtSeoDescription" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
          <span class="Validform_checktip">255个字符以内</span>
        </dd>
      </dl>
    </div>
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
