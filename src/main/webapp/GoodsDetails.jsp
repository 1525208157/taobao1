<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<script type="text/javascript">
	
	$(function() {
		$.ajax({
			url:"myTaobao/selectGoods",
			data:{
				"goodsId":2
			},
			dataType:"json",
			success:function(data){
				alert(132);
			}
			
		})
	});
	
	
</script>

<body>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
		<div class="col-lg-6 col-md-6 col-sm-6">
			
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
	</div>
</body>
</html>