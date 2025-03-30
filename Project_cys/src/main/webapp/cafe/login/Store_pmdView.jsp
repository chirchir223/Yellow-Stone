<%@page import="my.shop.PmdBean"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">

<%@ include file="cafe_top.jsp"%>

<style type="text/css">
.container {
	width: 300px;
	height: auto;
}

table {
	border-collapse: collapse;
	margin: auto;
}
</style>

<script type="text/javascript">
	function goCart(pnum){
		//alert(pnum);
		oqty = document.f.oqty.value; // 주문수량
		if(oqty == "" || oqty < 1){
			alert('최소 주문수량은 1개 입니다.');
			return;
		}
		
		location.href="<%=request.getContextPath()%>/cafe/login/Store_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;  
	}//goCart
	
	function goOrder(pnum){
		//alert(1);
		oqty = document.f.oqty.value;
		if(oqty == "" || oqty < 1){
			alert('최소 주문수량은 1개 입니다.');
			return;
		}
		
		location.href="<%=request.getContextPath()%>/cafe/login/Store_order.jsp?pnum="+ pnum + "&oqty=" + oqty;

	}//goOrder
</script>

<%
String pnum = request.getParameter("pnum");
PmdDao pdao = PmdDao.getInstance();

PmdBean pb = pdao.getPmdByNum(pnum);
%>
<h3 align="center"><%=pb.getPname()%></h3>
<br>

<hr
	style="width: 80%; height: 2px; margin: auto; background-color: #666666; border: none;">
<table width="90%" alian="center">

	<tr>
		<td align="center" class="m3"><img
			src="<%=request.getContextPath() + "/cafe/images/" + pb.getPimage()%>">

		</td>

		<td>
			<form method="post" name="f">
				<b>상품명:</b>
				<%=pb.getPname()%><br> <br> <b>판매가:</b>
				<%=pb.getPrice()%><br> <b>적립금:</b> [<%=pb.getPoint()%>]point<br>
				<hr>
				<font size="2">(최소주문수량 1개 이상)</font><br>

				<hr>

				<b>주문 수량</b> <input type="text" name="oqty" value="1" maxlength="3"
					size="1">개 <br> <br>

				<table>
					<tr align="center">
						<td><a href="javascript:goOrder('<%=pb.getPnum()%>')"
							class="btn btn-primary btn-lg btn-block" role="button">바로
								구매하기</a></td>

						<td><a href="javascript:goCart('<%=pb.getPnum()%>')"
							class="btn btn-default btn-lg btn-block" role="button">장바구니담기</a></td>
					</tr>
				</table>
			</form>
		</td>

	</tr>

	<tr height="200">
		<td colspan="2" align="center"><b>상품 상세 설명</b><br> <br>
			<%=pb.getPcontents()%></td>
	</tr>

</table>
<br>
<br>
<br>
<br>
<br>
<%@include file="cafe_bottom.jsp"%>


