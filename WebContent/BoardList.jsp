<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
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
	
		//��ü �Խñ��� ������ jsp������ �����;���
		BoardDAO bDao = new BoardDAO();
	
		//��ü �Խñ��� ���� �޾��ִ� �ҽ�
		Vector<BoardBean> vec = bDao.getAllBoard();
	
	%>
	<center>
	<h2>��ü �Խñ� ����</h2>
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td width="50"></td>
		</tr>
	</table>
	</center>
</body>
</html>