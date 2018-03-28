package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//¹Ø×¢µêÆÌ
@Entity
public class FavoritesShops {
	private Integer fsId;
	private Users users;
	private Shops shops;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getFsId() {
		return fsId;
	}
	public void setFsId(Integer fsId) {
		this.fsId = fsId;
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
	@JoinColumn(name="shopId")
	public Shops getShops() {
		return shops;
	}
	public void setShops(Shops shops) {
		this.shops = shops;
	}
	
}
