<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<style>
		#id_span {
			position:relative;
			left: -370px;
			top: 10px;
		}
	</style>

<!-- 首页、我的淘宝、购物车 导航样式 -->
<link rel="stylesheet"
	href="//g.alicdn.com/??kg/global-util/1.0.6/index-min.css,kg/tb-nav/2.4.1/index-min.css">

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

<script type="text/javascript">
	function fun1() {
		var a = $("input[name='b2']").get(0).checked == true ? "s" : "d";
		if (a == "s") {
			location.href = "${pageContext.request.contextPath}/Goods/queryAll?goodsName=" + $("#gname").val();
		} else if (a == "d") {
			location.href = "${pageContext.request.contextPath}/shops/queryAll?shopName=" + $("#gname").val();
		}
	}
</script>
</head>
<script type="text/javascript">
	$(function() {
		var userId = "${users.userId }";
		var nickname = "${users.nickname }";
		var userImg = "${users.userImg }";
		if (userId == "") {
			$("#id_span").append("<a href='${pageContext.request.contextPath}/Login.jsp'>你好，请登录！</a>");
		} else {
			$("#id_span").append("<img src='" + userImg + "' width='20px' height='20px' class='img-circle' width>" + nickname);
		}
		
	})
</script>
<body>
	<center>
		<div class="site-nav" id="J_SiteNav"
			data-component-config='{ "cart": "0.0.6","message": "3.4.6","umpp": "1.5.4","mini-login": "6.3.8","tb-ie-updater": "0.0.4","tbar": "2.1.0","tb-footer": "1.1.6","sidebar": "1.0.10" }'
			data-tbar='{ "show":true, "miniCart": "2.12.2","paramsBlackList": "_wt,seeyouagain1722","my_activity": "https:&#x2F;&#x2F;market.m.taobao.com&#x2F;apps&#x2F;abs&#x2F;5&#x2F;38&#x2F;my12?psId=58386&amp;pcPsId=58388", "venueUrl": "https:&#x2F;&#x2F;1212.taobao.com?wh_weex=true&amp;data_prefetch=true&amp;wx_navbar_transparent=true", "helpUrl": "https://consumerservice.taobao.com/online-help", "validTime":{"startTime": 1512057599, "endTime": 1513094400}, "style": {"name": "171212", "path": "kg/sidebar-style-171212/0.0.5/" }, "page":[],"blackList":[],"navDataId":{"tceSid":1182567,"tceVid":0},"pluginVersion":{ "cart":"0.2.0","history":"0.2.0","redpaper":"0.0.8","gotop":"0.2.5","help":"0.2.1","ww":"0.0.3","pagenav":"0.0.27","myasset":"0.0.9","my1212":"0.0.1","my1111":"0.2.2"}}'>
			<div class="site-nav-bd" id="J_SiteNavBd">
				<!-- 用户图片、名称 -->
				<span id="id_span"></span>

				<ul class="site-nav-bd-r" id="J_SiteNavBdR" data-spm-ab="2">

					<li
						class="site-nav-menu site-nav-mytaobao site-nav-multi-menu J_MultiMenu"
						id="J_SiteNavMytaobao" data-name="mytaobao" data-spm="1997525045">
						<div class="site-nav-menu-hd">
							<a href="${pageContext.request.contextPath}/MyTaobao.jsp" target="_top"> <span>我的淘宝</span>
							</a>

						</div>

					</li>

					<li
						class="site-nav-menu site-nav-cart site-nav-menu-empty site-nav-multi-menu J_MultiMenu"
						id="J_MiniCart" data-name="cart" data-spm="1997525049">
						<div class="site-nav-menu-hd">
							<a
								href="${pageContext.request.contextPath}/carts/showCarts"
								target="_blank"> <span
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
							<a href="${pageContext.request.contextPath}/FavoritesGoods.jsp" target="_top"> <span
								class="site-nav-icon">&#xe604;</span> <span>收藏夹</span>
							</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

						</div>

						<div class="site-nav-menu-bd site-nav-menu-list">
							<div class="site-nav-menu-bd-panel menu-bd-panel">

								<a href="${pageContext.request.contextPath}/FavoritesGoods.jsp" target="_top">收藏的宝贝</a> <a
									href="${pageContext.request.contextPath}/FavoritesShops.jsp" target="_top">收藏的店铺</a>

							</div>
						</div>

					</li>

					<li class="site-nav-pipe">|</li>

					<li
						class="site-nav-menu site-nav-seller site-nav-multi-menu J_MultiMenu"
						id="J_SiteNavSeller" data-name="seller" data-spm="1997525073">
						<div class="site-nav-menu-hd">
							<a href="${pageContext.request.contextPath}/Sellers.jsp" target="_top"> <span>卖家中心</span>
							</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

						</div>

						<div class="site-nav-menu-bd site-nav-menu-list">
							<div class="site-nav-menu-bd-panel menu-bd-panel">

								<a href="${pageContext.request.contextPath}/kaidian.jsp" target="_top">免费开店</a>

								

							</div>
						</div>

					</li>

				</ul>

			</div>
		</div>
		<div class="container">
			<div class="row" style="text-align: center;">
				<div class="col-md-5" id="tb_img">
					<img src="${pageContext.request.contextPath}/images/1.jpg">
				</div>
				<div class="col-md-7">
					<form class="navbar-form navbar-left" role="search">
						<table>
							<tr>
								<td>
									<div class="btn-group" data-toggle="buttons"
										style="width: 500px; text-align: left;">
										<label class="btn btn-default active"> <input
											type="radio" name="b2" autocomplete="off" value="s" checked>
											商品
										</label> <label class="btn btn-default"> <input type="radio"
											name="b2" value="d" autocomplete="off"> 店铺
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td><div class="form-group">
										<input type="text" class="form-control" placeholder="请输入"
											style="height: 40px; width: 400px;" id="gname">
									</div>
									<button type="button" class="btn btn-warning "
										style="height: 40px; width: 100px;" onclick="fun1();">搜索</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br>
		<div class="row" style="width: 1180px">
			<c:forEach items="${sl}" var="sl">
				<div class="col-lg-3 col-md-3 col-sm-3">
					<a href="${pageContext.request.contextPath}/ShopsDetails.jsp?shopId=${sl.shopId}"><img src="${pageContext.request.contextPath}/${sl.shopImg}" width="60px" height="60px"></a><br/>
							<a href="${pageContext.request.contextPath}/ShopsDetails.jsp?shopId=${sl.shopId}">${sl.shopName}</a>
				</div>
			</c:forEach>
		</div>
		<br>
		
	</center>
</body>
</html>