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
</style>

<%
int ref = Integer.parseInt(request.getParameter("ref"));
int re_step = Integer.parseInt(request.getParameter("re_step"));
int re_level = Integer.parseInt(request.getParameter("re_level"));
String pageNum = request.getParameter("pageNum");

System.out.println("ref:"+ref);
System.out.println("re_step:"+re_step);
System.out.println("re_level:"+re_level);
%>

<script type="text/javascript">
 function showList(){
	 location.href = "list.jsp";
 }
 function reply(){
	 location.href = "replyProc.jsp";
 }
</script>

<body>
	<h3 align="center">답글 쓰기</h3>
	<br>
<form action="replyProc.jsp?pageNum=<%=pageNum%>" method="post">
<input type = "hidden" name = "ref" value = "<%=ref %>">
<input type = "hidden" name = "re_step" value = "<%=re_step %>">
<input type = "hidden" name = "re_level" value = "<%=re_level %>">

<table style="width: 800px;" class="table table-striped">
   
   <tr>
		<td colspan="3"  align="right">
		<a href="list.jsp">글목록</td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td colspan="2"><input type="text" name="writer" maxlength="10"></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td colspan="3"><input type="text" name="subject"></td>
	</tr>
	<tr>
		<td align="center">Email</td>
		<td colspan="3"><input type="text"  name="email"></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td><textarea rows="5" cols="50"  name="content"></textarea> </td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td><input type="password"  name="passwd"></td>
	</tr>
	<tr align="center" height="30">
		<td colspan="4">
		<input type="submit" class="btn btn-default" value="답글쓰기"> 
		<input type="button" class="btn btn-default" value="다시작성" onClick="location='list.jsp'">
		<input type="button" class="btn btn-default" value="목록보기" onClick="location='list.jsp'">
		</td>
	</tr>

</table>
</form>
</body>
<br><br><br><br>
<%@ include file="cafe_bottom.jsp"%>