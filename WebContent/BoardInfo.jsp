<%@page import="model.BoardBean"%>
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
		//���� ���� �� ����������.
		int num = Integer.parseInt(request.getParameter("num").trim());
	
		//�����ͺ��̽� ����
		BoardDAO bDao = new BoardDAO();
		
		BoardBean bBean = bDao.getOneBoard(num);
	
	%>
	
	<center>
	<h2>�Խñ� ����</h2>
	<table width="600" border="1" bgcolor="beige">
		<tr height="40">
			<td align="center" width="120">�۹�ȣ</td>
			<td align="center" width="180"> <%=bBean.getNum()%>
			<td align="center" width="120">��ȸ��</td>
			<td align="center" width="180"><%=bBean.getReadcount()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">�ۼ���</td>	
			<td align="center" width="180"><%=bBean.getWriter()%></td>
			<td align="center" width="120">�ۼ���</td>
			<td align="center" width="180"><%=bBean.getReg_date()%></td> 	
		</tr>
		<tr height="40">
			<td align="center" width="120">�̸���</td>
			<td align="center" colspan="3"><%=bBean.getEmail()%></td> 
		</tr>
		<tr height="40">
			<td align="center" width="120">����</td>
			<td align="center" colspan="3"><%=bBean.getSubject()%></td> 
		</tr>
		<tr height="80">
			<td align="center" width="120">�۳���</td>
			<td align="center" colspan="3"><%=bBean.getContent()%></td> 
		</tr>
		<tr>
			<td align="center" colspan="4">
				<button onclick="location.href='BoardReWriteForm.jsp?num=
				<%=bBean.getNum()%>&ref=<%=bBean.getRef()%>&re_step=
				<%=bBean.getRe_step()%>&re_level=<%=bBean.getRe_level()%>'">��۾���</button>
				<button onclick="location.href='BoardUpdateForm.jsp?num=<%=bBean.getNum()%>'">�����ϱ�</button>
				<button onclick="location.href='BoardDeleteForm.jsp?num=<%=bBean.getNum()%>'">�����ϱ�</button>
				<button onclick="location.href='BoardList.jsp'">��Ϻ���</button>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>