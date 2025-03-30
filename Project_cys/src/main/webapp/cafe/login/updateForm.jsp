<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">
<%@include file="cafe_top.jsp"%>

<style>
table {
	border-collapse: collapse;
	margin: auto;
}
body {
	padding-top: 100px;
	margin: auto;
}
</style>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardDao bdao = BoardDao.getInstance();
BoardBean bb = bdao.updateGetArticle(num);
%>

<body>
	<h3 align="center">글수정</h3>
	<form action="updateProc.jsp" method="post">
		<input type="hidden" name="num" value="<%=bb.getNum()%>"> <input
			type="hidden" name="pageNum" value="<%=pageNum%>">
		<table style="width: 800px;" class="table table-striped">
			<tr>
				<td align="right" colspan="2"><a href="list.jsp">글목록</a></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="writer" maxlength="10"
					value="<%=bb.getWriter()%>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"
					value="<%=bb.getSubject()%>"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="text" name="email" value="<%=bb.getEmail()%>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="5" cols="50"><%=bb.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" class="btn btn-default" value="글수정">
				<input type="button" class="btn btn-default" value="다시작성">
				<input type="button" class="btn btn-default" value="목록보기" onClick="location='list.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
<br><br><br><br>
<%@ include file="cafe_bottom.jsp"%>