package org.zerock.vo;

import java.util.Date;

public class MemberVO {

   private String userId;
   private String userPass;
   private String userName;
   private Date regDate;
   
   
   private String EMAIL;
   private String NNAME;
   private String ADDRESS;
   private String ADDRESS2;
   private String ADDRESS3;
   private String ADDRESS4;
   
   private int SNUM;
   private int PNUM;
   private String GRADE;
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getUserPass() {
      return userPass;
   }
   public void setUserPass(String userPass) {
      this.userPass = userPass;
   }
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public Date getRegDate() {
      return regDate;
   }
   public void setRegDate(Date regDate) {
      this.regDate = regDate;
   }
   public String getEMAIL() {
      return EMAIL;
   }
   public void setEMAIL(String eMAIL) {
      EMAIL = eMAIL;
   }
   public String getNNAME() {
      return NNAME;
   }
   public void setNNAME(String nNAME) {
      NNAME = nNAME;
   }
   public String getADDRESS() {
      return ADDRESS;
   }
   public void setADDRESS(String aDDRESS) {
      ADDRESS = aDDRESS;
   }
   public int getSNUM() {
      return SNUM;
   }
   public void setSNUM(int sNUM) {
      SNUM = sNUM;
   }
   public int getPNUM() {
      return PNUM;
   }
   public void setPNUM(int pNUM) {
      PNUM = pNUM;
   }
   public String getGRADE() {
      return GRADE;
   }
   public void setGRADE(String gRADE) {
      GRADE = gRADE;
   }
   
   public String getADDRESS2() {
	return ADDRESS2;
}
public void setADDRESS2(String aDDRESS2) {
	ADDRESS2 = aDDRESS2;
}
public String getADDRESS3() {
	return ADDRESS3;
}
public void setADDRESS3(String aDDRESS3) {
	ADDRESS3 = aDDRESS3;
}
public String getADDRESS4() {
	return ADDRESS4;
}
public void setADDRESS4(String aDDRESS4) {
	ADDRESS4 = aDDRESS4;
}
@Override
public String toString() {
	return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", regDate=" + regDate
			+ ", EMAIL=" + EMAIL + ", NNAME=" + NNAME + ", ADDRESS=" + ADDRESS + ", ADDRESS2=" + ADDRESS2
			+ ", ADDRESS3=" + ADDRESS3 + ", ADDRESS4=" + ADDRESS4 + ", SNUM=" + SNUM + ", PNUM=" + PNUM + ", GRADE="
			+ GRADE + "]";
}

   
   
   
   
}