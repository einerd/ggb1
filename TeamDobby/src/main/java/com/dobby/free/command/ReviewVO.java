package com.dobby.free.command;

import java.sql.Timestamp;

public class ReviewVO {

	private String user_id;
	private String user_nick;
	private int starCount;
	private int review_no;
	private int pno;
	private int uno;
	private int sno;
	private String b_history;
	private String r_title;
	private String r_content;
	private String r_img_name;
	private String r_img_ext;
	private String r_uploadpath;
	private String r_fileloca;
	private Timestamp regdate;
	
	
	//기본생성자
	public ReviewVO() {
		
	}
	

	//게시판 생성자-파일있는 경우(o)
	public ReviewVO(int review_no, String user_id, String r_title, String r_content, String r_img_name,
			String r_img_ext, String r_uploadpath, String r_fileloca, Timestamp regdate, int starCount, int pno, int uno) {
		super();
		this.review_no = review_no;
		this.user_id = user_id;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_img_name = r_img_name;
		this.r_img_ext = r_img_ext;
		this.r_uploadpath = r_uploadpath;
		this.r_fileloca = r_fileloca;
		this.regdate = regdate;
		this.starCount = starCount;
		this.pno = pno;
		this.uno = uno;
		
	}
	
	//게시판생성자-파일없는 경우(x)
	public ReviewVO(int review_no, String user_id, String r_title, String r_content,
			Timestamp regdate, int starCount, int pno, int uno) {
		super();
		this.review_no = review_no;
		this.user_id = user_id;
		this.r_title = r_title;
		this.r_content = r_content;
		this.regdate = regdate;
		this.starCount = starCount;
		this.pno = pno;
		this.uno = uno;
	}
	
	
	
	//생성자
	public ReviewVO(String user_id, String user_nick, int review_no, int pno, int uno, int sno, String b_history,
			String r_title, String r_content, String r_img_name, String r_img_ext, String r_uploadpath,
			String r_fileloca, Timestamp regdate, int starCount) {
		super();
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.review_no = review_no;
		this.pno = pno;
		this.uno = uno;
		this.sno = sno;
		this.b_history = b_history;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_img_name = r_img_name;
		this.r_img_ext = r_img_ext;
		this.r_uploadpath = r_uploadpath;
		this.r_fileloca = r_fileloca;
		this.regdate = regdate;
		this.starCount = starCount;
	}



	//getter, setter
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStarCount() {
		return starCount;
	}


	public void setStarCount(int starCount) {
		this.starCount = starCount;
	}


	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getB_history() {
		return b_history;
	}
	public void setB_history(String b_history) {
		this.b_history = b_history;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_img_name() {
		return r_img_name;
	}
	public void setR_img_name(String r_img_name) {
		this.r_img_name = r_img_name;
	}
	public String getR_img_ext() {
		return r_img_ext;
	}
	public void setR_img_ext(String r_img_ext) {
		this.r_img_ext = r_img_ext;
	}
	public String getR_uploadpath() {
		return r_uploadpath;
	}
	public void setR_uploadpath(String r_uploadpath) {
		this.r_uploadpath = r_uploadpath;
	}
	public String getR_fileloca() {
		return r_fileloca;
	}
	public void setR_fileloca(String r_fileloca) {
		this.r_fileloca = r_fileloca;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
