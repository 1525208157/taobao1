<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">
function Trim1(str) { //js去前后去空格函数方法
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function check_account(){
	if(Trim1($("#account").val()) == ""){
		alert("账号不能为空!")
		
	}else{
	$.ajax({
		url : "${pageContext.request.contextPath}/user/check_account?account="+Trim1($("#account").val()),
		type : "post",
		dataType:"json",
		success : function(data) {
			
			if(data.biaoji=='error'){
				alert("请重新输入账号，该账号已被使用！")
				$("#account").val("");
			}
		}
	})}
}

function fun(){
	
	
	if(Trim1($("#account").val()) == ""){
		alert("账号不能为空!")
		return false;
	}
	
	if(Trim1($("#password").val()) == ""){
		alert("密码不能为空!");
		return false;
	}
	
	if(Trim1($("#nickname").val()) == ""){
		alert("昵称不能为空!");
		return false;
	}
	
	if(Trim1($("#problem").val()) == ""){
		alert("密保问题不能为空!");
		return false;
	}
	
	if(Trim1($("#answer").val()) == ""){
		alert("密保答案不能为空!");
		return false;
	}
	
	return true;
}





</script>

<div class="container">
<div class="col-lg-3 col-md-3"></div> 
<div class="col-lg-6 col-md-6"> 
<form class="form-horizontal" action="${pageContext.request.contextPath}/user/insert_user" method="post" onsubmit="return fun();" enctype="multipart/form-data">
	<br><br><br>
	<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel">账号:</label>	
	</div>
	<div class="col-lg-10 col-md-10">
	<input type="text" id="account" name="account" onblur="check_account()" class="form-control"/>
	</div>
	</div>
	
	<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel">密码:</label>	
	</div>
	<div class="col-lg-10 col-md-10">
	<input type="password" id="password" name="password" class="form-control"/>
	</div>
	</div>
	
	
	<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel">昵称:</label>	
	</div>
	<div class="col-lg-10 col-md-10">
	<input type="text" id="nickname" name="nickname" class="form-control"/>
	</div>
	</div>
	
	<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel">密保问题:</label>	
	</div>
	<div class="col-lg-10 col-md-10">
	<input type="text" id="problem" name="problem" class="form-control"/>
	</div>
	</div>
	
	<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel">密保答案:</label>	
	</div>
	<div class="col-lg-10 col-md-10">
	<input type="text" id="answer" name="answer" class="form-control"/>
	</div>
	</div>
	
	<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel">上传头像:</label>	
	</div>
	<div class="col-lg-10 col-md-10">
	<input type="file" id="img" name="img" class="form-control"/>
	</div>
	</div>
	
	
	
	<div class="form-group">
		<div  class="col-lg-2 col-md-2">
	   <label for="sex">性别:</label>	
	  </div>
		<div class="col-lg-10 col-md-10 ">
		<div class="btn-group" data-toggle="buttons">
		<label class="btn btn-default active" id="insert_sexlable1" > 
		<input type="radio" name="sex" id="insert_sex1" autocomplete="off" value="男" checked> 男
		</label>
		 <label class="btn btn-default" id="insert_sexlable2">
		  <input type="radio" name="sex" id="insrt_sex2" value="女" autocomplete="off">女
		</label>
		</div>
		</div>
		
		</div>
		<div class="form-group">
	<div  class="col-lg-2 col-md-2">
	<label for="tel"></label>	
	</div>
	
	<div class="col-lg-10 col-md-10">
	<button type="submit"  class="btn btn-info">注册会员</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-info">放弃注册</button>&nbsp;
	</div>
	</div>
		
	</form>
<div class="col-lg-3 col-md-3"></div> 
</div>
</div>

</body>
</html>