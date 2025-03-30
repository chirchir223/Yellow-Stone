<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<style type="text/css">
body {
	padding-top: 50px;
	margin: auto;
}

.centers {
	text-align: center;
}

table {
	margin: 3px auto;
}

.container {
	display: flex;
	justify-content: center;
}
</style>

<%
int pageSize = 10;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
//문자열 이기에 숫자로 전환함.
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = 0;
int number = 0;

BoardDao bdao = BoardDao.getInstance();
count = bdao.getArticleCount();
System.out.println("count:" + count);

number = count - (currentPage - 1) * pageSize;

ArrayList<BoardBean> articleLists = bdao.getArticles(startRow, endRow);
%>

<%@include file="cafe_top.jsp"%>


<body>
	<h2 align="center">Q & A</h2>
	<br>
	<!-- <hr style="width: 80%; height: 1px; margin: auto; background-color: #666666;; border: none;"> -->

	<b style="display: block; text-align: center;">글목록(전체 글:<%=count%>)
	</b>
	<table style="width: 800px;">
		<tr>
			<td align="right"><button class="btn btn-default">
					<a href="writeForm.jsp">글쓰기</a>
				</button></td>
		</tr>
	</table>

	<%
	if (count == 0) {
	%>
	<table style="width: 800px;" class="table table-hover">
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
	<%
	} else { // 레코드가 있으면
	%>
	<table style="width: 800px;" class="table table-hover">
		<tr bgcolor="">
			<td align="center">번호</td>
			<td align="center">제목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회수</td>
			<td align="center">IP</td>
		</tr>
		<%
		for (BoardBean bb : articleLists) {
		%>
		<tr align="center">
			<td><%=number--%></td>
			<td align="left">
				<%
				int wid = 0;
				if (bb.getRe_level() > 0) { // 
					wid = 20 * bb.getRe_level(); // 20 40 60
				%> <img src="../../images/white.gif" width="<%=wid%>" height="15">
				<img src="../../images/re.gif"> <%
 } //if
 %> <a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a>

				<%
				if (bb.getReadcount() >= 10) {
				%> <img src="../../images/hot.gif"> <%
 }
 %>

			</td>
			<td><%=bb.getWriter()%></td>
			<td><%=sdf.format(bb.getReg_date())%></td>
			<td><%=bb.getReadcount()%></td>
			<td><%=bb.getIp()%></td>
		</tr>
		<%
		} //for
		%>
	</table>

	<%
	} //else

	//페이지 설정
	if (count > 0) {

	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

	int pageBlock = 3;

	int startPage = ((currentPage - 1) / pageBlock * pageBlock) + 1;

	int endPage = startPage + pageBlock - 1;

	if (endPage > pageCount) {
		endPage = pageCount;
	}
	if (startPage > 0) {
	%>
	<div class="container">
		<ul class="pagination">
			<li class="disabled"><a
				href="list.jsp?pageNum=<%=startPage - 3%>">«</a></li>
			<%
			}
			for (int i = startPage; i <= endPage; i++) {
			%>
			<li><a href="list.jsp?pageNum=<%=i%>"><%=i%></a></li>
			<%
			}
			if (endPage < pageCount) {
			%>
			<li><a href="list.jsp?pageNum=<%=startPage + 3%>">»</a></li>
			<%
			}
			}
			%>
		</ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>

</body>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="cafe_bottom.jsp"%>