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
	
		request.setCharacterEncoding("euc-kr");
	
	%>
	
	<jsp:useBean id="bBean" class="model.BoardBean">
		<jsp:setProperty name="bBean" property="*" />
	</jsp:useBean>
	
	<%
	
		BoardDAO bDao = new BoardDAO();
		bDao.reWriteBoard(bBean);
		
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>