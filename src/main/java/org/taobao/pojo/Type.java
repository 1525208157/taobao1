 package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Type { //商品类型表
	private Integer typeId; //类型编号
	private String typeName; //类型名称
	private Type superType; //上级类型 自引用
	private List<Brand> brands; //品牌 一对多
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	@ManyToOne
	@JoinColumn(name="superTypeId")
	public Type getSuperType() {
		return superType;
	}
	public void setSuperType(Type superType) {
		this.superType = superType;
	}
	
	@OneToMany
	@JoinColumn(name="typeId")
	public List<Brand> getBrands() {
		return brands;
	}
	public void setBrands(List<Brand> brands) {
		this.brands = brands;
	}
	
	
}
