package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Coupons { //�����Ż�ȯ
	private Integer couponId; //�Ż�ȯID
	private double standard; //ʹ�ñ�׼ ����
	private double discount; //�ۿ۽��
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCouponId() {
		return couponId;
	}
	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}
	public double getStandard() {
		return standard;
	}
	public void setStandard(double standard) {
		this.standard = standard;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
}
