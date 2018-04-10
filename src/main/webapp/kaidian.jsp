<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>免费开店</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/verify.js" ></script>
</head>
<body>

<script type="text/javascript">

function add(str) { //js去前后去空格函数方法
	return str.replace(/(^\s*)|(\s*$)/g, "");
	alert("店铺名字不能为空！");
}


function fun(){
	if(add($("#shopName").val()) == ""){
		alert("店铺名字不能为空!")
		
	}else{
	$.ajax({
		url : "${pageContext.request.contextPath}/shops/addShops?shopName="+add($("#shopName").val()),
		type : "post",
		dataType:"json",
		success : function(data) {
			
			if(data.sign.biaoji=='error'){
				alert("请重新店铺名字，该名字已被使用！")
				$("#shopName").val(null);
			}
		}
	})}
}


function fun1(){
	if(add($("#shopName").val()) == ""){
		alert("店铺名字不能为空!");
		return false;
	
}
	return true;
} 
</script>

<form action="${pageContext.request.contextPath}/shops/addShops" method="post" onsubmit="return fun1();" name="open" id="uploadForm"  method="post"  enctype="multipart/form-data">
<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3"></div>
				<div class="col-lg-6 col-md-6">
					
					<div class="form-group">
						<label for="dianpu">店铺名称：</label>
						<input id="shopName" class="form-control" type="text" name="shopName"  onblur="fun()" placeholder="请设置您的账号" />
					</div>
					<div class="form-group">
						<label for="email">我的头像：</label>
						<input type="file" name="Imgs"maxlength="64"style="width: 156px;"/>
					</div>
					
				</div>
				<div class="col-lg-3 col-md-3"></div>
			</div>
		
			<div align="center"> <button type="submit"  class="btn btn-info">注册</button></div>
</div>
</form>



</body>
</html>