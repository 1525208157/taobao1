package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Courier { //��ݱ�
	private Integer courierId;  //���ID
	private Integer courierNo; //��ݺ�
	private String courierName; //�������
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCourierId() {
		return courierId;
	}
	public void setCourierId(Integer courierId) {
		this.courierId = courierId;
	}
	public Integer getCourierNo() {
		return courierNo;
	}
	public void setCourierNo(Integer courierNo) {
		this.courierNo = courierNo;
	}
	public String getCourierName() {
		return courierName;
	}
	public void setCourierName(String courierName) {
		this.courierName = courierName;
	}
	
}
