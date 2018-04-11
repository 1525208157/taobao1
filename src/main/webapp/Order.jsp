<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<style>
#id_span {
	position: absolute;
	top: 10px;
}

.set_image_all {
	cursor: pointer;
	position: relative;
}

.set_image_all .set_image_item {
	position: relative;
	display: inline-block;
	z-index: 11;
	visibility: visible;
}

.set_image_all .set_image_top {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 10;
}

.set_image_all .set_image_top>div {
	display: inline-block;
	overflow: hidden;
}

.set_image_all .set_image_top>div>img {
	height: 100%;
}

.grade {
	vertical-align: top;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<!-- 星星js -->
<script  type="text/javascript" src="js/markingSystem.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- 评分星星样式 -->
<script>
	$(function() {
		$("#star_grade").markingSystem({
	        backgroundImageInitial: 'img/star_hollow.png',
	        backgroundImageOver: 'img/star_solid.png',
	        num: 5,
	        havePoint: false,
	        haveGrade: true,
	        unit: '星',
	        grade: 1,
	        height: 30,
	      width: 30,
	    })
	    $("#star_grade1").markingSystem({
	        backgroundImageInitial: 'img/star_hollow.png',
	        backgroundImageOver: 'img/star_solid.png',
	        num: 5,
	        havePoint: false,
	        haveGrade: true,
	        unit: '星',
	        grade: 1,
	        height: 30,
	      width: 30,
	    })
	    $("#star_grade2").markingSystem({
	        backgroundImageInitial: 'img/star_hollow.png',
	        backgroundImageOver: 'img/star_solid.png',
	        num: 5,
	        havePoint: false,
	        haveGrade: true,
	        unit: '星',
	        grade: 1,
	        height: 30,
	      width: 30,
	    })
	})
</script>

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
		var userId = "${users.userId }";
		if (userId == "") {
			location.href = "Login.jsp";
		}
		var nickname = "${users.nickname }";
		var userImg = "${users.userImg }";
		$("#id_span").append(
				"<img src='"+userImg+"' width='20px' height='20px' class='img-circle' width>"
						+ nickname);
		
		selectOrders(0);
		selectIsDelOrders();
	});

	function selectOrders(orderStatus) {
		var userId = "${users.userId }";
		
		$
				.ajax({
					url : "myTaobao/selectOrders",
					data : {
						"userId" : userId,
						"orderStatus" : orderStatus
					},
					dataType : "json",
					success : function(data) {
						$("#orderDiv").empty();
						for (i = 0; i < data.length; i++) {
							for (j = 0; j < data[i].orderGoods.length; j++) {
								var str;
								var status;
								if (data[i].orderStatus == 1) {
									str = "待发货";
									status = "";
								} else if (data[i].orderStatus == 2) {
									str = "已发货";
									status = "<a href='#' onclick='updateOrderStatus("+data[i].orderId+",3)'>确认收货</a>";
								} else if (data[i].orderStatus == 3) {
									str = "待评价";
									status = "<a href='#' onclick='openAppraisesModal("+data[i].orderId+",4,"+data[i].orderGoods[j].specs.sGoods.goodsId+")'>评价</a>";
								} else if (data[i].orderStatus == 4) {
									str = "已完成";
									status = "";
								}
								$("#orderDiv")
										.append(
												"<div class='panel panel-default'><div class='panel-heading' style='height:40px;'><div class='col-lg-4 col-sm-4' style='text-align:left'>订单号："
														+ data[i].orderId
														+ "</div><div class='col-lg-6 col-sm-6' style='text-align:left'>店铺名称："
														+ data[i].orderGoods[j].specs.sGoods.shop.shopName
														+ "</div><div class='col-lg-2 col-sm-2'><a href='#' onclick='updateIsDel("
														+ data[i].orderId
														+ ",1)'>删除订单</a></div></div>"
														+ "<div class='panel-body'><div class='col-lg-4 col-sm-4'>"
														+ data[i].orderGoods[j].specs.sGoods.goodsName
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ data[i].orderGoods[j].specs.smoney
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ data[i].orderGoods[j].goodsNum
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ str
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ status
														+ "</div></div><hr>"
														+ "</div>");
							}

						}
					}

				});
	}

	//逻辑 删除/还原 订单
	function updateIsDel(orderId, isDel) {
		$.ajax({
			url : "myTaobao/updateIsDel",
			data : {
				"orderId" : orderId,
				"isDel" : isDel
			},
			success : function(data) {
				alert(data);
				location.reload();
			}
		});
	}

	//显示订单回收站模态框
	function openIsDelModal() {
		$("#isDelModal").modal();
	}

	//查询已删除订单
	function selectIsDelOrders() {
		var userId = "${users.userId }";
		$
				.ajax({
					url : "myTaobao/selectIsDelOrders",
					data : {
						"userId" : userId
					},
					dataType : "json",
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							for (j = 0; j < data[i].orderGoods.length; j++) {
								$("#isDelOrders")
										.append(
												"<div class='panel panel-default'><div class='panel-heading' style='height:40px;'><div class='col-lg-4 col-sm-4' style='text-align:left'>订单号："
														+ data[i].orderId
														+ "</div><div class='col-lg-6 col-sm-6' style='text-align:left'>店铺名称："
														+ data[i].orderGoods[j].specs.sGoods.shop.shopName
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ "<a href='#' onclick='updateIsDel("
														+ data[i].orderId
														+ ",0)'>还原订单</a>"
														+ "</div></div>"
														+ "<div class='panel-body'><div class='col-lg-4 col-sm-4'>"
														+ data[i].orderGoods[j].specs.sGoods.goodsName
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ data[i].orderGoods[j].specs.smoney
														+ "</div><div class='col-lg-2 col-sm-2'>"
														+ data[i].orderGoods[j].goodsNum
														+ "</div><div class='col-lg-2 col-sm-2'></div><div class='col-lg-2 col-sm-2'></div></div><hr>"
														+ "</div>");
							}

						}
					}

				});
	}
	
	//修改订单状态(确认收货)
	function updateOrderStatus(orderId,orderStatus) {
		$.ajax({
			url:"myTaobao/updateOrderStatus",
			data:{
				"orderId":orderId,
				"orderStatus":orderStatus
			},
			success:function(data){
				alert(data);
				location.reload();
			}
		});
	}
	
	//修改订单状态(评价)
	function addAppraises() {
		var goodsScore = $("#star_grade span").text();
		var serviceScore = $("#star_grade1 span").text();
		var logisticsScore = $("#star_grade2 span").text();
		var userId = "${users.userId }";
		$.ajax({
			url:"myTaobao/addAppraises",
			data:{
				"orderId":$("#orderId_txt").val(),
				"orderStatus":$("#orderStatus_txt").val(),
				"content":$("#content").val(),
				"goodsScore":Number(goodsScore.substring(1,0)),
				"logisticsScore":Number(logisticsScore.substring(1,0)),
				"serviceScore":Number(serviceScore.substring(1,0)),
				"users.userId":userId,
				"goods.goodsId":$("#goodsId_txt").val()
			},
			success:function(data){
				alert(data);
				location.reload();
			}
		});
	}
	
	function openAppraisesModal(orderId,orderStatus,goodsId) {
		$("#orderId_txt").val(orderId);
		$("#orderStatus_txt").val(orderStatus);
		$("#goodsId_txt").val(goodsId);
		$("#appraisesModal").modal();
	}
	
