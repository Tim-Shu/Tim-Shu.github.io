<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="script_code_edit.aspx.cs" Inherits="QJcms.Web.admin.plugins.script_code_edit" ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>编辑统计代码</title>
    <link href="../../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../lib/scripts/artdialog/dialog-plus-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/laymain.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#form1").initValidform();
        });
    </script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
        <!--导航栏-->
        <div class="location">
            <a href="javascript:history.back(-1);" class="back"><i></i><span>返回列表页</span></a>
            <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
            <i class="arrow"></i>
            <a href="script_code_list.aspx"><span>统计代码</span></a>
            <i class="arrow"></i>
            <span>编辑统计代码</span>
        </div>
        <div class="line10"></div>
        <!--/导航栏-->
        <!--内容-->
        <div id="floatHead" class="content-tab-wrap">
            <div class="content-tab">
                <div class="content-tab-ul-wrap">
                    <ul>
                        <li><a class="selected" href="javascript:;">基本信息</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="tab-content">
            <dl>
                <dt>所属站点</dt>
                <dd>
                    <div class="rule-single-select">
                        <asp:DropDownList ID="ddlSitePath" runat="server" datatype="*" errormsg="请选择所属站点！" sucmsg=" "></asp:DropDownList>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>标题名称</dt>
                <dd>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>代码位置</dt>
                <dd>
                    <div class="rule-multi-radio">
                        <asp:RadioButtonList ID="rblPlace" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="head" Selected="True">头部</asp:ListItem>
                            <asp:ListItem Value="foot">底部</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>审核状态</dt>
                <dd>
                    <div class="rule-multi-radio">
                        <asp:RadioButtonList ID="rblIsLock" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0" Selected="True">正常</asp:ListItem>
                            <asp:ListItem Value="1">待审核</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </dd>
            </dl>
            <dl>
                <dt>排序数字</dt>
                <dd>
                    <asp:TextBox ID="txtSortId" runat="server" CssClass="input small" datatype="n" sucmsg=" ">99</asp:TextBox>
                    <span class="Validform_checktip">*数字，越小越向前</span>
                </dd>
            </dl>
            <dl>
                <dt>代码正文</dt>
                <dd>
                    <asp:TextBox ID="txtContent" runat="server" CssClass="input" TextMode="MultiLine" datatype="*" sucmsg=" "></asp:TextBox>
                    <span class="Validform_checktip">支持html格式</span>
                </dd>
            </dl>
            <dl runat="server" id="dlLog" visible="false">
                <dt>操作记录</dt>
                <dd>
                    <pre><asp:Label runat="server" ID="lbLog"></asp:Label></pre>
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
