package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Logistics { //������Ϣ�� 
	private Integer logisticsId; //������ϢId
	private Courier courier; //���ID  ���һ
	private Integer courierNumber; //��������
	private String logisticsText; //������Ϣ
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getLogisticsId() {
		return logisticsId;
	}
	public void setLogisticsId(Integer logisticsId) {
		this.logisticsId = logisticsId;
	}
	
	@ManyToOne
	@JoinColumn(name="courierId")
	public Courier getCourier() {
		return courier;
	}
	public void setCourier(Courier courier) {
		this.courier = courier;
	}
	public Integer getCourierNumber() {
		return courierNumber;
	}
	public void setCourierNumber(Integer courierNumber) {
		this.courierNumber = courierNumber;
	}
	public String getLogisticsText() {
		return logisticsText;
	}
	public void setLogisticsText(String logisticsText) {
		this.logisticsText = logisticsText;
	}
	
}
