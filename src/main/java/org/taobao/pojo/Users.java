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
	private Integer userId; //�û�ID
	private String account; //�˺�
	private String password; //����
	private String sex; //�Ա�
	private String nickname; //�ǳ�
	private String userImg; //�û�ͷ��
	private String problem; //�ܱ�����
	private String answer; //�ܱ���
	private double balance; //�˻����
	private List<Orders> orders; //����  һ�Զ�
	private List<Address> addresses;  //�ջ���ַ һ�Զ�
	private Shops shops; //���� һ��һ
	private List<Appraises> appraises; //�ҵ�����
	
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
