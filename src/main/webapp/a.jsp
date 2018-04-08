<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<script type="text/javascript">
	function Trim1(str) { //js去前后去空格函数方法
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	function denglu() {
		var userName = Trim1($("#username").val());
		var userPass = Trim1($("#password").val());
		if (userName == "") {
			alert("账号不能为空！");
		} else if (userPass == "") {
			alert("密码不能为空！");
		} else {
			$.ajax({
				url : "myTaobao/selectUser?account=" + userName + "&password="
						+ userPass,
				success : function(data) {
					if (data == "ok") {
						location.href = "index.jsp";
					} else if (data == "error") {
						alert("账号或密码错误");
					}
				}

			})
		}
	}
</script>
<body>
		<br/>
		<div style=" height:500px;width: 1180px; background-color: #FE7748;" class="container">
		<div class="row"> 
		<div class="col-lg-7" style="width: 700px; text-align: center; padding-top: 60px;">
		<img  src="images/登录.jpg"/>	
		</div>
		<div class="col-lg-3" style="width: 480px; padding-top: 100px;">
	<form class="form-horizontal" role="form" style="background-color:#FFF2EE; height: 300px; width: 400px;">
  <br /> <br /> <br />
  <div class="form-group" style="text-align: center;">
    <label for="inputEmail3" class="col-sm-3 control-label">账号：</label>
    <div class="col-sm-9" style="width: 240px;">
      <input type="email" class="form-control" placeholder="Email">
    </div>
  </div>
  <div class="form-group" style="text-align: center;">
    <label for="inputPassword3" class="col-sm-3 control-label">密码：</label>
    <div class="col-sm-9" style="width: 240px;">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group" style="text-align: center;">  
  	 <label for="inputEmail3" class="col-sm-3 control-label"></label>
  	 <div  class="col-sm-9" style="width: 240px;">
  	 	<button type="submit" class="btn btn-warning"  style="width:210px;">登录</button></div>
  </div>
  <div style="text-align: right;"><a>忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>免费注册</a> </div>
</form>		
		</div>		
		</div>
	</div>
	
	
	
<!-- 找回密码 -->
<div class="modal fade" id="findUsers_modal" data-backdrop="false">
<!-- data-backdrop="false"设置显示模态框时，在模态框外面点击时，模态框时否消失-->
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">jeebbs论坛会员找回密码</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form" name="form2" id="form2">
      <div class="form-group">
	  <label for="find_userId" class="col-lg-2 col-sm-2 control-label">用户账号:</label>
	  <div class="col-lg-10">
	  <input type="text" class="form-control" id="find_userId"
	 name="find_userId" onblur="findUserPassQ_ByuserId();" >
		</div>
		</div>
      <div class="form-group">
	  <label for="find_userPassQ" class="col-lg-2 col-sm-2 control-label">密保问题:</label>
	  <div class="col-lg-10 col-sm-10">
	  <input type="text" class="form-control" id="find_userPassQ" name="find_userPassQ" readonly="readonly">
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="find_userPassA" class="col-lg-2 col-sm-2 control-label">密保答案:</label>
	  <div class="col-lg-10 col-sm-10">
	  <input type="text" class="form-control" id="find_userPassA" name="find_userPassA" >
		</div>
		</div>
		
		
		<div class="form-group">
		<label for="mpanel2" class="col-lg-2 col-sm-2  control-label">滑动验证码:</label>
     <div class="col-lg-10 col-sm-10">
    
        <div id="mpanel2">
        </div></div>
         </div>
      </form>
      
      <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="find_user();"><i class="glyphicon glyphicon-ok"></i>&nbsp;确定提交</button>&nbsp;
         <button type="button" class="btn btn-info" onclick="findUser_reset()"><i class="glyphicon glyphicon-repeat"></i>&nbsp;表单重置</button>&nbsp;
        <button type="button" class="btn btn-danger" onclick="findUser_reset()" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i>&nbsp;放弃提交</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	</div>
	
	
	
	
	
	</body>
</html>