<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的淘宝</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!--我的淘宝图片-->
<link rel="apple-touch-icon" sizes="72x72"
	href="//img.alicdn.com/tps/i1/T11naSFbdaXXcCcBHm-72-72.png" />
<link rel="stylesheet"
	href="//g.alicdn.com/??kg/global-util/1.0.6/index-min.css,kg/tb-nav/2.4.1/index-min.css">
<script
	src="//g.alicdn.com/??kissy/k/1.4.16/seed-min.js,kg/kmd-adapter/0.1.5/index.js,kg/kmd-adapter/0.1.5/util.js,kg/global-util/1.0.7/index-min.js,tb/tracker/4.0.1/p/index/index.js,kg/tb-nav/2.5.4/index-min.js"></script>
<script>
			KISSY.config({
				modules: {
					'flash': {
						alias: ['gallery/flash/1.0/']
					}
				}
			});
			KISSY.use('kg/global-util/1.0.7/');
			KISSY.config({
				modules: {
					'kg/tb-nav': {
						alias: 'kg/tb-nav/2.5.4/',
						requires: ['kg/global-util/1.0.7/']
					}
				}
			});
			KISSY.ready(function() {
				KISSY.use('kg/tb-nav')
			});
		</script>
<link rel="stylesheet"
	href="//g.alicdn.com/tb/mytaobao/5.1.4/pages/home/init.css"
	type="text/css" />
<script type="text/javascript">
			KISSY.add("util", [], function(S, require, exports, module) {
				module.exports = S;
			});
			window.MC = {
				"packagesBase": "//g.alicdn.com/tb/mytaobao/5.1.4/"
			};

			var __MT_MENU_FLAGS = {
				"enableFetchRemoteMenu": true,
				"showB2BMenu": true
			};
		</script>
<script type="text/javascript"
	src="//g.alicdn.com/tb/??mytaobao/5.1.4/components/common/package-config.js,mytaobao/5.1.4/deps.js"></script>
<script type="text/javascript"
	src="//g.alicdn.com/mtb/lib-mtop/2.3.14/mtop.js"></script>
<link rel="stylesheet"
	href="//g.alicdn.com/tb/mtbframe/2.0.2/pages/home/base.css">
<script type="text/javascript"
	src="//g.alicdn.com/tb/mtbframe/2.0.4/components/common/base.js"></script>

</head>

	<script type="text/javascript">
		$(function() {
			$.ajax({
				url:"myTaobao/selectAddress",
				dataType:"json",
				success:function(data){
					for (i = 0; i < data.length; i++) {
						$("#addressDiv").append("<div class='row'>"
								+"<div class='col-lg-2 col-md-2 col-sm-2'>"+data[i].userName+"</div>"
								+"<div class='col-lg-4 col-md-4 col-sm-4'>"+data[i].userAddress+"</div>"
								+"<div class='col-lg-2 col-md-2 col-sm-2'>"+data[i].userPhone+"</div>"
								+"<div class='col-lg-2 col-md-2 col-sm-2'><button class='btn btn-default btn-xs' onclick='selectOneAddress("+data[i].addressId+")'>修改</button> | <button class='btn btn-default btn-xs' onclick='deleteAddress("+data[i].addressId+")'>删除</button></div>"
								+"<div class='col-lg-2 col-md-2 col-sm-2'><c:if test='"+data[i].isDefault+"==1'>默认地址</c:if></div>"
								+"</div>");
					}
				}
			})
		});
		
		function insertAddress() {
			$.ajax({
				url:"myTaobao/updateAddress",
				data:{
					"userName":$("#insert_userName").val(),
					"userPhone":$("#insert_userPhone").val(),
					"userAddress":$("#insert_userAddress").val(),
					"isDefault":0,
					"users.userId":1
				},
				success:function(data){
					alert(data);
					$("#insertModal").modal("hide");
					location.reload();
				}
			})
		};
		
		function selectOneAddress(addressId) {
			$.ajax({
				url:"myTaobao/selectOneAddress?addressId="+addressId,
				dataType:"json",
				success:function(data){
					$("#update_addressId").val(data.addressId);
					$("#update_userName").val(data.userName);
					$("#update_userAddress").val(data.userAddress);
					$("#update_userPhone").val(data.userPhone);
					$("#updateModal").modal();
				}
			})
		}
		
		function updateAddress() {
			$.ajax({
				url:"myTaobao/updateAddress",
				data:{
					"addressId":$("#update_addressId").val(),
					"userName":$("#update_userName").val(),
					"userAddress":$("#update_userAddress").val(),
					"userPhone":$("#update_userPhone").val(),
					"isDefault":0,
					"users.userId":1
				},
				success:function(data){
					alert(data);
					$("#updateModal").modal("hide");
					location.reload();
				}
			})
		};
		
		function deleteAddress(addressId) {
			$.ajax({
				url:"myTaobao/deleteAddress?addressId="+addressId,
				success:function(data){
					alert(data);
					location.reload();
				}
			})
		};
		
		function openInsertModal() {
			$("#insertModal").modal();
		}
		
	</script>

