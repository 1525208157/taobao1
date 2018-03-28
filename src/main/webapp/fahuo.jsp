<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"> </script>
</head>

<body>

  
 
  订单ID<select name="d.orderId"></select> 
 <input type="text" name="like" /> 
 物流单号<input type="text"></input> 


    <script type="text/javascript"> 
     //页面加载完毕发送AJAX请求
     $(function () {
		val=$("input[name='like']").val();
		 $.ajax({
			 url:'orders/selectOrders',
			 dataType :"json",
			 success : function (data) {
				 $.each(data,function(i,d){
					$("select").append(
					"<option value="+d.courier.courierName+">" +d.orderId
					+ "</option>"
					) 
					
					
				}); 
				
			}
			 
		 });
		
	});
    	 
    
    
    </script>
</body>
</html>