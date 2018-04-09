package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class OrderGoods { //订单商品表
	private Integer ogId;
	private Specs specs; //多对一 规格
	private Integer goodsNum; //商品数量  
	private GoodsColor ogColor; //颜色
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getOgId() {
		return ogId;
	}
	public void setOgId(Integer ogId) {
		this.ogId = ogId;
	}
	public Integer getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}
	
	@ManyToOne
	@JoinColumn(name="specsId")
	@JsonIgnoreProperties("sGoods")
	public Specs getSpecs() {
		return specs;
	}
	public void setSpecs(Specs specs) {
		this.specs = specs;
	}
	
	@OneToOne
	@JoinColumn(name="gcId")
	public GoodsColor getOgColor() {
		return ogColor;
	}
	public void setOgColor(GoodsColor ogColor) {
		this.ogColor = ogColor;
	}
	
}