<body>
	<div class="site-nav site-nav-status-logout" id="J_SiteNav"
		data-component-config='{ "cart": "0.0.6","message": "3.4.6","umpp": "1.5.4","mini-login": "6.3.8","tb-ie-updater": "0.0.4","tbar": "2.1.0","tb-footer": "1.1.6","sidebar": "1.0.10" }'
		data-tbar='{ "show":true, "miniCart": "2.12.2","paramsBlackList": "_wt,seeyouagain1722","my_activity": "https:&#x2F;&#x2F;market.m.taobao.com&#x2F;apps&#x2F;abs&#x2F;5&#x2F;38&#x2F;my12?psId=58386&amp;pcPsId=58388", "venueUrl": "https:&#x2F;&#x2F;1212.taobao.com?wh_weex=true&amp;data_prefetch=true&amp;wx_navbar_transparent=true", "helpUrl": "https://consumerservice.taobao.com/online-help", "validTime":{"startTime": 1512057599, "endTime": 1513094400}, "style": {"name": "171212", "path": "kg/sidebar-style-171212/0.0.5/" }, "page":[],"blackList":[],"navDataId":{"tceSid":1182567,"tceVid":0},"pluginVersion":{ "cart":"0.2.0","history":"0.2.0","redpaper":"0.0.8","gotop":"0.2.5","help":"0.2.1","ww":"0.0.3","pagenav":"0.0.27","myasset":"0.0.9","my1212":"0.0.1","my1111":"0.2.2"}}'>
		<div class="site-nav-bd" id="J_SiteNavBd">

			<ul class="site-nav-bd-l" id="J_SiteNavBdL" data-spm-ab="1">

				<li class="site-nav-menu site-nav-login" id="J_SiteNavLogin"
					data-name="login" data-spm="754894437">
					<div class="site-nav-menu-hd">
						<a
							href="//login.taobao.com/member/login.jhtml?f=top&redirectURL=https%3A%2F%2Fwww.taobao.com%2F"
							target="_top"> <span>亲，请登录</span>
						</a>

					</div>

				</li>

			</ul>

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

	<header class="mt-header" data-spm="a210b"> <article>
	<div class="mt-logo" style="margin-left: 0px;">
		<a title="我的淘宝"
			href="//i.taobao.com/my_taobao.htm?nekot=1470211439696&amp;tracelog=newmytb_logodianji"
			class="mt-tblogo" data-spm="d1000351"></a>
	</div>
	<nav class="mt-nav">
	<ul id="J_MtMainNav">
		<li class="selected"><a
			href="MyTaobao.jsp"
			data-spm="d1000352">首页</a> <i class="mt-arrow"></i></li>
	</ul>
	</nav> </article> </header>

	<br>
	<br>

	<center>
		<div style="width: 62%">
			<div style="text-align: left">
				<button class="btn btn-default" onclick="openInsertModal()">新增收货地址</button>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-2">收货人</div>
						<div class="col-lg-4 col-md-4 col-sm-4">收货地址</div>
						<div class="col-lg-2 col-md-2 col-sm-2">电话</div>
						<div class="col-lg-2 col-md-2 col-sm-2">操作</div>
						<div class="col-lg-2 col-md-2 col-sm-2"></div>
					</div>
				</div>
				<div class="panel-body" id="addressDiv"></div>
			</div>
		</div>
	</center>
	
	<!-- 添加模态框 -->
	<div class="modal fade" id="insertModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增收货地址</h4>
				</div>
				<div class="modal-body">
					
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">收货人:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="insert_userName" style="width: 70%" >
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">收货地址:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="insert_userAddress" style="width: 70%" >
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">电话:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="insert_userPhone" style="width: 70%" >
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="insertAddress()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改模态框 -->
	<div class="modal fade" id="updateModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改收货地址</h4>
				</div>
				<div class="modal-body">
					
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">编号:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="update_addressId" style="width: 70%" readOnly>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">收货人:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="update_userName" style="width: 70%" >
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">收货地址:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="update_userAddress" style="width: 70%" >
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-3 col-sm-3" style="text-align: right">电话:</div>
						<div class="col-lg-9 col-sm-9">
							<input type="text" id="update_userPhone" style="width: 70%" >
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="updateAddress()">提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>