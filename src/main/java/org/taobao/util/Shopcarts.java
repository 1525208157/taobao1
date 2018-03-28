package org.taobao.util;
public class Shopcarts {//购物车用的购物实体
	private Integer shopId;//店铺id
	private String shopName;//店铺名称
	private Integer specsId;//手机型号
	private String specsName;//手机内存
	private String gcName;//手机颜色
	private Double smoney;//单价
	private Integer goodsId;//商品id
	private String goodsName;//商品名称
	private String goodsImg;//商品图片
	private Integer cartGoodNum;//商品数量
	private Double totalPrice;//商品总价格
	private String cgDate;//添加购物车时间
	private Integer cartGoodId;//购物车里的id cartGoodId
	public Integer getShopId() { 
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public Integer getSpecsId() {
		return specsId;
	}
	public void setSpecsId(Integer specsId) {
		this.specsId = specsId;
	}
	public String getSpecsName() {
		return specsName;
	}
	public void setSpecsName(String specsName) {
		this.specsName = specsName;
	}
	public String getGcName() {
		return gcName;
	}
	public void setGcName(String gcName) {
		this.gcName = gcName;
	}
	public Double getSmoney() {
		return smoney;
	}
	public void setSmoney(Double smoney) {
		this.smoney = smoney;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public Integer getCartGoodNum() {
		return cartGoodNum;
	}
	public void setCartGoodNum(Integer cartGoodNum) {
		this.cartGoodNum = cartGoodNum;
	}
	
	public Double getTotalPrice() {
		return  smoney*cartGoodNum;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getCgDate() {
		return cgDate;
	}
	public void setCgDate(String cgDate) {
		this.cgDate = cgDate;
	}
	public Integer getCartGoodId() {
		return cartGoodId;
	}
	public void setCartGoodId(Integer cartGoodId) {
		this.cartGoodId = cartGoodId;
	}
	
	
	
	
	

}
