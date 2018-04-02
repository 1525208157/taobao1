<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"> </script>
</head>
<body>

<script type="text/javascript">
	 function goodsShop() {
		
		$.ajax({
			url:"odersGoods/selectordergoods",
			dataType : "json",
			success : function (data) {
		$
				.each(//循环遍历数组
						data,
						function(i, d) {//i代表
							$("table")
									.append(
											"<tr><td>"
													+ d.ogId
													+ "</td><td>"
													+ d.specs.sGoods.goodsImg
													+ "</td><td>"
													+ d.specs.sGoods.goodsName
													+ "</td><td>"
													+ d.ogColor.gcName
													+ "</td><td>"
													+ d.goodsNum
													+ "</td><td>"
													+ d.specs.smoney
													+ "</td><tr>")
				
						});
			}		
			});
	}
	 
	 

	 goodsShop(); 

	
	
	

</script>


<table border="1">
		<tr>
 		<td>商品编号</td>
 		<td>图片</td>
 		<td>商品名称</td>
 		<td>商品颜色</td>
 		<td>商品数量</td>
 		<td>商品价格</td>
 		</tr>
</table>
</body>
</html>