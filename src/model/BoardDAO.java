package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
	
	String id="����Ŭ ���̵�";
	String pass="����Ŭ ��й�ȣ";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	//�����ͺ��̽��� ������ �� �ֵ��� ����
	Connection con;
	
	//�����ͺ��̽����� ������ ��������ִ� ��ü
	PreparedStatement pstmt;
	
	//�����ͺ��̽��� ���̺��� ����� ���� �޾� �ڹٿ� �������ִ� ��ü
	ResultSet rs;
	
	//�����ͺ��̽��� ������ �� �ֵ��� �����ִ� �޼ҵ�
	public void getCon() {
		try {
			//�ش� �����ͺ��̽��� ����Ѵٰ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//�ش� �����ͺ��̽��� ����
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertBoard(BoardBean bBean) {
		
		// bBean�� �Ѿ���� �ʾҴ� �����͸� �ʱ�ȭ ���־�� �Ѵ�.
		int ref = 0; //�� �׷�
		int re_step = 1; //����
		int re_level = 1;
		
		try {
			
			getCon();
			
			//���� ū ref ���� �о���� ���� �غ�
			String refSql = "select max(ref) from board";
			
			pstmt = con.prepareStatement(refSql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				ref = rs.getInt(1)+1; //�ִ� ���� +1�� ���ؼ� �� �׷��� ����
			}
			
			//�Խñ� ��ü�� ���̺� ����
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)"; //�� ó�� NUM���� �������� ���� (�ڵ����� +1 ���ش�)
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bBean.getWriter());
			pstmt.setString(2, bBean.getEmail());
			pstmt.setString(3, bBean.getSubject());
			pstmt.setString(4, bBean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bBean.getContent());
			
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}	
		
	}
	
}
