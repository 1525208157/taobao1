<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<script type="text/javascript">
	$(function() {
		var goodsId = ${param.goodsId};
		$.ajax({
					url : "myTaobao/selectGoods",
					data : {
						"goodsId" : goodsId
					},
					dataType : "json",
					success : function(data) {
						$("#td_goodsImg").append("<img src="+data.goodsImg+">");
						$("#td_goodsName").append(data.goodsName);
						$("#smoney").append(data.specs[0].smoney);
						$("#saleNum").append(data.saleNum);
						$("#favoritesGood").append("<a href='#' onclick='insertFavoritesGood("+data.goodsId+")'>收藏商品</a>");
						$("#appraisesNum").append(
								"<a href='#' onclick='openAppraisesModal()'>"
										+ data.appraises.length + "</a>");
						$("#introducePanel")
								.append(
										"<div class='row'><div class='col-lg-2' style='text-align: right'>摄像头</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.pixel
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>屏幕尺寸</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.gSize
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>屏幕分辨率</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.resolution
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>网络类型</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.network
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>网络模式</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.gModel
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>cup品牌</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.cpuBrand
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>操作系统</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.gSystem
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>核心数</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.gCore
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>运行内存</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.gMemory
												+ "</div></div>"
												+ "<div class='row'><div class='col-lg-2' style='text-align: right'>手机颜色</div><div class='col-lg-10'>"
												+ data.goodsIntroduce.phoneColor
												+ "</div></div>"

								);

						for (var x = 0; x < data.specs.length; x++) {
							$("#td_specsName")
									.append(
											"<label class='btn btn-default'><input type='radio' name='specsName_btn' onchange='getGStock("
													+ data.specs[x].specsId
													+ ")'>"
													+ data.specs[x].specsName
													+ "</label>");
						}
						for (var y = 0; y < data.appraises.length; y++) {
							$("#appraisesModal").append("<div class='row'><div class='col-lg-7 col-sm-7'>"+data.appraises[y].content+"</div><div class='col-lg-2 col-sm-2'>"+data.appraises[y].appraisesTime+"</div><div class='col-lg-3 col-sm-3'>"+data.appraises[y].users.nickname+"</div></div>");
						}
						for (var z = 0; z < data.goodsColor.length; z++) {
							$("#td_gcName").append(
									"<label class='btn btn-default'><input type='radio' name='gcName_btn'>"
											+ data.goodsColor[z].gcName
											+ "</label>");
						}

						$("#shopRow")
								.append(
										"<div class='col-lg-2 col-sm-2'><a href=''>"
												+ data.shop.shopName
												+ "</a></div>"
												+ "<div class='col-lg-1 col-sm-1'>描述<br>5</div>"
												+ "<div class='col-lg-1 col-sm-1'>服务<br>5</div>"
												+ "<div class='col-lg-1 col-sm-1'>物流<br>5</div>"
												+ "<div class='col-lg-2 col-sm-2'><a href=''><img src="+data.shop.shopImg+"></a></div>"
												+ "<div class='col-lg-5 col-sm-5'><a href='#' onclick='insertFavoritesShop("+data.shop.shopId+")'>收藏店铺</a></div>");

					}

				})
	});

	function addNum() {//控制数量加
		$("#td_num").val(eval($("#td_num").val() + "+1"));
	}

	function minusNum() { //控制数量减
		if ($("#td_num").val() <= 1) {
			$("#minusBtn").attr('disabled', true);
		} else if ($("#td_num").val() > 1) {
			$("#minusBtn").attr('disabled', false);
			$("#td_num").val(eval($("#td_num").val() + "-1"));
		}

	}

	function getGStock(specsId) { //修改单价 库存
		$.ajax({
			url : "myTaobao/selectSpecs",
			data : {
				"specsId" : specsId
			},
			success : function(data) {
				$("#gStock").empty();
				$("#smoney").empty();
				$("#gStock").append(data.gStock);
				$("#smoney").append(data.smoney);

			}
		});
	}
	
	//显示评价模态框
	function openAppraisesModal() { 
		$("#appModal").modal();
	}
	
	//添加收藏商品
	function insertFavoritesGood(goodsId) {
		var userId = "${users.userId }";
		if (userId == "") {
			alert("请先登录！");
		} else {
			$.ajax({
				url : "myTaobao/insertFavoritesGood",
				data : {
					"goodsId":goodsId,
					"userId":userId
				},
				success : function(data) {
					if (data == 0) {
						alert("该商品已存在于收藏夹中！");
					} else if (data == 1) {
						alert("收藏成功！");
					}
				}
			});
		}
		
	}
	
	//添加收藏店铺
	function insertFavoritesShop(shopId) {
		var userId = "${users.userId }";
		if (userId == "") {
			alert("请先登录！");
		} else {
			$.ajax({
				url : "myTaobao/insertFavoritesShop",
				data : {
					"shopId":shopId,
					"userId":userId
				},
				success : function(data) {
					if (data == 0) {
						alert("该店铺已存在于收藏夹中！");
					} else if (data == 1) {
						alert("收藏成功！");
					}
				}
			});
		}
		
	}
	
