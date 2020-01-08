package com.dobby.free.util;

public class Criteria { // DB로 전송될 클래스

	private int pageNum; // 현재 조회중인 페이지 번호
	private int amount; // 한페이지에서 보여줄 게시글의 갯수
	private String searchType; // 검색 타입
	private String searchName; // 검색 이름
	
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
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	
	public Criteria(int pageNum, int amount, String searchType, String searchName) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.searchType = searchType;
		this.searchName = searchName;
	}
	
	// 최초로 게시판 목록에 진입 시 기본값으로 가져야 할 정보
	public Criteria() {
		this(1, 10);
	}
	// 페이지 번호를 클릭 시 실행 될 생성자
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", searchType=" + searchType + ", searchName="
				+ searchName + "]";
	}
	
	
}
