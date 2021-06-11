<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 예제</title>
</head>
<body>

	<center>
	<h2>게시글 쓰기</h2>
	<form action="BoardWriteProc.jsp" method="post">
		<table width="600" border="1" bgcolor="beige">
			<tr height="40">
				<td align="center" width="150">작성자</td>
				<td><input type="text" name="writer" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">제목</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">이메일</td>
				<td><input type="email" name="email" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">패스워드</td>
				<td><input type="password" name="password" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">글 내용</td>
				<td><textarea rows="10" cols="50" name="content"></textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
					<input type="submit" value="작성 완료">
					<input type="reset" value="초기화">
					<button onclick="location.href='BoardList.jsp'">글 목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
	</center>

</body>
</html>