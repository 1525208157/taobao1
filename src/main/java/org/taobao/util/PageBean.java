package org.taobao.util;

import org.apache.commons.io.output.ThresholdingOutputStream;

public class PageBean {//辅助分页
	private int nowPage;//当前第几页
	private int allPage;//总页数
	private int count;//总记录数
	private int num;//每页显示多少条记录
	
	public PageBean(){//
		this.setNum(10);
		
	}
	public PageBean(int num){
		this.setNum(num);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {//设置当前第几页set方法
	    int a =this.getAllPage();
	    if(nowPage<1){//当前台传过来的第几页参数是0页就是本来在第一页时，这时又点击了第一页；传这时这个实体里的还是第一页
	    	this.nowPage=1;
	    }else if(nowPage>a){//当前传过来的第几页参数是大于全部的页数时 也就是本来在最后一页，这时又点击了下一页，分页的实体等于最后一页
	    	this.nowPage=a;
	    }else {//反之等于传过来的当前页
			this.nowPage=nowPage;
		}
		this.nowPage = nowPage;
	}
	
	
	public int getAllPage() {//设置总页数的方法
		int a=this.getCount();
		int b=this.getNum();
		this.allPage=a%b==0?a/b:a/b+1;
		return this.allPage;
	}
	/*public void setAllPage(int allPage) {
		this.allPage = allPage;
	}*/
	
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	

}
