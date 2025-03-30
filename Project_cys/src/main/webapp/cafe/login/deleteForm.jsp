<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">
<%@include file="cafe_top.jsp"%>


<style type="text/css">
body {
	padding-top: 100px;
	margin: auto;
}
table {
	margin: 3px auto;
}
</style>

<script type="text/javascript">
 function Check(){
	 if(delForm.passwd.value == ""){
		 alert("비밀번호를 입력하세요.");
		 delForm.passwd.focus();
		 return false;
	 }
 }
</script>



<%
	int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");

	System.out.println("deleteForm.jsp num:" + num);
%>

<form name="delForm" action="deleteProc.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="pagenum" value="<%=pageNum%>">

<h3 align="center">글삭제</h3>
	<table style="width: 500px;" class="table table-striped"> 
		<tr>
			<td align="center">비밀번호를 입력해 주세요.</td>
		</tr>
		<tr>
			<td align="center">비밀번호: <input type="password" name="passwd" align="center"></td>
		</tr>
		<tr align="center" height="30">
			<td colspan="3">
			<input type="submit" class="btn btn-default" value="글삭제" onClick= "return Check()"> 
			 <input type="button" class="btn btn-default" value="글목록" onclick="location.href='list.jsp?pageNum=<%= pageNum %>'">
			</td>
		</tr>

	</table>
</form>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@include file="cafe_bottom.jsp"%>