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
public class Carts { //���ﳵ��
	private Integer cartId; //���ﳵID
	private Users user; //�û�
	private List<CartGoods> cartGoods; //һ�Զ� ���ﳵ��Ʒ
	
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
