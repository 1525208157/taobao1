package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Specs { //规格表
	private Integer specsId; //规格编号
	private String specsName; //规格名称
	private double smoney; //单价
	private Integer gStock; //该规格商品库存
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getSpecsId() {
		return specsId;
	}
	public void setSpecsId(Integer specsId) {
		this.specsId = specsId;
	}
	public String getSpecsName() {
		return specsName;
	}
	public void setSpecsName(String specsName) {
		this.specsName = specsName;
	}
	public double getSmoney() {
		return smoney;
	}
	public void setSmoney(double smoney) {
		this.smoney = smoney;
	}
	public Integer getgStock() {
		return gStock;
	}
	public void setgStock(Integer gStock) {
		this.gStock = gStock;
	}

}
