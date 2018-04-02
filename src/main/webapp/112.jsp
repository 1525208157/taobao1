 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"> </script>
</head>
<body>
<script type="text/javascript">
	 function goods() {
		
		$.ajax({
			url:"orders/selectOrders",
			dataType : "json",
			success : function (data) {
		$
				.each(//循环遍历数组
						data,
						function(i, d) {//i代表
							$("table")
									.append(
											"<tr><td>"
						 							+ d.orderGoods.specs.sGoods.goodsId
													+ "</td><td>"
													+ d.orderGoods[0].specs.sGoods.goodsImg
													/* + "</td><td>"
													+ d.goods[0].goodsName
													+ "</td><td>"
													+ d.goods[0].isRecom
													+ "</td><td>"
													+ d.goods[0].saleNum
													+ "</td><td>"
													+ d.goods[0].saleTime
													 + "</td><td>"
													+ d.goods[0].goodsIntroduce.introduceId
													+ "</td><td>"
													+ d.goods[0].lastType.typeId
												 	+ "</td><td>" 
													+ d.shopId																																	
												 	 + "</td><td>"
													+ d.goods[0].specs[0].gStock */     
													+ "</td><tr>")
				
						});
			}
			
				
			});
			
	
	}

	goods(); 

	
	
	

</script>

 <table border="1">
 	<tr>
 		<td>商品编号</td>
 		<td>图片</td>
 		<td>商品名称</td>
 		<td>是否推荐</td>
 		<td>商品总销量</td>
 		<td>上架时间</td>
 		<td>商品介绍</td>
 		<td>商品类型编号</td>
 		<td>店铺ID</td>
 		<td>商品库存</td>
 	</tr>
 
 </table>
</body>
</html>