<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����</title>
</head>
<body>

	<center>
	<h2>�Խñ� ����</h2>
	<form action="BoardWriteProc.jsp" method="post">
		<table width="600" border="1" bgcolor="beige">
			<tr height="40">
				<td align="center" width="150">�ۼ���</td>
				<td><input type="text" name="writer" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">����</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">�̸���</td>
				<td><input type="email" name="email" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">�н�����</td>
				<td><input type="password" name="password" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">�� ����</td>
				<td><textarea rows="10" cols="50" name="content"></textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
					<input type="submit" value="�ۼ� �Ϸ�">
					<input type="reset" value="�ʱ�ȭ">
					<button onclick="location.href='BoardList.jsp'">�� ��� ����</button>
				</td>
			</tr>
		</table>
	</form>
	</center>

</body>
</html>