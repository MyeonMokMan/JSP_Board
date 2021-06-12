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
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td width="50"></td>
		</tr>
	</table>
	</center>
</body>
</html>