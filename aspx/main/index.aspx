<%@ Page Language="C#" AutoEventWireup="true" Inherits="QJcms.Web.UI.Page.index" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="QJcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by QJcms Template Engine at 2019-10-24 13:57:23.
		本页面代码由QJcms模板引擎生成于 2019-10-24 13:57:23. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

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


	templateBuilder.Append("\r\n\r\n    <div class=\"content\">\r\n        <!-- 产品中心 -->\r\n        <div class=\"main-pad-1\">\r\n            <div class=\"main-pad-2\">\r\n                <div class=\"container-fluid\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-xs-12\">\r\n                            <div class=\"title-1 text-center wow animate fadeInUp\">\r\n                                <div class=\"cn\">产品中心</div>\r\n                                <div class=\"jiangexian\"></div>\r\n                                <div class=\"en text-uppercase\">product</div>\r\n                                <div class=\"jieshao\">矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、销售.</div>\r\n                            </div>\r\n                            <div class=\"main-pad-3\">\r\n                                <div class=\"title-2 wow animate fadeInUp\">\r\n                                    <ul class=\"list-unstyled clearfix\">\r\n                                        ");
	DataTable pr_list = get_category_list("product",0);

	int pr_adder__loop__id=0;
	foreach(DataRow pr_adder in pr_list.Rows)
	{
		pr_adder__loop__id++;


	templateBuilder.Append("\r\n                                        <li class=\"pull-left ");
	if (pr_adder__loop__id==1)
	{

	templateBuilder.Append("active");
	}	//end for if

	templateBuilder.Append("\"><a class=\"tr text-center\"><span>" + Utils.ObjectToStr(pr_adder["title"]) + "</span></a></li>\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </ul>\r\n                                </div>\r\n                            </div>\r\n                            <div class=\"main-pad-3\">\r\n                                <div class=\"title-2-nr-box wow animate fadeInUp\">\r\n                                    <!-- 各类橡胶密封件 -->\r\n                                    ");
	int pr_adder2__loop__id=0;
	foreach(DataRow pr_adder2 in pr_list.Rows)
	{
		pr_adder2__loop__id++;


	templateBuilder.Append("\r\n                                    <div class=\"title-2-nr\">\r\n                                        <div class=\"picture-1\">\r\n                                            <div class=\"swiper-container\">\r\n                                                <div class=\"swiper-wrapper\">\r\n                                                    ");
	DataTable pr1_list = get_article_list("product",Utils.StrToInt(Utils.ObjectToStr(pr_adder2["id"]), 0),8,"");

	int pr1_adder__loop__id=0;
	foreach(DataRow pr1_adder in pr1_list.Rows)
	{
		pr1_adder__loop__id++;


	templateBuilder.Append("\r\n                                                    <div class=\"swiper-slide\">\r\n                                                        <div class=\"picture-1-list\">\r\n                                                            <a href='");
	templateBuilder.Append(linkurl("product-show",Utils.ObjectToStr(pr1_adder["id"])));

	templateBuilder.Append("'>\r\n                                                                <div class=\"imgbox\">\r\n                                                                    <span class=\"tr3 sizeCover\" style=\"background-image: url(" + Utils.ObjectToStr(pr1_adder["img_url"]) + ")\"></span>\r\n                                                                </div>\r\n                                                                <div class=\"textbox tr text-center overflow\">" + Utils.ObjectToStr(pr1_adder["title"]) + "</div>\r\n                                                            </a>\r\n                                                        </div>\r\n                                                    </div>\r\n                                                    ");
	}	//end for if

	templateBuilder.Append("\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div class=\"main-pad-3\">\r\n                                            <div class=\"more-1\">\r\n                                                <a href='");
	templateBuilder.Append(linkurl("product"));

	templateBuilder.Append("' class=\"text-center text-uppercase\">\r\n                                                    <span>see more</span>\r\n                                                </a>\r\n                                            </div>\r\n                                        </div>\r\n                                    </div>\r\n                                    ");
	}	//end for if

	templateBuilder.Append("\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- 优势 01 02-->\r\n        <div class=\"main-pad-2\" style=\"overflow: hidden;\">\r\n            <div class=\"container-fluid\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-xs-12\">\r\n                        <div class=\"title-3 text-center\">\r\n                            <b class=\"wow animate fadeIn\" style=\"animation-delay: 0.5s;\"></b>\r\n                            <b class=\"wow animate fadeIn\" style=\"animation-delay: 0.5s;\"></b>\r\n                            <b class=\"wow animate fadeIn\" style=\"animation-delay: 0.5s;\"></b>\r\n                            <b class=\"wow animate fadeIn\" style=\"animation-delay: 0.5s;\"></b>\r\n                            <b class=\"wow animate fadeIn\" style=\"animation-delay: 0.5s;\"></b>\r\n                            <div class=\"box\">\r\n                                <div class=\"maxbiaoti wow animate fadeInLeftBig\">选择</div>\r\n                                <div class=\"textbox wow animate fadeInRightBig\">\r\n                                    <div class=\"biaoti\">上海矽克密封科技有限公司</div>\r\n                                    <div class=\"jieshao\">以诚信的态度，做立世的企业</div>\r\n                                    <div class=\"tel\">\r\n                                        <div class=\"icon\"><img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/tel2.png\" alt=\"\"></div>\r\n                                        <div class=\"mc\">24小时服务热线：180-18851256</div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                        <div class=\"main-pad-4\">\r\n                            <div class=\"clearfix\">\r\n                                <div class=\"picture-2 wow animate fadeInRightBig\">\r\n                                    <div class=\"imgbox sizeCover\" style=\"background-image: url(");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/p2_img.jpg)\"></div>\r\n                                </div>\r\n                                <div class=\"text-1\">\r\n                                    <ul class=\"list-unstyled no-margin\">\r\n                                        <li class=\"wow animate fadeInUp\">\r\n                                            <div class=\"biaoti clearfix\">\r\n                                                <div class=\"maxshuzi pull-left\" data-title=\"01\">01</div>\r\n                                                <div class=\"text pull-left\">\r\n                                                    <div class=\"cn\">制造优势</div>\r\n                                                    <div class=\"en text-uppercase\">Manufacturing advantage</div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div class=\"jieshao\">\r\n                                                矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、\r\n                                                销售及提供客户服务.\r\n                                            </div>\r\n                                        </li>\r\n                                        <li class=\"wow animate fadeInUp\">\r\n                                            <div class=\"biaoti clearfix\">\r\n                                                <div class=\"maxshuzi pull-left\" data-title=\"02\">02</div>\r\n                                                <div class=\"text pull-left\">\r\n                                                    <div class=\"cn\">经验优势</div>\r\n                                                    <div class=\"en text-uppercase\">Empirical advantage</div>\r\n                                                </div>\r\n                                            </div>\r\n                                            <div class=\"jieshao\">\r\n                                                矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、\r\n                                                销售及提供客户服务.\r\n                                            </div>\r\n                                        </li>\r\n                                    </ul>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- 优势 03 04-->\r\n        <div class=\"main-pad-1 main-background-2 wow animate fadeInUp\">\r\n            <div class=\"main-pad-2\">\r\n                <div class=\"container-fluid\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-6 col-md-offset-6\">\r\n                            <div class=\"text-1 active\">\r\n                                <ul class=\"list-unstyled no-margin\">\r\n                                    <li class=\"wow animate fadeInUp\">\r\n                                        <div class=\"biaoti clearfix\">\r\n                                            <div class=\"maxshuzi pull-left\" data-title=\"03\">03</div>\r\n                                            <div class=\"text pull-left\">\r\n                                                <div class=\"cn\">管理优势</div>\r\n                                                <div class=\"en text-uppercase\">Manufacturing advantage</div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div class=\"jieshao\">\r\n                                            矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、\r\n                                            销售及提供客户服务.\r\n                                        </div>\r\n                                    </li>\r\n                                    <li class=\"wow animate fadeInUp\">\r\n                                        <div class=\"biaoti clearfix\">\r\n                                            <div class=\"maxshuzi pull-left\" data-title=\"04\">04</div>\r\n                                            <div class=\"text pull-left\">\r\n                                                <div class=\"cn\">服务优势</div>\r\n                                                <div class=\"en text-uppercase\">Empirical advantage</div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div class=\"jieshao\">\r\n                                            矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、\r\n                                            销售及提供客户服务.\r\n                                        </div>\r\n                                    </li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- 公司简介 -->\r\n        <div class=\"main-pad-1\">\r\n            <div class=\"main-pad-2\">\r\n                <div class=\"container-fluid\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-xs-12\">\r\n                            <div class=\"title-1 text-center wow animate fadeInUp\">\r\n                                <div class=\"cn\">公司简介</div>\r\n                                <div class=\"jiangexian\"></div>\r\n                                <div class=\"en text-uppercase\">about us</div>\r\n                                <div class=\"jieshao\">矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、销售.</div>\r\n                            </div>\r\n                            <div class=\"main-pad-3\">\r\n                                <div class=\"clearfix\">\r\n                                    <div class=\"picture-3 wow animate fadeInLeftBig\">\r\n                                        <div class=\"imgbox sizeCover\" style=\"background-image: url(");
	templateBuilder.Append(get_article_img_url(196).ToString());

	templateBuilder.Append(")\"></div>\r\n                                    </div>\r\n                                    <div class=\"picture-4 wow animate fadeInRightBig\">\r\n                                        <div class=\"top\">\r\n                                            <ul class=\"list-unstyled clearfix\">\r\n                                                <li class=\"pull-left\">\r\n                                                    <div class=\"imgbox\">\r\n                                                        <span class=\"tr3 sizeCover\" style=\"background-image: url(");
	templateBuilder.Append(get_article_img_url(6).ToString());

	templateBuilder.Append(")\"></span>\r\n                                                    </div>\r\n                                                </li>\r\n                                                <li class=\"pull-left\">\r\n                                                    <div class=\"imgbox\">\r\n                                                        <span class=\"tr3 sizeCover\" style=\"background-image: url(");
	templateBuilder.Append(get_article_img_url(192).ToString());

	templateBuilder.Append(")\"></span>\r\n                                                    </div>\r\n                                                </li>\r\n                                            </ul>\r\n                                        </div>\r\n                                        <div class=\"jieshao\">\r\n                                            ");
	templateBuilder.Append(get_article_content("iabout").ToString());

	templateBuilder.Append("\r\n                                        </div>\r\n                                        <div class=\"menu\">\r\n                                            <ul class=\"list-unstyled clearfix\">\r\n                                                ");
	DataTable list_ab = get_article_list("about",0,"");

	int adder_ab__loop__id=0;
	foreach(DataRow adder_ab in list_ab.Rows)
	{
		adder_ab__loop__id++;


	templateBuilder.Append("\r\n                                                <li class=\"pull-left ");
	if (adder_ab__loop__id==1)
	{

	templateBuilder.Append("active");
	}	//end for if

	templateBuilder.Append("\">\r\n                                                    <a href='");
	templateBuilder.Append(linkurl("about",Utils.ObjectToStr(adder_ab["id"])));

	templateBuilder.Append("' class=\"text-center tr\"><span>" + Utils.ObjectToStr(adder_ab["title"]) + "</span></a>\r\n                                                </li>\r\n                                                ");
	                                                if(adder_ab__loop__id>2) break;
	                                                

	}	//end for if

	templateBuilder.Append("\r\n                                            </ul>\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- 新闻资讯 -->\r\n        <div class=\"main-pad-2\">\r\n            <div class=\"container-fluid\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-xs-12\">\r\n                        <div class=\"title-1 text-center wow animate fadeInUp\">\r\n                            <div class=\"cn\">新闻资讯</div>\r\n                            <div class=\"jiangexian\"></div>\r\n                            <div class=\"en text-uppercase\">news</div>\r\n                            <div class=\"jieshao\">矽克专心致力于精密橡胶密封件、硅胶橡胶表带及精密橡胶制品的研发、制造、销售.</div>\r\n                        </div>\r\n                        <div class=\"main-pad-3\">\r\n                            <div class=\"clearfix\">\r\n                                <div class=\"picture-5 text-right wow animate fadeInRightBig\">\r\n                                    <img src=\"");
	templateBuilder.Append("/templates/demo");
	templateBuilder.Append("/images/p5_img.png\" alt=\"\">\r\n                                </div>\r\n                                <div class=\"text-2 wow animate fadeInLeftBig\">\r\n                                    <div class=\"menu\">\r\n                                        <ul class=\"list-unstyled clearfix\">\r\n                                            ");
	DataTable ne_list = get_category_list("news",0);

	int ne_adder__loop__id=0;
	foreach(DataRow ne_adder in ne_list.Rows)
	{
		ne_adder__loop__id++;


	templateBuilder.Append("\r\n                                            <li class=\"pull-left ");
	if (ne_adder__loop__id==1)
	{

	templateBuilder.Append("active");
	}	//end for if

	templateBuilder.Append("\"><a class=\"tr\"><span>" + Utils.ObjectToStr(ne_adder["title"]) + "</span></a></li>\r\n                                            ");
	}	//end for if

	templateBuilder.Append("\r\n                                        </ul>\r\n                                    </div>\r\n                                    <div class=\"textbox\">\r\n                                        <!-- 公司新闻 -->\r\n                                        ");
	int ne_adder2__loop__id=0;
	foreach(DataRow ne_adder2 in ne_list.Rows)
	{
		ne_adder2__loop__id++;


	templateBuilder.Append("\r\n                                        <ul class=\"list-unstyled no-margin ");
	if (ne_adder2__loop__id==1)
	{

	templateBuilder.Append("active");
	}	//end for if

	templateBuilder.Append("\">\r\n                                            ");
	DataTable ne1_list = get_article_list("news",Utils.StrToInt(Utils.ObjectToStr(ne_adder2["id"]), 0),4,"");

	int ne1_adder__loop__id=0;
	foreach(DataRow ne1_adder in ne1_list.Rows)
	{
		ne1_adder__loop__id++;


	templateBuilder.Append("\r\n                                            <li><a href='");
	templateBuilder.Append(linkurl("news-show",Utils.ObjectToStr(ne1_adder["id"])));

	templateBuilder.Append("' class=\"overflow\">" + Utils.ObjectToStr(ne1_adder["title"]) + "</a></li>\r\n                                            ");
	}	//end for if

	templateBuilder.Append("\r\n                                        </ul>\r\n                                        ");
	}	//end for if

	templateBuilder.Append("\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                            <div class=\"main-pad-3 wow animate fadeInUp\">\r\n                                <div class=\"text-2-more\">\r\n                                    <!-- 公司新闻的查看更多 -->\r\n                                    <div class=\"more-1\">\r\n                                        <a href='");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("' class=\"text-center text-uppercase\">\r\n                                            <span>see more</span>\r\n                                        </a>\r\n                                    </div>\r\n                                    <!-- 行业资讯的查看更多 -->\r\n                                    <div class=\"more-1\">\r\n                                        <a href='");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("' class=\"text-center text-uppercase\">\r\n                                            <span>see more</span>\r\n                                        </a>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"main-pad-5 main-background-1\">\r\n            <div class=\"main-pad-6\">\r\n                <div class=\"container-fluid\">\r\n                    <div class=\"row\">\r\n                        <div class=\"col-xs-12\">\r\n                            <div class=\"title-4 wow animate fadeInUp\">\r\n                                <div class=\"clearfix\">\r\n                                    <div class=\"left pull-left\">\r\n                                        <div class=\"cn pull-left\">设备展示</div>\r\n                                        <div class=\"en pull-left text-uppercase\">device</div>\r\n                                    </div>\r\n                                    <div class=\"right pull-right\">\r\n                                        <a class=\"tr pull-left\"><</a>\r\n                                        <a class=\"tr pull-left\">></a>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                            <div class=\"main-pad-5\">\r\n                                <div class=\"picture-6 wow animate fadeInUp\">\r\n                                    <div class=\"swiper-container\">\r\n                                        <div class=\"swiper-wrapper\">\r\n                                            ");
	DataTable ca_list=get_article_list("case",12,"status = 0 and is_red=1");

	int ca_adder__loop__id=0;
	foreach(DataRow ca_adder in ca_list.Rows)
	{
		ca_adder__loop__id++;


	templateBuilder.Append("\r\n                                            <div class=\"swiper-slide\">\r\n                                                <div class=\"picture-6-list\">\r\n                                                    <a href='");
	templateBuilder.Append(linkurl("case-show",Utils.ObjectToStr(ca_adder["id"])));

	templateBuilder.Append("'>\r\n                                                        <div class=\"imgbox\">\r\n                                                            <span class=\"tr3 sizeCover\" style=\"background-image: url(" + Utils.ObjectToStr(ca_adder["img_url"]) + ")\"></span>\r\n                                                        </div>\r\n                                                        <div class=\"textbox tr text-center overflow\">" + Utils.ObjectToStr(ca_adder["title"]) + "</div>\r\n                                                    </a>\r\n                                                </div>\r\n                                            </div>\r\n                                            ");
	}	//end for if

	templateBuilder.Append("\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n    </div>\r\n\r\n    ");

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


	foreach(QJcms.Model.article_attach modelt in get_artice_attach(196))
	{

	templateBuilder.Append("\r\n    <script>\r\n    $(function () {\r\n\r\n        //产品中心\r\n        $('.picture-1').each(function (z) {\r\n            $('.picture-1').eq(z).addClass('picture-1-' + (z + 1));\r\n            var p1swiper = new Swiper('.picture-1-' + (z + 1) + ' .swiper-container', {\r\n                slidesPerView: 4,\r\n                speed: 800,\r\n                autoplay: {\r\n                    delay: 5000\r\n                },\r\n                spaceBetween: 26,\r\n                slidesPerColumn: 2,\r\n                slidesPerColumnFill: 'row',\r\n                disableOnInteraction: false,\r\n                breakpoints: {\r\n                    991: {\r\n                        slidesPerView: 2,\r\n                        spaceBetween: 20\r\n                    }\r\n                }\r\n            })\r\n        })\r\n        $('.title-2-nr:nth-child(n+2)').hide();\r\n        $('.title-2 ul li').click(function () {\r\n            if (!$(this).hasClass('active') && $('.title-2-nr').eq($(this).index()).is(':hidden')) {\r\n                $(this).addClass('active').siblings().removeClass('active');\r\n                $('.title-2-nr').eq($(this).index()).show().siblings().hide();\r\n            }\r\n        })\r\n\r\n        //视频\r\n\r\n        $('.picture-3 .imgbox').click(function () {\r\n            var str = '<video width=\"100%\" height=\"100%\" controls><source src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.file_path));
	templateBuilder.Append("\"  type=\"video/mp4\">您的浏览器不支持 HTML5 video 标签。</video>';\r\n            $(this).remove();\r\n            $('.picture-3').append(str);\r\n            var videos = $('.picture-3 video');\r\n            videos.trigger('play');\r\n        })\r\n\r\n        //新闻资讯\r\n        $('.text-2 .menu ul li').click(function () {\r\n            $(this).addClass('active');\r\n            $(this).siblings().removeClass('active');\r\n            $('.text-2 .textbox ul').eq($(this).index()).addClass('active');\r\n            $('.text-2 .textbox ul').eq($(this).index()).siblings().removeClass('active');\r\n            $('.text-2-more .more-1').eq($(this).index()).show();\r\n            $('.text-2-more .more-1').eq($(this).index()).siblings().hide();\r\n        })\r\n\r\n        //设备展示\r\n        var p6swiper = new Swiper('.picture-6 .swiper-container', {\r\n            slidesPerView: 4,\r\n            speed: 800,\r\n            autoplay: {\r\n                delay: 5000\r\n            },\r\n            spaceBetween: 20,\r\n            disableOnInteraction: false,\r\n            navigation: {\r\n                prevEl: '.title-4 .right a:nth-child(1)',\r\n                nextEl: '.title-4 .right a:nth-child(2)'\r\n            },\r\n            breakpoints: {\r\n                991: {\r\n                    slidesPerView: 2\r\n                }\r\n            }\r\n        })\r\n\r\n    })\r\n    </");
	templateBuilder.Append("script>\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
