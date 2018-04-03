<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap的样式文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<body>

<script type="text/javascript">
function insertbtn() {
	$("#insertModal").modal("show");
}
		//点击添加提交表单数据
		function insertBclass(){
			
		$.ajax({
		url : "goods/insertGoods",
				type : "post",
				data : {
					"goods.goodsName":$("#insert_userName").val(),
					
				},
				dataType : "json",
				processData:false,
				contentType:false, 
				success : function(data){
					if(data.msg=="ok"){
						alert("添加成功!");
					/* 	$("#insertbbsname").val("");
						$("#classPicture").val(""); */
						$("#insertModal").modal("hide");
						$("#insertModal").modal("hide"); //隐藏添加模态框								
						$("#tab").bootstrapTable("refresh");//刷新表格数据
					} else if (data.msg=="error"){
						alert("添加失败!");
					}
				}
	});
		}
		
</script>

<!-- insert模态框开始 -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加版块信息</h4>
				</div>
				<div class="modal-body">
					<form action="" method="post" class="form-horizontal" role="form"
						name="insertForm" id="insertForm">
						

						<div class="form-group">
							<label for="hire" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insertbbsname"
									name="classname" required="required">
							</div>
						</div>

						<!-- <div class="form-group">
							<label for="email" class="col-sm-2 control-label">版块介绍</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="insertbbsjieshao"
									name="classmsg" required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="insert_userName" class="col-sm-2 control-label">版主</label>
							<div class="col-sm-10">
								<select id="insert_userName" name = "uid"></select>
							</div>
						</div>
							
						<div class="form-group">
    						<label for="insert_classPicture" class="col-sm-2 control-label">图片</label>
    						<div class="col-sm-10">
      							<input type="file" class="form-control" id="classPicture" name = "url">
    						</div>
  						</div> -->
						</form>	
						</div>
					

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="insert_submit_btn"
						onclick="insertBclass();">
						<span class="glyphicon glyphicon-ok"></span>&nbsp; 确认添加
					</button>
					<button type="button" class="btn btn-info" id="insert_reset_btn"
						onclick="insert_reset();">
						<span class="glyphicon glyphicon-repeat"></span>&nbsp; 重置表单
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>&nbsp; 放弃添加
					</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- insert模态框结束-->
	<div id="toolbar">
    			<button class="btn btn-info" type="button" onclick="insertbtn();"><i class="glyphicon glyphicon-plus"></i>&nbsp;发布新商品</button>
    			</div>
</body>
</html>