<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
.goods{
	background-color: #FFF0F5;
	border:1px dashed #000;
	 font-size: 17px
}
#dear{
background-color: #FF9966;
    position:fixed;
    bottom:0;
    left:100;
    width:1138px;
    height:70px
}
#jisuananniu{
 width:120px;
 height:70px;
   
    background:#FF9966;
}
#d11{
font-size: 19px
}
 
</style>
<script type="text/javascript">
var user="${user}"
$(function(){
	if(user!=null){
		cartsgoddss();
	}else{
		$("#d2").append("<h1>请先登录！！！</h1>")
	}
	
		})
   
   function cartsgoddss(){
	var userId="${user.userId}"
	 $.ajax({
		url:"${pageContext.request.contextPath}/carts/goodAll?userId="+userId,
		dataType:"json",
		success:function(data){
			//console.log(data);
			for(i=0;i<data.length;i++){
				$("#d2").append("<br><div><div class='row'><div class='col-lg-12 col-md-12'><input type='checkbox' onclick='dianpu_checked(this)' name='shopId_checkbox' value='"
						+data[i][0].shopId+"'>&nbsp;"+data[i][0].shopName+"<div id='dp"+i+"' class='goods'></div></div></div></div>");
				for(j=0;j<data[i].length;j++){
				    $("#dp"+i).append("</br><div class='row'><div class='col-lg-2 col-md-2'>&nbsp;<input type='checkbox'"
						 +" name='cartgoodId_checkbox'onclick='shangpin_checked(this)' value='"+data[i][j].cartGoodId+"'/>&nbsp;"
						 +"<img src='"+data[i][j].goodsImg+"'width=70 height=60/></div>"
				         +"<div class='col-lg-2 col-md-2'>"+data[i][j].goodsName+"</div>"
				         +"<div class='col-lg-2 col-md-2'>手机颜色："+data[i][j].gcName+"<br>"
				         +" 手机内存："+data[i][j].specsName+"</div>"
				         +"<div class='col-lg-1 col-md-1'>￥<span name='danjia'>"+data[i][j].smoney+"</span></div>"
				         +"<div class='col-lg-2 col-md-2'><button  type='button' class='btn btn-warning btn-xs' onclick='shangpin_jian(this)'><span class='glyphicon glyphicon-minus'></span></button>"
				         + "<button type='button' class='btn btn-default btn-xs' name='shulianganniu' value='"+data[i][j].cartGoodNum+"'>"
				         +data[i][j].cartGoodNum+"</button> "
				         +" <button type='button' onclick='shangpin_jia(this)' class='btn btn-warning btn-xs'><span class='glyphicon glyphicon-plus'></span></button></div>"
				         +"<div class='col-lg-1 col-md-1'><font color='red'>￥<span>"+data[i][j].totalPrice+"</span></font></div>"
				         +"<div class='col-lg-2 col-md-2'><a onclick='setFagood("+data[i][j].goodsId+")'>添加关注</a><br>"
				         +"<a onclick='delete_cartgood("+data[i][j].cartGoodId+")'>删除</a>"
				         +"<a onclick='update_select_cartgood("+data[i][j].cartGoodId+")'>|修改</a></div></div></br> ");
				   			
				}}
			    
			 /* $("input[type='checkbox']").click(function(){
					alert("商店按钮");
				})    */
				
			$("button[name='shulianganniu']").each(function(){//也面刚刚打开的时候当购物车的商品的数量为1时这时就不能减了，这时
				if($(this).val()==1){
					$(this).parent().parent().find(":button").first().attr('disabled',true)
					// $(".colordiv div").css("background-color","#FF0000");
				}
			});  
		}

	})
	
}
	function setFagood(goodsId){//单次关注
	  
		
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
		function delete_cartgood(cartgoodId){//单次删除前的显示是否要删除该帖模态框
			$("#delete_cartgoodId").html(cartgoodId);
			$("#delete_cartgoods_Modal").modal("show");
		}

	 function deleteCartGood(){  //根据用户名删除购物车里的商品
		
		location.href="${pageContext.request.contextPath}/carts/deleteCartGood?cartGoodId="+$("#delete_cartgoodId").html();
		 
	 }
	
	 function setFagoods(){//批量关注
	 
		 var cartGoodIds=new Array();
		 $("input[name='cartgoodId_checkbox']:checked").each(function(){//选中的商品按钮将按钮里的商品Id封装到集合中
			 cartGoodIds.push($(this).val());
			});
		
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/setFavoritesGoods",
				dataType:"json",
				type:"post",
				data:{"cartGoodIds":cartGoodIds},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					console.log(data)
					
					if(data.biaoji=="ok"){
						alert("添加成功！")
					}else{//这里在后台判断有没有选择商品按钮
						alert("请选择你要添加关注的商品！")
					}
				}
				
				
			})
		 
	 }
	 
	  function deleteCartGoods_piliang(){//批量删除前的模态框显示是否要批量删除
		  var cartGoodIds=new Array();
			 $("input[name='cartgoodId_checkbox']:checked").each(function(){//选中的商品按钮将按钮里的商品Id封装到集合中
				 cartGoodIds.push($(this).val());
				});
			 
			 
			 if(cartGoodIds.length!=0){
				 var cva="";
				 if(cartGoodIds.length!=1){//模态框里的商品id的拼接
				 for(i=0;i<cartGoodIds.length;i++){
					 if(i!=cartGoodIds.length-1){
					 cva=cva+cartGoodIds[i]+",";
					 }else{
						 cva=cva+cartGoodIds[i];
					 }
				 }}else{
					 cva=cva+cartGoodIds[0]+" "; 
				 }
			 
				 $("#delete_cartgoodId_piliang").html(cva);
				
				 $("#delete_cartgoodsPiliang_Modal").modal("show");
				 
			 }else{
				 alert("请选择你要删除的商品！")
			 }
	  }
	 
	 
	 
	 
	 
	 
	 function deleteCartGoods(){//批量量删除购物车里的商品
		 var cartGoodIds=new Array();
		 $("input[name='cartgoodId_checkbox']:checked").each(function(){//选中的商品按钮将按钮里的商品Id封装到集合中
			 cartGoodIds.push($(this).val());
			});
		
		
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/deleteCartGoods",
				dataType:"json",
				type:"post",
				data:{"cartGoodIds":cartGoodIds},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					location.reload();//刷新方法
				}
				
				
			})
		 }
	 
	function dianpu_checked(c){//点击店铺的多选按钮后，选中时它里面的商品也会选中，反之，里面的商品也不会选中
		 console.log(c);
		if(c.checked){//当该店铺的按钮选中时店铺里的按钮也会选中
			
			$(c).parent().find(":checkbox").prop("checked",true);
			
		}else{
			$(c).parent().find(":checkbox").prop("checked",false);
			
		}
		heji();	//这里要调用计算合计金额的方法
	}
	 
	function shangpin_checked(a){//店铺里的商品，如果全部选中是时，店铺的多选按钮也会选中，如果没选完， 店铺的按钮会取消选中	
	 var cc=$(a).parent().parent().parent().find(":checkbox").length;//店铺下面的商品的有几个按钮
	 var ca=$(a).parent().parent().parent().find(":checked").length;//店铺下面的商品按钮有几个选中的
	
	if(cc==ca){//相等时，该店铺的按钮也会选中的 如果没有就不会选中了
		
		$(a).parent().parent().parent().parent().parent().find(":checkbox").first().prop("checked",true);
	}else{
		$(a).parent().parent().parent().parent().parent().find(":checkbox").first().prop("checked",false);
	}
	heji();//当店铺里面的商品按钮点击时要调用计算合计金额的方法
	}
	
	function quanxuan_checkbox(a){//全选按钮
		
		if(a.checked){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
		heji();//调用计算合计金额的方法
		
	}
	function shangpin_jia(a){//商品数量加的效果
		//$(a).parent().parent().find(":checkbox").prop("checked",true);
		var c=$(a).parent().parent().find(":checkbox").val();//得到的是购物车里商品的id
		var ee=$(a).parent().parent().find(":button").first().next().val();//得到数量按钮里的值
		if(ee==1){//当商品数量时1这时点击加按钮后，减的按钮会恢复可点击状态
			$(a).parent().parent().find(":button").first().attr('disabled',false);
		}
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/jia_cartGoodNum",
				dataType:"json",
				type:"post",
				data:{"cartGoodId":c,"cartGoodNum":ee},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					  
				  $(a).parent().parent().find(":button").first().next().text(data.biaoji);//数量里的值
				 $(a).parent().parent().find(":button").first().next().val(data.biaoji);//数量里的value
				 var ii= $(a).parent().parent().find("span").first().text();//商品的数量
				//  $(a).parent().parent().find("span").eq(3).text();//下标从0开始  商品的金额
				 var y=$(a).parent().parent().find("span").eq().text(); //商品的单价
				 var cc=ii*data.biaoji;
				 $(a).parent().parent().find("span").eq(3).html(cc);//下标从0开始  该商品的数量乘以单价的到商品的金额并赋值
				 
				 heji();//选中商品以后加之后的要调合计的方法 这个要放最后
			       
				}
				
				
			})
		 
	}
	
	
	function shangpin_jian(a){//商品里的数量减的效果
		var c=$(a).parent().parent().find(":checkbox").val(); //得到的是购物车里商品的id
		var ee=$(a).parent().parent().find(":button").first().next().val();//得到商品数量按钮里的值
		if(ee==2){//当数量为2，这时点击了减，将减的按钮改成不可点击状态 这样当数量为1时，就不点击减按钮了
			$(a).parent().parent().find(":button").first().attr('disabled',true);
		}
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts//jian_cartGoodNum",
				dataType:"json",
				type:"post",
				data:{"cartGoodId":c,"cartGoodNum":ee},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					 
				 	
				 $(a).parent().parent().find(":button").first().next().text(data.biaoji);//数量里的值   从后台传过来的
				 $(a).parent().parent().find(":button").first().next().val(data.biaoji);//数量里的value
				
				 var ii= $(a).parent().parent().find("span").first().text();//商品的单价
				 // $(a).parent().parent().find("span").eq(3).text();//下标从0开始  商品的金额
				
				 var cc=ii*data.biaoji;
				 $(a).parent().parent().find("span").eq(3).html(cc);//下标从0开始  该商品的数量乘以单价的到商品的金额并赋值
				 
				 heji();//选中商品以后加减之后的要调合计的方法
			       
				}
				
				
			})
	
	}
	
	function heji(){//求合计的方法
		var cc=0;
	    var aa=0;
	    aa=$("input[name='cartgoodId_checkbox']:checked").length;//商品的件数
	    $("#shangpingeshu").html("<font color='red'>"+aa+"</font>");
		$("input[name='cartgoodId_checkbox']:checked").each(function(){//循环计算出总金额
			cc=cc+parseInt($(this).parent().parent().find("span").eq(3).text());
			});
		
		$("#heji").html(cc);
	}
	 function  update_select_cartgood(cartgoodId){//修改购物车里的商品之前去查找商品
		 $("#update_color").empty();//这里先要请空一下
		 $("#update_spece").empty();
		
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/slectBycartgoodId_to_color_to_specs",
				dataType:"json",
				type:"post",
				data:{"cartgoodId":cartgoodId},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					for(i=0;i<data.colorlist.length;i++){
					$("#update_color").append("<option value='"+data.colorlist[i].gcId+"'>"+data.colorlist[i].gcName+"</option>");
	        	}
					$("#update_color").val(data.cartGoods.gColor.gcId);
				
					 for(i=0;i<data.specelist.length;i++){
						 $("#update_spece").append("<option value='"+data.specelist[i].specsId+"'>"+data.specelist[i].specsName+"</option>");
			        	}
					 $("#update_cartgoodid").val(data.cartGoods.cartGoodId);
					 $("#update_spece").val(data.cartGoods.specs.specsId);
					 $("#cart_updateModal").modal("show");
					
					 }
				
				
			})
	 }
	 
	function update_cartgood(){//修改购物车里的商品的 提交的操作
		
		 $("#cart_updateModal").modal("hide");
		$.ajax({
			url:"${pageContext.request.contextPath}/carts/update_cartgoods",
			dataType:"json",
			type:"post",
			data:{"cartGoodId":$("#update_cartgoodid").val(),
				 "specs.specsId":$("#update_spece").val(),
				 "gColor.gcId":$("#update_color").val()
			},
				
				//这里不能直接写cartGoodIds，要写成json格式的
			success:function(data){
				
				location.reload(); 
				 
				 
				 }
			
		})
		
	}
	

	 function jieshuan(){//结算
		 var cartGoodIds=new Array();
		 $("input[name='cartgoodId_checkbox']:checked").each(function(){//选中的商品按钮将按钮里的商品Id封装到集合中
			 cartGoodIds.push($(this).val());
		
			});
		if(cartGoodIds.length!=0){
		     
			location.href="${pageContext.request.contextPath}/carts/mycart_jieshuan?cartGoodIds[]="+cartGoodIds;
			//如果这里不是ajax传参时，是url传参是要加[],不然传不过去
				
			
		}else{
		    alert("请你选择你要结算的商品！")
		}
	 }
