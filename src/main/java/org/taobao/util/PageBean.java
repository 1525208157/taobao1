package org.taobao.util;

import org.apache.commons.io.output.ThresholdingOutputStream;

public class PageBean {//������ҳ
	private int nowPage;//��ǰ�ڼ�ҳ
	private int allPage;//��ҳ��
	private int count;//�ܼ�¼��
	private int num;//ÿҳ��ʾ��������¼
	
	public PageBean(){//
		this.setNum(10);
		
	}
	public PageBean(int num){
		this.setNum(num);
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {//���õ�ǰ�ڼ�ҳset����
	    int a =this.getAllPage();
	    if(nowPage<1){//��ǰ̨�������ĵڼ�ҳ������0ҳ���Ǳ����ڵ�һҳʱ����ʱ�ֵ���˵�һҳ������ʱ���ʵ����Ļ��ǵ�һҳ
	    	this.nowPage=1;
	    }else if(nowPage>a){//��ǰ�������ĵڼ�ҳ�����Ǵ���ȫ����ҳ��ʱ Ҳ���Ǳ��������һҳ����ʱ�ֵ������һҳ����ҳ��ʵ��������һҳ
	    	this.nowPage=a;
	    }else {//��֮���ڴ������ĵ�ǰҳ
			this.nowPage=nowPage;
		}
		this.nowPage = nowPage;
	}
	
	
	public int getAllPage() {//������ҳ���ķ���
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
