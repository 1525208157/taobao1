<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
#cc{
background-color:  #FFF0F5;
 font-size: 14px;
padding:11px;
  
}

#d11{
font-size: 17px;
}

#dibu{
width:455px;

border:3px solid  #FF9966;;
}
</style>
<body>
<div id="d11" class="container">
		<c:if test="${empty users}">
		<script type="text/javascript">
		location.href="${pageContext.request.contextPath}/carts/tiaozhuan_login";
		</script>
		</c:if>
        <c:if test="${!empty users}">
		<div  id="d2">
		<br><br><br><br>
		 <div class="row">
		
		 <div class="col-lg-2 col-md-2" >确认收货地址:</div>
		 <div class="col-lg-8 col-md-8" ></div>
		 <div class="col-lg-2 col-md-2" ><a onclick="cheshi()">管理收货地址</a></div>
		 </div>
		 <div class="row">
		  <hr style="height:2px;border:none;border-top:2px dotted #185598;">
		  </div>
		<div class="row">
		 寄货至:
		
		
		</div>
		
		<div class="row">
		<div class="col-lg-1 col-md-1" > </div>
		<div class="col-lg-9 col-md-9" >  
	      
	      <c:forEach items="${address}" var="addr">
	      <br>
	     <div> <input type="radio" name="addrs" onclick="fapiaotaitou()" ${addr.isDefault eq "1"?"checked":""}
	      value="${addr.addressId}" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     <span> ${addr.userAddress}</span>      &nbsp; &nbsp;&nbsp;
	     (<span name="username">${addr.userName}</span>&nbsp;收)  &nbsp;&nbsp;&nbsp;
	      <span>${addr.userPhone}</span>&nbsp;&nbsp;&nbsp;
	      &nbsp;&nbsp;&nbsp;${addr.isDefault eq 1?"默认地址":""}
	      
	      </div>
	      </c:forEach>
	    
	    
	       
	     </div>
	     <div class="col-lg-2 col-md-2" >
	     <br>
	     <c:forEach items="${address}" var="addr">
	     <a onclick="update_address('${addr.addressId}')">修改本地址</a><br><br>
	     </c:forEach>
	     </div>
		</div>
		<div class="row">
		<div class="col-lg-1 col-md-1" ></div>
		<div class="col-lg-9 col-md-9" ><a onclick="show_insertAddress();">&nbsp;&nbsp;&nbsp;使用新地址</a></div>
		<div class="col-lg-2 col-md-2" ></div>
		
		</div>
		
		<div class="row">
		<br>
		确定订单信息
		<hr style="height:2px;border:none;border-top:2px dotted #185598;">
		</div>
		<div class="row">
		<div class="col-lg-4 col-md-4" >店铺宝贝</div>
		<div class="col-lg-3 col-md-3" >商品属性</div>
		<div class="col-lg-1 col-md-1" >单价</div>
		<div class="col-lg-1 col-md-1" >数量</div>
		<div class="col-lg-2 col-md-2" >优惠方式</div>
		<div class="col-lg-1 col-md-1" >合计</div>
		</div>
		 <c:forEach items="${cart_jieshuan}" var="cart_jie">
		
		 <div>
		  <br>
		 ${cart_jie[0].shopName}
		 <hr style="height:1px;;border-top:2px dotted #185598;">
		 </div>
		 
		  <div id="cc">
		  <c:forEach items="${cart_jie}" var="a">
		 
		  
		  	<div class="row">
		  	<div class="col-lg-2 col-md-2" ><img src="${a.goodsImg}" width=60 height=50></div>
		    <div class="col-lg-2 col-md-2" >${a.goodsName}<input type="hidden" name="cartgoodsId" value="${a.cartGoodId}"></div>
		     <div class="col-lg-3 col-md-3" >手机颜色：${a.gcName}<br>手机内存：${a.specsName}</div>
		    <div class="col-lg-1 col-md-1" >${a.smoney}</div>
		    <div class="col-lg-1 col-md-1" >${a.cartGoodNum}</div>
		   <div class="col-lg-2 col-md-2" >优惠方式</div>
		   <div class="col-lg-1 col-md-1" ><span name="acc"><font  color='red'>${a.totalPrice}</font></span></div>
		  	</div>
		    <br>
		  
		 
		  
		  </c:forEach>
		  
		  <div class="row">
		  <br>
		  <div class="col-lg-5 col-md-5"><input type="checkbox">开具发票<br>发票抬头类型: &nbsp;&nbsp;<input type="radio" name="taitou" checked>个人
		  &nbsp;&nbsp;<input type="radio"  name="taitou" >企业<br>发票抬头 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<span name="fapiao"></span>&nbsp;
		  &nbsp;<a>修改</a>
		  <br> 给卖家留言:&nbsp;<input type="text">
		  </div>
		  <div class="col-lg-6 col-md-6">
		   运送方式：普通配送 &nbsp;快递&nbsp;免邮<br>
		 运费险：<input type="checkbox">运费险 &nbsp;卖家送，确认收货前退货问题
		   
		  
		  
		  </div>
		  <div class="col-lg-1 col-md-1"><font  color='red'>0.00</font></br><font  color='red'>0.00</font>
		 </div>
		  </div>
		  <div class="row">
		   <div class="col-lg-9 col-md-9"></div>
		   <div class="col-lg-3 col-md-3">店铺合计(含运费)&nbsp;<font color="red">￥</font><span name="dianpujieshuan"></span></div>
		  </div>
		  </div>
		 </c:forEach>
		
		 <div class="row">
		 <div class="col-lg-7 col-md-7"></div>
		  <div class="col-lg-5 col-md-5">
		 
		  <div id="dibu">
	
		  <div class="row">
		   <div class="col-lg-6 col-md-6"></div>
		   <div class="col-lg-6 col-md-6">
		   <font style='font-weight:bold' >实付款:</font><font size="6">￥</font><span id="zonghe"></span>
		   </div>
		  </div>
		  
		   <div class="row">
		   <div class="col-lg-2 col-md-2"></div>
		   <div class="col-lg-10 col-md-10">
		     <font style='font-weight:bold'> 寄送至:</font><span id="dizhi"></span><br>
		   </div>
		  </div>
		  
		  
		   <div class="row">
		   <div class="col-lg-5 col-md-5"></div>
		   <div class="col-lg-7 col-md-7">
		    <font style='font-weight:bold'>收货人:</font><span id="shouhuoren"></span> &nbsp;&nbsp; 
            <span id="dianhua"></span>		  
		    
		   </div>
		  </div>
		    
		  </div>
		    <div class="row">
		    <div class="col-lg-1 col-md-1"></div>
		    <div class="col-lg-5 col-md-5"><br><a href="${pageContext.request.contextPath}/carts/showCarts">返回购物车</a></div>
		  <div class="col-lg-3 col-md-3">
		     <button type="button"   style="width:200px;height:50px;background:#FF0033;color:white;font-weight:bold;font-size:18px;" onclick="tijiaodingdan();">&nbsp;&nbsp;提交订单&nbsp;&nbsp;</button>
		  <br><br>
		   </div>
		  
		   <div class="col-lg-3 col-md-3"></div>
		  </div>
		
		 </div>
		 
		</div><!-- 结束 -->
		
		
		
