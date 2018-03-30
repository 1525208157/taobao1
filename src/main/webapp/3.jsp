<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
#aaa{
width:150px;
height:60px;
font-size: 30px;
color: blue;
border-bottom-color: black;
}


</style>



</head>




<body onload="createCode()">
	<script type="text/javascript" language="javascript">
		
		
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





</head>
<body>
		<br>	<br>	<br>	<br>	<br>	<br>
			<div align="center">账号:&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  <input type="text"></div>
				<br><br>
			<div align="center">密保问题:&nbsp; &nbsp; <input type="text"></div>
			<br><br>
			<div align="center">密保答案:&nbsp; &nbsp; <input type="text"></div>

	
	
	<!--验证码-->
	<div id="form1" runat="server" onsubmit="validateCode()">
	<div>
	<table border="0" cellspacing="5" cellpadding="5" height="60"
	align="center">
	<tr>
	<td>
	
	<br><br><br><br><br>
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
		<div align="center">
	<button id="aaa" type="button">确定</button>
	
	</div>
</body>
</html>