<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
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
		//��ü �Խñ��� ������ jsp������ �����;���
		BoardDAO bDao = new BoardDAO();
	
		//��ü �Խñ��� ���� �޾��ִ� �ҽ�
		Vector<BoardBean> vec = bDao.getAllBoard();
	%>
	<center>
	<h2>��ü �Խñ� ����</h2>
	<table width="800" border="1" bgcolor="beige">
		<tr height="40">
			<td width="50" align="center">��ȣ</td>
			<td width="320" align="center">����</td>
			<td width="100" align="center">�ۼ���</td>
			<td width="150" align="center">�ۼ���</td>
			<td width="80" align="center">��ȸ��</td>	
		</tr>
		<%
			for(int i=0; i<vec.size(); i++) {
				
				BoardBean bBean = vec.get(i); //���Ϳ� ���� �Ǿ��ִ� BoardBean Ŭ������ �ϳ��� �����Ѵ�.
		%>
		<tr height="40">
			<td width="50" align="center"><%=i+1%></td>
			<td width="320" align="left"><a href="BoardInfo.jsp?num=<%=bBean.getNum()%>" style="text-decoration:none">
			<%
				//�鿩����
				if(bBean.getRe_step()>1) {
				
					for(int j=0; j<(bBean.getRe_step()-1)*5; j++){
			%>&nbsp;
			<%
					}
				}
			%>
			<%=bBean.getSubject() %></a></td>
			<td width="100" align="center"><%=bBean.getWriter() %></td>
			<td width="150" align="center"><%=bBean.getReg_date() %></td>
			<td width="80" align="center"><%=bBean.getReadcount() %></td>	
		</tr>
		<%
			}
		%>
		<tr height="40">
			<td align="center" colspan="5">
				<button onclick="location.href='BoardWriteForm.jsp'">�Խñ� �ۼ�</button>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>