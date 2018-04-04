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
				"goodsId":1
			},
			dataType:"json",
			success:function(data){
				$("#td_goodsImg").append("<img src="+data.goodsImg+">");
				$("#td_goodsName").append(data.goodsName);
				$("#smoney").append(data.specs[0].smoney);
				$("#saleNum").append(data.saleNum);
				$("#appraisesNum").append(data.appraises.length);
				for (var x = 0; x < data.specs.length; x++) {
					
					$("#td_specsName").append("<label class='btn btn-default'><input type='radio' name='specsName_btn' onchange='getGStock("+data.specs[x].specsId+")'>"+data.specs[x].specsName+"</label>");
				}
				for (var y = 0; y < data.appraises.length; y++) {
						
				}
				for (var z = 0; z < data.goodsColor.length; z++) {
					$("#td_gcName").append("<label class='btn btn-default'><input type='radio' name='gcName_btn'>"+data.goodsColor[z].gcName+"</label>");
				}
					
					$("#shopRow").append("<div class='col-lg-2 col-sm-2'><a href=''>"+data.shop.shopName+"</a></div>"
							+"<div class='col-lg-1 col-sm-1'>描述<br>5</div>"
							+"<div class='col-lg-1 col-sm-1'>服务<br>5</div>"
							+"<div class='col-lg-1 col-sm-1'>物流<br>5</div>"
							+"<div class='col-lg-2 col-sm-2'><a href=''><img src="+data.shop.shopImg+"></a></div>"
							+"<div class='col-lg-5 col-sm-5'><button class='btn btn-default'>添加收藏</button></div>"
					);
					
						
			}
			
		})
	});
	
	function addNum() {
		$("#td_num").val(eval($("#td_num").val() +"+1"));
	}
	
	function minusNum() {
		if ($("#td_num").val() <= 1) {
			$("#minusBtn").attr('disabled',true);
		} else if ($("#td_num").val() >1){
			$("#minusBtn").attr('disabled',false);
			$("#td_num").val(eval($("#td_num").val() +"-1"));
		}
		
	}
	
	function getGStock(specsId) {
		$.ajax({
			url:"myTaobao/selectSpecs",
			data:{
				"specsId":specsId
			},
			success:function(data){
				$("#gStock").empty();
				$("#smoney").empty();
				$("#gStock").append(data.gStock);
				$("#smoney").append(data.smoney);
				
			}
		});
	}
	
</script>

<body>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
		<div class="col-lg-6 col-md-6 col-sm-6" id="goodsBody"><!-- body -->
			
			<div class="row" id="shopRow" style="width: 100%;border: 1px solid;"></div>
			
			<div class="row" style="width: 100%;">
			<table border="1" width="100%">
				<tr>
					<td rowspan="6" width="40%" id="td_goodsImg"></td><!-- 商品图片 -->
					<td colspan="2" id="td_goodsName"></td><!-- 商品名称 -->
				</tr>
				<tr>
					<td width="15%">价格</td>
					<td>
						<font size="5" color="red" id="smoney"></font>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="td_saleNum">总销量<font id="saleNum" color="red"></font>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;评价<font id="appraisesNum" color="red"></font></td><!-- 销量、评价 -->
				</tr>
				<tr>
					<td>机身颜色</td>
					<td>
						<div class="btn-group" data-toggle="buttons" id="td_gcName"></div>
					</td>
				</tr>
				<tr>
					<td>存储容量</td>
					<td>
						<div class="btn-group" data-toggle="buttons" id="td_specsName"></div>
					</td>
				</tr>
				<tr>
					<td>数量</td>
					<td>
						<button type="button" id="addBtn" class="btn btn-dafault" onclick="addNum()"><i class="glyphicon glyphicon-plus"></i></button>
						<input type="text" value="1" size="2" id="td_num">
						<button type="button" id="minusBtn" class="btn btn-dafault" onclick="minusNum()"><i class="glyphicon glyphicon-minus"></i></button>
						&nbsp;&nbsp;&nbsp;库存<font id="gStock"></font>
					</td>
				</tr>
				<tr>
					<td align="center">收藏商品</td>
					<td colspan="2" align="center" id="td_buy">
						<button type="button" class="btn btn-danger">加入购物车</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger">购买</button>
					</td>
				</tr>
			</table>
			</div>
		</div><!-- body结束 -->
		<div class="col-lg-3 col-md-3 col-sm-3"></div>
	</div>
</body>
</html>