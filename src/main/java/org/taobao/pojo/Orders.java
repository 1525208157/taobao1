package org.taobao.pojo;

import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Orders { //������Ϣ��
	private Integer orderId; //����Id
	private double totalMoney; //�����ܽ��
	private Address address; //�ջ���ַ  һ��һ 
	private Integer orderStatus; // ����״̬ ---1�������� ��2����������3�����ջ���4��������
	private Integer isAppraise; //�Ƿ����  0 1
	private String receiveTime; //�ջ�ʱ��
	private Courier courier; //��ݹ�˾ID  ��� ���һ
	private Logistics logistics; //������Ϣ һ��һ
	private String createTime; //�µ�ʱ��
	private List<OrderGoods> orderGoods; //һ�Զ� ������Ʒ
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	@OneToOne
	@JoinColumn(name="addressId")
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Integer getIsAppraise() {
		return isAppraise;
	}
	public void setIsAppraise(Integer isAppraise) {
		this.isAppraise = isAppraise;
	}
	public String getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
	}
	
	@ManyToOne
	@JoinColumn(name="courierId")
	public Courier getCourier() {
		return courier;
	}
	public void setCourier(Courier courier) {
		this.courier = courier;
	}
	
	@OneToOne
	@JoinColumn(name="logisticsId")
	public Logistics getLogistics() {
		return logistics;
	}
	public void setLogistics(Logistics logistics) {
		this.logistics = logistics;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	@OneToMany
	@JoinColumn(name="orderId")
	public List<OrderGoods> getOrderGoods() {
		return orderGoods;
	}
	public void setOrderGoods(List<OrderGoods> orderGoods) {
		this.orderGoods = orderGoods;
	}
	
}
