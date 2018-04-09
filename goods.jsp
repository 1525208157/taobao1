<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
			url:"shops/queryShops",
			dataType : "json",
			success : function (data) {
				 //alert(data[0].goods[0].goodsId);
		 $.each(//循环遍历数组
						data,
						function(i, d) {//i代表
												for ( j = 0; j < d.goods.length; j++) {
												for ( a = 0; a < d.goods[j].specs.length; a++) {
													$("table")
													.append(
															"<tr><td>"
														+d.goods[j].goodsId
														+"</td><td>"
														+d.goods[j].goodsImg
														+"</td><td>"
														+d.goods[j].goodsName
														+"</td><td>"
														+d.goods[j].isRecom
														+"</td><td>"
														+d.goods[j].saleNum
														+"</td><td>"
														+d.goods[j].saleTime
														+"</td><td>"
														+d.goods[j].goodsIntroduce.introduceId
														+"</td><td>"
														+d.shopId
														+"</td><td>"
														+d.goods[j].specs[a].gStock
														+ "</td><tr>");
												}	
												}	  
											
											
													
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
 		<td>店铺ID</td>
 		<td>商品库存</td>
 	</tr>
 
 </table>


</body>
</html>