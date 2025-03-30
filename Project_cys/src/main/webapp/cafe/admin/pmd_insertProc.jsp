<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
pmb_insertProc.jsp<br>

<%
PmdDao pdao = PmdDao.getInstance();

String configDir = config.getServletContext().getRealPath("/cafe/images");
System.out.println("configDir:" + configDir);

int maxSize = 1024 * 1024 * 5;
String encoding = "UTF-8";

MultipartRequest multi = new MultipartRequest(request,
		                                 configDir, 
		                                 maxSize, 
		                                 encoding,
		                                 new DefaultFileRenamePolicy());


System.out.println(multi.getParameter("pname"));

String pimage = multi.getFilesystemName("pimage");
System.out.println(pimage);

String opimage = multi.getOriginalFileName("pimage");
System.out.println(opimage);

String requestDir = request.getContextPath()+"/cafe/images";

requestDir = requestDir + "/" + opimage;
System.out.println("requestDir:" + requestDir); // 포함

%>

<jsp:useBean id="pb" class="my.shop.PmdBean">
<jsp:setProperty name = "pb" property = "*"/>
</jsp:useBean>

<%
int cnt = pdao.insertPmd(multi);

String msg;
String url;

if (cnt != -1) {
	msg = "상품등록 완료";
	url = "pmd_list.jsp";
} else {
	msg = "상품등록 실패";
	url = "pmd_list.jsp";
}

%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>