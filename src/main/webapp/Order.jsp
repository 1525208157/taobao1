<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>

<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--
        	作者：offline
        	时间：2018-03-26
        	描述：我的淘宝、我的订单搜索导航
        -->
<link rel="stylesheet" href="css/base.css" />

<!--
        	作者：offline
        	时间：2018-03-26
        	描述：首页、我的淘宝、、、导航
        -->
<link rel="stylesheet" href="css/index.css">

<!--
        	作者：offline
        	时间：2018-03-26
        	描述：购物车、收藏夹、卖家中心 展开功能
        -->
<script
	src="//g.alicdn.com/??kissy/k/1.4.16/seed-min.js,kg/kmd-adapter/0.1.5/index.js,kg/kmd-adapter/0.1.5/util.js,kg/global-util/1.0.7/index-min.js,tb/tracker/4.0.1/p/index/index.js,kg/tb-nav/2.5.4/index-min.js"></script>
<script>
	KISSY.config({
		modules : {
			'flash' : {
				alias : [ 'gallery/flash/1.0/' ]
			}
		}
	});
	KISSY.use('kg/global-util/1.0.7/');
	KISSY.config({
		modules : {
			'kg/tb-nav' : {
				alias : 'kg/tb-nav/2.5.4/',
				requires : [ 'kg/global-util/1.0.7/' ]
			}
		}
	});
	KISSY.ready(function() {
		KISSY.use('kg/tb-nav')
	});
</script>

<script>
	$(function() {
		$
				.ajax({
					url : "myTaobao/selectOrders",
					dataType : "json",
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							$("#orderDiv")
									.append(
											"<div class='panel panel-default'><div class='panel-heading'><div class='col-lg-4 col-sm-4'>订单号："+data[i].orderId+ "</div><div class='col-lg-8 col-sm-8'>"+data[i].orderGoods[0].specs.sGoods.shop.shopName+"</div></div>"
											+"<div class='panel-body'><div class='col-lg-4 col-sm-4'>"+data[i].orderGoods[0].specs.sGoods.goodsName+"</div><div class='col-lg-2 col-sm-2'>"+data[i].orderGoods[0].specs.smoney+"</div><div class='col-lg-2 col-sm-2'>"+data[i].orderGoods[0].goodsNum+"</div><div class='col-lg-2 col-sm-2'>${"+data[i].logistics+" == '' ? '未发货':'已发货' }</div><div class='col-lg-2 col-sm-2'><c:if test=' "+data[i].orderStatus+" < 3 '>确认收货</c:if></div></div><hr>"
											+"</div>");

						}
					}

				});

	});
</script>

