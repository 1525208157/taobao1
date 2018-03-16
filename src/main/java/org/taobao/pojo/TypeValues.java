package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TypeValues { //������Ա�
	private Integer typeValueId; //������Ա��
	private String typeValueName; //ֵ����
	private double price; //�ù����Ʒ����
	private Integer gStock; //�ù����Ʒ���
	
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
