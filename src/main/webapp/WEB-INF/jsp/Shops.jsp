<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function fun1() {
		var a = $("input[name='b2']").get(0).checked == true ? "s" : "d";
		if (a == "s") {
			location.href = "${pageContext.request.contextPath}/Goods/queryAll?goodsName="
					+ $("#Name").val();
		}else{
			location.href="Shops/queryAll?shopName="+$("#Name").val();
		}
	}
</script>
</head>
<body>
<center>
<div class="container">
			<div class="row"
				style="background-color: lavender; height: 40px; font-family: 'arial black';">
				<div class="col-md-2">
					<a href="">亲，请登录</a>
				</div>
				<div class="col-md-1">
					<a href="">免费注册</a>
				</div>
				<div class="col-md-5"></div>
				<div class="col-md-1">
					<a href="">我的淘宝</a>
				</div>
				<div class="col-md-1">
					<a href="">购物车</a>
				</div>
				<div class="col-md-1">
					<a href="">收藏夹</a>
				</div>
				<div class="col-md-1">
					<a href="">卖家中心</a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" style="text-align: center;">
				<div class="col-md-5">
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
											style="height: 40px; width: 400px;" id="Name">
									</div>
									<button type="button" class="btn btn-warning "
										style="height: 40px; width: 100px;" onclick="fun1();">搜索</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
<table width="1180px" >
			<tr align="center">
				<c:forEach items="${sl}" var="sl" varStatus="s">
					<td width=""><a href=""><img src="${pageContext.request.contextPath}/${sl.shopImg}"></a><br/>
							<a href="">${sl.shopName}</a>
							</td>
					<c:if test="${(s.index+1) %6==0}">
			</tr>
			<tr align="center">
				</c:if>
				</c:forEach>
			</tr>
			</table>

</center>
</body>
</html>