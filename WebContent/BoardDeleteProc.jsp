<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����</title>
</head>
<body>

	<%
		//BoardDeleteForm.jsp���� password�� num�� �޴´�
		String pass = request.getParameter("password");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bDao = new BoardDAO();
		
		String password = bDao.getPass(num);
		
		//���� �н������ �Է��� �н����带 ��
		if(pass.equals(password)) {
			
			bDao.deleteBoard(num);
			
			response.sendRedirect("BoardList.jsp");
			
		} else {
			
	%>		
		<script type="text/javascript">
			
			alert("�н����尡 Ʋ���ϴ�.");
			history.go(-1);
			
		</script>
	<%
		}
	%>
	

</body>
</html>