package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardDAO {
	
	String id="";
	String pass="";
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
	
	public Vector<BoardBean> getAllBoard() {
		
		Vector<BoardBean> vec = new Vector<BoardBean>();
		
		try {
			
			getCon();
			
			String sql = "select * from board order by ref desc, re_step asc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				//BoardBean Ŭ������ �̿��ؼ� �����͸� ��Ű¡
				BoardBean bBean = new BoardBean();
				
				bBean.setNum(rs.getInt(1));
				bBean.setWriter(rs.getString(2));
				bBean.setEmail(rs.getString(3));
				bBean.setSubject(rs.getString(4));
				bBean.setPassword(rs.getString(5));
				bBean.setReg_date(rs.getDate(6).toString());
				bBean.setRef(rs.getInt(7));
				bBean.setRe_step(rs.getInt(8));
				bBean.setRe_level(rs.getInt(9));
				bBean.setReadcount(rs.getInt(10));
				bBean.setContent(rs.getString(11));
				
				vec.add(bBean);
			
			}
			
			con.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return vec;
	}
	
}
