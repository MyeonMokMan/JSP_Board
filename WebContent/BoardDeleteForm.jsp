<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 예제</title>
</head>
<body>

	<%
	
		BoardDAO bDao = new BoardDAO();
	
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardBean bBean = bDao.getOneUpdateBoard(num);

	%>
	
	<center>
	<h2>게시글 삭제</h2>
	<form action="BoardDeleteProc.jsp" method="post">
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center"><%=bBean.getWriter()%></td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center"><%=bBean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">제목</td>
			<td align="left" colspan="3"><%=bBean.getSubject()%></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">패스워드</td>
			<td align="left" colspan="3"><input type="password" size="60" name="password"></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="submit" value="글 삭제">
				<input type="button" onclick="location.href='BoardList.jsp'" value="글 목록 보기">
			</td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>