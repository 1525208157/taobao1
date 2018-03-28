<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<style type="text/css">
.goods{
	background-color: #FFCCCC;
	border:1px dashed #000;
}
#dear{
background-color: #FF9933;
    position:fixed;
    bottom:0;
    left:100;
}

</style>
<script type="text/javascript">

$(function(){
	$.ajax({
			url:"${pageContext.request.contextPath}/carts/goodAll?userId=1",
			dataType:"json",
			success:function(data){
				//console.log(data);
				for(i=0;i<data.length;i++){
					$("#d2").append("<br><div><div class='row'><div class='col-lg-12 col-md-12'><input type='checkbox' onclick='dianpu_checked(this)' name='shopId_checkbox' value='"
							+data[i][0].shopId+"'>"+data[i][0].shopName+" <div id='dp"+i+"' class='goods'></div></div></div></div>");
					for(j=0;j<data[i].length;j++){
					    $("#dp"+i).append("</br><div class='row'><div class='col-lg-1 col-md-1'>&nbsp;<input type='checkbox'"
							 +" name='cartgoodId_checkbox'onclick='shangpin_checked(this)' value='"+data[i][j].cartGoodId+"'/></div><div class='col-lg-2 col-md-2'>"
							 +"<img src='"+data[i][j].goodsImg+"'width=40 height=30/></div>"
					         +"<div class='col-lg-2 col-md-2'>"+data[i][j].goodsName+"</div>"
					         +"<div class='col-lg-2 col-md-2'>手机颜色："+data[i][j].gcName+"<br>"
					         +" 手机内存："+data[i][j].specsName+"</div>"
					         +"<div class='col-lg-1 col-md-1'>￥"+data[i][j].smoney+"</div>"
					         +"<div class='col-lg-1 col-md-1'>"+data[i][j].cartGoodNum+"<span class='glyphicon glyphicon-plus'></span> </div>"
					         +"<div class='col-lg-1 col-md-1'>"+data[i][j].totalPrice+"</div>"
					         +"<div class='col-lg-2 col-md-2'><a onclick='setFagood("+data[i][j].goodsId+")'>添加到收藏夹</a><br>"
					         +"<a onclick='deleteCartGood("+data[i][j].cartGoodId+")'>删除</a> </div></div></br>");
					   			
					}}
				 /* $("input[type='checkbox']").click(function(){
						alert("商店按钮");
					})    */
				
			}
	
		})
		
		
		})

	function setFagood(goodsId){//单次关注
	    alert(321);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/carts/setFavoritesGood?goodsId="+goodsId,
			dataType:"json",
			success:function(data){
				if(data.biaoji=="error"){
					alert("你的关注夹里已有该商品！无需在添加")
				}else{
					alert("添加关注成功！")
				}
			}
			
			
		})
		
}
	 function deleteCartGood(cartGoodId){//根据用户名删除购物车里的商品
		 alert(12131);
		location.href="${pageContext.request.contextPath}/carts/deleteCartGood?cartGoodId="+cartGoodId;
		 
	 }
	
	 function setFagoods(){//批量关注
	  alert("批量关注")
		 var cartGoodIds=new Array();
		 $("input[type='checkbox']:checked").each(function(){
			 cartGoodIds.push($(this).val());
			});
		
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/setFavoritesGoods",
				dataType:"json",
				type:"post",
				data:{"cartGoodIds":cartGoodIds},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					console.log(data)
					alert(data);
					alert("批量添加关注")
					if(data.biaoji=="ok"){
						alert("添加成功！")
					}else{
						alert("请选择你要添加关注的商品！")
					}
				}
				
				
			})
		 
	 }
	 
	 function deleteCartGoods(){//根据用户名删除购物车里的商品
		 var cartGoodIds=new Array();
		 $("input[type='checkbox']:checked").each(function(){
			 cartGoodIds.push($(this).val());
			});
		if(cartGoodIds.length!=0){
		
		 
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/deleteCartGoods",
				dataType:"json",
				type:"post",
				data:{"cartGoodIds":cartGoodIds},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
				
				}
				
				
			})
		}else{
		    alert("请你选择你要删除的商品！")
		}
	 }
	function dianpu_checked(c){//点击商品的多选按钮后，选中时它里面的商品也会选中，反之，里面的商品也不会选中
		 console.log(c);
		if(c.checked){
			//alert("ddddddd")
			//var cc=$("c.next() input[type='checkbox']").length;
			//alert(cc);
			$(c).parent().find(":checkbox").prop("checked",true);
		}else{
			$(c).parent().find(":checkbox").prop("checked",false);
			
		}
			 
	}
	 
	function shangpin_checked(a){//店铺里的商品，如果全部选中是时，店铺的多选按钮也会选中，如果没选完， 店铺的按钮会取消选中	
	 var cc=$(a).parent().parent().parent().find(":checkbox").length;
	 var ca=$(a).parent().parent().parent().find(":checked").length;
	alert(ca);
	if(cc==ca){
		$(a).parent().parent().parent().parent().parent().find(":checkbox").first().prop("checked",true);
	}else{
		$(a).parent().parent().parent().parent().parent().find(":checkbox").first().prop("checked",false);
	}
	
	}
	
	function quanxuan_checkbox(){
		$("input[type=checkbox]").attr("checked",true);
		
	}
</script>

</head>
<body>



<br><br><br>

<div id="d1" class="container">
		<div class="row">
		<div class="col-lg-1 col-md-1" id="d1"></div>
		
		
		<div class="col-lg-10 col-md-10" id="d2">
		 
		<div class="row">
		<div class="col-lg-3 col-md-3" id="w1">&nbsp;<a onclick="quanxuan_checkbox()">全选</a></div>
		<div class="col-lg-4 col-md-4" id="w2">商品信息</div>
		<div class="col-lg-1 col-md-1" id="w3">单价</div>
		<div class="col-lg-1 col-md-1" id="w4">数量</div>
		<div class="col-lg-1 col-md-1" id="w5">金额</div>
		<div class="col-lg-2 col-md-2" id="w6">操作</div>
		</div>
		</div>
		<div class="col-lg-1 col-md-1" ></div>
		</div>	
		
		<div class="row">
		<div class="col-lg-1 col-md-1" ></div>
		
		<div class="col-lg-10 col-md-10" >
		<br>
		<div id="dear"  width=100%>
		<br>
		&nbsp;&nbsp;&nbsp;
		<a onclick="quanxuan_checkbox()">全选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a onclick="setFagoods()">添加关注</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a onclick="deleteCartGoods()">批量删除</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;
		<br>
		
		</div>
	
		</div>
		<div class="col-lg-1 col-md-1" ></div>
		
		
			
</div>		




<script type="text/javascript">


</script>
</body>
</html>