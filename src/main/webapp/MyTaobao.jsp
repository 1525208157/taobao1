<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的淘宝</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<style>
		#id_span {
			position: absolute;
			top: 10px;
		}
	</style>

<!--我的淘宝图片-->
<link rel="apple-touch-icon" sizes="72x72"
	href="//img.alicdn.com/tps/i1/T11naSFbdaXXcCcBHm-72-72.png" />
<link rel="stylesheet"
	href="//g.alicdn.com/??kg/global-util/1.0.6/index-min.css,kg/tb-nav/2.4.1/index-min.css">
<script
	src="//g.alicdn.com/??kissy/k/1.4.16/seed-min.js,kg/kmd-adapter/0.1.5/index.js,kg/kmd-adapter/0.1.5/util.js,kg/global-util/1.0.7/index-min.js,tb/tracker/4.0.1/p/index/index.js,kg/tb-nav/2.5.4/index-min.js"></script>
<link rel="stylesheet"
	href="//g.alicdn.com/tb/mtbframe/2.0.2/pages/home/base.css">
<script type="text/javascript"
	src="//g.alicdn.com/tb/mtbframe/2.0.4/components/common/base.js"></script>

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
</head>

<script type="text/javascript">
		//显示修改密码模态框
		function openUpdatePassModal() {
			$("#updatePass").modal();
		}
		
		//验证账号密码是否正确
		function validationUser() {
			if ($("#account").val() == account && $("#password").val() == password) {
				$("#visDiv").attr("style","visibility:hidden;");
				$("#hidDiv").attr("style","visibility:visible;");
			} else {
				alert("账号或密码错误");
			}
			
		};
		
		//判断账号密码是否为空
		$(isNull); //页面加载判定
		function isNull() {
			var userId = "${users.userId }";
			var account = "${users.account }";
			var password = "${users.password }";
			var nickname = "${users.nickname }";
			var userImg = "${users.userImg }";
			
			if (userId == "") {
				location.href="Login.jsp";
			}
			
			$("#id_span").append("<img src='" + userImg + "' width='20px' height='20px' class='img-circle' width>" + nickname);
			
			
			if ($("#account").val() == "" || $("#password").val() == "") {
				$("#nextBtn").attr('disabled',true);
			} else {
				$("#nextBtn").attr('disabled',false);
			}
			
		}
		
		//修改密码
		function updatePass() {
			if ($("#update_password").val() == "") {
				alert("请输入新密码！");
			} else {
				if ($("#update_password").val() != $("#update_pass").val()) {
					alert("两次密码不一致！");
				} else {
					$.ajax({
						url:"myTaobao/updatePass?userId="+userId+"&password="+$("#update_password").val(),
						success:function(data){
							alert(data);
							$("#updatePass").modal("hide");
							location.reload();
						}
					});
				}
			}	
		}
		
	</script>

