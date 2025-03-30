<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">
<%@include file="cafe_top.jsp"%>

<style type="text/css">
table {
	margin: 5px auto;
}

body {
	padding-top: 100px;
	margin: auto;
}

.centers {
	text-align: center;
}
</style>

<script type="text/javascript">
	function showList() {
		location.href = "list.jsp";
	}
</script>

<%
int num = Integer.parseInt(request.getParameter("num"));
//System.out.println("content.jsp num:" + num);
String pageNum = request.getParameter("pageNum");
System.out.println("content.jsp pageNum:" + pageNum);
BoardDao bdao = BoardDao.getInstance();
BoardBean bb = bdao.getArticle(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
System.out.println(bb.getRef());
int ref = bb.getRef();
System.out.println(bb.getRe_step());
System.out.println(bb.getRe_level());
%>

<body>
	<h3 align="center">글내용 보기</h3>
	<br>
	<table style="width: 730px;" class="table table-bordered">
		<tr align="center" height="30">
			<td width="150">글번호</td>
			<td width="150"><%=bb.getNum()%></td>
			<td width="150">조회수</td>
			<td width="150"><%=bb.getReadcount()%></td>
		</tr>
		<tr align="center" height="30">
			<td width="150">작성자</td>
			<td width="150"><%=bb.getWriter()%></td>
			<td width="150">작성일</td>
			<td width="150"><%=sdf.format(bb.getReg_date())%></td>
		</tr>
		<tr align="center" height="30">
			<td width="150">글제목</td>
			<td colspan="3" width="450"><%=bb.getSubject()%></td>
		</tr>
		<tr align="center" height="50">
			<td width="150">글내용</td>
			<td colspan="3" width="450" align="left"><%=bb.getContent()%></td>
		</tr>
		<tr align="center" height="30">
			<td colspan="4" >
			<input type="button" class="btn btn-default" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" class="btn btn-default" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" class="btn btn-default" value="답글쓰기"onClick="location.href='replyForm.jsp?ref=<%=ref%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum%>'">
			<input type="button" class="btn btn-default" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
		</tr>
	</table>
</body>
<br><br><br><br><br>
<%@ include file="cafe_bottom.jsp"%>