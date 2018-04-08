<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>xxx的收藏夹</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>
#id_span {
	position: absolute;
	top: 10px;
}
</style>

<!-- 首页、我的淘宝、购物车 导航样式 -->
<link rel="stylesheet"
	href="//g.alicdn.com/??kg/global-util/1.0.6/index-min.css,kg/tb-nav/2.4.1/index-min.css">

<!-- 搜索框样式 -->
<link rel="stylesheet"
	href="//g.alicdn.com/tbc/search-suggest/1.4.5/??new_searchbox-min.css,new_suggest-min.css">

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

<!-- 收藏夹导航js -->
<script src="//g.alicdn.com/kissy/k/1.4.16/import-style-min.js"
	data-config="{combine:true}"></script>
<script id="J_ConfigScript"
	src="//g.alicdn.com/tb/mercury/6.0.8/config.js" data-v="6.0.8"
	type="text/javascript"></script>
<script>
	XCake.config({
		name : 'mercury',
		base : '//g.alicdn.com/tb/mercury/6.0.8',
		combine : true
	})
</script>
<script>
	KISSY.importStyle('mercury/p/shoplist/index');
</script>

</head>

<script type="text/javascript">
	$(function() {
		var userId = "${users.userId }";
		if (userId == "") {
			location.href="Login.jsp";
		}
		
		var nickname = "${users.nickname }";
		var userImg = "${users.userImg }";
		$("#id_span").append("<img src='"+userImg+"' width='20px' height='20px' class='img-circle' width>"+nickname);
		
		$.ajax({
			url : "myTaobao/selectFavoritesShops",
			data:{
				"userId":userId
			},
			dataType : "json",
			success : function(data) {
				$("#sNum").append(data.length);
				var num = 0;
				for (i = 0; i < data.length; i++) {
					if (i != 0 && i %4 == 0) {
						num++;
						$("#favoritesShopsDiv").append("<div class='row' id='d"+i+" '>"
								+"<div class='col-lg-3 col-md-3'>"
								+"<a href='ShopsDetails.jsp?shopId="+data[i].shops.shopId+"'><img src='"+data[i].shops.shopImg+"' width='260' height='240' class='img-rounded'></a>"
								+"<br><a href='ShopsDetails.jsp?shopId="+data[i].shops.shopId+"'><font size='4'>"+data[i].shops.shopName+"</font></a>"
								+"</div>"
								+"</div>");
					}
					if (i < 4) {
						$("#firstRow").append("<div class='col-lg-3 col-md-3'>"
								+"<a href='ShopsDetails.jsp?shopId="+data[i].shops.shopId+"'><img src='"+data[i].shops.shopImg+"' width='260' height='240' class='img-rounded'></a>"
								+"<br><a href='ShopsDetails.jsp?shopId="+data[i].shops.shopId+"'><font size='4'>"+data[i].shops.shopName+"</font></a>"
								+"</div>");
					} else if (i % 4 != 0) {
						$("d"+num).append("<div class='col-lg-3 col-md-3'>"
								+"<a href='ShopsDetails.jsp?shopId="+data[i].shops.shopId+"'><img src='"+data[i].shops.shopImg+"' width='260' height='240' class='img-rounded'></a>"
								+"<br><a href='ShopsDetails.jsp?shopId="+data[i].shops.shopId+"'><font size='4'>"+data[i].shops.shopName+"</font></a>"
								+"</div>");
					}
					
				}
			}
		})
	});
</script>

