package org.taobao.pojo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Goods { //商品表
	private Integer goodsId; //商品编号
	private String goodsName; //商品名称
	private String goodsImg; //商品图片路径
	private Integer isRecom; //是否推荐
	private Integer saleNum; //商品总销量
	private String saleTime; //上架时间
	private List<Appraises> appraises; //评价 一对多
	private List<GoodsColor> goodsColor=new ArrayList<>(); //颜色，一对多
	private GoodsIntroduce goodsIntroduce; //商品介绍
	private List<GoodsPicture> goodsPicture; //商品图片
	private List<Specs> specs=new ArrayList<>(); //一对多 规格 双向
	private Shops shop; //多对一 店铺
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public Integer getIsRecom() {
		return isRecom;
	}
	public void setIsRecom(Integer isRecom) {
		this.isRecom = isRecom;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	public String getSaleTime() {
		return saleTime;
	}
	public void setSaleTime(String saleTime) {
		this.saleTime = saleTime;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<Appraises> getAppraises() {
		return appraises;
	}
	public void setAppraises(List<Appraises> appraises) {
		this.appraises = appraises;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="goodsId")
	public List<GoodsColor> getGoodsColor() {
		return goodsColor;
	}
	public void setGoodsColor(List<GoodsColor> goodsColor) {
		this.goodsColor = goodsColor;
	}
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="introduceId")
	public GoodsIntroduce getGoodsIntroduce() {
		return goodsIntroduce;
	}
	
	public void setGoodsIntroduce(GoodsIntroduce goodsIntroduce) {
		this.goodsIntroduce = goodsIntroduce;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<GoodsPicture> getGoodsPicture() {
		return goodsPicture;
	}
	public void setGoodsPicture(List<GoodsPicture> goodsPicture) {
		this.goodsPicture = goodsPicture;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="goodsId")
	@JsonIgnoreProperties("sGoods")  //双向关系转json时，查规格后规格不再查询到商品
	public List<Specs> getSpecs() {
		return specs;
	}
	public void setSpecs(List<Specs> specs) {
		this.specs = specs;
	}
	
	@ManyToOne
	@JoinColumn(name="shopId")
	@JsonIgnoreProperties("goods")
	public Shops getShop() {
		return shop;
	}
	public void setShop(Shops shop) {
		this.shop = shop;
	}
	
}
