package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GoodsPicture { //��ƷͼƬ
	private Integer goodsPictureId;
	private String pictureUrl; //ͼƬ��ַ
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getGoodsPictureId() {
		return goodsPictureId;
	}
	public void setGoodsPictureId(Integer goodsPictureId) {
		this.goodsPictureId = goodsPictureId;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	
}
