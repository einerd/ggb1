package com.dobby.free.command;

import java.sql.Timestamp;

public class QnaVO {
	private int qna_no;
	private int pno;
	private int uno;
	private int sno;
	private String b_history;
	private String q_title;
	private String q_content;
	private String q_img_name;
	private String q_img_ext;
	private String q_uploadpath;
	private String q_fileloca;
	private Timestamp regdate;
	private String user_id;
	
	

	
	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public QnaVO() {}


	@Override
	public String toString() {
		return "QnaVO [qna_no=" + qna_no + ", pno=" + pno + ", uno=" + uno + ", sno=" + sno + ", b_history=" + b_history
				+ ", q_title=" + q_title + ", q_content=" + q_content + ", q_img_name=" + q_img_name + ", q_img_ext="
				+ q_img_ext + ", q_uploadpath=" + q_uploadpath + ", q_fileloca=" + q_fileloca + "]";
	}

	
	public QnaVO(int qna_no, int pno, int uno, String b_history, String q_title, String q_content, Timestamp regdate) {
		super();
		this.qna_no = qna_no;
		this.pno = pno;
		this.uno = uno;
		this.b_history = b_history;
		this.q_title = q_title;
		this.q_content = q_content;
		this.regdate = regdate;
	}
	
	
	public QnaVO(int qna_no, int pno, int uno, String b_history, String q_title, String q_content,
			String q_img_name, String q_img_ext, String q_uploadpath, String q_fileloca, Timestamp regdate) {
		super();
		this.qna_no = qna_no;
		this.pno = pno;
		this.uno = uno;
		this.b_history = b_history;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_img_name = q_img_name;
		this.q_img_ext = q_img_ext;
		this.q_uploadpath = q_uploadpath;
		this.q_fileloca = q_fileloca;
		this.regdate = regdate;
	}


	public QnaVO(int qna_no, int pno, int uno, int sno, String b_history, String q_title, String q_content,
			String q_img_name, String q_img_ext, String q_uploadpath, String q_fileloca, Timestamp regdate) {
		super();
		this.qna_no = qna_no;
		this.pno = pno;
		this.uno = uno;
		this.sno = sno;
		this.b_history = b_history;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_img_name = q_img_name;
		this.q_img_ext = q_img_ext;
		this.q_uploadpath = q_uploadpath;
		this.q_fileloca = q_fileloca;
		this.regdate = regdate;
	}

	


	public QnaVO(int qna_no, int pno, int uno, int sno, String b_history, String q_title, String q_content,
			String q_img_name, String q_img_ext, String q_uploadpath, String q_fileloca) {
		super();
		this.qna_no = qna_no;
		this.pno = pno;
		this.uno = uno;
		this.sno = sno;
		this.b_history = b_history;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_img_name = q_img_name;
		this.q_img_ext = q_img_ext;
		this.q_uploadpath = q_uploadpath;
		this.q_fileloca = q_fileloca;
	}


	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_img_name() {
		return q_img_name;
	}

	public void setQ_img_name(String q_img_name) {
		this.q_img_name = q_img_name;
	}

	public String getQ_img_ext() {
		return q_img_ext;
	}

	public void setQ_img_ext(String q_img_ext) {
		this.q_img_ext = q_img_ext;
	}

	public String getQ_uploadpath() {
		return q_uploadpath;
	}

	public void setQ_uploadpath(String q_uploadpath) {
		this.q_uploadpath = q_uploadpath;
	}

	public String getQ_fileloca() {
		return q_fileloca;
	}

	public void setQ_fileloca(String q_fileloca) {
		this.q_fileloca = q_fileloca;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}