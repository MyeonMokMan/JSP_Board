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
	
		request.setCharacterEncoding("euc-kr");
			
	%>
	
	<jsp:useBean id="bBean" class="model.BoardBean">
		<jsp:setProperty name="bBean" property="*" />
	</jsp:useBean>
	
	<%
		//�ش� �Խñ��� �н����带 ����
		BoardDAO bDao = new BoardDAO();
		
		String pass = bDao.getPass(bBean.getNum());
		
		//���� �н����� ���� Update�� �Է��� ��й�ȣ�� ��
		if(pass.equals(bBean.getPassword())) {
			
			//������ �����ϴ� �޼ҵ�
			bDao.updateBoard(bBean);
			
			//������ �Ϸ�Ǹ� ����Ʈ��
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