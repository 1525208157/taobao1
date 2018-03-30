<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<!-- bootstrap的样式文件 -->
<link rel="stylesheet" href="js/bootstarp-3.3.7/css/bootstrap.min.css" />
<!-- 导入jquery.js,必须在导入bootstrap的js之前先导入 -->
<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
<!-- 导入bootstrap.js,必须在导入jquery.js之后导入 -->
<script type="text/javascript"
	src="js/bootstarp-3.3.7/js/bootstrap.min.js"></script>

<!-- bootstarp-table部分 -->
<!-- bootstrap-table的样式文件 -->
<link rel="stylesheet"
	href="js/bootstarp-table-1.11.1/bootstrap-table.min.css" />
<!-- 导入bootstrap-table.js,必须在导入bootstrap.js之后导入 -->
<script type="text/javascript"
	src="js/bootstarp-table-1.11.1/bootstrap-table.min.js"></script>
<!-- bootstrap-table的汉化文件，汉化默认样式中的内容，必须在bootstarp-table.js之后导入 -->
<script type="text/javascript"
	src="js/bootstarp-table-1.11.1/bootstrap-table-zh-CN.min.js"></script>

<style>
#all {
	width: 95%;
}

#banner{
				height: 50px;
				background-color: #008AE5;
				
				margin: 5px;
			}
			
#bname{
	height: 40px;
	background-color: #F6F6F6;
	margin: 5px;
	}
</style>


<body>
	
	  	  		<nav class="navbar" id="bname"><!-- id="banner"  -->
  		<div class="container-fluid">
    	<!-- Brand and toggle get grouped for better mobile display -->
    
    	<div class="navbar-header">
      	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a class="navbar-brand" href="#"><span style="color:#808080">卖家手机端</span>&nbsp;&nbsp;</a>
       
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <li class="active"><a href="#" id="a"><span style="color:#808080">淘宝网首页</span><span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="#" id="a"><span style="color:#808080">我的淘宝</span><span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="#" id="a"><span style="color:#808080">卖家服务</span><span class="sr-only">(current)</span></a></li>
        <li><a href="#"><sapn style="color:#808080">卖家中心</sapn></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span style="color:#FFFFFF">更多</span> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">规则中心</a></li>
            <li><a href="#">安全中心</a></li>
            <li><a href="#">应用中心</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">淘宝大学</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">问题反馈</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">联系客服</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">卖家地图 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	
	
  <div class="container">
  	<div class="row">
  	  <div class="col-md-12">

  		</div>
  </div>
  
  
  
  </div>
  


<nav class="navbar" id="banner"><!-- id="banner"  -->
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a class="navbar-brand" href="#"><span style="color:#FFFFFF">淘宝网</span>&nbsp;&nbsp;<span style="color:#FFFFFF">卖家中心</span></a>
       
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <li class="active"><a href="#" id="a"><span style="color:#FFFFFF">首页</span><span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="#" id="a"><span style="color:#FFFFFF">自运营</span><span class="sr-only">(current)</span></a></li>
        <li><a href="#"><sapn style="color:#FFFFFF">基础设置</sapn></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span style="color:#FFFFFF">更多</span> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">规则中心</a></li>
            <li><a href="#">安全中心</a></li>
            <li><a href="#">应用中心</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">淘宝大学</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">问题反馈</a></li>
          </ul>
        </li>
      </ul>
     
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div  class="container">

	<div class="row">
		<div class=".col-md-1">
<table border="1" width="600" height="600" >
<tr>
<td>店铺管理</td>
</tr>
<tr>
<td><a href="#">我要开店</a></td>
</tr>

<tr>
<td>交易管理</td>
</tr>

<tr>
<td><a href="#">已卖出的商品</a></td>
</tr>

<tr>
<td>物流管理</td>
</tr>



<tr>
<td><a href="#">发货</a></td>
</tr>

<tr>
<td>商品管理</td>
</tr>

<tr>
<td><a href="#">发布新商品</a></td>
</tr>

<tr>
<td>仓库中的商品</td>
</tr>

<tr>
<td>
<a href="#">查看库存</a>
</td>
</tr>
</table>
			</div>
	</div>
