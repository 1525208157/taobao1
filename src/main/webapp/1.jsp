﻿<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>Fullscreen Login</title><!-- CSS --><link rel="stylesheet" href="assets/css/reset.css"><link rel="stylesheet" href="assets/css/supersized.css"><link rel="stylesheet" href="assets/css/style.css"></head><script type="text/javascript">	function Trim1(str) { //js去前后去空格函数方法		return str.replace(/(^\s*)|(\s*$)/g, "");	}	function denglu() {		var userName = Trim1($("#username").val());		var userPass = Trim1($("#password").val());		if (userName == "") {			alert("账号不能为空！");		} else if (userPass == "") {			alert("密码不能为空！");		} else {			$.ajax({				url : "myTaobao/selectUser?account=" + userName + "&password="						+ userPass,				success : function(data) {					if (data == "ok") {						location.href = "index.jsp";					} else if (data == "error") {						alert("账号或密码错误");					}				}			})		}	}</script><body>	<!-- Javascript -->	<script src="assets/js/jquery.min.js"></script>	<script src="assets/js/supersized.3.2.7.min.js"></script>	<script src="assets/js/supersized-init.js"></script>	<script src="assets/js/scripts.js"></script>	<div class="page-container">		<span id="ss">登录&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;			&nbsp; &nbsp; <a href="2.jsp">立即注册</a>		</span>		<form method="post">			<br> <br> <br> <input id="username" type="text"				name="username" placeholder="账号"> <br> <br> <br>			<input id="password" type="password" name="password" placeholder="密码">			<br> <br> <br>			<button type="button" onclick="denglu()">登陆</button>			<div class="error">				<span></span>			</div>		</form>	</div></body></html>