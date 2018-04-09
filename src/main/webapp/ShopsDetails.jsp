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
		var shopId = ${param.shopId};
		$.ajax({
			url:"myTaobao/selectShops",
			data:{
				"shopId":shopId
			},
			dataType : "json",
			success:function(data){
				$("#shopRow").append(
						"<div class='col-lg-2 col-sm-2'><a target='_blank' href='ShopsDetails.jsp?shopId="+data.shopId+"'>"
								+ data.shopName
								+ "</a></div>"
								+ "<div class='col-lg-1 col-sm-1'>描述<br>5</div>"
								+ "<div class='col-lg-1 col-sm-1'>服务<br>5</div>"
								+ "<div class='col-lg-1 col-sm-1'>物流<br>5</div>"
								+ "<div class='col-lg-2 col-sm-2'><a target='_blank' href='ShopsDetails.jsp?shopId="+data.shopId+"'><img src="+data.shopImg+"></a></div>"
								+ "<div class='col-lg-5 col-sm-5'><a href='#' onclick='insertFavoritesShop("+data.shopId+")'>收藏店铺</a></div>");
				var num = 0;
				for (i = 0; i < data.goods.length; i++) {
					if (i != 0 && i %4 == 0) {
						num++;
						$("#goodsBody").append("<div class='row' id='d"+num+"'>"
								+"<div class='col-lg-3 col-md-3'>"
								+"<a target='_blank' href='GoodsDetails.jsp?goodsId="+data.goods[i].goodsId+"'><img src='"+data.goods[i].goodsImg+"' width='180' height='160' class='img-rounded'></a>"
								+"<br><a target='_blank' href='GoodsDetails.jsp?goodsId="+data.goods[i].goodsId+"'><font size='4'>"+data.goods[i].goodsName+"</font></a>"
								+"<br><font size='4' color='red'>￥"+data.goods[i].specs[0].smoney+"</font>"
								+"</div>"
								+"</div>");
					}
					if (i < 4) {
						$("#firstRow").append("<div class='col-lg-3 col-md-3'>"
								+"<a target='_blank' href='GoodsDetails.jsp?goodsId="+data.goods[i].goodsId+"'><img src='"+data.goods[i].goodsImg+"' width='180' height='160' class='img-rounded'></a>"
								+"<br><a target='_blank' href='GoodsDetails.jsp?goodsId="+data.goods[i].goodsId+"'><font size='4'>"+data.goods[i].goodsName+"</font></a>"
								+"<br><font size='4' color='red'>￥"+data.goods[i].specs[0].smoney+"</font>"
								+"</div>");
					} else if (i%4 != 0) {
						$("#d"+num).append("<div class='col-lg-3 col-md-3'>"
								+"<a target='_blank' href='GoodsDetails.jsp?goodsId="+data.goods[i].goodsId+"'><img src='"+data.goods[i].goodsImg+"' width='180' height='160' class='img-rounded'></a>"
								+"<br><a target='_blank' href='GoodsDetails.jsp?goodsId="+data.goods[i].goodsId+"'><font size='4'>"+data.goods[i].goodsName+"</font></a>"
								+"<br><font size='4' color='red'>￥"+data.goods[i].specs[0].smoney+"</font>"
								+"</div>");
					}
					
				}
				
			}
		})
	})
	
	
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
		<div class="col-lg-6 col-md-6 col-sm-6" id="goodsBody" style="border: 1px solid;">
			<!-- 店铺信息 -->
			<div class="row" id="shopRow" style="width: 100%;"></div>
			<!-- 商品详情 -->
			<div class="row" id="firstRow"></div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
	</div>
</body>
</html>