<%@page import="model.BoardBean"%>
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
		//공백 제거 후 정수형으로.
		int num = Integer.parseInt(request.getParameter("num").trim());
	
		//데이터베이스 접근
		BoardDAO bDao = new BoardDAO();
		
		BoardBean bBean = bDao.getOneBoard(num);
	
	%>
	
	<center>
	<h2>게시글 보기</h2>
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td align="center" width="120">글번호</td>
			<td align="center" width="180"> <%=bBean.getNum()%>
			<td align="center" width="120">조회수</td>
			<td align="center" width="180"><%=bBean.getReadcount()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">작성자</td>	
			<td align="center" width="180"><%=bBean.getWriter()%></td>
			<td align="center" width="120">작성일</td>
			<td align="center" width="180"><%=bBean.getReg_date()%></td> 	
		</tr>
		<tr height="40">
			<td align="center" width="120">이메일</td>
			<td align="center" colspan="3"><%=bBean.getEmail()%></td> 
		</tr>
		<tr height="40">
			<td align="center" width="120">제목</td>
			<td align="center" colspan="3"><%=bBean.getSubject()%></td> 
		</tr>
		<tr height="80">
			<td align="center" width="120">글내용</td>
			<td align="center" colspan="3"><%=bBean.getContent()%></td> 
		</tr>
		<tr>
			<td align="center" colspan="4">
				<button onclick="location.href='BoardReWriteForm.jsp?num=
				<%=bBean.getNum()%>&ref=<%=bBean.getRef()%>&re_step=
				<%=bBean.getRe_step()%>&re_level=<%=bBean.getRe_level()%>'">답글쓰기</button>
				<button onclick="location.href='BoardUpdateForm.jsp?num=<%=bBean.getNum()%>'">수정하기</button>
				<button onclick="location.href='BoardDeleteForm.jsp?num=<%=bBean.getNum()%>'">삭제하기</button>
				<button onclick="location.href='BoardList.jsp'">목록보기</button>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>