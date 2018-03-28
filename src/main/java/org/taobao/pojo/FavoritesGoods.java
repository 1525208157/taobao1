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

//¹Ø×¢ÉÌÆ·
@Entity
public class FavoritesGoods {
	private Integer fgId;
	private List<Goods> goods;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getFgId() {
		return fgId;
	}
	public void setFgId(Integer fgId) {
		this.fgId = fgId;
	}
	
	@OneToMany
	@JoinColumn(name="fgId")
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	
}
