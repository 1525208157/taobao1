package org.taobao.pojo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Orders { //订单信息表
	private Integer orderId; //订单Id
	private double totalMoney; //订单总金额
	private Address address; //收货地址  一对一 
	private Integer orderStatus; // 订单状态 ---1：待发货、2：待收货、3：待评价、4：已完成
	private String receiveTime; //收货时间
	private Logistics logistics; //物流信息 一对一
	private String createTime; //下单时间
	private Integer isDel; //是否删除  0 1
	private List<OrderGoods> orderGoods; //一对多 订单商品
	
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
	@JsonIgnoreProperties("address")
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
	public String getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
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
	public Integer getIsDel() {
		return isDel;
	}
	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}
	
	 @OneToMany(cascade=CascadeType.ALL)
	 @JoinColumn(name="orderId")
	public List<OrderGoods> getOrderGoods() {
		return orderGoods;
	}
	public void setOrderGoods(List<OrderGoods> orderGoods) {
		this.orderGoods = orderGoods;
	}
	
}
