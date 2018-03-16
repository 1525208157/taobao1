package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Specs { //����
	private Integer specsId; //�����
	private String specsName; //�������
	private List<TypeValues> typeValues; //������� һ�Զ�
	
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
	
	@OneToMany
	@JoinColumn(name="specsId")
	public List<TypeValues> getTypeValues() {
		return typeValues;
	}
	public void setTypeValues(List<TypeValues> typeValues) {
		this.typeValues = typeValues;
	}
	
}
