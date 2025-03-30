<%@page import="java.io.File"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deletePmd.jsp<br>

<%
request.setCharacterEncoding("UTF-8");     
int pnum = Integer.parseInt(request.getParameter("pnum"));
String pimage = request.getParameter("pimage");
System.out.println(pnum + "," + pimage);

PmdDao pdao = PmdDao.getInstance();

int cnt = pdao.DeletePmd(pnum);

String configDir = config.getServletContext().getRealPath("/cafe/images");
File file = new File(configDir + "/" + pimage);
if (file.exists()) {
	if (file.delete()) {
%>

<script type="text/javascript">
	alert('파일 삭제 성공');
</script>

<%
}

}

String msg;
String url;

if (cnt > 0) {
msg = "삭제 성공";
url = "pmd_list.jsp";
} else {
msg = "삭제 실패";
url = "pmd_list.jsp";
}
%>

<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href='<%=url%>';
</script>