</script>

<body>
	<div class="site-nav site-nav-status-logout" id="J_SiteNav"
		data-tbar='{ "show":true, "miniCart": "2.12.2","paramsBlackList": "_wt,seeyouagain1722","my_activity": "https://market.m.taobao.com/apps/abs/5/38/my12?psId=58386&amp;pcPsId=58388", "venueUrl": "https://1212.taobao.com?wh_weex=true&amp;data_prefetch=true&amp;wx_navbar_transparent=true", "helpUrl": "https://consumerservice.taobao.com/online-help", "validTime":{"startTime": 1512057599, "endTime": 1513094400}, "style": {"name": "171212", "path": "kg/sidebar-style-171212/0.0.5/" }, "page":[],"blackList":[],"navDataId":{"tceSid":1182567,"tceVid":0},"pluginVersion":{ "cart":"0.2.0","history":"0.2.0","redpaper":"0.0.8","gotop":"0.2.5","help":"0.2.1","ww":"0.0.3","pagenav":"0.0.27","myasset":"0.0.9","my1212":"0.0.1","my1111":"0.2.2"}}'
		data-component-config='{ "cart": "0.0.6","message": "3.4.6","umpp": "1.5.4","mini-login": "6.3.8","tb-ie-updater": "0.0.4","tbar": "2.1.0","tb-footer": "1.1.6","sidebar": "1.0.10" }'>
		<div class="site-nav-bd" id="J_SiteNavBd">
			<span id="id_span"></span>
			<ul class="site-nav-bd-r" id="J_SiteNavBdR" data-spm-ab="2">

				<li class="site-nav-menu site-nav-home" id="J_SiteNavHome"
					data-spm="1581860521" data-name="home">
					<div class="site-nav-menu-hd">
						<a href="index.jsp" target="_top"> <span>淘宝网首页</span>
						</a>

					</div>

				</li>

				<li
					class="site-nav-menu site-nav-mytaobao site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavMytaobao" data-spm="1997525045" data-name="mytaobao">
					<div class="site-nav-menu-hd">
						<a href="MyTaobao.jsp" target="_top"> <span>我的淘宝</span>
						</a>

					</div>

				</li>

				<li
					class="site-nav-menu site-nav-cart site-nav-menu-empty site-nav-multi-menu J_MultiMenu mini-cart menu"
					id="J_MiniCart" data-spm="1997525049" data-name="cart">
					<div class="site-nav-menu-hd">
						<a id="mc-menu-hd" href="${pageContext.request.contextPath}/carts/showCarts" target="_blank"> <span
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
						<a href="FavoritesGoods.jsp" target="_top"> <span
							class="site-nav-icon"></span> <span>收藏夹</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon"></span></span>

					</div>

					<div class="site-nav-menu-bd site-nav-menu-list">
						<div class="site-nav-menu-bd-panel menu-bd-panel">

							<a href="FavoritesGoods.jsp" target="_top">收藏的宝贝</a> <a
								href="FavoritesShops.jsp" target="_top">收藏的店铺</a>

						</div>
					</div>
				</li>

				<li class="site-nav-pipe">|</li>

				<li
					class="site-nav-menu site-nav-seller site-nav-multi-menu J_MultiMenu"
					id="J_SiteNavSeller" data-spm="1997525073" data-name="seller">
					<div class="site-nav-menu-hd">
						<a href="Sellers.jsp" target="_top"> <span>卖家中心</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon"></span></span>

					</div>

					<div class="site-nav-menu-bd site-nav-menu-list">
						<div class="site-nav-menu-bd-panel menu-bd-panel">

							<a href="kaidian.jsp" target="_top">免费开店</a>

						</div>
					</div>

				</li>

			</ul>

		</div>
	</div>

	<header class="mt-header" data-spm="a210b"> <article>
	<div class="mt-logo" style="margin-left: 0px;">
		<a title="我的淘宝" class="mt-tblogo" href="MyTaobao.jsp"
			data-spm="d1000351"></a>
	</div>
	<nav class="mt-nav">
	<ul id="J_MtMainNav">
		<li class="selected"><a href="#" data-spm="d1000352">我的订单</a> <i
			class="mt-arrow"></i></li>

	</ul>
	</nav> </article> </header>
	<br>
	<br>
	<center>
		<div style="width: 63%;">
			<div class="row" style="width: 100%; text-align: right">
				<button onclick="openIsDelModal()" class="btn btn-default">订单回收站</button>
			</div>
			<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#" onclick="selectOrders(0)">所有订单</a></li>
						<li><a href="#" onclick="selectOrders(1)">待发货</a></li>
						<li><a href="#" onclick="selectOrders(2)">待收货</a></li>
						<li><a href="#" onclick="selectOrders(3)">待评价</a></li>
					</ul>

				</div>

			</div>

			</nav>



			<div class="row" style="width: 100%;">
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

			<div id="orderDiv" class="row" style="width: 100%;"></div>

		</div>

		<!-- 订单回收站模态框 -->
		<div class="modal fade" id="isDelModal">
			<div class="modal-dialog" style="width: 63%">
				<div class="modal-content">
					<div class="modal-header" style="height: 40px">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						</h4><h4 class="modal-title">订单回收站</h4>
					</div>
					<div class="modal-body" id="isDelOrders" style="width: 100%">
						<div class="row" style="width: 100%;">
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
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 评价模态框 -->
		<div class="modal fade" id="appraisesModal">
			<div class="modal-dialog" style="width: 50%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title"><font size="5">评价</font></h4>
					</div>
					<div class="modal-body">
					<input type="hidden" id="orderId_txt">
					<input type="hidden" id="orderStatus_txt">
					<input type="hidden" id="goodsId_txt">
					<div class="row">
						<div class="col-lg-4 col-sm-4"><font size="5">商品评分：</font></div>
						<div class="col-lg-8 col-sm-8">
							<div id="star_grade"></div><br>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-sm-4"><font size="5">服务评分：</font></div>
						<div class="col-lg-8 col-sm-8">
							<div id="star_grade1"></div><br>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-sm-4"><font size="5">物流评分：</font></div>
						<div class="col-lg-8 col-sm-8">
							<div id="star_grade2"></div><br>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-sm-4"><font size="5">评价内容：</font></div>
						<div class="col-lg-8 col-sm-8">
							<textarea cols="110" rows="9" id="content"></textarea>
						</div>
					</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="addAppraises()">提交评价</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</center>
</body>
</html>