  package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address { //�ջ���ַ��
	private Integer addressId; //�ջ���ַID
	private String userName; //��ʵ����
	private long userPhone; //�ջ��˵绰
	private String userAddress; //�ջ���ַ
	private Integer isDefault; //�Ƿ�Ĭ�ϵ�ַ  0  1
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(long userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Integer getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
	}
	
}
