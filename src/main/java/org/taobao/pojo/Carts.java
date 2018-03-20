package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Carts { //购物车表
	private Integer cartId; //购物车ID
	private Users user; //用户
	private List<Specs> specs; //一对多 购物车商品
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	
	@OneToMany
	@JoinColumn(name="cartId")
	public List<Specs> getSpecs() {
		return specs;
	}
	public void setSpecs(List<Specs> specs) {
		this.specs = specs;
	}
	
	@OneToOne
	@JoinColumn(name="userId")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
}
