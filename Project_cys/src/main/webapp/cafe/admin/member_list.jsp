<%@page import="java.text.SimpleDateFormat"%>
<%@page import="my.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<%
request.setCharacterEncoding("UTF-8");
MemberDao mdao = MemberDao.getInstance();
String name = request.getParameter("name");
System.out.println("name:" + name);

%>
member_list.jsp
<br>

<%@ include file="admin_top.jsp"%>
<br><br><br>

<style type="text/css">
.fixed-table {
	width: 750px;
	margin: auto;
}

.container1 {
	border: 1px solid #CCCCCC; /* 테두리 스타일과 색상 설정 */
	padding: 30px; /* 테두리 내부 여백 설정 */
	max-width: 900px;
	margin: auto; /* 가운데 정렬 */
	border-radius: 10px;
}
</style>

<h4 align="center">
	<font size="5">회원목록</font>
</h4>
<hr
	style="width: 70%; height: 1px; background-color: #CCCCCC; border: none;">

<form>
	<table class="table table-striped fixed-table" style="width: 900px;">
		<thead>
			<tr>
				<th class="text-center" bgcolor="" width="10%">등록번호</th>
				<th class="text-center" bgcolor="" width="10%">아이디</th>
				<th class="text-center" bgcolor="" width="15%">이메일</th>
				<th class="text-center" bgcolor="" width="20%">생년월일</th>
				<th class="text-center" bgcolor="" width="15%">이름</th> 
				<th class="text-center" bgcolor="" width="25%">전화번호</th>
			</tr>
		</thead>

		<%
		ArrayList<MemberBean> lists = mdao.getAllMember();
		if (lists.size() == 0) {
		%>

		<tr align="center">
			<td colspan="6">등록된 회원이 없습니다.</td>
		</tr>

		<%
		}
		%>

		<%
		for (MemberBean mb : lists) {
		%>

		<tr align="center">
			<td><%=mb.getNum()%></td>
			<td><%=mb.getId()%></td>
			<td><%=mb.getEmail()%></td>
			<td><%=mb.getBirth()%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getTelecom()%> | <%=mb.getHphone() %></td>
		</tr>
		<%
		}
		%>

	</table>
</form>