<%@page import="my.shop.CagoBean"%>
<%@page import="my.shop.CagoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="my.shop.PmdBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">

<%@ include file="cafe_top.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
DecimalFormat df = new DecimalFormat("###,###");
CagoDao cdao = CagoDao.getInstance();
ArrayList<CagoBean> lists = cdao.getAlllist();

PmdDao pdao = PmdDao.getInstance();
ArrayList<PmdBean> plists = new ArrayList<PmdBean>();

HashMap<String, ArrayList<PmdBean>> categoryMap = new HashMap<String, ArrayList<PmdBean>>();

for (CagoBean cb : lists) {
	ArrayList<PmdBean> selectedPmdList = pdao.selectByCago(cb.getCode());
	categoryMap.put(cb.getCode(), selectedPmdList);
}

for (ArrayList<PmdBean> categoryList : categoryMap.values()) {
	plists.addAll(categoryList);
}
%>

<style type="text/css">
body {
	padding-top: 20px;
	margin: auto;
}

btn {
	margin: auto;
}

.caption {
	text-align: center;
	font-style: normal;
}
</style>

<%
for (CagoBean cb : lists) {
%>

<h3 align="center"><%=cb.getCode()%></h3>

<hr
	style="width: 70%; height: 1px; margin: auto; background-color: black; border: none;">

<br>
<br>
<br>
<body>

	<div class="container">
		<div class="row">
			<%
			ArrayList<PmdBean> categoryList = categoryMap.get(cb.getCode());
			if (categoryList != null) {
				for (PmdBean pb : categoryList) {
			%>
			<div class="col-sm-6 col-md-3">

				<div class="thumbnail">
				<a href = "Store_pmdView.jsp?pnum=<%=pb.getPnum()%>">
					<img
						src="<%=request.getContextPath() + "/cafe/images/" + pb.getPimage()%>"
						alt="...">
						</a>
					<div class="caption">
						<p><%=pb.getPname()%></p>
						<p><%=df.format(pb.getPrice())%>원
						</p>

					</div>
				</div>

			</div>
			<%
			}
			}
			%>
		</div>
	</div>
</body>
<%
} //cfor
%>

<%@include file="cafe_bottom.jsp"%>