</script>

<body>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
		<div class="col-lg-6 col-md-6 col-sm-6">
			<!-- body -->

			<div class="row" id="shopRow" style="width: 100%;"></div>

			<div class="row" style="width: 100%;">
				<table border="1" width="100%">
					<tr>
						<td rowspan="6" width="40%" id="td_goodsImg" height="400px"></td>
						<!-- 商品图片 -->
						<td colspan="2" id="td_goodsName"></td>
						<!-- 商品名称 -->
					</tr>
					<tr>
						<td width="15%">价格</td>
						<td><font size="5" color="red" id="smoney"></font></td>
					</tr>
					<tr>
						<td colspan="2" id="td_saleNum">总销量<font id="saleNum"
							color="red"></font>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;评价<font
							id="appraisesNum" color="red"></font></td>
						<!-- 销量、评价 -->
					</tr>
					<tr>
						<td>机身颜色</td>
						<td>
							<div class="btn-group" data-toggle="buttons" id="td_gcName"></div>
						</td>
					</tr>
					<tr>
						<td>存储容量</td>
						<td>
							<div class="btn-group" data-toggle="buttons" id="td_specsName"></div>
						</td>
					</tr>
					<tr>
						<td>数量</td>
						<td>
							<button type="button" id="addBtn" class="btn btn-dafault"
								onclick="addNum()">
								<i class="glyphicon glyphicon-plus"></i>
							</button> <input type="text" value="1" size="2" id="td_num">
							<button type="button" id="minusBtn" class="btn btn-dafault"
								onclick="minusNum()">
								<i class="glyphicon glyphicon-minus"></i>
							</button> &nbsp;&nbsp;&nbsp;库存<font id="gStock"></font>
						</td>
					</tr>
					<tr>
						<td align="center" id="favoritesGood"></td>
						<td colspan="2">
							<button type="button" class="btn btn-danger">加入购物车</button>&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger">购买</button>
						</td>
					</tr>
				</table>
			</div>

			<div class="row">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#">商品详情</a></li>
				</ul>
			</div>
			<div class="row" style="width: 100%;">
				<div class="panel panel-default">
					<div class="panel-heading">详细介绍</div>
					<div class="panel-body" id="introducePanel"></div>
				</div>
			</div>
			
			<!-- 评价模态框 -->
			<div class="modal fade" id="appModal">
				<div class="modal-dialog" style="width: 50%">
					<div class="modal-content">
						<div class="modal-header">
							
							<h4 class="modal-title">
							<div class="row">
								<div class="col-lg-7 col-md-8 col-sm-7">评价内容</div>
								<div class="col-lg-2 col-md-2 col-sm-2">评价时间</div>
								<div class="col-lg-2 col-md-2 col-sm-2">评价人</div>
								<div class="col-lg-1 col-md-1 col-sm-1"><button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button></div>
								
							</div>
							</h4>
						</div>
						<div class="modal-body" id="appraisesModal">
							
						</div>
						
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			
		</div>
		<!-- body结束 -->


		<div class="col-lg-3 col-md-3 col-sm-3"></div>
	</div>

</body>
</html>