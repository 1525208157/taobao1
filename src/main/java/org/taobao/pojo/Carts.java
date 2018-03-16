package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Carts { //购物车表
	private Integer cartId; //购物车ID
	private List<CartGoods> CartGoods; //一对多 购物车商品
	
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
	public List<CartGoods> getCartGoods() {
		return CartGoods;
	}
	public void setCartGoods(List<CartGoods> cartGoods) {
		CartGoods = cartGoods;
	}
	
}
