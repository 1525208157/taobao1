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
<<<<<<< HEAD
	
=======
 
>>>>>>> branch 'master' of https://github.com/1525208157/taobao1.git
	private Users user; //用户
<<<<<<< HEAD
	private List<CartGoods> cartGoods; //一对多 购物车商品
=======
	private List<Specs> specs; //一对多 购物车商品
>>>>>>> branch 'master' of https://github.com/1525208157/taobao1.git
 
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCartId() {
		return cartId;
	}
	
	public void setCartGoods(List<CartGoods> cartGoods) {
		this.cartGoods = cartGoods;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
	@OneToOne
	@JoinColumn(name="userId")
	public Users getUser() {
		return user;
	}
	
	@OneToMany
	@JoinColumn(name="cartId")
	public List<CartGoods> getCartGoods() {
		return cartGoods;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	
	
}
