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
		$.ajax({
			url:"myTaobao/selectGoods",
			data:{
				"goodsId":1
			},
			dataType:"json",
			success:function(data){
					for (var c = 0; c < data.specs.length; c++) {
						
					}
					for (var j = 0; j < data.appraises.length; j++) {
						
					}
					for (var x = 0; x < data.goodsColor.length; x++) {
							
					}
					
					$("#shopRow").append("<div class='col-lg-2 col-sm-2'><a href=''>"+data.shop.shopName+"</a></div>"
							+"<div class='col-lg-1 col-sm-1'>描述<br>5</div>"
							+"<div class='col-lg-1 col-sm-1'>服务<br>5</div>"
							+"<div class='col-lg-1 col-sm-1'>物流<br>5</div>"
							+"<div class='col-lg-2 col-sm-2'><a href=''><img src="+data.shop.shopImg+"></a></div>"
							+"<div class='col-lg-5 col-sm-5'><button class='btn btn-default'>添加收藏</button></div>"
					);
					
						
			}
			
		})
	});
	
	
</script>

<body>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
		<div class="col-lg-6 col-md-6 col-sm-6" id="goodsBody"><!-- body -->
			
			<div class="row" id="shopRow" style="width: 100%;border: 1px solid;"></div>
			<div class="row" style="width: 100%;">
			<table border="1" width="100%">
				<tr>
					<td rowspan="7" width="40%"></td><!-- 商品图片 -->
					<td colspan="2" align="center">商品名称</td><!-- 商品名称 -->
				</tr>
				<tr>
					<td width="15%">价格</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center">销量、评价</td><!-- 销量、评价 -->
				</tr>
				<tr>
					<td>机身颜色</td>
					<td></td>
				</tr>
				<tr>
					<td>存储容量</td>
					<td></td>
				</tr>
				<tr>
					<td>数量</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" align="center">购买、加入购物车</td><!-- 购买、加入购物车 -->
				</tr>
			</table>
			</div>
		</div><!-- body结束 -->
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
	</div>
</body>
</html>