package org.taobao.pojo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Goods { //��Ʒ��
	private Integer goodsId; //��Ʒ���
	private String goodsName; //��Ʒ����
	private String goodsImg; //��ƷͼƬ·��
	private Integer isRecom; //�Ƿ��Ƽ�
	private Integer saleNum; //��Ʒ������
	private String saleTime; //�ϼ�ʱ��
	private List<Appraises> appraises; //���� һ�Զ�
	private List<GoodsColor> goodsColor=new ArrayList<>(); //��ɫ��һ�Զ�
	private GoodsIntroduce goodsIntroduce; //��Ʒ����
	private List<GoodsPicture> goodsPicture; //��ƷͼƬ
	private List<Specs> specs=new ArrayList<>(); //һ�Զ� ��� ˫��
	private Shops shop; //���һ ����
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public Integer getIsRecom() {
		return isRecom;
	}
	public void setIsRecom(Integer isRecom) {
		this.isRecom = isRecom;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	public String getSaleTime() {
		return saleTime;
	}
	public void setSaleTime(String saleTime) {
		this.saleTime = saleTime;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<Appraises> getAppraises() {
		return appraises;
	}
	public void setAppraises(List<Appraises> appraises) {
		this.appraises = appraises;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="goodsId")
	public List<GoodsColor> getGoodsColor() {
		return goodsColor;
	}
	public void setGoodsColor(List<GoodsColor> goodsColor) {
		this.goodsColor = goodsColor;
	}
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="introduceId")
	public GoodsIntroduce getGoodsIntroduce() {
		return goodsIntroduce;
	}
	
	public void setGoodsIntroduce(GoodsIntroduce goodsIntroduce) {
		this.goodsIntroduce = goodsIntroduce;
	}
	
	@OneToMany
	@JoinColumn(name="goodsId")
	public List<GoodsPicture> getGoodsPicture() {
		return goodsPicture;
	}
	public void setGoodsPicture(List<GoodsPicture> goodsPicture) {
		this.goodsPicture = goodsPicture;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="goodsId")
	@JsonIgnoreProperties("sGoods")  //˫���ϵתjsonʱ����������ٲ�ѯ����Ʒ
	public List<Specs> getSpecs() {
		return specs;
	}
	public void setSpecs(List<Specs> specs) {
		this.specs = specs;
	}
	
	@ManyToOne
	@JoinColumn(name="shopId")
	@JsonIgnoreProperties("goods")
	public Shops getShop() {
		return shop;
	}
	public void setShop(Shops shop) {
		this.shop = shop;
	}
	
}
