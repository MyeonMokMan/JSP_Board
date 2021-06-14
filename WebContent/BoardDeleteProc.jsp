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
		//BoardDeleteForm.jsp에서 password와 num을 받는다
		String pass = request.getParameter("password");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO bDao = new BoardDAO();
		
		String password = bDao.getPass(num);
		
		//기존 패스워드와 입력한 패스워드를 비교
		if(pass.equals(password)) {
			
			bDao.deleteBoard(num);
			
			response.sendRedirect("BoardList.jsp");
			
		} else {
			
	%>		
		<script type="text/javascript">
			
			alert("패스워드가 틀립니다.");
			history.go(-1);
			
		</script>
	<%
		}
	%>
	

</body>
</html>