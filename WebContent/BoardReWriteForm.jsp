<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 예제</title>
</head>
<body>

	<%
		
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
	%>

	<center>
	<h2>답글 입력</h2>
	<form action="BoardReWriteProc.jsp" method="post">
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td width="150" align="center">작성자</td>
			<td width="450" align="center"><input type="text" name="writer" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">제목</td>
			<td width="450" align="center"><input type="text" value="[답변]" name="subject" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">이메일</td>
			<td width="450" align="center"><input type="email" name="email" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">비밀번호</td>
			<td width="450" align="center"><input type="password" name="password" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">글내용</td>
			<td width="450" align="center"><textarea rows="10" cols="60" name="content"></textarea></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="2">
				<input type="hidden" name="ref" value="<%=ref%>">
				<input type="hidden" name="re_step" value="<%=re_step%>">
				<input type="hidden" name="re_level" value="<%=re_level%>">
				<input type="submit" value="완료">
				<input type="reset" value="초기화">
				<button onclick="location.href='BoardList.jsp'">목록 보기</button>
			</td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>