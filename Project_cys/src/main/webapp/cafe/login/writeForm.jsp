<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">
<%@include file="cafe_top.jsp"%>


<style>
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
	function writeForm() {
		location.href = "writeForm.jsp";
	}
</script>

<body>

	<h3 align="center">글쓰기</h3>
	<br>
	<form action="writeProc.jsp">
		<table style="width: 730px;" class="table table-striped">

			<tr>
				<td bgcolor="" colspan="3" align="right"><a href="list.jsp">글목록</td>
			</tr>
			<tr>
				<td align="center" bgcolor="">이름</td>
				<td colspan="2"><input type="text" name="writer" maxlength="10"></td>
			</tr>
			<tr>
				<td align="center" bgcolor="">제목</td>
				<td colspan="3"><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td align="center" bgcolor="">Email</td>
				<td colspan="3"><input type="text" name="email"></td>
			</tr>
			<tr>
				<td align="center" bgcolor="">내용</td>
				<td><textarea rows="5" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td align="center" bgcolor="">비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr align="center" height="30">
				<td colspan="4" >
				<input type="submit" class="btn btn-default" value="글쓰기"> 
				<input type="button" class="btn btn-default" value="다시작성" onClick="writeForm()"> 
				<input type="button" class="btn btn-default" value="목록보기" onClick="showList()">
				</td>
			</tr>

		</table>
	</form>
</body>
	<br><br><br><br>
<%@ include file="cafe_bottom.jsp"%>