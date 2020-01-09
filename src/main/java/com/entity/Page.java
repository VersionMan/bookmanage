package com.entity;

import java.util.List;

public class Page<T> {
	//总页数
	private int totalPageCount=0;
	//每页记录数
	private int pageSize=3;
	//总记录数
	private int totalCount;
	//当前页数
	private int currPageNo=1;
	//集合
	private List<T> list;
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize>0){
			this.pageSize = pageSize;
		}
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		if(totalCount>0){
			this.totalCount=totalCount;
			this.totalPageCount=this.totalCount%pageSize==0?(this.totalCount/pageSize):(this.totalCount/pageSize+1);
		}
	}
	public int getCurrPageNo() {
		if(totalPageCount==0){
			return 0;
		}
		return currPageNo;
	}
	public void setCurrPageNo(int currPageNo) {
		if(currPageNo>0){
			this.currPageNo = currPageNo;
		}	
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public Page(int totalPageCount, int pageSize, int totalCount,
			int currPageNo, List<T> list) {
		super();
		this.totalPageCount = totalPageCount;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currPageNo = currPageNo;
		this.list = list;
	}
	public Page() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Page(int pageSize,List<T> list){
		this.pageSize = pageSize;
		this.list = list;
	}
}
