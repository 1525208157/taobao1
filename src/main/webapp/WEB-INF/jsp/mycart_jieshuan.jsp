<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>


<body>
<div id="d11" class="container">
<div class="row">
		<div class="col-lg-1 col-md-1" id="d1"></div>
		
		
		<div class="col-lg-10 col-md-10" id="d2">
		<br><br><br><br>
		 <div class="row">
		
		 <div class="col-lg-2 col-md-2" >确认收货地址:</div>
		 <div class="col-lg-8 col-md-8" ></div>
		 <div class="col-lg-2 col-md-2" ><a onclick="cheshi()">管理收货地址</a></div>
		 </div>
		 <div class="row"> <hr style="height:2px;border:none;border-top:2px dotted #185598;"></div>
		<div class="row">
		<div class="col-lg-1 col-md-1" > 寄货至:</div>
		<div class="col-lg-9 col-md-9" >  
	      <c:forEach items="${address}" var="addr">
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      <input type="radio" name="addrs" value="${addr.addressId}" >&nbsp;&nbsp;&nbsp;&nbsp;
	      &nbsp;${addr.userAddress}&nbsp;
	      &nbsp;&nbsp;(${addr.userName}收)&nbsp;&nbsp;&nbsp;${addr.userPhone}&nbsp;&nbsp;&nbsp;
	      &nbsp;&nbsp;&nbsp;${addr.isDefault eq 1?"默认地址":""}
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</br><br>
	      </c:forEach>
	      <br> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
	       &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<a>使用新地址</a>
	     </div>
	     <div class="col-lg-2 col-md-2" >
	     <c:forEach items="${address}" var="addr">
	     <a onclick="jieshuan(addr.addressId)">修改本地址</a></br><br>
	     </c:forEach>
	     </div>
		</div>
		<div class="row">
		确定订单信息
		<hr style="height:2px;border:none;border-top:2px dotted #185598;">
		</div>
		<div class="row">
		<div class="col-lg-4 col-md-4" >店铺宝贝</div>
		<div class="col-lg-4 col-md-4" >商品属性</div>
		<div class="col-lg-1 col-md-1" >单价</div>
		<div class="col-lg-2 col-md-2" >数量</div>
		<div class="col-lg-2 col-md-2" >优惠方式</div>
		<div class="col-lg-1 col-md-1" >优惠方式</div>
		<div class="col-lg-2 col-md-2" >优惠方式</div>
		</div>
		
		
		
		
		
		
		
		
		
		</div><!-- 结束 -->
		<div class="col-lg-1 col-md-1" ></div>
		</div>	
</div>
<script type="text/javascript">
/* var a="${address}";
var b="${cart_jieshuan}"; 
console.log(a);
alert(a[0]);

	cart_jieshua();

	
   function cart_jieshua(){
    for(i=0;i<a.length;i++){
	$("#dizhi").append("<input type='radio' name='address_dizhi' value='"+a[i].addressId+"'>"
			+a[i].userAddress+"&nbsp;&nbsp;("+a[i].userName+")&nbsp;"
			+a[i].userPhone+"&nbsp;&nbsp<a>修改本地址</a>"
			)
}
} */

 function cheshi(){
	$.ajax({
		url:"${pageContext.request.contextPath}/carts/cheshi",
		dataType:"json",
		success:function(data){
			alert("21");
			location.reload(); 
			 
		}
		
		
	})
}

</script>
</body>
</html>