</div>


<!--底部footer-->
    <div class="footer" id="J_SiteFooter" data-spm="1997523009">
   <div class="footer-hd" align="center">
    <p><span><a href="http://www.alibabagroup.com/cn/global/home">阿里巴巴集团</a></span><b>|</b><span><a href="//www.taobao.com">淘宝网</a></span><b>|</b><span><a href="//www.tmall.com">天猫</a></span><b>|</b><span><a href="//ju.taobao.com">聚划算</a></span><b>|</b><span><a href="http://www.aliexpress.com">全球速卖通</a></span><b>|</b><span><a href="http://www.alibaba.com/">阿里巴巴国际交易市场</a></span><b>|</b><span><a href="http://www.1688.com">1688</a></span><b>|</b><span><a href="http://www.alimama.com">阿里妈妈</a></span><b>|</b><span><a href="http://www.fliggy.com/">飞猪</a></span><b>|</b><span><a href="http://www.aliyun.com">阿里云计算</a></span><b>|</b><span><a href="http://www.yunos.com">YunOS</a></span><b>|</b><span><a href="http://www.aliqin.cn/">阿里通信</a></span><b>|</b><span><a href="http://www.etao.com/">一淘</a></span><b>|</b><span><a href="http://www.net.cn">万网</a></span><b>|</b><span><a href="http://www.autonavi.com/">高德</a></span><b>|</b><span><a href="http://www.uc.cn/">UC</a></span><b>|</b><span><a href="http://www.umeng.com/">友盟</a></span><br /><span><a href="http://www.xiami.com">虾米</a></span><b>|</b><span><a href="http://www.alibabaplanet.com/">阿里星球</a></span><b>|</b><span><a href="http://www.laiwang.com/">来往</a></span><b>|</b><span><a href="http://www.dingtalk.com/?lwfrom=20150130160830727">钉钉</a></span><b>|</b><span><a href="https://www.alipay.com">支付宝</a></span><b>|</b><span><a href="http://www.youku.com/">优酷</a></span><b>|</b><span><a href="http://www.tudou.com/">土豆</a></span><b>|</b><span><a href="http://www.alihealth.cn/">阿里健康</a></span><b>|</b><span><a href="http://www.alibabapictures.com/simp/0-home.html">阿里影业</a></span><b>|</b><span><a href="http://www.alisports.com/cn/">阿里体育</a></span><b>|</b><span><a href="https://www.mybank.cn/">网商银行</a></span></p>
   </div>
   <div class="footer-bd" align="center">
    <p><span><a href="//www.taobao.com/about">关于淘宝</a></span><span><a href="//www.taobao.com/about/partners.php">合作伙伴</a></span><span><a href="//pro.taobao.com">营销中心</a></span><span><a href="http://jubao.alibaba.com/internet/readme.htm?site=taobao">廉正举报</a></span><span><a href="//service.taobao.com/support/main/service_route.htm">联系客服</a></span><span><a href="//open.taobao.com">开放平台</a></span><span><a href="//www.taobao.com/about/join.php">诚征英才</a></span><span><a href="//consumerservice.taobao.com/contact-us">联系我们</a></span><span><a href="//www.taobao.com/sitemap.php">网站地图</a></span><span><a href="//www.taobao.com/go/chn/tb-fp/2014/law.php">法律声明及隐私权政策</a></span><span><a href="http://ipp.alibabagroup.com/">知识产权</a></span><b>|</b> <em>&copy; 2003-2017 Taobao.com 版权所有</em></p>
    <p><span>网络文化经营许可证：<a href="//img.alicdn.com/tps/i2/TB1YFcPLpXXXXaiXFXXcaDpFFXX-803-473.png">浙网文[2013]0268-027号</a></span><b>|</b><span>增值电信业务经营许可证：<a href="http://zcainfo.miitbeian.gov.cn/state/outPortal/loginPortal.action">浙B2-20080224</a></span><b>|</b><span>信息网络传播视听节目许可证：1109364号</span><b>|</b><span>互联网违法和不良信息举报电话:0571-81683755 blxxjb@alibaba-inc.com</span></p>
   </div>
  </div>

</body>
</html>