</div>	
</c:if>	
</div>


<!-- 修改模态框 -->
<div class="modal fade" id="address_updateModal" data-backdrop="false">
<!-- data-backdrop="false"设置显示模态框时，在模态框外面点击时，模态框时否消失-->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">修改地址</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form">
      
      <div class="form-group">
     
	  <label for="colorid" class="col-lg-3 col-sm-3 control-label">详细地址:</label>
	  <div class="col-lg-9">
	  <input type="hidden" id="update_addressId" />
	  
      <input type="text" class="form-control" id="update_userAddress"
	  name="update_userAddress"  >
	 
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label">收货人姓名:</label>
	 
	  <div class="col-lg-9">
	   <input type="text" class="form-control" id="update_userName"
	  name="update_userName"  >
       
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label">收货人电话:</label>
	 
	  <div class="col-lg-9">
	   <input type="text" class="form-control" id="update_userPhone"
	  name="update_userPhone"  >
       
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label"></label>
	 
	  <div class="col-lg-9">
	   <input type="checkbox"  id="update_isDefault"
	  name="update_isDefault"   value="1"/>设置为默认收货地址
       
		</div>
		</div>
    
      </form>
      <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="updateAddress();"><i class="glyphicon glyphicon-ok"></i>&nbsp;确定修改</button>&nbsp;
         <button type="button" class="btn btn-info" onclick="reset_updateAddress();"><i class="glyphicon glyphicon-repeat"></i>&nbsp;表单重置</button>&nbsp;
        <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-star"></span>&nbsp;放弃修改</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div><!-- 修改地址模态框 -->


