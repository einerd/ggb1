package com.dobby.free.util;

public class PageVO {

	private int endPage;
	private int startPage;
	private boolean prev;
	private boolean next;
	
	private int pageNum;
	private int amount;
	private int total;
	
	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	private Criteria cri;
	
	public PageVO() {}
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		
		// 전달되는 기준에 따라서 PageVO 계산처리
		
		// 1. endPage 계산 								ex) 현재 조회하는 페이지 12 : 화면에 보여질 끝 페이지 20
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		
		// 2. startPage 계산
		this.startPage = this.endPage - 10 + 1;
		
		// 3. 실제 마지막 페이지 계산
		// ex) 게시물 63개 : 마지막페이지 7
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		// ex) 152개 게시물 1번 페이지 클릭 시 -> endPage 20, realEnd 16
		if(this.endPage > realEnd) {
			this.endPage = realEnd; // 진짜 끝번호를 따라감
		}
		
		// prev버튼 활성화 여부
		// statPage: 1, 11, 21, 31.... 101...
		this.prev = this.startPage > 1;
		
		// next버튼 활성화 여부
		this.next = realEnd > this.endPage;
	}

	@Override
	public String toString() {
		return "PageVO [endPage=" + endPage + ", startPage=" + startPage + ", prev=" + prev + ", next=" + next
				+ ", pageNum=" + pageNum + ", amount=" + amount + ", total=" + total + ", cri=" + cri + "]";
	}
	
	
}
