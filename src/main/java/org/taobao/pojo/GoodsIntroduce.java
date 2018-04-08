package org.taobao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GoodsIntroduce { //��Ʒ����
	
	private Integer introduceId; //ID
	private Integer pixel; //����ͷ����
	private double gSize; //��Ļ�ߴ�
	private Integer resolution; //�ֱ���
	private String network; //���� 4G/3G
	private String gModel; //����ģʽ ˫��˫��
	private String gMemory; //�����ڴ�
	private String cpuBrand; //cupƷ��
	private String phoneColor; //�ֻ���ɫ
	private String gSystem; //����ϵͳ
	private String gCore; //������ �˺�2.5GHz
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getIntroduceId() {
		return introduceId;
	}
	public void setIntroduceId(Integer introduceId) {
		this.introduceId = introduceId;
	}
	public Integer getPixel() {
		return pixel;
	}
	public void setPixel(Integer pixel) {
		this.pixel = pixel;
	}
	public double getgSize() {
		return gSize;
	}
	public void setgSize(double gSize) {
		this.gSize = gSize;
	}
	public Integer getResolution() {
		return resolution;
	}
	public void setResolution(Integer resolution) {
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
	
	
}