<body>
	<div class="site-nav site-nav-status-logout" id="J_SiteNav"
		data-tbar='{ "show":true, "miniCart": "2.12.2","paramsBlackList": "_wt,seeyouagain1722","my_activity": "https://market.m.taobao.com/apps/abs/5/38/my12?psId=58386&amp;pcPsId=58388", "venueUrl": "https://1212.taobao.com?wh_weex=true&amp;data_prefetch=true&amp;wx_navbar_transparent=true", "helpUrl": "https://consumerservice.taobao.com/online-help", "validTime":{"startTime": 1512057599, "endTime": 1513094400}, "style": {"name": "171212", "path": "kg/sidebar-style-171212/0.0.5/" }, "page":[],"blackList":[],"navDataId":{"tceSid":1182567,"tceVid":0},"pluginVersion":{ "cart":"0.2.0","history":"0.2.0","redpaper":"0.0.8","gotop":"0.2.5","help":"0.2.1","ww":"0.0.3","pagenav":"0.0.27","myasset":"0.0.9","my1212":"0.0.1","my1111":"0.2.2"}}'
		data-component-config='{ "cart": "0.0.6","message": "3.4.6","umpp": "1.5.4","mini-login": "6.3.8","tb-ie-updater": "0.0.4","tbar": "2.1.0","tb-footer": "1.1.6","sidebar": "1.0.10" }'>
		<div class="site-nav-bd" id="J_SiteNavBd">

			<ul class="site-nav-bd-l" id="J_SiteNavBdL" data-spm-ab="1">

				<li class="site-nav-menu site-nav-login" id="J_SiteNavLogin"
					data-spm="754894437" data-name="login"><div
						class="site-nav-menu-hd">
						<div class="site-nav-sign">
							<a class="h"
								href="https://login.taobao.com/member/login.jhtml?f=top&amp;redirectURL=http%3A%2F%2F127.0.0.1%3A8020%2Fproject%2Fnew_file.html"
								target="_top">亲，请登录</a> <a
								href="//reg.taobao.com/member/new_register.jhtml?from=tbtop&amp;ex_info=&amp;ex_sign="
								target="_top">免费注册</a>
						</div>
						<div class="site-nav-user">
							<a class="site-nav-login-info-nick "
								href="//i.taobao.com/my_taobao.htm?ad_id=&amp;am_id=&amp;cm_id=&amp;pm_id=1501036000a02c5c3739"
								target="_top">undefined</a> <span class="site-nav-arrow"><span
								class="site-nav-icon"></span></span>
						</div>
					</div>
					<div class="site-nav-menu-bd" id="J_SiteNavLoginPanel"></div></li>

			</ul>

			<ul class="site-nav-bd-r" id="J_SiteNavBdR" data-spm-ab="2">
				<li class="site-nav-menu site-nav-home" id="J_SiteNavHome"
					data-spm="1581860521" data-name="home">
					<div class="site-nav-menu-hd">
						<a href="//www.taobao.com/" target="_top"> <span>淘宝网首页</span>
						</a>

					</div>

				</li>

				<li
					class="site-nav-menu site-nav-mytaobao site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavMytaobao" data-spm="1997525045" data-name="mytaobao">
					<div class="site-nav-menu-hd">
						<a href="//i.taobao.com/my_taobao.htm" target="_top"> <span>我的淘宝</span>
						</a>

					</div>

				</li>

				<li
					class="site-nav-menu site-nav-cart site-nav-menu-empty site-nav-multi-menu J_MultiMenu mini-cart menu"
					id="J_MiniCart" data-spm="1997525049" data-name="cart">
					<div class="site-nav-menu-hd">
						<a id="mc-menu-hd"
							href="//cart.taobao.com/cart.htm?from=mini&amp;ad_id=&amp;am_id=&amp;cm_id=&amp;pm_id=1501036000a02c5c3739"
							target="_top"> <span
							class="site-nav-icon site-nav-icon-highlight"></span> <span>购物车</span>
							<strong class="h" id="J_MiniCartNum">0</strong>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon"></span></span>

					</div>
					<div class="site-nav-menu-bd">
						<div class="site-nav-menu-bd-panel menu-bd-panel"></div>
					</div>
				</li>

				<li
					class="site-nav-menu site-nav-favor site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavFavor" data-spm="1997525053" data-name="favor">
					<div class="site-nav-menu-hd">
						<a href="//shoucang.taobao.com/item_collect.htm" target="_top">
							<span class="site-nav-icon"></span> <span>收藏夹</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon"></span></span>

					</div>

					<div class="site-nav-menu-bd site-nav-menu-list">
						<div class="site-nav-menu-bd-panel menu-bd-panel">

							<a href="//shoucang.taobao.com/item_collect.htm" target="_top">收藏的宝贝</a>

							<a href="//shoucang.taobao.com/shop_collect_list.htm"
								target="_top">收藏的店铺</a>

						</div>
					</div>

				</li>

				<li class="site-nav-pipe">|</li>

				<li
					class="site-nav-menu site-nav-seller site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavSeller" data-spm="1997525073" data-name="seller">
					<div class="site-nav-menu-hd">
						<a href="//mai.taobao.com/seller_admin.htm" target="_top"> <span>卖家中心</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon"></span></span>

					</div>

					<div class="site-nav-menu-bd site-nav-menu-list">
						<div class="site-nav-menu-bd-panel menu-bd-panel">

							<a href="//mai.taobao.com/seller_admin.htm" target="_top">免费开店</a>

							<a href="//trade.taobao.com/trade/itemlist/list_sold_items.htm"
								target="_top">已卖出的宝贝</a> <a
								href="//sell.taobao.com/auction/goods/goods_on_sale.htm"
								target="_top">出售中的宝贝</a>

						</div>
					</div>

				</li>

			</ul>

		</div>
	</div>

	<header class="mt-header" data-spm="a210b"> <article>
	<div class="mt-logo" style="margin-left: 0px;">
		<a title="我的淘宝" class="mt-tblogo"
			href="//i.taobao.com/my_taobao.htm?nekot=1470211439696&amp;tracelog=newmytb_logodianji"
			data-spm="d1000351"></a>
	</div>
	<nav class="mt-nav">
	<ul id="J_MtMainNav">
		<li class="selected"><a
			href="//i.taobao.com/my_taobao.htm?tracelog=mytaobaonavindex&amp;nekot=1470211439696"
			data-spm="d1000352">我的订单</a> <i class="mt-arrow"></i></li>

	</ul>
	<div class="search" id="J_Search" role="search">
		<div class="search-panel search-sns-panel-field">
			<form name="search" class="search-panel-focused" id="J_TSearchForm"
				action="//s.taobao.com/search" target="_blank">
				<div class="search-button">
					<button class="btn-search" type="submit">搜 索</button>
				</div>
				<div class="search-panel-fields">
					<label for="q"></label>
					<div class="search-combobox" id="ks-component1045">
						<div class="search-combobox-input-wrap">
							<div class="search-combobox">
								<div class="search-combobox-input-wrap">
									<input name="q" class="search-combobox-input" id="q"
										role="combobox" aria-haspopup="true" accesskey="s"
										autofocus="true" aria-label="请输入搜索文字或从搜索历史中选择"
										aria-combobox="list" x-webkit-grammar="builtin:translate"
										x-webkit-speech="" autocomplete="off">
								</div>
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
	</nav> </article> </header>
		<br><br>
		<div class="row">
			<div class="col-lg-2 col-sm-2"></div>
			<div class="col-lg-8 col-sm-8">
				<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">所有订单</a></li>
							<li><a href="#">待发货</a></li>
							<li><a href="#">待收货</a></li>
							<li><a href="#">待评价</a></li>
						</ul>
					</div>
				</div>
				</nav>
				
				<div class="row">
					<div class="col-lg-4 col-sm-4">
						<font size="4">商品</font>
					</div>
					<div class="col-lg-2 col-sm-2">
						<font size="4">单价</font>
					</div>
					<div class="col-lg-2 col-sm-2">
						<font size="4">数量</font>
					</div>
					<div class="col-lg-2 col-sm-2">
						<font size="4">交易状态</font>
					</div>
					<div class="col-lg-2 col-sm-2">
						<font size="4">交易操作</font>
					</div>
				</div>
	
				<div id="orderDiv"></div>
				
			</div>
			
			<div class="col-lg-2 col-sm-2"></div>
		</div>
		
</body>
</html>