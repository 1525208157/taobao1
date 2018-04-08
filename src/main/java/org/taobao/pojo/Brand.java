package org.taobao.pojo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Brand { //Ʒ�Ʊ�
	private Integer brandId; //Ʒ�Ʊ��
	private String brandName; //Ʒ������
	private String brandImg; //Ʒ��ͼ��·��
	private List<Goods> goods=new ArrayList<>(); //��Ʒ һ�Զ�
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandImg() {
		return brandImg;
	}
	public void setBrandImg(String brandImg) {
		this.brandImg = brandImg;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="brandId")
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	
}
