 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
			url:"${pageContext.request.contextPath}/carts/goodAll?userId=1",
			dataType:"json",
			success:function(data){
				console.log(data);
				for(i=0;i<data.length;i++){
					$("#table").append("<tr><td colspan=8>"+data[i][0].shopName+"</td></tr>");
					for(j=0;j<data[i].length;j++){
					$("#table").append("<tr><td><input type='checkbox' name='foods' value='niurou'></td>"
					+"<td><img src='"+data[i][j].goodsImg+"' width=50 height=40/></td>"
					+"<td>"+data[i][j].goodsName+"</td>"
					+"<td>颜色:"+data[i][j].gcName+"<br>手机内存："+data[i][j].specsName+"</td>"
					+"<td>"+data[i][j].smoney+"元</td>"
					+"<td>"+data[i][j].cartGoodNum+"</td>"
					+"<td>"+data[i][j].totalPrice+"元</td>"
					+"<td><a onclick='setFagood("+data[i][j].goodsId+")'>添加到收藏夹</a><br>删除</td></tr>"
					)
					}
				}
			}
	
	})
})

	function setFagood(goodsId){
		//location.href="${pageContext.request.contextPath}/carts/setFavoritesGood?goodsId="+goodsId;
		$.ajax({
			url:"${pageContext.request.contextPath}/carts/setFavoritesGood?goodsId="+goodsId,
			dataType:"json",
			success:function(data){
				if(data.biaoji==error){
					alert("你的关注夹里已有该商品！无需在添加")
				}else{
					alert("添加关注成功！")
				}
			}
			
			
		})
		
}


</script>

</head>
<body>
<div class="container" id="all" >
<div class="row">


<div class="col-lg-12 col-lg-12">
<br><br><br>
<table border=1 id="table" width=1200>
<tr>
<td>全选</td>
<td colspan=3>商品信息</td>

<td>单价</td>
<td>数量</td>
<td>金额</td>
<td>操作</td>
</tr>

</table>
</div>


</div>
</div>
</body>
</html>