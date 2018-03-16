package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TypeValues { //规格属性表
	private Integer typeValueId; //规格属性编号
	private String typeValueName; //值名称
	private double price; //该规格商品单价
	private Integer gStock; //该规格商品库存
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getTypeValueId() {
		return typeValueId;
	}
	public void setTypeValueId(Integer typeValueId) {
		this.typeValueId = typeValueId;
	}
	public String getTypeValueName() {
		return typeValueName;
	}
	public void setTypeValueName(String typeValueName) {
		this.typeValueName = typeValueName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getgStock() {
		return gStock;
	}
	public void setgStock(Integer gStock) {
		this.gStock = gStock;
	}
	
}
