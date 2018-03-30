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
	background-color: #FFF0F5;
	border:1px dashed #000;
	 font-size: 12px
}
#dear{
background-color: #FF9966;
    position:fixed;
    bottom:0;
    left:100;
    width:945px;
    height:50px
}

</style>
<script type="text/javascript">

$(function(){
	// var uid=1;
	cartsgoddss();
		
		})
   
   function cartsgoddss(){
	 $.ajax({
		url:"${pageContext.request.contextPath}/carts/goodAll?userId=1",
		dataType:"json",
		success:function(data){
			//console.log(data);
			for(i=0;i<data.length;i++){
				$("#d2").append("<br><div><div class='row'><div class='col-lg-12 col-md-12'><input type='checkbox' onclick='dianpu_checked(this)' name='shopId_checkbox' value='"
						+data[i][0].shopId+"'>"+data[i][0].shopName+" <div id='dp"+i+"' class='goods'></div></div></div></div>");
				for(j=0;j<data[i].length;j++){
				    $("#dp"+i).append("</br><div class='row'><div class='col-lg-2 col-md-2'>&nbsp;<input type='checkbox'"
						 +" name='cartgoodId_checkbox'onclick='shangpin_checked(this)' value='"+data[i][j].cartGoodId+"'/>&nbsp;"
						 +"<img src='"+data[i][j].goodsImg+"'width=40 height=30/></div>"
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
				         +"<a onclick='deleteCartGood("+data[i][j].cartGoodId+")'>删除</a><a>|修改</a> </div></div></br>");
				   			
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
		 $("input[name='cartgoodId_checkbox']:checked").each(function(){
			 alert(11);
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
	 
	 function deleteCartGoods(){//批量量删除购物车里的商品
		 var cartGoodIds=new Array();
		 $("input[name='cartgoodId_checkbox ']:checked").each(function(){
			 cartGoodIds.push($(this).val());
			});
		if(cartGoodIds.length!=0){
		
		 
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts/deleteCartGoods",
				dataType:"json",
				type:"post",
				data:{"cartGoodIds":cartGoodIds},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					location.reload();
				}
				
				
			})
		}else{
		    alert("请你选择你要删除的商品！")
		}
	 }
	function dianpu_checked(c){//点击店铺的多选按钮后，选中时它里面的商品也会选中，反之，里面的商品也不会选中
		 console.log(c);
		if(c.checked){
			//alert("ddddddd")
			//var cc=$("c.next() input[type='checkbox']").length;
			//alert(cc);
			$(c).parent().find(":checkbox").prop("checked",true);
			
		}else{
			$(c).parent().find(":checkbox").prop("checked",false);
			
		}
		heji();	 
	}
	 
	function shangpin_checked(a){//店铺里的商品，如果全部选中是时，店铺的多选按钮也会选中，如果没选完， 店铺的按钮会取消选中	
	 var cc=$(a).parent().parent().parent().find(":checkbox").length;
	 var ca=$(a).parent().parent().parent().find(":checked").length;
	//alert(ca);
	
	if(cc==ca){
		
		$(a).parent().parent().parent().parent().parent().find(":checkbox").first().prop("checked",true);
	}else{
		$(a).parent().parent().parent().parent().parent().find(":checkbox").first().prop("checked",false);
	}
	heji();
	}
	
	function quanxuan_checkbox(a){//全选按钮
		
		if(a.checked){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
		heji();
		
	}
	function shangpin_jia(a){//商品数量加的效果
		//$(a).parent().parent().find(":checkbox").prop("checked",true);
		var c=$(a).parent().parent().find(":checkbox").val();//得到的是购物车里商品的id
		var ee=$(a).parent().parent().find(":button").first().next().val();//得到数量按钮里的值
		if(ee==1){
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
				  $(a).parent().parent().find("span").eq(3).text();//下标从0开始  商品的金额
				 var y=$(a).parent().parent().find("span").eq().text(); //商品的单价
				 var cc=ii*data.biaoji;
				 $(a).parent().parent().find("span").eq(3).html(cc);
				 
				 heji();//选中商品以后加之后的要调合计的方法 这个要放最后
			       
				}
				
				
			})
		 
	}
	
	
	function shangpin_jian(a){//商品里的数量减的效果
		var c=$(a).parent().parent().find(":checkbox").val(); //得到的是购物车里商品的id
		var ee=$(a).parent().parent().find(":button").first().next().val();//得到改按钮里的值
		if(ee==2){
			$(a).parent().parent().find(":button").first().attr('disabled',true);
		}
		 $.ajax({
				url:"${pageContext.request.contextPath}/carts//jian_cartGoodNum",
				dataType:"json",
				type:"post",
				data:{"cartGoodId":c,"cartGoodNum":ee},//这里不能直接写cartGoodIds，要写成json格式的
				success:function(data){
					 
				 	//location.reload(); 
				 $(a).parent().parent().find(":button").first().next().text(data.biaoji);//数量里的值
				 $(a).parent().parent().find(":button").first().next().val(data.biaoji);//数量里的value
				 var ii= $(a).parent().parent().find("span").first().text();//商品的数量
				  $(a).parent().parent().find("span").eq(3).text();//下标从0开始  商品的金额
				 var y=$(a).parent().parent().find("span").eq().text(); //商品的单价
				 var cc=ii*data.biaoji;
				 $(a).parent().parent().find("span").eq(3).html(cc);
				 
				 heji();//选中商品以后加减之后的要调合计的方法
			       
				}
				
				
			})
	
	}
	
	function heji(){//求合计的方法
		var cc=0;
	    var aa=0;
	    aa=$("input[name='cartgoodId_checkbox']:checked").length;
	    $("#shangpingeshu").html(aa);
		$("input[name='cartgoodId_checkbox']:checked").each(function(){
			cc=cc+parseInt($(this).parent().parent().find("span").eq(3).text());
			});
		
		$("#heji").html(cc);
	}
	
	
</script>

</head>
<body>



<br><br><br>

<div id="d11" class="container">
		<div class="row">
		<div class="col-lg-1 col-md-1" id="d1"></div>
		
		
		<div class="col-lg-10 col-md-10" id="d2">
		 
		<div class="row">
		<div class="col-lg-2 col-md-2" id="w1">&nbsp;<input type="checkbox" onclick="quanxuan_checkbox(this)"/>全选</div>
		<div class="col-lg-4 col-md-4" id="w2">商品信息</div>
		<div class="col-lg-1 col-md-1" id="w3">单价</div>
		<div class="col-lg-2 col-md-2" id="w4">数量</div>
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
		<div id="dear"  ">
		<br>
		&nbsp;&nbsp;&nbsp;
		<input type="checkbox" onclick="quanxuan_checkbox(this)"/>全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a onclick="setFagoods()">批量关注</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a onclick="deleteCartGoods()">批量删除</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		已选择商品&nbsp;<span id="shangpingeshu"><font color="red">0</span>&nbsp;件
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		合计<font color="red">￥<span id="heji">0.0</span></font>&nbsp;&nbsp;&nbsp;&nbsp;
		<br>
		
		</div>
	
		</div>
		<div class="col-lg-1 col-md-1" ></div>
		
		
			
</div>		
<!-- 修改模态框 -->
<div class="modal fade" id="theme_updateModal" data-backdrop="false">
<!-- data-backdrop="false"设置显示模态框时，在模态框外面点击时，模态框时否消失-->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">设置该主题帖是否置顶/精华</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form">
      <div class="form-group">
	  <label for="themeId" class="col-lg-2 col-sm-2 control-label">主题编号:</label>
	  <div class="col-lg-10">
	  <input type="text" class="form-control" id="themeId"
	 name="themeId" readonly="readonly" width="50px">
		</div>
		</div>
      <div class="form-group">
	  <label for="themeTitle" class="col-lg-2 col-sm-2  control-label">主题标题:</label>
	  <div class="col-lg-10">
	  <input type="text" class="form-control" id="themeTitle"
	 name="themeTitle" readonly="readonly" width="50px">
	 
	 
	 <input type="hidden" id="updateTheme_themeIsTop">
	 <input type="hidden" id="updateTheme_themeIsTopTime">
		</div>
		</div>
         
      <div class="form-group"><!-- 按钮组， label+group ，group中有两个lable,每label包一个input radio -->
   
      <label for="themeIsTop" class="col-lg-2 col-sm-2 control-label">置顶状态:</label>
       <div class="col-lg-10 ">
      <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-default active" id="label_themeIsTop1">
    <input type="radio" name="themeIsTop" id="update_themeIsTop1" value="1"  autocomplete="off" >是
  </label>
  <label class="btn btn-default" id="label_themeIsTop2">
    <input type="radio" name="themeIsTop" value="0" id="update_themeIsTop2" autocomplete="off">否
  </label>
  </div>
  </div>
 </div>
 
 
      <div class="form-group"><!-- 按钮组， label+group ，group中有两个lable,每label包一个input radio -->
      <label for="themeSign" class="col-lg-2 col-sm-2 control-label">精华状态:</label>
       <div class="col-lg-10 ">
      <div class="btn-group" data-toggle="buttons">
  <label class="btn btn-default active" id="label_themeSign1">
    <input type="radio" name="themeSign" id="update_themeSign1" value="1" autocomplete="off" >是
  </label>
  <label class="btn btn-default" id="label_themeSign2">
    <input type="radio" name="themeSign" value="0" autocomplete="off" id="update_themeSign2">否
  </label>
  </div>
  </div>
 </div>
      </form>
      <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="update_theme();"><i class="glyphicon glyphicon-ok"></i>&nbsp;确定修改</button>&nbsp;
         <button type="button" class="btn btn-info" onclick="reset();"><i class="glyphicon glyphicon-repeat"></i>&nbsp;表单重置</button>&nbsp;
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i>&nbsp;放弃修改</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">


</script>
</body>
</html>