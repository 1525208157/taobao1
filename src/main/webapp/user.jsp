<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.js" ></script>

<style type="text/css">
.input {
	color: #cccccc;
}

.code {
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 30px;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	width: 150px;
	height: 60px;
	line-height: 60px;
	text-align: center;
	vertical-align: middle;
}

a {
	text-decoration: none;
	font-size: 12px;
	color: #288bc4;
}

a:hover {
	text-decoration: underline;
}
</style>



</head>




<body onload="createCode()">
	<script type="text/javascript" language="javascript">
		function Trim(str) { //js去前后去空格函数方法
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
		function denglubtn() {
			$("#denglu").modal("show");
		}
		function zhucebtn() {
			$("#zhuce").modal("show");
		}
		function denlu() {

			if (Trim($("#denglu_uname").val()) == "") {
				alert("账号不能为空！！");
			} else if (Trim($("#denglu_password").val()) == "") {
				alert("密码不能为空！！");
			} else {
				$.ajax({

					url : "${pageContext.request.contextPath}/user/selectUser",
					data : {
						"account" : Trim($("#denglu_uname").val()),
						"password" : Trim($("#denglu_password").val())
					},
					success : function(data) {
						console.log(data);
						if (data=="ok") {
							alert("登陆成功");
						}else if(data=="erorr"){
							alert("登陆失败");
						}
					}
				})
			}
		}

		var code;
		function createCode() {
			code = "";
			var codeLength = 6; //验证码的长度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b',
					'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
					'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
					'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
					'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
			for (var i = 0; i < codeLength; i++) {
				var charNum = Math.floor(Math.random() * 52);
				code += codeChars[charNum];
			}
			if (checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}
		function validateCode() {
			var inputCode = document.getElementById("inputCode").value;
			if (inputCode.length <= 0) {
				alert("请输入验证码！");
			} else if (inputCode.toUpperCase() != code.toUpperCase()) {
				alert("验证码输入有误！");
				createCode();
			} else {
				alert("验证码正确！");
			}
		}
	</script>



	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">首页</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">购买 <span class="sr-only">(current)</span></a></li>
				<li><a href="#">服装</a></li>
				<li class="dropdown">
				<li onclick="denglubtn();"><a href="#">登陆</a></li>

				<li class="dropdown">
				<li onclick="zhucebtn();"><a href="#">注册</a></li>

			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- 登陆modal -->
	<div class="modal" id="denglu" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
	<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
	aria-label="Close">
	<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">登陆</h4>
</div>
	<div class="modal-body">
	<form action="" class="form-horizontal">
	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">账号</span> <input type="text"
	id="denglu_uname" class="form-control" />
</div>
</div>
	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon" onclick="login">密码</span> <input
	type="text" class="form-control" id="denglu_password" />
</div>
</div>
	<div class="modal-footer">
	<button type="button" class="btn btn-default"
	data-dismiss="modal" onclick="denlu()">登录</button>
</div>
				</form>
			</div>
		</div>
</div>
</div>

	<!-- 注册modal -->
	<div class="modal fade" id="zhuce" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
	
	<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
	aria-label="Close">
	<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title">注册</h4>
</div>

	<div class="modal-body">
	<div action="" class="form-horizontal">
	
	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">账号</span> <input type="text"
	class="form-control" />
</div>
</div>

	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">密码</span> <input type="text"
	class="form-control" />
</div>
</div>

	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">密码确认</span> <input type="text"
	class="form-control" />
</div>
</div>

	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">头像</span> <input type="file"
	class="form-control" />
</div>
</div>

	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">密保问题</span> <input type="text"
	class="form-control" />
</div>
</div>

	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">密保答案</span> <input type="text"
	class="form-control" />
</div>
</div>

	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">昵稱</span> <input type="text"
	class="form-control" />
</div>
</div>


	<div class="form-group">
	<div class="input-group">
	<span class="input-group-addon">性别</span> &nbsp; &nbsp; &nbsp; <input
	type="radio" name="sex" />男 &nbsp; &nbsp; &nbsp; <input
	type="radio" name="sex">女
</div>
</div>

<!--验证码-->
	<div id="form1" runat="server" onsubmit="validateCode()">
	<div>
	<table border="0" cellspacing="5" cellpadding="5" height="60"
	align="center">
	<tr>
	<td>
	<input type="text" id="inputCode" class="input"
	value="请输入验证码" onkeydown="if (event.keyCode==13) {}"
	onblur="if(this.value=='')value='请输入验证码';"
	onfocus="if(this.value=='请输入验证码')value='';" value="请输入验证码" />
	<input id="Button1" onclick="validateCode();" type="button"
	value="确定" />
	</td>
</tr>
	<tr>
	<td>
	<div class="code" id="checkCode"></div> <a href="#"
	onclick="createCode()" style="size: auto;"><br>看不清换一张</a>
</td>
</tr>
</table>
</div>

</div>
			<!--验证码结束-->
	
	<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">注册</button>
	</div>
	
	</div>
		
			
	</div>
			
	
</div>
</div>
</div>

</body>
</html>
