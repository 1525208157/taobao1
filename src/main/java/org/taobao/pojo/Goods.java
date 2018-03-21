package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Goods { //商品表
	private Integer goodsId; //商品编号
	private String goodsName; //商品名称
	private String goodsImg; //商品图片路径
	private Integer isRecom; //是否推荐
	private String goodsDesc; //商品描述
	private Integer saleNum; //商品总销量
	private String saleTime; //上架时间
	private Type lastType; //最后一级商品分类  多对一
	private List<Specs> specs; //规格 一对多
	private List<Appraises> appraises; //评价 一对多
	private List<GoodsColor> goodsColor; //颜色，一对多
	private GoodsIntroduce goodsIntroduce; //商品介绍
	private List<GoodsPicture> goodsPicture; //商品图片
	
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
	public String getGoodsDesc() {
		return goodsDesc;
	}
	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
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
	
	@ManyToOne
	@JoinColumn(name="typeId")
	public Type getLastType() {
		return lastType;
	}
	public void setLastType(Type lastType) {
		this.lastType = lastType;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<Specs> getSpecs() {
		return specs;
	}
	public void setSpecs(List<Specs> specs) {
		this.specs = specs;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<Appraises> getAppraises() {
		return appraises;
	}
	public void setAppraises(List<Appraises> appraises) {
		this.appraises = appraises;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<GoodsColor> getGoodsColor() {
		return goodsColor;
	}
	public void setGoodsColor(List<GoodsColor> goodsColor) {
		this.goodsColor = goodsColor;
	}
	
	@OneToOne
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
	
}
