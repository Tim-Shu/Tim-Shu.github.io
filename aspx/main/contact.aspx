<%@ Page Language="C#" AutoEventWireup="true" Inherits="QJcms.Web.UI.Page.article_list" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="QJcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by QJcms Template Engine at 2019-10-24 13:57:24.
		本页面代码由QJcms模板引擎生成于 2019-10-24 13:57:24. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	const string channel = "danye";

	templateBuilder.Append("<!DOCTYPE HTML>\r\n<html lang=\"zh-CN\">\r\n<head>\r\n    ");

	templateBuilder.Append("<meta charset=\"utf-8\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<meta name=\"format-detection\" content=\"telephone=no\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/css/bootstrap.min.css\">\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/css/swiper.min.css\">\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/css/animate.min.css\">\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/css/style.css\">\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/wow.min.js\"></");
	templateBuilder.Append("script>\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/jquery.min.js\"></");
	templateBuilder.Append("script>\r\n<script language=\"Javascript\">\r\n    document.oncontextmenu = new Function(\"event.returnValue=false\");\r\n    document.onselectstart = new Function(\"event.returnValue=false\");\r\n</");
	templateBuilder.Append("script>\r\n<!--[if IE 9]>\r\n        <script src=\"js/html5shiv.min.js\"></");
	templateBuilder.Append("script>\r\n        <script src=\"js/respond.min.js\"></");
	templateBuilder.Append("script>\r\n        <script>window.location.href='http://sunjinyin.qi-ju.com/update/index.html';</");
	templateBuilder.Append("script>\r\n<![endif]-->\r\n<!--[if lt IE 9]>\r\n        <script src=\"js/html5shiv.min.js\"></");
	templateBuilder.Append("script>\r\n        <script src=\"js/respond.min.js\"></");
	templateBuilder.Append("script>\r\n        <script>window.location.href='http://sunjinyin.qi-ju.com/update/index.html';</");
	templateBuilder.Append("script>\r\n<![endif]-->\r\n<script>\r\n    new WOW().init();\r\n</");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n</head>\r\n<body>\r\n    ");

	templateBuilder.Append("<div class=\"menu-box hidden-md hidden-lg\">\r\n    <ul class=\"list-unstyled no-margin clearfix\">\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("'>网站首页</a>\r\n        </li>\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("about",192));

	templateBuilder.Append("'>公司简介</a>\r\n        </li>\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("product"));

	templateBuilder.Append("'>产品中心</a>\r\n        </li>\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("case"));

	templateBuilder.Append("'>设备展示</a>\r\n        </li>\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("'>新闻资讯</a>\r\n        </li>\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("service"));

	templateBuilder.Append("'>技术资料</a>\r\n        </li>\r\n        <li>\r\n            <a href='");
	templateBuilder.Append(linkurl("contact"));

	templateBuilder.Append("'>联系我们</a>\r\n        </li>\r\n    </ul>\r\n</div>\r\n\r\n<header>\r\n    <div class=\"top_bar hidden-xs hidden-sm\">\r\n        <div class=\"container-fluid\">\r\n            <div class=\"row\">\r\n                <div class=\"col-xs-12 clearfix\">\r\n                    <div class=\"biaoyu pull-left\">欢迎来到");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("官网～</div>\r\n                    <div class=\"tel pull-right\">\r\n                        <div class=\"icon pull-left\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/tel.png\" alt=\"\"></div>\r\n                        <div class=\"text pull-left text-uppercase\">Service Hotline:");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("</div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"qita\">\r\n        <div class=\"container-fluid\">\r\n            <div class=\"row\">\r\n                <div class=\"col-xs-12 clearfix\">\r\n                    <div class=\"logo pull-left\">\r\n                        <a href=\"/\">\r\n                            <img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/logo.png\" alt=\"\">\r\n                        </a>\r\n                    </div>\r\n                    <div class=\"fenxiang pull-right hidden-xs hidden-sm\">\r\n                        <div class=\"icon\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/weixin.png\" alt=\"\"></div>\r\n                        <div class=\"imgbox tr\">\r\n                            <span><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webewm1));
	templateBuilder.Append("\" alt=\"\"></span>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"menu pull-right hidden-xs hidden-sm\">\r\n                        <ul class=\"list-unstyled no-margin clearfix\">\r\n                            <li class=\"pull-left\"><a href='");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("' class=\"tr\">网站首页</a></li>\r\n                            <li class=\"pull-left\">\r\n                                <a href='");
	templateBuilder.Append(linkurl("about",192));

	templateBuilder.Append("' class=\"tr\">公司简介</a>\r\n                                <div class=\"xiala tr2\">\r\n                                    <div class=\"ul\">\r\n                                        ");
	DataTable abt_list = get_article_list("about",0,"");

	int abt_adder__loop__id=0;
	foreach(DataRow abt_adder in abt_list.Rows)
	{
		abt_adder__loop__id++;


	templateBuilder.Append("\r\n                                        <div class=\"li\"><a href='");
	templateBuilder.Append(linkurl("about",Utils.ObjectToStr(abt_adder["id"])));

	templateBuilder.Append("' class=\"tr\">" + Utils.ObjectToStr(abt_adder["title"]) + "</a></div>\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </div>\r\n                                </div>\r\n                            </li>\r\n                            <li class=\"pull-left\">\r\n                                <a href='");
	templateBuilder.Append(linkurl("product"));

	templateBuilder.Append("' class=\"tr\">产品中心</a>\r\n                                <div class=\"xiala tr2\">\r\n                                    <div class=\"ul\">\r\n                                        ");
	DataTable pi_list = get_category_list("product",0);

	int pi_adder__loop__id=0;
	foreach(DataRow pi_adder in pi_list.Rows)
	{
		pi_adder__loop__id++;


	templateBuilder.Append("\r\n                                        <div class=\"li\"><a href='");
	templateBuilder.Append(linkurl("product_lb",Utils.ObjectToStr(pi_adder["id"])));

	templateBuilder.Append("' class=\"tr\">" + Utils.ObjectToStr(pi_adder["title"]) + "</a></div>\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </div>\r\n                                </div>\r\n                            </li>\r\n                            <li class=\"pull-left\">\r\n                                <a href='");
	templateBuilder.Append(linkurl("case"));

	templateBuilder.Append("' class=\"tr\">设备展示</a>\r\n                                <div class=\"xiala tr2\">\r\n                                    <div class=\"ul\">\r\n                                        ");
	DataTable ci_list = get_category_list("case",0);

	int ci_adder__loop__id=0;
	foreach(DataRow ci_adder in ci_list.Rows)
	{
		ci_adder__loop__id++;


	templateBuilder.Append("\r\n                                        <div class=\"li\"><a href='");
	templateBuilder.Append(linkurl("case_lb",Utils.ObjectToStr(ci_adder["id"])));

	templateBuilder.Append("' class=\"tr\">" + Utils.ObjectToStr(ci_adder["title"]) + "</a></div>\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </div>\r\n                                </div>\r\n                            </li>\r\n                            <li class=\"pull-left\">\r\n                                <a href='");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("' class=\"tr\">新闻资讯</a>\r\n                                <div class=\"xiala tr2\">\r\n                                    <div class=\"ul\">\r\n                                        ");
	DataTable ni_list = get_category_list("news",0);

	int ni_adder__loop__id=0;
	foreach(DataRow ni_adder in ni_list.Rows)
	{
		ni_adder__loop__id++;


	templateBuilder.Append("\r\n                                        <div class=\"li\"><a href='");
	templateBuilder.Append(linkurl("news_lb",Utils.ObjectToStr(ni_adder["id"])));

	templateBuilder.Append("' class=\"tr\">" + Utils.ObjectToStr(ni_adder["title"]) + "</a></div>\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </div>\r\n                                </div>\r\n                            </li>\r\n                            <li class=\"pull-left\"><a href='");
	templateBuilder.Append(linkurl("service"));

	templateBuilder.Append("' class=\"tr\">技术资料</a></li>\r\n                            <li class=\"pull-left\"><a href='");
	templateBuilder.Append(linkurl("contact"));

	templateBuilder.Append("' class=\"tr\">联系我们</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"menu-btn pull-right hidden-md hidden-lg\">\r\n                        <b class=\"tr\"></b>\r\n                        <b class=\"tr\"></b>\r\n                        <b class=\"tr\"></b>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</header>\r\n\r\n<div class=\"banner wow animate fadeIn\">\r\n    <div class=\"swiper-container\">\r\n        <div class=\"swiper-wrapper\">\r\n            <div class=\"swiper-slide\">\r\n                <a href=\"#\">\r\n                    <img class=\"hidden-xs hidden-sm\" src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/1.jpg\" alt=\"\">\r\n                    <img class=\"hidden-md hidden-lg\" src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/11.jpg\" alt=\"\">\r\n                </a>\r\n            </div>\r\n            <div class=\"swiper-slide\">\r\n                <a href=\"#\">\r\n                    <img class=\"hidden-xs hidden-sm\" src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/2.jpg\" alt=\"\">\r\n                    <img class=\"hidden-md hidden-lg\" src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/22.jpg\" alt=\"\">\r\n                </a>\r\n            </div>\r\n            <div class=\"swiper-slide\">\r\n                <a href=\"#\">\r\n                    <img class=\"hidden-xs hidden-sm\" src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/3.jpg\" alt=\"\">\r\n                    <img class=\"hidden-md hidden-lg\" src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/33.jpg\" alt=\"\">\r\n                </a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"swiper-pagination\"></div>\r\n</div>");


	templateBuilder.Append("\r\n\r\n    <div class=\"content\">\r\n        <div class=\"main-pad-7\">\r\n            <div class=\"main-pad-8\">\r\n                <div class=\"container-fluid\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-3\">\r\n                            <div class=\"subnav\">\r\n                                <div class=\"biaoti\"><span>联系我们</span></div>\r\n                                <ul class=\"list-unstyled clearfix\">\r\n                                    <li class=\"active\"><a href=\"#\" class=\"tr overflow\">联系我们</a></li>\r\n\r\n                                </ul>\r\n                                ");

	templateBuilder.Append("<div class=\"hidden-xs hidden-sm\">\r\n    <div class=\"biaoti\"><span>联系我们</span></div>\r\n    <div class=\"imgbox wow animate fadeIn\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/subnav_img.jpg\" alt=\"\"></div>\r\n    <div class=\"textbox\">\r\n        ");
	templateBuilder.Append(get_article_content("contact").ToString());

	templateBuilder.Append("\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n                            </div>\r\n                        </div>\r\n                        <div class=\"col-md-9\">\r\n                            <div class=\"title-5 clearfix hidden-xs hidden-sm\">\r\n                                <div class=\"biaoti pull-left\">联系我们</div>\r\n                            </div>\r\n                            <div class=\"text-5\">\r\n                                ");
	templateBuilder.Append(get_article_content("contact").ToString());

	templateBuilder.Append("\r\n                            </div>\r\n                            <div class=\"picture-8\">\r\n                                <div class=\"map sizeCover\">\r\n                                    ");

	templateBuilder.Append("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n    <style type=\"text/css\">\r\n        /*清除样式*/\r\n\r\n.clear \r\n{\r\n     clear:both;\r\n\r\n}\r\n        html, body {\r\n            margin: 0;\r\n            padding: 0;\r\n        }\r\n\r\n        .iw_poi_title {\r\n            color: #CC5522;\r\n            font-size: 14px;\r\n            font-weight: bold;\r\n            overflow: hidden;\r\n            padding-right: 13px;\r\n            white-space: nowrap;\r\n        }\r\n\r\n        .iw_poi_content {\r\n            font: 12px arial,sans-serif;\r\n            overflow: visible;\r\n            padding-top: 4px;\r\n            white-space: -moz-pre-wrap;\r\n            word-wrap: break-word;\r\n        }\r\n    </style>\r\n    <script type=\"text/javascript\" src=\"http://api.map.baidu.com/api?key=&v=1.1&services=true\"></");
	templateBuilder.Append("script>\r\n</head>\r\n<body>\r\n    <div style=\"width:100%;height:320px;border:#ccc solid 1px;\" id=\"dituContent\"></div>\r\n</body>\r\n</html>\r\n<script type=\"text/javascript\">\r\n    //创建和初始化地图函数：\r\n    function initMap(){\r\n        createMap();//创建地图\r\n        setMapEvent();//设置地图事件\r\n        addMapControl();//向地图添加控件\r\n        addMarker();//向地图中添加marker\r\n    }\r\n\r\n    //创建地图函数：\r\n    function createMap(){\r\n        var map = new BMap.Map(\"dituContent\");//在百度地图容器中创建一个地图\r\n        var point = new BMap.Point(");
	templateBuilder.Append(Utils.ObjectToStr(config.webqq2));
	templateBuilder.Append(", ");
	templateBuilder.Append(Utils.ObjectToStr(config.webfax));
	templateBuilder.Append(");//定义一个中心点坐标\r\n        map.centerAndZoom(point,17);//设定地图的中心点和坐标并将地图显示在地图容器中\r\n        window.map = map;//将map变量存储在全局\r\n    }\r\n\r\n    //地图事件设置函数：\r\n    function setMapEvent(){\r\n        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)\r\n        map.enableScrollWheelZoom();//启用地图滚轮放大缩小\r\n        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)\r\n        map.enableKeyboard();//启用键盘上下左右键移动地图\r\n    }\r\n\r\n    //地图控件添加函数：\r\n    function addMapControl(){\r\n        //向地图中添加缩放控件\r\n	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});\r\n	map.addControl(ctrl_nav);\r\n        //向地图中添加缩略图控件\r\n	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});\r\n	map.addControl(ctrl_ove);\r\n        //向地图中添加比例尺控件\r\n	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});\r\n	map.addControl(ctrl_sca);\r\n    }\r\n    //标注点数组\r\n    var markerArr = [{ title: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append(" \", content: \"电话:");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("\", point: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webqq2));
	templateBuilder.Append("|");
	templateBuilder.Append(Utils.ObjectToStr(config.webfax));
	templateBuilder.Append("\", isOpen: 1, icon: { w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12 } }\r\n    ];\r\n    //创建marker\r\n    function addMarker() {\r\n        for (var i = 0; i < markerArr.length; i++) {\r\n            var json = markerArr[i];\r\n            var p0 = json.point.split(\"|\")[0];\r\n            var p1 = json.point.split(\"|\")[1];\r\n            var point = new BMap.Point(p0, p1);\r\n            var iconImg = createIcon(json.icon);\r\n            var marker = new BMap.Marker(point, { icon: iconImg });\r\n            var iw = createInfoWindow(i);\r\n            var label = new BMap.Label(json.title, { \"offset\": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });\r\n            marker.setLabel(label);\r\n            map.addOverlay(marker);\r\n            label.setStyle({\r\n                borderColor: \"#808080\",\r\n                color: \"#333\",\r\n                cursor: \"pointer\"\r\n            });\r\n\r\n            (function () {\r\n                var index = i;\r\n                var _iw = createInfoWindow(i);\r\n                var _marker = marker;\r\n                _marker.addEventListener(\"click\", function () {\r\n                    this.openInfoWindow(_iw);\r\n                });\r\n                _iw.addEventListener(\"open\", function () {\r\n                    _marker.getLabel().hide();\r\n                })\r\n                _iw.addEventListener(\"close\", function () {\r\n                    _marker.getLabel().show();\r\n                })\r\n                label.addEventListener(\"click\", function () {\r\n                    _marker.openInfoWindow(_iw);\r\n                })\r\n                if (!!json.isOpen) {\r\n                    label.hide();\r\n                    _marker.openInfoWindow(_iw);\r\n                }\r\n            })()\r\n        }\r\n    }\r\n    //创建InfoWindow\r\n    function createInfoWindow(i) {\r\n        var json = markerArr[i];\r\n        var iw = new BMap.InfoWindow(\"<b class='iw_poi_title' title='\" + json.title + \"'>\" + json.title + \"</b><div class='iw_poi_content'>\" + json.content + \"</div>\" + \"<div class='iw_poi_content'>地址:");
	templateBuilder.Append(Utils.ObjectToStr(config.webaddress));
	templateBuilder.Append("</div>\");\r\n        return iw;\r\n    }\r\n    //创建一个Icon\r\n    function createIcon(json) {\r\n        var icon = new BMap.Icon(\"http://app.baidu.com/map/images/us_mk_icon.png\", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })\r\n        return icon;\r\n    }\r\n\r\n    initMap();//创建和初始化地图\r\n</");
	templateBuilder.Append("script>\r\n");


	templateBuilder.Append("\r\n                                </div>\r\n                            </div>\r\n                            ");

	templateBuilder.Append("<div class=\"main-pad-1\">\r\n    <div class=\"title-6\">\r\n        <div class=\"jiangexian\"></div>\r\n        <div class=\"en text-uppercase\">Recommended reading</div>\r\n        <div class=\"cn\">推荐阅读</div>\r\n    </div>\r\n    <div class=\"main-pad-3\">\r\n        <div class=\"picture-7\">\r\n            <div class=\"swiper-container\">\r\n                <div class=\"swiper-wrapper\">\r\n                    ");
	DataTable news_list=get_article_list("news",4,"status = 0 and is_red=1");

	int news_adder__loop__id=0;
	foreach(DataRow news_adder in news_list.Rows)
	{
		news_adder__loop__id++;


	templateBuilder.Append("\r\n                    <div class=\"swiper-slide\">\r\n                        <div class=\"picture-7-list\">\r\n                            <a href='");
	templateBuilder.Append(linkurl("news-show",Utils.ObjectToStr(news_adder["id"])));

	templateBuilder.Append("' class=\"clearfix\">\r\n                                <div class=\"imgbox pull-left wow animate fadeIn\">\r\n                                    <span class=\"tr3 sizeCover\" style=\"background-image: url(" + Utils.ObjectToStr(news_adder["img_url"]) + ")\"></span>\r\n                                </div>\r\n                                <div class=\"textbox pull-left tr\">\r\n                                    <div class=\"biaoti clearfix\">\r\n                                        <div class=\"mc pull-left tr overflow\">" + Utils.ObjectToStr(news_adder["title"]) + "</div>\r\n                                        <div class=\"time tr pull-right text-right\">");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(news_adder["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</div>\r\n                                    </div>\r\n                                    <div class=\"jieshao tr\">\r\n                                        " + Utils.ObjectToStr(news_adder["zhaiyao"]) + "\r\n                                    </div>\r\n                                </div>\r\n                            </a>\r\n                        </div>\r\n                    </div>\r\n                    ");
	}	//end for if

	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n            <div class=\"swiper-pagination\"></div>\r\n        </div>\r\n    </div>\r\n</div>");


	templateBuilder.Append("\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n    </div>\r\n\r\n    ");

	templateBuilder.Append("<footer>\r\n    <div class=\"top\">\r\n        <div class=\"container-fluid\">\r\n            <div class=\"row\">\r\n                <div class=\"col-xs-12\">\r\n                    <div class=\"biaoti clearfix\">\r\n                        <div class=\"cn pull-left\">联系我们</div>\r\n                        <div class=\"xiexian pull-left\">/</div>\r\n                        <div class=\"en pull-left\">Contact us</div>\r\n                    </div>\r\n                    <div class=\"clearfix\">\r\n                        <div class=\"contact pull-left\">\r\n                            <div class=\"imgbox pull-left wow animate fadeIn\">\r\n                                <span class=\"sizeCover\" style=\"background-image: url(");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/footer_contact_img.jpg)\"></span>\r\n                            </div>\r\n                            <div class=\"textbox pull-left\">\r\n                                <ul class=\"list-unstyled no-margin clearfix\">\r\n\r\n                                    <li class=\"clearfix\">\r\n                                        <div class=\"icon pull-left\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/footer_contact_dianhua.png\" alt=\"\"></div>\r\n                                        <div class=\"mc pull-left\">电   话：");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("</div>\r\n                                    </li>\r\n                                    <li class=\"clearfix\">\r\n                                        <div class=\"icon pull-left\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/footer_contact_chuanzhen.png\" alt=\"\"></div>\r\n                                        <div class=\"mc pull-left\">传　 真：");
	templateBuilder.Append(Utils.ObjectToStr(config.webcompany));
	templateBuilder.Append("</div>\r\n                                    </li>\r\n                                    <li class=\"clearfix\">\r\n                                        <div class=\"icon pull-left\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/footer_contact_youxiang.png\" alt=\"\"></div>\r\n                                        <div class=\"mc pull-left\">邮   箱：");
	templateBuilder.Append(Utils.ObjectToStr(config.webmail));
	templateBuilder.Append("</div>\r\n                                    </li>\r\n                                    <li class=\"clearfix\">\r\n                                        <div class=\"icon pull-left\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/footer_contact_dizhi.png\" alt=\"\"></div>\r\n                                        <div class=\"mc pull-left\">地   址：");
	templateBuilder.Append(Utils.ObjectToStr(config.webaddress));
	templateBuilder.Append("</div>\r\n                                    </li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                        <div class=\"map pull-right\">\r\n                            <div class=\"imgbox sizeCover\">\r\n                                ");
	templateBuilder.Append(get_article_content("ilxwm").ToString());

	templateBuilder.Append("\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"center text-center\">\r\n        <div class=\"container-fluid\">\r\n            <div class=\"row\">\r\n                <div class=\"col-xs-12\">\r\n                    <div class=\"menu\">\r\n                        <ul class=\"list-unstyled no-margin clearfix\">\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("' class=\"tr\">网站首页</a></li>\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("about",192));

	templateBuilder.Append("' class=\"tr\">公司简介</a></li>\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("product"));

	templateBuilder.Append("' class=\"tr\">产品中心</a></li>\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("case"));

	templateBuilder.Append("' class=\"tr\">设备展示</a></li>\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("' class=\"tr\">新闻资讯</a></li>\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("service"));

	templateBuilder.Append("' class=\"tr\">技术资料</a></li>\r\n                            <li><a href='");
	templateBuilder.Append(linkurl("contact"));

	templateBuilder.Append("' class=\"tr\">联系我们</a></li>\r\n                        </ul>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"bot text-center\">\r\n        <div class=\"container-fluid\">\r\n            <div class=\"row\">\r\n                <div class=\"col-xs-12\">\r\n                    版权所有 © 2019  ");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("  <a href=\"http://www.miitbeian.gov.cn\" target=\"_blank\" style=\"color:white\">");
	templateBuilder.Append(Utils.ObjectToStr(config.webcrod));
	templateBuilder.Append("</a>  all rights reserved.\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</footer>\r\n\r\n<div class=\"tabBar visible-xs\">\r\n    <ul class=\"list-unstyled text-center no-margin clearfix\">\r\n        <li class=\"pull-left\">\r\n            <a href=\"tel:");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("\">\r\n                <div class=\"icon\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/tabBar_dianhua.png\" alt=\"\"></div>\r\n                <div class=\"mc\">电话</div>\r\n            </a>\r\n        </li>\r\n        <li class=\"pull-left\">\r\n            <a href=\"sms:");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("\">\r\n                <div class=\"icon\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/tabBar_duanxin.png\" alt=\"\"></div>\r\n                <div class=\"mc\">短信</div>\r\n            </a>\r\n        </li>\r\n        <li class=\"pull-left\">\r\n            <a>\r\n                <div class=\"icon\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/tabBar_erweima.png\" alt=\"\"></div>\r\n                <div class=\"mc\">微信</div>\r\n            </a>\r\n            <div class=\"tanchuang\">\r\n                <div class=\"imgbox\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webewm1));
	templateBuilder.Append("\" alt=\"\"></div>\r\n            </div>\r\n        </li>\r\n    </ul>\r\n</div>\r\n\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/bootstrap.js\"></");
	templateBuilder.Append("script>\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/ie10-viewport-bug-workaround.js\"></");
	templateBuilder.Append("script>\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/swiper.min.js\"></");
	templateBuilder.Append("script>\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/style.js\"></");
	templateBuilder.Append("script>\r\n\r\n\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/subnav.js\"></");
	templateBuilder.Append("script>\r\n<script src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/js/tuijian.js\"></");
	templateBuilder.Append("script>\r\n\r\n<div class=\"yb_conct hidden-xs\">\r\n    <div class=\"yb_bar\">\r\n        <ul>\r\n            <li class=\"yb_top\">返回顶部</li>\r\n            <li class=\"yb_phone\">");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("</li>\r\n            <li class=\"yb_QQ\">\r\n                <a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=");
	templateBuilder.Append(Utils.ObjectToStr(config.webqq1));
	templateBuilder.Append("&amp;site=qq&amp;menu=yes&amp;from=message&amp;isappinstalled=0\" title=\"即刻发送您的需求\">在线咨询</a>\r\n            </li>\r\n            <li class=\"yb_ercode\" style=\"height:53px;\">\r\n                微信二维码 <br>\r\n                <img class=\"hd_qr\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webewm1));
	templateBuilder.Append("\" alt=\"关注你附近\" width=\"200\">\r\n            </li>\r\n        </ul>\r\n    </div>\r\n</div>\r\n<script>\r\n    $(function () {\r\n        // 悬浮窗口\r\n        $(\".yb_conct\").hover(function () {\r\n            $(\".yb_conct\").css(\"right\", \"5px\");\r\n            $(\".yb_bar .yb_ercode\").css('height', '200px');\r\n        }, function () {\r\n            $(\".yb_conct\").css(\"right\", \"-127px\");\r\n            $(\".yb_bar .yb_ercode\").css('height', '53px');\r\n        });\r\n        // 返回顶部\r\n        $(\".yb_top\").click(function () {\r\n            $(\"html,body\").animate({\r\n                'scrollTop': '0px'\r\n            }, 300)\r\n        });\r\n    });\r\n</");
	templateBuilder.Append("script>\r\n<script>\r\n    (function () {\r\n        var bp = document.createElement('script');\r\n        var curProtocol = window.location.protocol.split(':')[0];\r\n        if (curProtocol === 'https') {\r\n            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';\r\n        }\r\n        else {\r\n            bp.src = 'http://push.zhanzhang.baidu.com/push.js';\r\n        }\r\n        var s = document.getElementsByTagName(\"script\")[0];\r\n        s.parentNode.insertBefore(bp, s);\r\n    })();\r\n</");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
