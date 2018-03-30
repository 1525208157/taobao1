<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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



<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->

<!--[if lt IE 9]>

            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>

        <![endif]-->


</head>





<script type="text/javascript">
	function Trim1(str) { //js去前后去空格函数方法
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	function insertUser_w() {
		/* var form1 = document.getElementById("form12");
		var fd = new FormData(form1); */
		if (Trim1($("#username").val()) == "") {
			alert("账号不能为空！")
		} else if (Trim1($("#password").val()) == "") {
			alert("密码不能为空!")
		} else if (Trim1($("#nickname").val()) == "") {
			alert("昵称不能为空")
		} else if (Trim1($("#problem").val()) == "") {
			alert("密保问题不能为空")
		} else if (Trim1($("#answer").val()) == "") {
			alert("密保答案不能为空")
		} else {
			
		}
	}
</script>
<body>





	<div class="page-container">
		<span>注册&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<a href="1.jsp">立即登录</a>
		</span>
	</div>

	<form action="" id="uploadForm">
		<input type="file" name="img">
	</form>
	


	<form action="${pageContext.request.contextPath}/user/register">
		   <img alt="" src="" id="userImg"> 
		   <br>
		   <input type="hidden" name="userImg"> 
		   <br>
		   <input type="text" name="account" placeholder="账号"> 
		   <br>
		   <input type="password" name="password" placeholder="密码" >
		   <br>
		   <input type="text"name="nickname" placeholder="昵称">
		   <br>
		   <input type="text" name="problem" placeholder="密保问题">
		   <br>
		   <input type="text" name="answer" placeholder="密保答案">	
		   <br>
		   <input type="submit"value="注册" />
	</form>
			<button>上传</button>
	<script src="assets/js/jquery-1.8.2.min.js"></script>

	<script type="text/javascript">
		$(function aaa(){

			$("button:contains('上穿')").on("click", function() {
				var fd = new FormData($("#uploadForm")[0]);
				$.ajax({
					url : "${pageContext.request.contextPath}/user/upload",
					data : fd,
					type : "post",
					processData : false,
					contentType : false,
					success : function(data) {
						alert(data);
						$("#userImg").attr("src", "${pageContext.request.contextPath}/"+data);
						$("[name= 'userImg']").prop('value',data);
					}
				});
			});
		});
	</script>

	<!-- Javascript -->


	<script src="assets/js/supersized.3.2.7.min.js"></script>

	<script src="assets/js/supersized-init.js"></script>

	<script src="assets/js/scripts.js"></script>



</body>



</html>


















