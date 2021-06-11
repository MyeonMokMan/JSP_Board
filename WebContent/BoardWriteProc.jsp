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
		request.setCharacterEncoding("euc-kr");
	%>
	
	<!-- 게시글에 작성한 데이터를 BoardBean에 넣음 -->
	<jsp:useBean id="bBean" class="model.BoardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDAO bDao = new BoardDAO();
	 	bDao.insertBoard(bBean);
	%>
	
	
</body>
</html>