package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//¹Ø×¢µêÆÌ
@Entity
public class FavoritesShops {
	private Integer fsId;
	private List<Shops> shops;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getFsId() {
		return fsId;
	}
	public void setFsId(Integer fsId) {
		this.fsId = fsId;
	}
	
	@OneToMany
	@JoinColumn(name="fsId")
	public List<Shops> getShops() {
		return shops;
	}
	public void setShops(List<Shops> shops) {
		this.shops = shops;
	}
	
}
