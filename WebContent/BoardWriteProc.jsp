<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	
	<!-- �Խñۿ� �ۼ��� �����͸� BoardBean�� ���� -->
	<jsp:useBean id="bBean" class="model.BoardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDAO bDao = new BoardDAO();
	 	bDao.insertBoard(bBean);
	%>
	
	
</body>
</html>