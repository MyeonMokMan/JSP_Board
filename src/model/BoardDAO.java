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
	
	//데이터베이스에 접근할 수 있도록 설정
	Connection con;
	
	//데이터베이스에서 쿼리를 실행시켜주는 객체
	PreparedStatement pstmt;
	
	//데이터베이스의 테이블의 결과를 리턴 받아 자바에 저장해주는 객체
	ResultSet rs;
	
	//데이터베이스에 접근할 수 있도록 도와주는 메소드
	public void getCon() {
		try {
			//해당 데이터베이스를 사용한다고 선언
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//해당 데이터베이스를 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertBoard(BoardBean bBean) {
		
		// bBean에 넘어오지 않았던 데이터를 초기화 해주어야 한다.
		int ref = 0; //글 그룹
		int re_step = 1; //새글
		int re_level = 1;
		
		try {
			
			getCon();
			
			//가장 큰 ref 값을 읽어오는 쿼리 준비
			String refSql = "select max(ref) from board";
			
			pstmt = con.prepareStatement(refSql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				ref = rs.getInt(1)+1; //최대 값에 +1을 더해서 글 그룹을 설정
			}
			
			//게시글 전체를 테이블에 저장
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)"; //맨 처음 NUM에는 시퀀스가 들어간다 (자동으로 +1 해준다)
			
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
				
				//BoardBean 클래스를 이용해서 데이터를 패키징
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