</script>

</head>
<body>



<br><br><br>

<div id="d11" class="container">
	
		<div  id="d2">
		 
		<div class="row">
		<div class="col-lg-2 col-md-2" id="w1">&nbsp;<input type="checkbox" onclick="quanxuan_checkbox(this)"/>&nbsp;全选</div>
		<div class="col-lg-4 col-md-4" id="w2">商品信息</div>
		<div class="col-lg-1 col-md-2" id="w3">单&nbsp;&nbsp;&nbsp;价</div>
		<div class="col-lg-2 col-md-2" id="w4">数&nbsp;&nbsp;&nbsp;量</div>
		<div class="col-lg-1 col-md-1" id="w5">金&nbsp;&nbsp;&nbsp;额</div>
		<div class="col-lg-2 col-md-1" id="w6">操&nbsp;&nbsp;&nbsp;作</div>
		</div>
	
		</div>	
		
		<div class="row">
		<div id="dear" style="left:390px;">
		<br>
		<div class="col-lg-1 col-md-1"> <input type="checkbox" onclick="quanxuan_checkbox(this)"/>&nbsp;全选 </div>
		<div class="col-lg-2 col-md-2"> <a onclick="setFagoods()">批量关注</a> </div>
		<div class="col-lg-2 col-md-2"> <a onclick="deleteCartGoods_piliang()">批量删除</a> </div>
		<div class="col-lg-1 col-md-1"> </div>
		<div class="col-lg-2 col-md-2">已选择商品&nbsp;<span id="shangpingeshu"><font color="red">0</font></span>&nbsp;件</div>
		<div class="col-lg-2 col-md-2">合计:&nbsp;&nbsp;<font color="red">￥<span id="heji">0.0</span></font></div>
		<div class="col-lg-2 col-md-2" style="top: -26px; left: 50px;font-weight:bold;color:red"><input type="button" id="jisuananniu" onclick="jieshuan()"  style='font-size:25px' value="结 算"/></div>

		
		</div>
		<br>
	
		
		</div>
		
		
			
