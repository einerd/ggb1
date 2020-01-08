package com.dobby.free.command;

import java.sql.Timestamp;
import java.util.ArrayList;

//import com.dobby.free.command.FreeBoardVO;

	public class UserVO {
		private int uno;
		private String user_id;
		private String user_pw;
		private String user_name;
		private String user_nick;
		private String u_phone_1;
		private String u_phone_2;
		private String u_mobile_1;
		private String u_mobile_2;
		private String u_email_1;
		private String u_email_2;
		private String u_post_no; //우편번호
		private String u_address_1; //기본주소
		private String u_address_2; //상세주소
		private Timestamp regdate; //등록일
		
		private String header_user_id;
		private String header_user_pw;
		
		public String getHeader_user_id() {
			return header_user_id;
		}

		public void setHeader_user_id(String header_user_id) {
			this.header_user_id = header_user_id;
		}

		public String getHeader_user_pw() {
			return header_user_pw;
		}

		public void setHeader_user_pw(String header_user_pw) {
			this.header_user_pw = header_user_pw;
		}
		
		
		//마이페이지에 join을통해 한번에 게시글에 대한정보를 가져나가기 위한 선언
//		private ArrayList<FreeBoardVO> userBoardList;

		public UserVO() {
			
		}
		
		public UserVO(String header_user_id, String header_user_pw) {
			super();
			this.header_user_id = header_user_id;
			this.header_user_pw = header_user_pw;
		}

		public UserVO(int uno, String user_id, String user_pw, String user_name, String user_nick, String u_phone_1,
				String u_phone_2, String u_mobile_1, String u_mobile_2, String u_email_1, String u_email_2,
				String u_post_no, String u_address_1, String u_address_2, Timestamp regdate/*,
				ArrayList<FreeBoardVO> userBoardList*/) {
			super();
			this.uno = uno;
			this.user_id = user_id;
			this.user_pw = user_pw;
			this.user_name = user_name;
			this.user_nick = user_nick;
			this.u_phone_1 = u_phone_1;
			this.u_phone_2 = u_phone_2;
			this.u_mobile_1 = u_mobile_1;
			this.u_mobile_2 = u_mobile_2;
			this.u_email_1 = u_email_1;
			this.u_email_2 = u_email_2;
			this.u_post_no = u_post_no;
			this.u_address_1 = u_address_1;
			this.u_address_2 = u_address_2;
			this.regdate = regdate;
			/*this.userBoardList = userBoardList;*/
		}
		
		@Override
		public String toString() {
			return "UserVO [uno=" + uno + "user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_nick="
					+ user_nick + ", u_phone_1=" + u_phone_1 + ", u_phone_2=" + u_phone_2 + ", u_mobile_1=" + u_mobile_1
					+ ", u_mobile_2=" + u_mobile_2 + ", u_email_1=" + u_email_1 + ", u_email_2=" + u_email_2
					+ ", u_post_no=" + u_post_no + ", u_address_1=" + u_address_1 + ", u_address_2=" + u_address_2
					+ ", regdate=" + regdate + /*", userBoardList=" + userBoardList +*/ "]";
		}

		public int getUno() {
			return uno;
		}
		
		public void setUno(int uno) {
			this.uno = uno;
		}
		
		public String getUser_id() {
			return user_id;
		}

		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}

		public String getUser_pw() {
			return user_pw;
		}

		public void setUser_pw(String user_pw) {
			this.user_pw = user_pw;
		}

		public String getUser_name() {
			return user_name;
		}

		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}

		public String getUser_nick() {
			return user_nick;
		}

		public void setUser_nick(String user_nick) {
			this.user_nick = user_nick;
		}

		public String getU_phone_1() {
			return u_phone_1;
		}

		public void setU_phone_1(String u_phone_1) {
			this.u_phone_1 = u_phone_1;
		}

		public String getU_phone_2() {
			return u_phone_2;
		}

		public void setU_phone_2(String u_phone_2) {
			this.u_phone_2 = u_phone_2;
		}

		public String getU_mobile_1() {
			return u_mobile_1;
		}

		public void setU_mobile_1(String u_mobile_1) {
			this.u_mobile_1 = u_mobile_1;
		}

		public String getU_mobile_2() {
			return u_mobile_2;
		}

		public void setU_mobile_2(String u_mobile_2) {
			this.u_mobile_2 = u_mobile_2;
		}

		public String getU_email_1() {
			return u_email_1;
		}

		public void setU_email_1(String u_email_1) {
			this.u_email_1 = u_email_1;
		}

		public String getU_email_2() {
			return u_email_2;
		}

		public void setU_email_2(String u_email_2) {
			this.u_email_2 = u_email_2;
		}

		public String getU_post_no() {
			return u_post_no;
		}

		public void setU_post_no(String u_post_no) {
			this.u_post_no = u_post_no;
		}

		public String getU_address_1() {
			return u_address_1;
		}

		public void setU_address_1(String u_address_1) {
			this.u_address_1 = u_address_1;
		}

		public String getU_address_2() {
			return u_address_2;
		}

		public void setU_address_2(String u_address_2) {
			this.u_address_2 = u_address_2;
		}

		public Timestamp getRegdate() {
			return regdate;
		}

		public void setRegdate(Timestamp regdate) {
			this.regdate = regdate;
		}

/*		public ArrayList<FreeBoardVO> getUserBoardList() {
			return userBoardList;
		}

		public void setUserBoardList(ArrayList<FreeBoardVO> userBoardList) {
			this.userBoardList = userBoardList;
		}
*/	
}
