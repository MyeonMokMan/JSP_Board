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
	
		int num = Integer.parseInt(request.getParameter("num").trim());
		
		BoardDAO bDao = new BoardDAO();
		
		BoardBean bBean = bDao.getOneUpdateBoard(num);
		
	%>

	<center>
	<h2>게시글 수정</h2>
	<form action="BoardUpdateProc.jsp" method="post">
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center"><%=bBean.getWriter()%></td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center"><%=bBean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">제목</td>
			<td colspan="3"><input type="text" name="subject" value="<%=bBean.getSubject()%>"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">패스워드</td>
			<td colspan="3"><input type="password" name="password"></td> 
		</tr>
		<tr height="40">
			<td width="120" align="center">글내용</td>
			<td colspan="3"><textarea rows="10" cols="60" name="content" align="left"><%=bBean.getContent()%></textarea></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="submit" value="수정 완료">
				<input type="reset" value="초기화">
				<input type="button" onclick="location.href='BoardList.jsp'" value="글 목록 보기">
			</td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>