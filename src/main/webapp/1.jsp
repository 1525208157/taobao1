<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>Fullscreen Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
</head>	<script  type="text/javascript">	function Trim1(str){ //js去前后去空格函数方法		             return str.replace(/(^\s*)|(\s*$)/g, ""); 		     }			function denglu() {			var userName=Trim1($("#username").val());			var userPass=Trim1($("#password").val());			alert(userPass);			alert(userName);			if(userName==""){				alert("账号不能为空！");			}else if(userPass==""){				alert("密码不能为空！");			}else{			$.ajax({				url:"${pageContext.request.contextPath}/user/selectUser",				dataType:"json",				type:"post",				data:{				"account":userName,				"password":userPass				},				success:function(data){					if(data.fz=="ok"){					alert("登陆成功");					}else{						alert("登陆失败");					}				},				error:function(data){					alert("cuowu")				}							})			}	}		</script>
    <body>			 <!-- Javascript -->        <script src="assets/js/jquery.min.js"></script>        <script src="assets/js/supersized.3.2.7.min.js"></script>        <script src="assets/js/supersized-init.js"></script>        <script src="assets/js/scripts.js"></script>
        <div class="page-container">
            <span id="ss">登录&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;				<a href="2.jsp">立即注册</a></span>
            <form  method="post">            			<br>	<br>	<br>					<input id="username"  type="text" name="username"  placeholder="账号">					<br>	<br>	<br>               		<input   id="password"  type="password"  name="password"  placeholder="密码" >							<br>	<br>	<br>                <button type="button" onclick="denglu()">登陆</button>                <div class="error"><span></span></div>            </form>            	        </div>

       
 
    </body>

</html>

