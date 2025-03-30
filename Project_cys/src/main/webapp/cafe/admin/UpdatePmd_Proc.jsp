<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
UpdatePmd_Proc.jsp<br>

<%
PmdDao pdao = PmdDao.getInstance();

String configDir = config.getServletContext().getRealPath("/cafe/images");
int maxSize = 1024 * 1024 * 5;
String encoding = "UTF-8";

MultipartRequest mr = new MultipartRequest(request, configDir, maxSize, encoding, new DefaultFileRenamePolicy());

String ornimg = mr.getParameter("pimage2");
String pimage = mr.getFilesystemName("pimage");
String img = null;
String configFolder = config.getServletContext().getRealPath("/cafe/images");

if(ornimg == null){
	
	if(pimage != null){
		img = pimage;
	}
	
}else if(ornimg != null){
	
	 if(pimage == null){
		img = ornimg;
	}
	 else if(pimage != null){
		img = pimage;
		
		File delFile = new File(configFolder,ornimg);
		delFile.delete();
	}
}

int cnt = pdao.updatePmd(mr,img);

String msg = null;
String url = null;
if (cnt > 0) {
	msg = "수정 성공";
	url = "pmd_list.jsp";
} else {
	msg = "수정 실패";
	url = "UpdatePmd_form.jsp?pnum=" + mr.getParameter("pnum");
}
%>
<script>
        alert("<%=msg%>");
        location.href="<%=url%>";
</script>