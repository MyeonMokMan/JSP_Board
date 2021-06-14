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
		//해당 게시글의 패스워드를 얻어옴
		BoardDAO bDao = new BoardDAO();
		
		String pass = bDao.getPass(bBean.getNum());
		
		//기존 패스워드 값과 Update에 입력한 비밀번호를 비교
		if(pass.equals(bBean.getPassword())) {
			
			//데이터 수정하는 메소드
			bDao.updateBoard(bBean);
			
			//수정이 완료되면 리스트로
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