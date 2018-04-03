package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class GoodsIntroduce { //商品介绍
	private Integer introduceId; //ID
	private String pixel; //摄像头像素
	private double gSize; //屏幕尺寸
	private String resolution; //分辨率
	private String network; //网络 4G/3G
	private String gModel; //网络模式 双卡双待
	private String gMemory; //运行内存
	private String cpuBrand; //cup品牌
	private String phoneColor; //手机颜色
	private String gSystem; //操作系统
	private String gCore; //核心数 八核2.5GHz
	private Goods goods; //一对一商品
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getIntroduceId() {
		return introduceId;
	}
	public void setIntroduceId(Integer introduceId) {
		this.introduceId = introduceId;
	}
	public String getPixel() {
		return pixel;
	}
	public void setPixel(String pixel) {
		this.pixel = pixel;
	}
	public double getgSize() {
		return gSize;
	}
	public void setgSize(double gSize) {
		this.gSize = gSize;
	}
	public String getResolution() {
		return resolution;
	}
	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	public String getNetwork() {
		return network;
	}
	public void setNetwork(String network) {
		this.network = network;
	}
	public String getgModel() {
		return gModel;
	}
	public void setgModel(String gModel) {
		this.gModel = gModel;
	}
	public String getgMemory() {
		return gMemory;
	}
	public void setgMemory(String gMemory) {
		this.gMemory = gMemory;
	}
	public String getCpuBrand() {
		return cpuBrand;
	}
	public void setCpuBrand(String cpuBrand) {
		this.cpuBrand = cpuBrand;
	}
	public String getPhoneColor() {
		return phoneColor;
	}
	public void setPhoneColor(String phoneColor) {
		this.phoneColor = phoneColor;
	}
	public String getgSystem() {
		return gSystem;
	}
	public void setgSystem(String gSystem) {
		this.gSystem = gSystem;
	}
	public String getgCore() {
		return gCore;
	}
	public void setgCore(String gCore) {
		this.gCore = gCore;
	}
	
	@OneToOne
	@JoinColumn(name="goodsId")
	@JsonIgnoreProperties("goodsIntroduce")
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
