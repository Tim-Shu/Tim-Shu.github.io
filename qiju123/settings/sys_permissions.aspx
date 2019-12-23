<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sys_permissions.aspx.cs" Inherits="QJcms.Web.admin.settings.sys_permissions" %>
<%@ Import Namespace="QJcms.Common" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>系统参数设置</title>
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
      <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
      <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
      <i class="arrow"></i>
      <span>功能设置</span>
    </div>
    <div class="line10"></div>
    <!--/导航栏-->

    <!--内容-->
    <div id="floatHead" class="content-tab-wrap">
      <div class="content-tab">
        <div class="content-tab-ul-wrap">
          <ul>
            <li><a class="selected" href="javascript:;">系统功能设置</a></li>
            <li><a href="javascript:;">会员权限设置</a></li>
            <li><a href="javascript:;">商城功能设置</a></li>
            <li><a href="javascript:;">上传功能设置</a></li>
            <li><a href="javascript:;">高级功能设置</a></li>
            <li><a href="javascript:;">工具插件设置</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!--系统功能设置-->
    <div class="tab-content">
      <dl>
        <dt>网站安装目录</dt>
        <dd>
          <asp:TextBox ID="webpath" runat="server" CssClass="input txt" datatype="*1-100" sucmsg=" " />
          <span class="Validform_checktip">*根目录输入“/”，其它输入“/目录名/”</span>
        </dd>
      </dl>
      <dl>
        <dt>后台管理目录</dt>
        <dd>
          <asp:TextBox ID="webmanagepath" runat="server" CssClass="input txt" datatype="*1-100" sucmsg=" " />
          <span class="Validform_checktip">*默认admin，其它请输入目录名，否则无法进入后台</span>
        </dd>
      </dl>
      <dl>
        <dt>URL重写开关</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="staticstatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">关闭</asp:ListItem>
              <asp:ListItem Value="1">伪URL重写</asp:ListItem>
              <asp:ListItem Value="2">生成静态</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*URL配置规则，点击这里查看说明</span>
        </dd>
      </dl>
      <dl>
        <dt>静态URL后缀</dt>
        <dd>
          <asp:TextBox ID="staticextension" runat="server" CssClass="input small" datatype="*1-100" sucmsg=" " />
          <span class="Validform_checktip">*扩展名，不包括“.”，访问或生成时将会替换此值，如：aspx、html</span>
        </dd>
      </dl>
      <dl>
        <dt>开启管理日志</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="logstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后将会记录管理员在后台的操作日志</span>
        </dd>
      </dl>
      <dl>
        <dt>是否开启网站</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="webstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后网站前台将不能访问</span>
        </dd>
      </dl>
      <dl>
        <dt>网站关闭原因</dt>
        <dd>
          <asp:TextBox ID="webclosereason" runat="server" CssClass="input" TextMode="MultiLine" />
          <span class="Validform_checktip">支持HTML</span>
        </dd>
      </dl>
      <dl>
        <dt>网站统计代码</dt>
        <dd>
          <asp:TextBox ID="webcountcode" runat="server" CssClass="input" TextMode="MultiLine" />
          <span class="Validform_checktip">支持HTML</span>
        </dd>
      </dl>
    </div>
    <!--/系统功能设置-->
    <!--会员权限设置-->
    <div class="tab-content" style="display: none">
      <dl>
        <dt>开启会员功能</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="memberstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后关联会员的内容将失效</span>
        </dd>
      </dl>
      <dl>
        <dt>开启邀请注册</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="invitedstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后无法申请邀请码，无法邀请注册</span>
        </dd>
      </dl>
      <dl>
        <dt>开启会员组</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="membergroupstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后会员组相关内容将失效</span>
        </dd>
      </dl>
      <dl>
        <dt>开启会员等级</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="memberlevelstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后会员无升级经验值</span>
        </dd>
      </dl>
      <dl>
        <dt>开启会员积分</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="memberpointstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后会员积分功能失效</span>
        </dd>
      </dl>
      <dl>
        <dt>开启账户余额</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="memberamountstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后会员不能使用余额交易</span>
        </dd>
      </dl>
      <dl>
        <dt>开启会员头像</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="memberavatarstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后会员无头像显示</span>
        </dd>
      </dl>
      <dl>
        <dt>第三方登录</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="memberoauthstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后会法使用第三方登录插件</span>
        </dd>
      </dl>
      <dl>
        <dt>开启评论审核</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="commentstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后评论将会审核才显示</span>
        </dd>
      </dl>
    </div>
    <!--/会员权限设置-->
    <!--商城功能设置-->
    <div class="tab-content" style="display: none">
      <dl>
        <dt>开启商城功能</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="shoppingstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后网站商城相关功能将失效</span>
        </dd>
      </dl>
      <dl>
        <dt>物流跟踪</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="tracking" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*授权后可在订单参数里配置快递100接口</span>
        </dd>
      </dl>
      <dl>
        <dt>订单通知</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="ordernotice" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*授权后可在订单参数里配置订单通知方式</span>
        </dd>
      </dl>
      <dl>
        <dt>通知模板</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="ordertemplates" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*授权后可在订单参数里配置订单通知模板</span>
        </dd>
      </dl>
      <dl>
        <dt>支付配置</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="paymentset" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*授权后可配置支付方式</span>
        </dd>
      </dl>
      <dl>
        <dt>支付方式</dt>
        <dd>
          <div class="rule-multi-porp">
            <asp:CheckBoxList ID="paymentlicense" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="balance">余额支付（须开启账户余额）</asp:ListItem>
              <asp:ListItem Value="alipaypc">支付宝</asp:ListItem>
              <asp:ListItem Value="tenpaypc">财付通</asp:ListItem>
              <asp:ListItem Value="chinabankpc">网银在线</asp:ListItem>
              <asp:ListItem Value="alipaymb">支付宝手机支付</asp:ListItem>
              <asp:ListItem Value="wxnatpay">微信扫码支付</asp:ListItem>
              <asp:ListItem Value="wxapipay">微信公众号支付</asp:ListItem>
            </asp:CheckBoxList>
          </div>
        </dd>
      </dl>
    </div>
    <!--/商城功能设置-->
    <!--上传功能设置-->
    <div class="tab-content" style="display: none">
      <dl>
        <dt>上传权限</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="uploadswitch" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
          <span class="Validform_checktip">*限制权限后以下配置无法修改。</span>
        </dd>
      </dl>
      <dl>
        <dt>编辑器图片</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="fileremote" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">关闭下载</asp:ListItem>
              <asp:ListItem Value="1">自动下载</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>附件上传</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="upattach" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>视频上传</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="upvideo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>图片上传</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="upimages" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>生成缩略</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="imgthumb" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </dd>
      </dl>
      <dl>
        <dt>水印权限</dt>
        <dd>
          <div class="rule-multi-radio">
            <asp:RadioButtonList ID="watermark" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
              <asp:ListItem Value="0" Selected="True">限制</asp:ListItem>
              <asp:ListItem Value="1">授权</asp:ListItem>
            </asp:RadioButtonList>
          </div>
        </dd>
      </dl>
    </div>
    <!--/上传功能设置-->
    <!--高级功能设置-->
    <div class="tab-content" style="display: none">
      <dl>
        <dt>开启邮件服务</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="mailstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后网站无法发送邮件</span>
        </dd>
      </dl>
      <dl>
        <dt>开启短信平台</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="smsstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后网站无法发送短信</span>
        </dd>
      </dl>
      <dl>
        <dt>开启微信平台</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="weixin" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启商品品牌</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="brandstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后网站产品支持多品牌</span>
        </dd>
      </dl>
      <dl>
        <dt>开启商品SKU</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="skustatus" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后商品支持多SKU规格（须商城功能配合）</span>
        </dd>
      </dl>
      <dl>
        <dt>开启分类属性</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="attributes" runat="server" />
          </div>
          <span class="Validform_checktip">*开启后提供分类中的多属性字段</span>
        </dd>
      </dl>
      <dl>
        <dt>开启Tags标签</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="tags" runat="server" />
          </div>
          <span class="Validform_checktip"></span>
        </dd>
      </dl>
      <dl>
        <dt>开启多角色权限</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="rolestatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后客户网站仅有单一管理员</span>
        </dd>
      </dl>
      <dl>
        <dt>开启静态生成</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="htmlstatus" runat="server" />
          </div>
          <span class="Validform_checktip">*关闭后网站以伪URL方式访问</span>
        </dd>
      </dl>
    </div>
    <!--/高级功能设置-->
    <!--工具插件设置-->
    <div class="tab-content" style="display: none">
      <dl>
        <dt>开启数据备份</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="dbback" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启统计代码</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="scriptcode" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启指定SEO</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="pageseo" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启友情链接</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="flink" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启在线留言</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="feedback" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启文件管理</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="filemanage" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启热门搜索</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="hotkey" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启广告管理</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="advert" runat="server" />
          </div>
        </dd>
      </dl>
      <dl>
        <dt>开启在线客服</dt>
        <dd>
          <div class="rule-single-checkbox">
            <asp:CheckBox ID="onlineser" runat="server" />
          </div>
        </dd>
      </dl>
    </div>
    <!--/工具插件设置-->
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
