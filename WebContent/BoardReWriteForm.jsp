<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����</title>
</head>
<body>

	<%
		
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
	%>

	<center>
	<h2>��� �Է�</h2>
	<form action="BoardReWriteProc.jsp" method="post">
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td width="150" align="center">�ۼ���</td>
			<td width="450" align="center"><input type="text" name="writer" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">����</td>
			<td width="450" align="center"><input type="text" value="[�亯]" name="subject" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">�̸���</td>
			<td width="450" align="center"><input type="email" name="email" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">��й�ȣ</td>
			<td width="450" align="center"><input type="password" name="password" size="60"></td>
		</tr>
		<tr height="40">
			<td width="150" align="center">�۳���</td>
			<td width="450" align="center"><textarea rows="10" cols="60" name="content"></textarea></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="2">
				<input type="hidden" name="ref" value="<%=ref%>">
				<input type="hidden" name="re_step" value="<%=re_step%>">
				<input type="hidden" name="re_level" value="<%=re_level%>">
				<input type="submit" value="�Ϸ�">
				<input type="reset" value="�ʱ�ȭ">
				<button onclick="location.href='BoardList.jsp'">��� ����</button>
			</td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>