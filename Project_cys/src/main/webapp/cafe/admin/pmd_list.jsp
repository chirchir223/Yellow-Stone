<%@page import="my.shop.PmdBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="admin_top.jsp"%>	
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<style type="text/css">
table { 
  margin: auto;
}

</style>

pmb_list.jsp
<br>
<br>
<br>
<br>
<br>
<%
request.setCharacterEncoding("UTF-8");
PmdDao pdao = PmdDao.getInstance();
%>

<script type="text/javascript">
	function updatePmd(pnum) {
		location.href = "UpdatePmd_form.jsp?pnum="+pnum;
	}

	function deletePmd(pnum,pimage) {
		var isDel = confirm("정말 삭제하겠습니까?");
		/* (pname)을(를) 정말 삭제하겠습니까? */
		if (isDel) {       
			location.href = 'deletePmd.jsp?pnum='+pnum+'&pimage='+pimage;
		}
	}
</script>

<h4 align="center">
	<font size="5">MD 상품목록</font>
</h4>
<hr
	style="width: 70%; height: 1px; background-color: #CCCCCC; border: none;">

<table class="table table-hover" style="width:1000px;">
	<thead>
		<tr align="center">
			<th>No</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>카테고리</th>
			<th>상품수량</th>
			<th>가격</th>
			<th>상세정보</th>
			<th>포인트</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	</thead>
	<%
	ArrayList<PmdBean> lists = pdao.getAllPmb();
	for (PmdBean pb : lists) {
		String requestDir = request.getContextPath() + "/cafe/images";
	%>
	<tr align="center">
		<td><%=pb.getPnum()%></td>
		<td><img src="<%=requestDir + "/" + pb.getPimage()%>" width="30"
					height="30"></td>
		<td><%=pb.getPname()%></td>
		<td><%=pb.getPcategory_fk()%></td>
		<td><%=pb.getPqty()%></td>
		<td><%=pb.getPrice()%></td>
		<td><%=pb.getPcontents()%></td>
		<td><%=pb.getPoint()%></td>
		<td><button type="submit" class="btn btn-primary" onclick="updatePmd('<%= pb.getPnum() %>')">수정</button></td>
		<td><button type="reset" class="btn btn-primary" onclick="deletePmd('<%= pb.getPnum() %>','<%= pb.getPimage()%>')">삭제</button></td>
	</tr>
	<%
	}
	%>
</table>
