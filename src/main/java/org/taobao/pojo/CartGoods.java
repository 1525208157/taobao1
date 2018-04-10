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
public class CartGoods {
	private Integer cartGoodId; //ID
	private Specs specs; //���һ����
	private Integer cartGoodNum; //��Ʒ����
	private String cgDate; //���ʱ��
	private GoodsColor gColor; //��ɫ
	private Carts carts; //���ﳵ һ�Զ�
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCartGoodId() {
		return cartGoodId;
	}
	public void setCartGoodId(Integer cartGoodId) {
		this.cartGoodId = cartGoodId;
	}
	
	public Integer getCartGoodNum() {
		return cartGoodNum;
	}
	public void setCartGoodNum(Integer cartGoodNum) {
		this.cartGoodNum = cartGoodNum;
	}
	
	@ManyToOne
	@JoinColumn(name="specsId")
	public Specs getSpecs() {
		return specs;
	}
	public void setSpecs(Specs specs) {
		this.specs = specs;
	}
	
	public String getCgDate() {
		return cgDate;
	}
	public void setCgDate(String cgDate) {
		this.cgDate = cgDate;
	}
	
	@OneToOne
	@JoinColumn(name="gcId")
	public GoodsColor getgColor() {
		return gColor;
	}
	public void setgColor(GoodsColor gColor) {
		this.gColor = gColor;
	}
	
	@ManyToOne
	@JoinColumn(name="cartId")
	@JsonIgnoreProperties("cartGoods")
	public Carts getCarts() {
		return carts;
	}
	public void setCarts(Carts carts) {
		this.carts = carts;
	}
	
}
