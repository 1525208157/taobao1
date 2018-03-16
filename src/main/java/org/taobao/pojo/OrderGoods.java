package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderGoods {
	private Integer ogId;
	private Goods goods; //一对一 商品
	private Integer goodsNum; //商品数量
	
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
	@JoinColumn(name="goodsId")
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
