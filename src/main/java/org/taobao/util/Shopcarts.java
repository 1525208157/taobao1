package org.taobao.util;
public class Shopcarts {//���ﳵ�õĹ���ʵ��
	private Integer shopId;//����id
	private String shopName;//��������
	private Integer specsId;//�ֻ��ͺ�
	private String specsName;//�ֻ��ڴ�
	private String gcName;//�ֻ���ɫ
	private Double smoney;//����
	private Integer goodsId;//��Ʒid
	private String goodsName;//��Ʒ����
	private String goodsImg;//��ƷͼƬ
	private Integer cartGoodNum;//��Ʒ����
	private Double totalPrice;//��Ʒ�ܼ۸�
	private String cgDate;//��ӹ��ﳵʱ��
	private Integer cartGoodId;//���ﳵ���id cartGoodId
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
