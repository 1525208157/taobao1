  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/verify.css">
   <script type="text/javascript" src="js/verify.js" ></script>
</head>
<style type="text/css">
#desr{
padding:13px;
  
}


</style>
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
				url : "${pageContext.request.contextPath}/user/login",
				data:{"account":userName,
					"password":userPass
		           },
				success : function(data) {
					if (data.biaoji == "ok") {
						alert("登录成功！")
					} else if (data.biaoji == "error") {
						alert("账号或密码错误");
					}
				}

			})
		}
	}
	
	
	
	
	function show_findUsers_modal(){
		$("#findUsers_modal").modal("show");
		
	}
	function findcheck_account(){
		
		if(Trim1($("#find_account").val())==""){//离开焦点就会调用此方法，包括点击确定提交 也是离开了#find_userId 的按钮了
			alert("用户账号不能为空!"); //如果不写，有的直接填第二行一下就避开了开userid离开焦点调的函数方法
			$("#find_account").val(null);
		}else{
			
			$.ajax({
				url : "${pageContext.request.contextPath}/user/check_account?account="+Trim1($("#find_account").val()),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.sign.biaoji=="ok"){
						alert("该网站无此帐号");
						$("#find_account").val(null);
						}else{
							$("#find_problem").val(data.users.problem);
						}
					}
			
	});
		}
	}
	
	function find_user(){
		
		if(Trim1($("#find_account").val())==""){//这里写上最好
			alert("用户账号不能为空!");
		}else if(Trim1($("#find_problem").val())==""){
		alert("密保问题不能为空！");
    }else if(Trim1($("#find_answer").val())==""){
    	alert("密保答案不能为空！");
    } else if($("#mpanel2").val()==""){
    	alert("还未验证，请你滑动滑块验证！");
    }else {
    	$.ajax({
			url : "${pageContext.request.contextPath}/user/check_user",
			type:"post",
			data:{"account":Trim1($("#find_account").val()),
				  "problem":Trim1($("#find_problem").val()),
				  "answer":Trim1($("#find_answer").val())
	
			},
			
			dataType:"json",
			success:function(data){
				console.log(data);
				if(data.sign.biaoji=="error"){
					findUser_reset();
					$("#findUsers_modal").modal("hide");
					$("#find_update_Users_modal").modal("show");
					$("#find_update_find_account").val(data.users.account);
					$("#find_update_nickname").val(data.users.nickname);
					
				}else{
					alert("密保答案错误，请重新输入！");
					$("#find_answer").val(null);
				}
				}
				
});
    }
	
	}
	
	function find_update_userPassword(){
		
		if(Trim1($("#find_update_password").val())==""){
			alert("修改的密码不能为空！");
		}else if($("#mpane13").val()==""){
			alert("还未验证，请你滑动滑块验证2！");
		}else{
	   
		$.ajax({
			url : "${pageContext.request.contextPath}/user/find_update_uses",
			type:"post",
			data:{"account":Trim1($("#find_update_find_account").val()),
				  "password":Trim1($("#find_update_password").val())
			},
			dataType:"json",
			success:function(data){
				
					alert("恭喜你，找回修改密码成功，欢迎登陆！！！");
					$("#find_update_Users_modal").modal("hide");
				
			}
			
		});
	}
		
	}
	
	function findUser_reset(){
		$("#find_account").val(null);
		$("#find_problem").val(null);
		$("#find_answer").val(null);
		
	}
	
	function find_update_reset(){
		$("#find_update_find_account").val(null);
		$("#find_update_password").val(null);
		$("#find_update_nickname").val(null);
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
    <label for="username" class="col-sm-3 control-label">账号：</label>
    <div class="col-sm-9" style="width: 240px;">
      <input type="text" class="form-control" id="username" name="username" placeholder="请输入账号">
    </div>
  </div>
  <div class="form-group" style="text-align: center;">
    <label for="password" class="col-sm-3 control-label">密码：</label>
    <div class="col-sm-9" style="width: 240px;">
      <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
    </div>
  </div>
  <div class="form-group" style="text-align: center;">  
  	 <label for="inputEmail3" class="col-sm-3 control-label"></label>
  	 <div  class="col-sm-9" style="width: 240px;">
  	 	<button type="button" class="btn btn-warning" onclick="denglu()"  style="width:210px;">登录</button></div>
  </div>
  <div id="desr" style="text-align: right;"><a onclick="show_findUsers_modal()">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="registe.jsp">免费注册</a> </div>
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
        <h4 class="modal-title">淘宝网会员找回密码</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form" name="form2" id="form2">
      <div class="form-group">
	  <label for="find_account" class="col-lg-2 col-sm-2 control-label">用户账号:</label>
	  <div class="col-lg-10">
	  <input type="text" class="form-control" id="find_account"
	 name="find_account" onblur="findcheck_account();" >
		</div>
		</div>
      <div class="form-group">
	  <label for="find_problem" class="col-lg-2 col-sm-2 control-label">密保问题:</label>
	  <div class="col-lg-10 col-sm-10">
	  <input type="text" class="form-control" id="find_problem" name="find_problem" readonly="readonly">
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="find_answer" class="col-lg-2 col-sm-2 control-label">密保答案:</label>
	  <div class="col-lg-10 col-sm-10">
	  <input type="text" class="form-control" id="find_answer" name="find_answer" >
		</div>
		</div>
		
		<div class="form-group">
		<label for="mpanel2" class="col-lg-2 col-sm-2  control-label">滑动验证码:</label>
     <div class="col-lg-10 col-sm-10">
    
        <div id="mpanel2">
		</div>
		</div>
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
	
	
		<!-- 找回密码修改密码 -->
<div class="modal fade" id="find_update_Users_modal" data-backdrop="false">
<!-- data-backdrop="false"设置显示模态框时，在模态框外面点击时，模态框时否消失-->
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">淘宝用户找回修改密码</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form" name="form3" id="form3">
      <div class="form-group">
	  <label for="find_update_userId" class="col-lg-2 col-sm-2 control-label">你的账号是:</label>
	  <div class="col-lg-10">
	  <input type="text" class="form-account" id="find_update_find_account"
	 name="find_update_find_account" readonly="readonly" >
		</div>
		</div>
      <div class="form-group">
	  <label for="find_update_nickname" class="col-lg-2 col-sm-2 control-label">你的昵称是:</label>
	  <div class="col-lg-10 col-sm-10">
	  <input type="text" class="form-control" id="find_update_nickname" name="find_update_nickname" readonly="readonly">
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="find_update_password" class="col-lg-2 col-sm-2 control-label">请输入你要修改后密码:</label>
	  <div class="col-lg-10 col-sm-10">
	  <input type="password" class="form-control" id="find_update_password" name="find_update_password" >
		</div>
		</div>
		
      
      <div class="form-group">
		<label for="mpane13" class="col-lg-2 col-sm-2  control-label">滑动验证码:</label>
     <div class="col-lg-10 col-sm-10">
    
        <div id="mpane13">
        </div></div>
         </div>
      </form>
      
      <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="find_update_userPassword();"><i class="glyphicon glyphicon-ok"></i>&nbsp;确定提交</button>&nbsp;
         <button type="button" class="btn btn-info" onclick="find_update_reset();"><i class="glyphicon glyphicon-repeat"></i>&nbsp;表单重置</button>&nbsp;
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="find_update_reset();"><i class="glyphicon glyphicon-remove"></i>&nbsp;放弃提交</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	</div>
	
	<script type="text/javascript">
	$('#mpanel2').slideVerify({
		type : 1,		//类型
		vOffset : 5,	//误差量，根据需求自行调整
        barSize : {
        	width : '300%',
        	height : '40px',
        },
        ready : function() {
    	},
        success : function() {
        	alert('验证成功，添加你自己的代码！');
        	//document.getElementById("mpanel1").innerHTML="1"; innerHTML 不能用jQuery选择器
        	$("#mpanel2").val("1");
        },
        error : function() {
//        	alert('验证失败！');
        }
        
    });
	
	$('#mpane13').slideVerify({
		type : 1,		//类型
		vOffset : 5,	//误差量，根据需求自行调整
        barSize : {
        	width : '300%',
        	height : '40px',
        },
        ready : function() {
    	},
        success : function() {
        	alert('验证成功，添加你自己的代码！');
        	//document.getElementById("mpanel1").innerHTML="1"; innerHTML 不能用jQuery选择器
        	$("#mpane13").val("1");
        },
        error : function() {
        	alert('验证失败！');
        }
        
    });
	
	
	</script>
	
	</body>
</html>