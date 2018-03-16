package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Appraises { //���۱�
	private Integer appraisesId; //����Id
	private Integer goodsScore; //��Ʒ����
	private Integer serviceScore; //��������
	private Integer logisticsScore; //��������
	private String content; //��������
	private String appraisesTime; //����ʱ��
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getAppraisesId() {
		return appraisesId;
	}
	public void setAppraisesId(Integer appraisesId) {
		this.appraisesId = appraisesId;
	}
	public Integer getGoodsScore() {
		return goodsScore;
	}
	public void setGoodsScore(Integer goodsScore) {
		this.goodsScore = goodsScore;
	}
	public Integer getServiceScore() {
		return serviceScore;
	}
	public void setServiceScore(Integer serviceScore) {
		this.serviceScore = serviceScore;
	}
	public Integer getLogisticsScore() {
		return logisticsScore;
	}
	public void setLogisticsScore(Integer logisticsScore) {
		this.logisticsScore = logisticsScore;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAppraisesTime() {
		return appraisesTime;
	}
	public void setAppraisesTime(String appraisesTime) {
		this.appraisesTime = appraisesTime;
	}
	
}
