package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
	
	String id = "����Ŭ ���̵�";
	String pass = "����Ŭ ��й�ȣ";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con;
	
	PreparedStatement pstmt;
	
	ResultSet rs;
	
	public void getcon() {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url, id, pass);
		
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
	}
	
	
}
