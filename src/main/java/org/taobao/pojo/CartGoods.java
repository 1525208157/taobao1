package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CartGoods {
	private Integer cartGoodId; //ID
 
 
	private Specs specs; //多对一类型
 
 
	private Integer cartGoodNum; //物品数量
	private String cgDate; //添加时间
	
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
	
}
