package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Appraises { //评价表
	private Integer appraisesId; //评价Id
	private Integer goodsScore; //商品评分
	private Integer serviceScore; //服务评分
	private Integer logisticsScore; //物流评分
	private String content; //点评内容
	private String appraisesTime; //评价时间
	
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