<!--添加收货地址模态框 -->
<div class="modal fade" id="address_insertModal" data-backdrop="false">
<!-- data-backdrop="false"设置显示模态框时，在模态框外面点击时，模态框时否消失-->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">创建地址</h4>
      </div>
      <div class="modal-body">
      
      <form class="form-horizontal" role="form">
      
      <div class="form-group">
     
	  <label for="colorid" class="col-lg-3 col-sm-3 control-label">详细地址:</label>
	  <div class="col-lg-9">
	 
      <input type="text" class="form-control" id="insert_userAddress"
	  name="insert_userAddress"  >
	 
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label">收货人姓名:</label>
	 
	  <div class="col-lg-9">
	   <input type="text" class="form-control" id="insert_userName"
	  name="insert_userName"  >
       
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label">收货人电话:</label>
	 
	  <div class="col-lg-9">
	   <input type="text" class="form-control" id="insert_userPhone"
	  name="insert_userPhone"  >
       
		</div>
		</div>
		
		 <div class="form-group">
	  <label for="spece" class="col-lg-3 col-sm-3 control-label"></label>
	 
	  <div class="col-lg-9">
	   <input type="checkbox"  id="insert_isDefault"
	  name="insert_isDefault"   value="1"/>设置为默认收货地址
       
		</div>
		</div>
    
      </form>
      <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="insert_Address();"><i class="glyphicon glyphicon-ok"></i>&nbsp;确定添加</button>&nbsp;
         <button type="button" class="btn btn-info" onclick="reset_insertAddress()"><i class="glyphicon glyphicon-repeat"></i>&nbsp;表单重置</button>&nbsp;
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="glyphicon glyphicon-remove-circle"></i>&nbsp;放弃添加</button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div><!-- 修改地址模态框 -->

<script type="text/javascript">
/* var a="${address}";
var b="${cart_jieshuan}";//后台存在模型里的对象在js 里面的是 字符串对象，所以在下面的循环中无法循环
   function cart_jieshua(){
    for(i=0;i<a.length;i++){
	$("#dizhi").append("<input type='radio' name='address_dizhi' value='"+a[i].addressId+"'>"
			+a[i].userAddress+"&nbsp;&nbsp;("+a[i].userName+")&nbsp;"
			+a[i].userPhone+"&nbsp;&nbsp<a>修改本地址</a>"
			)
}
} */

heji();//调方法给每个店铺里的合计金额赋值
function heji(){//求每个店铺的合计金额
	$("span[name='dianpujieshuan']").each(function(){//循环店铺集合span标签 >>外层循环
		var a=0;//变量
	 $(this).parent().parent().parent().find($("[name='acc']")).each(function(){//店铺里面的商品集合循环 >>内层循环
		a=a+parseInt(($(this).text()));//计算a的值
	 })
	  $(this).html("<font color='red'>"+a+"</font>");//最后把a的值赋给店铺的合计金额
	 
	 })
}


fapiaotaitou();//页面打开时会调用该方法，单击选择单选按钮时会选择
function fapiaotaitou(){//js 发票台头和 底部提交定单信息框里显示
	var a=null;
	$("input[name='addrs']:checked").each(function(){//选择的单选按钮的集合循环方法
	 a= $(this).parent().find("[name='username']").text();//得到收货人的名字
	 
	  $("#dizhi").html($(this).parent().find("span").eq(0).text());//底部提交定单信息框里的地址赋值
	  $("#shouhuoren").html($(this).parent().find("span").eq(1).text());//底部提交定单信息框里的收货人赋值
	  $("#dianhua").html($(this).parent().find("span").eq(2).text()); ///底部提交定单信息框里的电话赋值
	})
	$("span[name='fapiao']").each(function(){//给发票里姓名赋值
		$(this).html(a);
	});
	
}

zongheji();
function zongheji(){//求总合计
	var a=0;
	$("span[name='dianpujieshuan']").each(function(){//循环店铺合计金额里的span标签计算得到总金额
		a=a+parseInt($(this).text());
	})
	$("#zonghe").html("<font size='6' color='red'>"+a+"</font>");
}

