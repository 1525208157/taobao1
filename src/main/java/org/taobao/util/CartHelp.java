package org.taobao.util;

import java.util.List;

import org.taobao.pojo.CartGoods;
import org.taobao.pojo.GoodsColor;
import org.taobao.pojo.Specs;

public class CartHelp {//���ﳵ��װ���صĶ����޸Ĺ��������
	private CartGoods cartGoods;
	private List<GoodsColor> colorlist;
	private List<Specs> specelist;
	public CartGoods getCartGoods() {
		return cartGoods;
	}
	public void setCartGoods(CartGoods cartGoods) {
		this.cartGoods = cartGoods;
	}
	public List<GoodsColor> getColorlist() {
		return colorlist;
	}
	public void setColorlist(List<GoodsColor> colorlist) {
		this.colorlist = colorlist;
	}
	public List<Specs> getSpecelist() {
		return specelist;
	}
	public void setSpecelist(List<Specs> specelist) {
		this.specelist = specelist;
	}

}
