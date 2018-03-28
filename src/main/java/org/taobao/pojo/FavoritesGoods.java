package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//¹Ø×¢ÉÌÆ·
@Entity
public class FavoritesGoods {
	private Integer fgId;
	private Users users;
	private Goods goods;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getFgId() {
		return fgId;
	}
	public void setFgId(Integer fgId) {
		this.fgId = fgId;
	}
	
	@ManyToOne
	@JoinColumn(name="userId")
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
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