<body data-spm="1">
	<div class="site-nav site-nav-status-logout" id="J_SiteNav"
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
						<a href="FavoritesGoods.jsp" target="_top"> <span
							class="site-nav-icon">&#xe604;</span> <span>收藏夹</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

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
					id="J_SiteNavSeller" data-name="seller" data-spm="1997525073">
					<div class="site-nav-menu-hd">
						<a href="Sellers.jsp" target="_top"> <span>卖家中心</span>
						</a> <span class="site-nav-arrow"><span class="site-nav-icon">&#xe605;</span></span>

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
		<a title="我的淘宝" href="" class="mt-tblogo" data-spm="d1000351"></a>
	</div>
	<nav class="mt-nav">
	<ul id="J_MtMainNav">
		<li class="selected"><a href="MyTaobao.jsp" data-spm="d1000352">首页</a>
			<i class="mt-arrow"></i></li>
		<li class="J_MtNavSubTrigger"><a class="mt-nav-parent"
			href="//member1.taobao.com/member/fresh/account_security.htm?tracelog=mytaobaonavsetup&amp;nekot=1470211439696"
			data-spm="d1000356">账户设置<i><em></em><s></s></i></a> <i
			class="mt-arrow"></i>
			<div class="J_MtNavSub mt-nav-sub hide">
				<div class="mt-nav-arr"></div>
				<dl class="mt-nav-sub-col1">
					<dt>安全设置</dt>
					<dd>
						<p>
							<a data-spm="11" href="#" onclick="openUpdatePassModal()">修改登录密码</a>
						</p>
					</dd>
				</dl>
				<dl class="mt-nav-sub-col2">
					<dt>个人资料</dt>
					<dd>
						<p>
							<a data-spm="8" href="Address.jsp">收货地址</a>
						</p>
					</dd>
				</dl>

			</div></li>
	</ul>
	
	</nav> </article> </header>
	<!-- end ems/mytaobao/header -->
	<div id="layout-center">
		<div class="grid-c2">
			<div id="J_Col_Main" class="col-main">
				<div class="main-wrap">

					<div class="mt-ml-c1">
						<div class="mt-ml-shim">

							<div class="m-userinfo" data-spm="972272805">
								<div class="s-userbar s-bar" style="padding-top: 10px;">
									<div class="s-baseinfo">
										<div target="_blank" class="s-avatar" data-spm="d4911997">
											<img
												src="//wwc.alicdn.com/avatar/getAvatar.do?userId=2116339787&amp;width=160&amp;height=160&amp;type=sns">
										</div>
										<div class="s-name">
											<a data-spm="d4912005" target="_blank"
												href="//i.taobao.com/user/baseInfoSet.htm?spm=a310q.2219005.0.0.ncBmVr">
												<em>无知丶</em> ()
											</a>
										</div>

									</div>
									<ul class="s-my-stuffs">

										<li><a href="Address.jsp" target="_blank"
											data-spm="d4912033" class="J_DropTrigger i-trigger">我的收货地址</a>
										</li>
									</ul>
								</div>
								<div class="s-my-counts s-content">
									<ul>
										<li><a data-spm="d4919660" target="_blank"
											href="//buyertrade.taobao.com/trade/itemlist/list_bought_items.htm?action=itemlist/BoughtQueryAction&event_submit_do_query=1&tabCode=waitPay"><span>待付款</span></a>
										</li>
										<li><a data-spm="d4919661" target="_blank"
											href="//buyertrade.taobao.com/trade/itemlist/list_bought_items.htm?action=itemlist/BoughtQueryAction&event_submit_do_query=1&tabCode=waitSend"><span>待发货</span></a>
										</li>
										<li><a data-spm="d4919662" target="_blank"
											href="//buyertrade.taobao.com/trade/itemlist/list_bought_items.htm?action=itemlist/BoughtQueryAction&event_submit_do_query=1&tabCode=waitConfirm"><span>待收货<em>2</em></span></a>
										</li>
										<li><a data-spm="d4919663" target="_blank"
											href="//buyertrade.taobao.com/trade/itemlist/list_bought_items.htm?action=itemlist/BoughtQueryAction&event_submit_do_query=1&tabCode=waitRate"><span>待评价<em>1</em></span></a>
										</li>
										<li><a data-spm="d4919664" target="_blank"
											href="//refund.taobao.com/refund_list.htm"><span>退款</a></span>
										</li>
									</ul>
								</div>
							</div>

							<div data-spm="1998049142"
								class="m-logistics g-box-base g-mb-set">
								<div class="s-bar">
									<i class="s-icon"></i>我的物流
								</div>
								<div class="s-content">
									<ul class="lg-list">

										<li class="lg-item">
											<div class="item-info">
												<a data-spm="d4919535" target="_blank"
													href="//buyertrade.taobao.com/trade/detail/trade_item_detail.htm?bizOrderId=139307624846338797&tracelog=yimaidaopic">
													<img
													src="//img.alicdn.com/bao/uploaded/i3/2176952686/TB2cB5ToB4lpuFjy1zjXXcAKpXa_!!2176952686.jpg_120x120xz.jpg"
													alt="南极人皮肤衣男女户外超薄防晒服情侣款春夏季透气运动风衣防晒衣" />
												</a>

											</div>
											<div class="lg-info">

												<p>卖家发货</p>
												<time>2018-03-23 08:57:24</time>

											</div>
											<div class="lg-confirm">
												<a data-spm="d4919529" target="_blank" class="i-btn-typical"
													href="//buyertrade.taobao.com/trade/confirm_goods.htm?biz_order_id=139307624846338797&tracelog=yimaidaocheck">确认收货</a>
											</div>
										</li>

									</ul>

								</div>

							</div>

							<div class="m-guess-you-like" data-spm="1998049143">
								<div class="s-bar">
									根据浏览，猜我喜欢 <a class="i-load-more-item-shadow hide"
										data-spm-click="gostr=/sns;locaid=d4919531;" href="#"><i>&#xe63e;</i>换一组</a>
								</div>
								<div class="s-content">
									<div class="s-inner-content">
										<div class="s-item-list clearfix">
											<div class="s-item-data-loading"></div>
										</div>
										<div class="s-more-btn i-load-more-item hide" data-screen="1">
											<i>&#xe63e;</i>换一组
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="mt-ml-toolbar J_MTToolBar">
						<div class="s-tool-tab">
							<a class="s-tool-btn J_ToolBtn"
								data-for=".J_Calendar,.J_SUniverse" href="#"><i
								class="s-tool-icon">&#xe636;</i><br />我<br />的<br />日<br />历<br />
							<i class="s-tool-count">2</i></a>
						</div>
					</div>
					<div class="mt-ml-c2">

						<div data-spm="1998056009"
							class="g-box-base m-calendar J_Calendar i-toobar-con">

							<div class="s-bar">
								<a data-spm-click="gostr=/sns;locaid=d4919643;"
									data-spm="d4919643" class="i-history-trigger s-icon" href="#"></a>我的日历
							</div>
							<div class="s-content">
								<div class="i-maskself J_CalendarMask"></div>
								<div class="s-care s-care-noweather">
									<div class="s-date">
										<em>23</em> <span>星期五</span> <span>2018.03</span>
									</div>

								</div>
								<a href=""> <img border="0"
									src="https://img.alicdn.com/simba/img/TB1FPLqX1ySBuNjy1zdSutPxFXa.jpg"
									width="300px" height="125px">
								</a> <a href=""> <img border="0"
									src="https://img.alicdn.com/simba/img/TB1FPLqX1ySBuNjy1zdSutPxFXa.jpg"
									width="300px" height="125px">
								</a>
							</div>
						</div>

					</div>

				</div>
			</div>
			<section id="J_Col_Sub" class="col-sub">

			<div id="J_EMS" style="width: 0; height: 0;"></div>
			<aside class="mt-menu" id="J_MtSideMenu">
			<div class="mt-menu-tree">
				<dl class="mt-menu-item" data-spm="a2109">
					<dt class="fs14">全部功能</dt>
					<dd>
						<a href="${pageContext.request.contextPath}/carts/showCarts"
							target="_blank" role="menuitem" data-spm="d1000367">我的购物车</a>
					</dd>
					<dd class="mt-menu-sub fold J_MtSideTree">
						<!--<b class="mt-indicator J_MtIndicator">-</b>-->
						<a id="bought" href="Order.jsp" data-spm="d1000368">我的订单</a>
					</dd>
					<dd id="favorite1">
						<a href="FavoritesGoods.jsp" data-spm="d1000374">收藏商品</a>
					</dd>
					<dd id="favorite2">
						<a href="FavoritesShops.jsp" data-spm="d1000374">收藏店铺</a>
					</dd>

				</dl>

			</div>
			</aside> </section>
		</div>
	</div>

	<!-- 修改密码模态框 -->
	<div class="modal fade" id="updatePass">
		<div class="modal-dialog" style="width: 50%;">
			<div class="modal-content" style="height: 320px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改密码</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div id="visDiv" class="col-lg-6 col-sm-6">
							<br>
							<br>
							<div class="row">
								<div class="col-lg-3 col-sm-3" style="text-align: right">
									<font size="4" style="font-family: SimHei;">账号:</font>
								</div>
								<div class="col-lg-9 col-sm-9">
									<input type="text" id="account"
										style="width: 90%; height: 28px" onchange="isNull()">
								</div>
							</div>
							<br>
							<br>
							<div class="row">
								<div class="col-lg-3 col-sm-3" style="text-align: right">
									<font size="4" style="font-family: SimHei;">原密码:</font>
								</div>
								<div class="col-lg-9 col-sm-9">
									<input type="password" id="password"
										style="width: 90%; height: 28px" onchange="isNull()">
								</div>
							</div>
							<br>
							<br>
							<div style="text-align: center">
								<button type="button" id="nextBtn" onclick="validationUser()"
									class="btn btn-default">下一步</button>
							</div>
						</div>
						<div id="hidDiv" class="col-lg-6 col-sm-6"
							style="visibility: hidden;">
							<br>
							<br>
							<div class="row">
								<div class="col-lg-3 col-sm-3" style="text-align: right">
									<font size="4" style="font-family: SimHei;">新密码:</font>
								</div>
								<div class="col-lg-9 col-sm-9">
									<input type="password" id="update_password"
										style="width: 90%; height: 28px">
								</div>
							</div>
							<br>
							<br>
							<div class="row">
								<div class="col-lg-3 col-sm-3" style="text-align: right">
									<font size="4" style="font-family: SimHei;">确认密码:</font>
								</div>
								<div class="col-lg-9 col-sm-9">
									<input type="password" id="update_pass"
										style="width: 90%; height: 28px">
								</div>
							</div>
							<br>
							<br>
							<div style="text-align: center;">
								<button type="button" class="btn btn-default"
									onclick="updatePass()">提交</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>