function update_address(c){ //修改地址前的查找
	$.ajax({
		url:"${pageContext.request.contextPath}/carts/getAddress_one?addressId="+c,
		dataType:"json",
		success:function(data){
			 $("#update_addressId").val(data.addressId);
			 $("#update_userAddress").val(data.userAddress);
			 $("#update_userName").val(data.userName);
			 $("#update_userPhone").val(data.userPhone);
			 if(data.isDefault=='1'){//??????
				 $("#update_isDefault").prop("checked",true);
			 }
			
			 $("#address_updateModal").modal("show");
			 
		}
		
		
	})
}
	function Trim(str){ //js去前后去空格函数方法
		             return str.replace(/(^\s*)|(\s*$)/g, ""); 
		     }
	
	function updateAddress(){
		var a=0;
		if($("#update_isDefault").is(':checked')){
			a=1;
		}
		if(Trim($("#update_userAddress").val())==""){
			alert("收货地址不能为空！");
		}else if(Trim($("#update_userName").val())==""){
			alert("收件人不能为空！");
		}else if(Trim($("#update_userPhone").val())==""){
			alert("收件人电话不能为空！");
		}else{
			$.ajax({
				url:"${pageContext.request.contextPath}/carts/update_address",
				dataType:"json",
				data:{"userAddress":Trim($("#update_userAddress").val()),
					"userName":Trim($("#update_userName").val()),
					"userPhone":Trim($("#update_userPhone").val()),
					"isDefault":a,
					"addressId":$("#update_addressId").val()
					},
				success:function(data){
					 $("#address_updateModal").modal("hide");
					location.reload(); 
					 
					
					 
				}
				
				
			})
		
}}
	
	function show_insertAddress(){//显示添加模态框
		 $("#address_insertModal").modal("show");
	}
	
	
	
	
	function insert_Address(){//添加新地址
		
		var a=0;
		if($("#insert_isDefault").is(':checked')){//注意这个js的写法
			a=1;
		}
		if(Trim($("#insert_userAddress").val())==""){
			alert("收货地址不能为空！");
		}else if(Trim($("#insert_userName").val())==""){
			alert("收件人不能为空！");
		}else if(Trim($("#insert_userPhone").val())==""){
			alert("收件人电话不能为空！");
		}else{
			$.ajax({
				url:"${pageContext.request.contextPath}/carts/insert_address",
				dataType:"json",
				data:{"userAddress":Trim($("#insert_userAddress").val()),
					"userName":Trim($("#insert_userName").val()),
					"userPhone":Trim($("#insert_userPhone").val()),
					"isDefault":a
					},
				success:function(data){
					 $("#address_insertModal").modal("hide");
					location.reload(); 
	 
				}
		
			})
		
	}
}
	
		function reset_insertAddress(){
			$("#insert_userName").val(null);
			$("#insert_userPhone").val(null);
			$("#insert_userAddress").val(null);
			$("#insert_isDefault").prop("checked",false);
			
		}
		
		function reset_updateAddress(){
			$("#update_userName").val(null);
			$("#update_userAddress").val(null);
			$("#update_userPhone").val(null);
			$("#update_isDefault").prop("checked",false);
			
		}
		
		function tijiaodingdan(){//提交订单
			 var cartGoodIds=new Array();
			 $("input[name='cartgoodsId']").each(function(){//选中的商品按钮将按钮里的商品Id封装到集合中
				 cartGoodIds.push($(this).val());
			   //  alert("商品id："+cccc)
				});
			 var a=null;
				$("input[name='addrs']:checked").each(function(){//选择的单选按钮的集合循环方法
				 a= $(this).val();//得到收货人的名字
				 alert("收货id："+a);
				})
				if($("input[name='addrs']:checked").length==0){
					alert("请选择收货地址！");
				}else{
				
				$.ajax({
					url:"${pageContext.request.contextPath}/carts/create_dingdan",
					dataType:"json",
					data:{"cartGoodIds":cartGoodIds,"addressId":a},
					success:function(data){
						location.href="${pageContext.request.contextPath}/carts/showCarts";
				}
		
			})}
		}
			
		
		
</script>
</body>
</html>