<body data-spm="7385961">
	<div class="site-nav" id="J_SiteNav"
		data-component-config='{ "cart": "0.0.6","message": "3.4.6","umpp": "1.5.4","mini-login": "6.3.8","tb-ie-updater": "0.0.4","tbar": "2.1.0","tb-footer": "1.1.6","sidebar": "1.0.10" }'
		data-tbar='{ "show":true, "miniCart": "2.12.2","paramsBlackList": "_wt,seeyouagain1722","my_activity": "https:&#x2F;&#x2F;market.m.taobao.com&#x2F;apps&#x2F;abs&#x2F;5&#x2F;38&#x2F;my12?psId=58386&amp;pcPsId=58388", "venueUrl": "https:&#x2F;&#x2F;1212.taobao.com?wh_weex=true&amp;data_prefetch=true&amp;wx_navbar_transparent=true", "helpUrl": "https://consumerservice.taobao.com/online-help", "validTime":{"startTime": 1512057599, "endTime": 1513094400}, "style": {"name": "171212", "path": "kg/sidebar-style-171212/0.0.5/" }, "page":[],"blackList":[],"navDataId":{"tceSid":1182567,"tceVid":0},"pluginVersion":{ "cart":"0.2.0","history":"0.2.0","redpaper":"0.0.8","gotop":"0.2.5","help":"0.2.1","ww":"0.0.3","pagenav":"0.0.27","myasset":"0.0.9","my1212":"0.0.1","my1111":"0.2.2"}}'>
		<div class="site-nav-bd" id="J_SiteNavBd">

			<!-- 用户图片、名称 -->
			<span id="id_span"></span>

			<ul class="site-nav-bd-r" id="J_SiteNavBdR" data-spm-ab="2">
				<li class="site-nav-menu site-nav-home" id="J_SiteNavHome"
					data-name="home" data-spm="1581860521">
					<div class="site-nav-menu-hd">
						<a href="index.jsp" target="_top"> <span>淘宝网首页</span>
						</a>

					</div>

				</li>

				<li
					class="site-nav-menu site-nav-mytaobao site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavMytaobao" data-name="mytaobao" data-spm="1997525045">
					<div class="site-nav-menu-hd">
						<a href="MyTaobao.jsp" target="_top"> <span>我的淘宝</span>
						</a>

					</div>

				</li>

				<li
					class="site-nav-menu site-nav-cart site-nav-menu-empty site-nav-multi-menu J_MultiMenu"
					id="J_MiniCart" data-name="cart" data-spm="1997525049">
					<div class="site-nav-menu-hd">
						<a
							href="//cart.taobao.com/cart.htm?from=mini&ad_id=&am_id=&cm_id=&pm_id=1501036000a02c5c3739"
							target="_top"> <span
							class="site-nav-icon site-nav-icon-highlight">&#xe603;</span> <span>购物车</span>
							<strong class="h" id="J_MiniCartNum"></strong>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

					</div>
					<div class="site-nav-menu-bd">
						<div class="site-nav-menu-bd-panel menu-bd-panel"></div>
					</div>
				</li>

				<li
					class="site-nav-menu site-nav-favor site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavFavor" data-name="favor" data-spm="1997525053">
					<div class="site-nav-menu-hd">
						<a href="FavoritesGoods.jsp" target="_top">
							<span class="site-nav-icon">&#xe604;</span> <span>收藏夹</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

					</div>

					<div class="site-nav-menu-bd site-nav-menu-list">
						<div class="site-nav-menu-bd-panel menu-bd-panel">

							<a href="FavoritesGoods.jsp" target="_top">收藏的宝贝</a>

							<a href="FavoritesShops.jsp"
								target="_top">收藏的店铺</a>

						</div>
					</div>

				</li>

				<li class="site-nav-pipe">|</li>

				<li
					class="site-nav-menu site-nav-seller site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavSeller" data-name="seller" data-spm="1997525073">
					<div class="site-nav-menu-hd">
						<a href="//mai.taobao.com/seller_admin.htm" target="_top"> <span>卖家中心</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

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

	<div id="page" class="page-shoplist">
		<div id="content">
			<div id="mercury" class="">

				<!-- info.pageType 0 -->

				<div id="fav-tab">
					<div id="fav-tab-bd">
						<div data-spm="1997985201" id="fav-tab-menu"
							class="clearfix floatleft">

							<a aria-label="您可以使用tab键寻找您的收藏" class="fav-logo" href=""> <img
								aria-label="欢迎访问淘宝收藏夹"
								src="//img.alicdn.com/tps/i1/T1gbUrFeVaXXXO7MrX-136-28.png">
							</a> <a class="item-page " href="FavoritesGoods.jsp" data-spm="">商品收藏</a>

							<a class="shop-page current" href="/shop_collect_list_n.htm"
								data-spm="d4919065">店铺收藏</a>

							<div class="more-list J_FavTabMore hidden">
								<a class="buyed-page " target="_blank"
									href="/bought_shop_list.htm?itemtype=0" data-spm=""> 购买过的店铺
									<i class="i"></i>
								</a>
								<div class="more-popup">
									<ul>
										<li class="more-item"><a class="tab-link" target="_blank"
											href="//trade.taobao.com/trade/itemlist/list_bought_items.htm"
											data-spm="d4919077">已买到的宝贝</a></li>

										<li class="more-item"><a class="tab-link" target="_blank"
											href="//lu.taobao.com/newMyPath.htm" data-spm="d4919082">我的足迹</a>
										</li>

									</ul>
								</div>
							</div>

						</div>

					</div>
				</div>

				<div class="mercury-cont">

					<div class="fav-floatbar">
						<div class="fav-bar-height">
							<div class="fav-bar-float">
								<div class="fav-bar-float-layout clearfix">
									<div class="fav-select" data-spm="1997985009">
										<ul>
											<li class="fav-sel-item fav-sel-item-first J_SelItemsTags ">
												<span class="fav-sel-link fav-sel-select"> 全部店铺 <em>(<font id="sNum"></font>)</em>
											</span>
											</li>
										</ul>
									</div>

									<div class="fav-search fav-search-in-shop cleatfix">
										<form class="fav-search-panel-focused fav-search-in-shop-form"
											id="J_FavSearchForm" name="favsearch" action="" target="_top">
											<input name="_tb_token_" type="hidden" value="e148e8be71b75">
											<input class="fav-search-panel-focused-timer" name="t"
												type="hidden" value=""> <input id="" type="hidden"
												name="spm" value="a1z0k.7385961.1997985253.d4918985">
											<input type="hidden" name="type" value="10">
											<div class="fav-search-panel-fields">
												<input id="fav-q" name="value" accesskey="s"
													autocomplete="off" x-webkit-speech=""
													x-webkit-grammar="builtin:translate" placeholder="搜索店铺"
													value="" aria-haspopup="true" aria-combobox="list"
													role="combobox" class="search-combobox-input"
													aria-label="输入关键词搜索收藏夹内的店铺">
											</div>
											<div class="fav-search-button">
												<button type="button"
													class="fav-btn-search fav-btn-search-s"
													data-spm-click="gostr=/tbscj;locaid=d1selbtn">搜店铺</button>
											</div>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div id="favoritesShopsDiv">
						<div id="firstRow" class="row"></div>
					</div>
					
				</div>


			</div>
		</div>
	</div>

	<script>
		
	</script>
</body>
</html>