</div>	
	


<!-- 修改模态框 -->
<div class="modal fade" id="cart_updateModal" data-backdrop="false">
<!-- data-backdrop="false"设置显示模态框时，在模态框外面点击时，模态框时否消失-->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">修改购物车商品的规格及颜色</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form">
      
      <div class="form-group">
     
	  <label for="colorid" class="col-lg-3 col-sm-3 control-label">颜色分类:</label>
	  <div class="col-lg-9">
	  <input type="hidden" id="update_cartgoodid" />
	  
       <select id="update_color" class="form-control" ></select>
		</div>
		</div>
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label">手机内存分类:</label>
	  <div class="col-lg-9">
	   
       <select id="update_spece" class="form-control" ></select>
		</div>
		</div>
    
      </form>
      <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="update_cartgood();"><i class="glyphicon glyphicon-ok"></i>&nbsp;确定修改</button>&nbsp;
         <button type="button" class="btn btn-info" onclick="reset();"><i class="glyphicon glyphicon-repeat"></i>&nbsp;表单重置</button>&nbsp;
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i>&nbsp;放弃修改</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="delete_cartgoods_Modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content danger">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" align="center">删除确认</h3>
      </div>
      <div class="modal-body">
	      <div class="alert alert-danger alert-dismissible fade in" role="alert" id="deleteAlert" >
	        	<p>您真的要删除&nbsp; <span id="delete_cartgoodId"></span>&nbsp; 的信息吗？请谨慎删除！</p>
	       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="deleteCartGood();"><i class="glyphicon glyphicon-trash"></i>&nbsp; 确认删除</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="glyphicon glyphicon-repeat"></i>&nbsp; 放弃</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" tabindex="-1" role="dialog" id="delete_cartgoodsPiliang_Modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content danger">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" align="center">删除确认</h3>
      </div>
      <div class="modal-body">
	      <div class="alert alert-danger alert-dismissible fade in" role="alert" id="deleteAlert" >
	        	<p>您真的要删除&nbsp; <span id="delete_cartgoodId_piliang"></span>&nbsp; 的信息吗？请谨慎删除！</p>
	       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="deleteCartGoods();"><i class="glyphicon glyphicon-trash"></i>&nbsp; 确认删除</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="glyphicon glyphicon-repeat"></i>&nbsp; 放弃</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">


</script>
</body>
</html>