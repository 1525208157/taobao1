package org.taobao.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Users {
	private Integer userId; //用户ID
	private String account; //账号
	private String password; //密码
	private String sex; //性别
	private String nickname; //昵称
	private String userImg; //用户头像
	private String problem; //密保问题
	private String answer; //密保答案
	private double balance; //账户余额
	private List<Orders> orders; //订单  一对多
	private List<Address> addresses;  //收货地址 一对多
	private Shops shops; //店铺 一对一
	private List<Appraises> appraises; //我的评价
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	@OneToMany
	@JoinColumn(name="userId")
	public List<Orders> getOrders() {
		return orders;
	}
	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
	
	@OneToMany
	@JoinColumn(name="userId")
	@JsonIgnoreProperties("users")
	public List<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	
	@OneToOne
	@JoinColumn(name="shopId")
	public Shops getShops() {
		return shops;
	}
	public void setShops(Shops shops) {
		this.shops = shops;
	}
	
	@OneToMany
	@JoinColumn(name="userId")
	public List<Appraises> getAppraises() {
		return appraises;
	}
	public void setAppraises(List<Appraises> appraises) {
		this.appraises = appraises;
	}
	
}
