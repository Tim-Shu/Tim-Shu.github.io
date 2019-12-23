<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_edit.aspx.cs" Inherits="QJcms.Web.admin.article.article_edit" ValidateRequest="false" %>

<%@ Import Namespace="QJcms.Common" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>编辑内容</title>
    <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/datepicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/webuploader/webuploader.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../editor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../editor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../editor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/uploader.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#form1").initValidform();

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
                        initialFrameWidth: '100%',
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

            //初始化上传控件
            $(".upload-img").InitUploader({ filesize: "<%=siteConfig.imgsize %>", sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf", filetypes: "<%=siteConfig.fileextension %>" });
      $(".upload-video").InitUploader({ filesize: "<%=siteConfig.videosize %>", sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf", filetypes: "<%=siteConfig.videoextension %>" });
        $(".upload-album").InitUploader({ btntext: "批量上传", multiple: true, water: true, thumbnail: true, filesize: "<%=siteConfig.imgsize %>", sendurl: "../../tools/upload_ajax.ashx", swf: "../../lib/scripts/webuploader/uploader.swf" });

        //设置封面图片的样式
        $(".photo-list ul li .img-box img").each(function () {
            if ($(this).attr("src") == $("#hidFocusPhoto").val()) {
                $(this).parent().addClass("selected");
            }
        });

        //创建上传附件
        $(".attach-btn").click(function () {
            showAttachDialog();
        });

        //创建商品规格
        $(".spec-btn").click(function () {
            showSpecDialog();
        });

        //赋值规格市场价格
        $("#field_control_market_price").blur(function () {
            $("#div_spec__container").find("input[name='spec_market_price']").val($(this).val());
        });
        //赋值规格销售价格
        $("#field_control_sell_price").blur(function () {
            $("#div_spec__container").find("input[name='spec_sell_price']").val($(this).val());
        });
      <%if (this.channel_model.is_category_attributes == 1)
        {%>
        //选择分类时加载属性列表
        $("#ddlCategoryId").change(function () {
            loadAttributes(this);
        });
        loadAttributes("#ddlCategoryId");
      <%}%>
    });

        //初始化附件窗口
        function showAttachDialog(obj) {
            var objNum = arguments.length;
            var attachDialog = top.dialog({
                id: 'attachDialogId',
                title: "上传附件",
                url: 'dialog/dialog_attach.aspx',
                width: 500,
                height: 180,
                onclose: function () {
                    var liHtml = this.returnValue; //获取返回值
                    if (liHtml.length > 0) {
                        $("#showAttachList").children("ul").append(liHtml);
                    }
                }
            }).showModal();
            //如果是修改状态，将对象传进去
            if (objNum == 1) {
                attachDialog.data = obj;
            }
        }
        //删除附件节点
        function delAttachNode(obj) {
            $(obj).parent().remove();
        }

        //初始化规格窗口
        function showSpecDialog() {
            var d = top.dialog({
                id: 'specDialogId',
                padding: 0,
                title: "商品规格",
                url: 'dialog/dialog_spec_item.aspx'
            }).showModal();
            //将容器对象传进去
            d.data = $("#item_box");
        }
        //初始化会员组价格窗口
        function showPriceDialog(obj) {
            var d = top.dialog({
                padding: 0,
                title: "会员组价格",
                url: 'dialog/dialog_group_price.aspx',
                width: 400
            }).showModal();
            //将对象传进去
            d.data = obj;
        }
        //计算出最小的市场价格
        function countMarketPrice(obj) {
            var objName = $(obj).attr("name");
            var minValue = parseFloat($(obj).val());
            $("input[name='" + objName + "']").each(function () {
                if ($(this).val().length > 0) {
                    if (parseFloat($(this).val()) < minValue) {
                        minValue = parseFloat($(this).val());
                    }
                }
            });
            $("#field_control_market_price").val(minValue);
        }
        //计算最小的销售价格
        function countSellPrice(obj) {
            var objName = $(obj).attr("name");
            var minValue = parseFloat($(obj).val());
            $("input[name='" + objName + "']").each(function () {
                if ($(this).val().length > 0) {
                    if (parseFloat($(this).val()) < minValue) {
                        minValue = parseFloat($(this).val());
                    }
                }
            });
            $("#field_control_sell_price").val(minValue);
        }
        //计算库存总数量
        function countStockQuantity(obj) {
            var objName = $(obj).attr("name");
            var countValue = 0;
            $("input[name='" + objName + "']").each(function () {
                if ($(this).val().length > 0) {
                    countValue += parseFloat($(this).val());
                }
            });
            $("#field_control_stock_quantity").val(countValue);
        }

        //加载属性列表
        function loadAttributes(obj) {
            var _cid = $(obj).val();
            var _result = "<dl><dt>请先选择分类</dt><dd></dd></dl>";
            if (_cid <= 0) {
                $("#div_attributes").html(_result);
                return;
            }
            $.ajax({
                type: "post",
                url: "../../tools/attributes_ajax.ashx?action=get_attributes_values",
                data: { category_id: _cid },
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    top.dialog({
                        title: '提示',
                        content: '加载属性列表失败，错误信息：' + errorThrown,
                        okValue: '确定',
                        ok: function () { }
                    }).showModal();
                },
                success: function (data, textStatus) {
                    if (data.status == 1) {
                        var group_name = "";
                        var attr_name = "";
                        var count = 0;
                        var attr_id_list = "";
                        _result = "";
                        if (data.rows.length > 0) {
                            $.each(data.rows, function () {
                                if (group_name != this.group_name) {
                                    _result += "<dl><dt></dt><dd>" + this.group_name + "</dd></dl>";
                                }
                                group_name = this.group_name;
                                if (attr_name != this.attr_name) {
                                    attr_id_list += this.attr_id + ",";
                                    _result += "<dl><dt>" + this.attr_name + "</dt><dd><div class=\"rule-multi-radio\">";
                                }
                                _result += "<input type=\"radio\" value=\"" + this.id + "\" name=\"rblAttr" + this.attr_id + "\" id=\"rblAttr" + this.attr_id + "_" + this.id + "\"><label for=\"rblAttr" + this.attr_id + "_" + this.id + "\">" + this.name + "</label>";
                                if (count + 1 < data.rows.length) {
                                    if (attr_name == this.attr_name && attr_name != data.rows[count + 1].attr_name) {
                                        _result += "</div></dd></dl>";
                                    }
                                }
                                attr_name = this.attr_name;
                                count++;
                            });
                        }
                        else {
                            _result = "<dl><dt>当前分类无任何属性</dt><dd></dd></dl>";
                        }
                        $("#hidAttrId").val(attr_id_list);
                        $("#div_attributes").html(_result);

                        var value_id_list = $("#hidAttrValueId").val().split(",");
                        for (var i = 0; i < value_id_list.length; i++) {
                            $("#rblAttr" + value_id_list[i].split("|")[0] + "_" + value_id_list[i].split("|")[1]).attr("checked", "checked");
                        }

                        $(".rule-multi-radio").ruleMultiRadio();
                    } else {
                        top.dialog({
                            title: '提示',
                            content: '加载属性列表失败：' + data.msg,
                            okValue: '确定',
                            ok: function () { }
                        }).showModal();
                    }
                }
            });
        }
    </script>
</head>

<body class="mainbody">
    <form id="form1" runat="server">
        <!--导航栏-->
        <div class="location">
            <a href="article_list.aspx?channel_id=<%=this.channel_id %>" class="back"><i></i><span>返回列表页</span></a>
            <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
            <i class="arrow"></i>
            <a href="article_list.aspx?channel_id=<%=this.channel_id %>"><span>内容管理</span></a>
            <i class="arrow"></i>
            <span>编辑内容</span>
        </div>
        <div class="line10"></div>
        <!--/导航栏-->

        <!--内容-->
        <div id="floatHead" class="content-tab-wrap">
            <div class="content-tab">
                <div class="content-tab-ul-wrap">
                    <ul>
                        <li><a class="selected" href="javascript:;">基本信息</a></li>
                        <li runat="server" id="li_sale" visible="false"><a href="javascript:;">商品信息</a></li>
                        <li runat="server" id="li_attributes" visible="false"><a href="javascript:;">属性参数</a>
                            <asp:HiddenField runat="server" ID="hidAttrId" Value="0" />
                            <asp:HiddenField runat="server" ID="hidAttrValueId" Value="" />
                        </li>
                        <li id="field_tab_item" runat="server" visible="false"><a href="javascript:;">扩展选项</a></li>
                        <li runat="server" id="li_content" visible="false"><a href="javascript:;">详细描述</a></li>
                        <li runat="server" id="li_seo" visible="false"><a href="javascript:;">SEO选项</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <dl runat="server" id="dl_category" visible="false">
                <dt>所属类别</dt>
                <dd>
                    <div class="rule-single-select">
                        <asp:DropDownList ID="ddlCategoryId" runat="server" datatype="*" sucmsg=" "></asp:DropDownList>
                    </div>
                </dd>
            </dl>
            <dl runat="server" id="dl_brand" visible="false">
                <dt>所属品牌</dt>
                <dd>
                    <div class="rule-single-select">
                        <asp:DropDownList ID="ddlBrand" runat="server" datatype="*" sucmsg=" "></asp:DropDownList>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>显示状态</dt>
                <dd>
                    <div class="rule-multi-radio">
                        <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0" Selected="True">正常</asp:ListItem>
                            <asp:ListItem Value="2">不显示</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </dd>
            </dl>
            <dl runat="server" id="dl_issys" visible="false">
                <dt>系统类别</dt>
                <dd>
                    <div class="rule-single-checkbox">
                        <asp:CheckBox ID="cbIsSys" runat="server" />
                    </div>
                    <span class="Validform_checktip">*开启后不可删除</span>
                </dd>
            </dl>
            <dl runat="server" id="dl_recom" visible="false">
                <dt>推荐类型</dt>
                <dd>
                    <div class="rule-multi-checkbox">
                        <asp:CheckBoxList ID="cblItem" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        </asp:CheckBoxList>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>内容标题</dt>
                <dd>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" " />
                    <span class="Validform_checktip">*标题最多100个字符</span>
                </dd>
            </dl>
            <dl id="div_sub_title" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_sub_title_title" runat="server" Text="副标题" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_sub_title" runat="server" CssClass="input normal" datatype="*0-255" sucmsg=" " />
                    <asp:Label ID="div_sub_title_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl runat="server" id="dl_call" visible="false">
                <dt>调用别名</dt>
                <dd>
                    <asp:TextBox ID="txtCallIndex" runat="server" CssClass="input normal" datatype="/^\s*$|^[a-zA-Z0-9\-\_]{2,50}$/" sucmsg=" "></asp:TextBox>
                    <span class="Validform_checktip">*别名访问，非必填，不可重复</span>
                </dd>
            </dl>
            <dl id="div_source" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_source_title" runat="server" Text="信息来源" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_source" runat="server" CssClass="input normal"></asp:TextBox>
                    <asp:Label ID="div_source_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl id="div_author" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_author_title" runat="server" Text="文章作者" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_author" runat="server" CssClass="input normal" datatype="s0-50" sucmsg=" "></asp:TextBox>
                    <asp:Label ID="div_author_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl runat="server" id="dl_tags" visible="false">
                <dt>Tags标签</dt>
                <dd>
                    <asp:TextBox ID="txtTags" runat="server" CssClass="input normal" datatype="*0-500" sucmsg=" " />
                    <span class="Validform_checktip">多个可用英文逗号分隔开，如：a,b</span>
                </dd>
            </dl>
            <dl runat="server" id="dl_image" visible="false">
                <dt>封面图片</dt>
                <dd>
                    <asp:TextBox ID="txtImgUrl" runat="server" CssClass="input normal upload-path" />
                    <div class="upload-box upload-img"></div>
                </dd>
            </dl>
            <dl>
                <dt>排序数字</dt>
                <dd>
                    <asp:TextBox ID="txtSortId" runat="server" CssClass="input small" datatype="n" sucmsg=" ">99</asp:TextBox>
                    <span class="Validform_checktip">*数字，越小越向前</span>
                </dd>
            </dl>
            <dl runat="server" id="dl_click" visible="false">
                <dt>浏览次数</dt>
                <dd>
                    <asp:TextBox ID="txtClick" runat="server" CssClass="input small" datatype="n" sucmsg=" ">0</asp:TextBox>
                    <span class="Validform_checktip">点击浏览该信息自动+1</span>
                </dd>
            </dl>
            <dl>
                <dt>发布时间</dt>
                <dd>
                    <asp:TextBox ID="txtAddTime" runat="server" CssClass="input rule-date-input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
                    <span class="Validform_checktip">不选择默认当前发布时间</span>
                </dd>
            </dl>
            <dl id="div_albums_container" runat="server" visible="false">
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
            <dl id="div_attach_container" runat="server" visible="false">
                <dt>上传附件</dt>
                <dd>
                    <a class="icon-btn add attach-btn"><span>添加附件</span></a>
                    <div id="showAttachList" class="attach-list">
                        <ul>
                            <asp:Repeater ID="rptAttachList" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <input name="hid_attach_id" type="hidden" value="<%#Eval("id")%>" />
                                        <input name="hid_attach_filename" type="hidden" value="<%#Eval("file_name")%>" />
                                        <input name="hid_attach_filepath" type="hidden" value="<%#Eval("file_path")%>" />
                                        <input name="hid_attach_filesize" type="hidden" value="<%#Eval("file_size")%>" />
                                        <i class="icon"></i>
                                        <a href="javascript:;" onclick="delAttachNode(this);" class="del" title="删除附件"></a>
                                        <a href="javascript:;" onclick="showAttachDialog(this);" class="edit" title="更新附件"></a>
                                        <div class="title"><%#Eval("file_name")%></div>
                                        <div class="info">类型：<span class="ext"><%#Eval("file_ext")%></span> 大小：<span class="size"><%#Convert.ToInt32(Eval("file_size")) > 1024 ? Convert.ToDouble((Convert.ToDouble(Eval("file_size")) / 1024f)).ToString("0.0") + "MB" : Eval("file_size") + "KB"%></span> 下载：<span class="down"><%#Eval("down_num")%></span>次</div>
                                        <div class="btns">下载积分：<input type="text" name="txt_attach_point" onkeydown="return checkNumber(event);" value="<%#Eval("point")%>" /></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </dd>
            </dl>
        </div>
        <div id="div_sale" runat="server" visible="false" class="tab-content" style="display: none">
            <dl id="div_goods_no" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_goods_no_title" runat="server" Text="商品货号" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_goods_no" runat="server" CssClass="input normal" datatype="*0-100" sucmsg=" " />
                    <asp:Label ID="div_goods_no_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl id="div_stock_quantity" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_stock_quantity_title" runat="server" Text="库存数量" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_stock_quantity" runat="server" CssClass="input small" datatype="n" sucmsg=" ">0</asp:TextBox>
                    <asp:Label ID="div_stock_quantity_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl id="div_market_price" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_market_price_title" runat="server" Text="市场价格" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_market_price" runat="server" CssClass="input small" datatype="/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/" sucmsg=" ">0</asp:TextBox>
                    元
      <asp:Label ID="div_market_price_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl id="div_sell_price" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_sell_price_title" runat="server" Text="销售价格" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_sell_price" runat="server" CssClass="input small" datatype="/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/" sucmsg=" ">0</asp:TextBox>
                    元
      <asp:Label ID="div_sell_price_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl id="div_point" runat="server" visible="false">
                <dt>
                    <asp:Label ID="div_point_title" runat="server" Text="积分" /></dt>
                <dd>
                    <asp:TextBox ID="field_control_point" runat="server" CssClass="input small" datatype="/^-?\d+$/" sucmsg=" ">0</asp:TextBox>
                    <asp:Label ID="div_point_tip" runat="server" CssClass="Validform_checktip" />
                </dd>
            </dl>
            <dl id="div_spec__container" runat="server" visible="false">
                <dt>商品规格</dt>
                <dd>
                    <a class="icon-btn add spec-btn"><span>设置规格</span></a>
                    <div class="table-container" style="padding-top: 10px;">
                        <asp:HiddenField ID="hide_goods_spec_list" runat="server" />
                        <table border="0" cellspacing="0" cellpadding="0" class="border-table" width="82%">
                            <thead>
                                <tr>
                                    <th align="center" width="15%">货号</th>
                                    <th width="8%">市场价(元)</th>
                                    <th width="8%">销售价(元)</th>
                                    <th width="8%">库存(件)</th>
                                    <th width="35%">规格</th>
                                    <th width="8%">会员价</th>
                                </tr>
                            </thead>
                            <tbody id="item_box">
                                <asp:Repeater ID="rptGroupPrice" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td align="center">
                                                <input type="hidden" name="hide_goods_id" value="<%#Eval("id")%>" />
                                                <input type="text" name="spec_goods_no" class="td-input" value="<%#Eval("goods_no")%>" />
                                            </td>
                                            <td align="center">
                                                <input type="text" name="spec_market_price" maxlength="10" class="td-input" value="<%#Eval("market_price")%>" onkeydown="return checkForFloat(this,event);" onblur="countMarketPrice(this);" /></td>
                                            <td align="center">
                                                <input type="text" name="spec_sell_price" maxlength="10" class="td-input" value="<%#Eval("sell_price")%>" onkeydown="return checkForFloat(this,event);" onblur="countSellPrice(this);" /></td>
                                            <td align="center">
                                                <input type="text" name="spec_stock_quantity" maxlength="10" class="td-input" value="<%#Eval("stock_quantity")%>" onkeydown="return checkNumber(event);" onblur="countStockQuantity(this);" /></td>
                                            <td style="white-space: inherit; word-break: break-all;">
                                                <input type="hidden" name="hide_spec_ids" value="<%#Eval("spec_ids")%>" />
                                                <input type="hidden" name="hide_spec_text" value="<%#Eval("spec_text")%>" />
                                                <p><%#Eval("spec_text")%></p>
                                            </td>
                                            <td align="center">
                                                <input name="hide_group_price" type="hidden" value='<%#JsonHelper.ObjectToJSON(Eval("group_prices"))%>' />
                                                <a href="javascript:;" onclick="showPriceDialog(this);">设置</a>
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
        <div id="div_attributes" runat="server" visible="false" class="tab-content" style="display: none">
            <dl>
                <dt>请先选择分类</dt>
                <dd></dd>
            </dl>
        </div>
        <div id="field_tab_content" runat="server" visible="false" class="tab-content" style="display: none"></div>

        <div class="tab-content" style="display: none" runat="server" id="div_content" visible="false">
            <dl runat="server" id="dl_link" visible="false">
                <dt>URL链接</dt>
                <dd>
                    <asp:TextBox ID="txtLinkUrl" runat="server" MaxLength="255" CssClass="input normal" />
                    <span class="Validform_checktip">填写后直接跳转到该网址</span>
                </dd>
            </dl>
            <dl runat="server" id="dl_abstract" visible="false">
                <dt>内容摘要</dt>
                <dd>
                    <asp:TextBox ID="txtZhaiyao" runat="server" CssClass="input" TextMode="MultiLine" datatype="*0-255" sucmsg=" "></asp:TextBox>
                    <span class="Validform_checktip">不填写则自动截取内容前255字符</span>
                </dd>
            </dl>
            <dl runat="server" id="dl_content" visible="false">
                <dt>内容描述</dt>
                <dd>
                    <textarea id="txtContent" class="editor" runat="server"></textarea>
                </dd>
            </dl>
        </div>

        <div class="tab-content" style="display: none" runat="server" id="div_seo" visible="false">
            <dl>
                <dt>SEO标题</dt>
                <dd>
                    <asp:TextBox ID="txtSeoTitle" runat="server" MaxLength="255" CssClass="input normal" datatype="*0-100" sucmsg=" " />
                    <span class="Validform_checktip">255个字符以内</span>
                </dd>
            </dl>
            <dl>
                <dt>SEO关健字</dt>
                <dd>
                    <asp:TextBox ID="txtSeoKeywords" runat="server" CssClass="input" TextMode="MultiLine" datatype="*0-255" sucmsg=" "></asp:TextBox>
                    <span class="Validform_checktip">以“,”逗号区分开，255个字符以内</span>
                </dd>
            </dl>
            <dl>
                <dt>SEO描述</dt>
                <dd>
                    <asp:TextBox ID="txtSeoDescription" runat="server" CssClass="input" TextMode="MultiLine" datatype="*0-255" sucmsg=" "></asp:TextBox>
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
