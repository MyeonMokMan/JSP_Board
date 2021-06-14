<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 예제</title>
</head>
<body>
	
	<%
		//전체 게시글의 내용을 jsp쪽으로 가져와야함
		BoardDAO bDao = new BoardDAO();
	
		//전체 게시글을 리턴 받아주는 소스
		Vector<BoardBean> vec = bDao.getAllBoard();
	%>
	<center>
	<h2>전체 게시글 보기</h2>
	<table width="800" border="1" bgcolor="beige">
		<tr height="40">
			<td width="50" align="center">번호</td>
			<td width="320" align="center">제목</td>
			<td width="100" align="center">작성자</td>
			<td width="150" align="center">작성일</td>
			<td width="80" align="center">조회수</td>	
		</tr>
		<%
			for(int i=0; i<vec.size(); i++) {
				
				BoardBean bBean = vec.get(i); //벡터에 저장 되어있는 BoardBean 클래스를 하나씩 저장한다.
		%>
		<tr height="40">
			<td width="50" align="center"><%=i+1%></td>
			<td width="320" align="left"><a href="BoardInfo.jsp?num=<%=bBean.getNum()%>" style="text-decoration:none">
			<%
				//들여쓰기
				if(bBean.getRe_step()>1) {
				
					for(int j=0; j<(bBean.getRe_step()-1)*5; j++){
			%>&nbsp;
			<%
					}
				}
			%>
			<%=bBean.getSubject() %></a></td>
			<td width="100" align="center"><%=bBean.getWriter() %></td>
			<td width="150" align="center"><%=bBean.getReg_date() %></td>
			<td width="80" align="center"><%=bBean.getReadcount() %></td>	
		</tr>
		<%
			}
		%>
		<tr height="40">
			<td align="center" colspan="5">
				<button onclick="location.href='BoardWriteForm.jsp'">게시글 작성</button>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>