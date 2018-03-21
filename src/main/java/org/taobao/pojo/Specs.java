package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Specs { //����
	private Integer specsId; //�����
	private String specsName; //�������
	private double smoney; //����
	private Integer gStock; //�ù����Ʒ���
	
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
