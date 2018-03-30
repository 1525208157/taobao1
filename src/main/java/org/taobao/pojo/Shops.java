package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Shops { //店铺表
	private Integer 	shopId; //店铺Id
	private String shopName; //店铺名称
	private String shopImg; //店铺图片地址
	private List<Goods> goods; //商品  一对多
	private List<Coupons> coupons; //优惠券  一对多
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public String getShopImg() {
		return shopImg;
	}
	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}
	
	@OneToMany
	@JoinColumn(name="shopId")
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	
	@OneToMany
	@JoinColumn(name="shopId")
	@JsonIgnoreProperties("shop")
	public List<Coupons> getCoupons() {
		return coupons;
	}
	public void setCoupons(List<Coupons> coupons) {
		this.coupons = coupons;
	}
	
}
