package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardDAO {
	
	String id="오라클 아이디";
	String pass="오라클 비밀번호";
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
	
	//BoardInfo의 하나의 게시글,조회수 증가 쿼리를 리턴하는 메소드
	public BoardBean getOneBoard(int num) {
		
		BoardBean bBean = new BoardBean();
		
		try {
			getCon();
			
			//조회수 증가 쿼리
			String readSql = "update board set readcount=readcount+1 where num=?";
			
			pstmt = con.prepareStatement(readSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			String sql = "select * from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
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
				
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bBean;
	}
	
	//댓글 메소드
	public void reWriteBoard(BoardBean bBean) {
		
		//부모 글 그룹과 글 레벨,스텝을 읽어드림
		int ref = bBean.getRef();
		int re_step = bBean.getRe_step();
		int re_level = bBean.getRe_level();
		
		try {
			
			getCon();
			
			//답글 쿼리
			String levelSql = "update board set re_level=re_level+1 where ref=? and re_level>?";
			
			pstmt=con.prepareStatement(levelSql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bBean.getWriter());
			pstmt.setString(2, bBean.getEmail());
			pstmt.setString(3, bBean.getSubject());
			pstmt.setString(4, bBean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step+1); //답글이기에 부모 글 re_step에 1을 더해줌
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bBean.getContent());
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//BoardUpdate용 하나의 게시글 리턴
	public BoardBean getOneUpdateBoard(int num) {
		
		BoardBean bBean = new BoardBean();
		
		try {
			getCon();
			
			String sql = "select * from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
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
				
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bBean;
	}
	
	//update와 delete에 필요한 비밀번호를 리턴해주는 메소드
	public String getPass(int num) {
		
		String pass="";
		
		try {
			
			getCon();
			
			String passSql = "select password from board where num=?";
			
			pstmt = con.prepareStatement(passSql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				pass = rs.getString(1);
				
			}
			
			con.close();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pass;
		
	}
	
	public void updateBoard(BoardBean bBean) {
		
		try {
			
			getCon();
			
			String updateSql = "update board set subject=?, content=? where num=?";
			
			pstmt = con.prepareStatement(updateSql);
			pstmt.setString(1, bBean.getSubject());
			pstmt.setString(2, bBean.getContent());
			pstmt.setInt(3, bBean.getNum());
			
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteBoard(int num) {
		
		try {
			
			getCon();
			
			String deleteSql = "delete from board where num=?";
			
			pstmt = con.prepareStatement(deleteSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			con.close();
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public int getAllCount() {
		
		int count = 0;
		
		try {
			
			getCon();
			
			String countSql = "select count(*) from board";
			
			pstmt = con.prepareStatement(countSql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				//전체 게시글 수
				count = rs.getInt(1);
				
			}
			
			con.close();
					
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return count;
	}
}
