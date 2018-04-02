<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<html>
	<head>
    <title>
        淘宝网 - 淘我喜欢！
    </title>
    <meta name="data-spm" content="a1z38n" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="中国最大、最安全的网上交易社区，尽享淘宝乐趣！" />
    <meta name="keywords" content="淘宝,掏宝,网上购物,购物,论坛,联盟,买,卖,1元,一元,电脑,视听,MP3,MD,CD,VCD,DV,耗材,化妆,相机,数码,配件,珠宝,手表,艺术,宠物,求购,出租,出售,二手,汽车,音响,保健,讨价换价,一口价,拍卖,auction,sell,buy,price,bid" />
    <link href="//img.alicdn.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <!-- <link href="//assets.alicdn.com/p/mytaobao/common_v2.css?t=20110317.css" type="text/css" rel="stylesheet" /> -->
    <script type="text/javascript" src="//assets.alicdn.com/apps/sell/1.0/home/common.js?t=20080611.js"></script>
    <script type="text/javascript" src="//assets.alicdn.com/tbra/1.0/tbra-aio.js?t=20090312.js"></script>
    <script type="text/javascript" src="//g.alicdn.com/cm/old-sell-rely/1.0.2/top_v4.js"></script>
    <script type="text/javascript" src="//g.alicdn.com/cm/old-sell-rely/1.0.2/mytaobao_bc.js"></script>
    <script type="text/javascript" src="//assets.alicdn.com/s/kissy/1.2.0/kissy-min.js"></script>
    <script type="application/javascript">
        KISSY.config({
            packages: [{
                name: 'tbc',
                path: '//g.alicdn.com/tbc/',
                ignorePackageNameInUri: true
            }]
        });

        KISSY.config({
            map: [
                [/(\/tbc\/)tbc\//g, '$1']
            ]
        });
    </script>
        <script type="text/javascript" src="//g.alicdn.com/cm/sell/2.1.4/v2/service/??flash.js,ajbridge.js,clipboard.js"></script>
    <script type="text/javascript" src="//g.alicdn.com/cm/sell/2.1.4/v2/service/goods_list_v1-min.js"></script>

    <link type="text/css" href="//g.alicdn.com/cm/old-sell-rely/1.0.2/css/volcano.css" rel="stylesheet" />
    <link type="text/css" href="//g.alicdn.com/cm/old-sell-rely/1.0.2/css/mytaobao_bc.css" rel="stylesheet" />

    <link type="text/css" href="//g.alicdn.com/cm/sell/2.1.4/v2/service/hqGoods-min.css" rel="stylesheet"/>
    <link type="text/css" href="//g.alicdn.com/cm/sell/2.1.4/v2/service/goods_list_v1-min.css" rel="stylesheet" />
    <link type="text/css" href="//g.alicdn.com/cm/sell/2.1.4/v2/service/index-min.css" rel="stylesheet" />
    <script type="text/javascript" src="//g.alicdn.com/cm/sell/2.1.4/v2/service/index-min.js"></script>

    <!--吊顶初始化assets-->
    

<link href="//g.alicdn.com/tb/seller-global/1.0.0/css/global.css" rel="stylesheet"/>
<script src="//g.alicdn.com/tb/seller-global/1.0.0/??js/template.js,js/global_t.js" charset="utf-8"></script>

    <!--layout样式-->
    
 <!--[if lt IE 9]>
 <script>location.href = "//www.taobao.com/markets/tbhome/ali-page-updater"; </script>
 <![endif]-->
<link href="//g.alicdn.com/tb/seller-center/0.2.10/pages/layout/index.css" rel="stylesheet"/>

</head>
	<body>
		<span class="mytaobao-rc-tp"><span></span></span>
<div class="navigation">
    <div class="crumbs">
        <a href="//i.taobao.com/seller_admin.htm">我是卖家</a>
        <span>&gt;</span>
        <a href="#100">宝贝管理</a>
        <span>&gt;</span>
        出售中的宝贝
    </div>
    <div class="absright">
        <ul>
            <li>
                <div class="msg">
                    <p class="help">
                        <a href="//service.taobao.com/support/help.htm" target="_blank">查看帮助</a>
                    </p>
                </div>
            </li>
        </ul>
    </div>
</div>
<div id="main-content">


    
<div class="msg msg-bar">
    <div id="punish-alert" class="alert-msg" data-url="//notice.taobao.com/json/counter.htm"></div>
    </div>

<style media="screen" type="text/css">
    .bgt td {text-align:left;}
</style>
<form action="goods/insertGoods" method="post" name="open">
<!--     <input name='_tb_token_' type='hidden' value='53134beb55f31'>
<input type="hidden" name="pageName" value="goodsOnSale">
<input type="hidden" name="banner" value="">
<input type="hidden" name="page" value="1">
<input type="hidden" id="setVal" name="setVal" value="">
<input type="hidden" id="orderField" name="orderField" value="1" />
<input type="hidden" id="orderBy" name="orderBy" value="0" />
<input type="hidden" name="singleId" value="">
<input type="hidden" name="singleIdNum" value="">
<input type="hidden" name="singleIdMinNum" value="">
<input type="hidden" name="distributionIds" value="">
<input type="hidden" name="action" value="goodsmanager/GoodsManageAction">
<input type="hidden" name="event_submit_do_recommend" value="">
<input type="hidden" name="event_submit_do_delete" />
<input type="hidden" name="event_submit_do_off_shelf" />
<input type="hidden" name="event_submit_do_unrecommend" />
<input type="hidden" name="event_submit_do_set_lighting_auction" />
<input type="hidden" id="J_HideCateNameInShop" name="shopCatName" value=""> -->

<div class="hq-goods-area">
	<div class="hq-goods-con">
        <div class="hq-goods-left">
            <div class="hq-goods-pos">
                <div class="hq-goods-logo">
                    <img src="//img.alicdn.com/tfs/TB1nlZbRVXXXXaAXpXXXXXXXXXX-48-44.png" alt="橱窗logo"></img>
                </div>
                <div class="hq-goods-content">
                <h4>橱窗位</h4>
                <p>
                    <p class="all-num"><span class="gray">总量：</span><span class="red">2</span> </p>
                    <p class="left-num"><span class="gray">已使用：</span><span class="red">0</span> </p>
                    <a href="javascript:;" id="J_RecommendTrigger" class="hq-detail" onclick="javascript:goldlog.record('/mjzx.32.37','','','H46747619')">查看明细</a>
                    <a href="javascript:;" id="showcase-btn" class="hq-set" onclick="javascript:goldlog.record('/mjzx.32.35.1','','','H46807174')">一键设置</a>
                    <input type="hidden" id="showcase-input" name="_tb_token_" value="53134beb55f31">
                </p>
                </div>
            </div>
        </div>

                <div class="hq-goods-right">
            <h4>成交达标奖励规则
                                <span class="tips">
                    奖励每周五更新，您的本周成交额：<span class="red">&yen; 0.00 </span>
                </span>
            </h4>
            	            	            								<p class="gray"> 亲，如果近30天无成交，或店铺不满1星，或主营类目不符合橱窗奖励要求（如保险、理财类目等），则看不到成交基线，拿不到成交基线奖励橱窗位</p>
                	            	
        </div>
        
    </div>
</div>


<div class="data-list data-list-goods"
          id="goods-on-sale" >
<div class="hd clearfix">
    <ul class="tabs J_Notice" data-url="//notice.taobao.com/json/counter.htm">
        <li data-spm="1998242581" class="selected">
            <a href="//sell.taobao.com/auction/merchandise/auction_list.htm" hidefocus="true">发布新宝贝</a>
        </li>
                                                
    </ul>
            <div class="enter-trash">
            <a class="icon-trash" href="//sell.taobao.com/auction/goods/recover.htm">宝贝回收站</a>
            <sup class=""></sup>
        </div>
    </div>
<div class="search-form">
	<input type="hidden" id="J_maxRecommendNum_hidden" value="10"/>
            <div class="colum">
            <div class="row">
                <label for="search-keyword">宝贝名称：</label>
                <input type="text" value="" maxlength="64" name="goodsName" id="search-keyword" />
            </div>

            <div class="row">
                                    <label>价格：</label>
                
                <input type="text" value=""  class="search-price" name="specs.smoney" id="search-price-from"/>
            </div>
                            <div class="row">
                    <label>颜色：</label>
                    
                    <input type="text" value="" maxlength="64" name="goodsColor.gcName" id="search-keyword1" />
                    <!-- <select id="itemConditionSet" name="itemConditionSet">
                        <option  selected  value="">无</option>
                        <option  value="discount">会员折扣</option>
                                                <option  value="charityItem">公益宝贝</option>
                    </select> -->
                </div>
            
        </div>

        <div class="colum">

                            <div class="row">
                    <label for="outer-id">商品类型编号：</label>
                    <input type="text" value="" maxlength="64" name="type.typeId" id="outer-id"/>
                </div>
            
            <div class="row">
                <label>库存：</label>
                <input type="text" value=""  class="search-num" name="specs.gStock" id="search-num-from"/>
            </div>

                            <div class="row">
                    <label>规格名称：</label>
                    <input type="text" value="" maxlength="64" name="specs.specsName" id="outer-id"/>
                    <!-- <select id="itemStepAudit" name="itemStepAudit">
                        <option  selected  value="">无</option>
                        <option  value="stepChecking">审核中</option>
                        <option  value="stepFailed">审核未通过</option>
                    </select> -->
                </div>
                    </div>
                <div class="colum">
            <div class="row">
                <label for="first-cate-id">宝贝品牌：</label>
                <input type="text" value="" maxlength="64" name="brand.brandId" id="outer-id"/>
                
                <!-- <select name="category" id="first-cate-id"> -->
                   <!--  <option value="" selected >全部类目</option>
                                            <option value="50002766" >华为</option>
                                            <option value="16" >水果</option>
                                    </select> -->
            </div>
                  
                        <div class="row alignright">
                <button class="aslink" type="reset">清空条件</button>
                <button onclick="searchItems()" class="search-btn" type="submit">搜索</button>
            </div>
        </div>

        <div class="colum">
            <div class="row">
                <label for="search-itemid">商品介绍：</label>
                <input type="text" value="" maxlength="64" name="introduceId" id="search-itemid"  class="search-keyword" style="width: 156px;"/>
            </div>
            <label for="search-itemid">商铺Id：</label>    
            <input type="text" value="" maxlength="64" name="shop.shopId" id="outer-id"/>
        </div>
        <div  class="colum">
                </div>
               <div> <input type="submit" value="添加"></div>
    </div>
    </div>

</form>

<!-- <form action="goods/insertGoods">
			<input type="hidden" name="eid"> 
			<input type="date"
				name="saleTime"> 
				商品类型:<input type="text" name="ename" /> 
				商品名称:<input type="text" name="goodsName" /> 
				<select name="dept.did"></select> 
				<input type="submit" value="添加">
		</form>
 -->
</body>
</html>