<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
BoardDao bdao = BoardDao.getInstance();
int num = Integer.parseInt(request.getParameter("num"));
String passwd = request.getParameter("passwd");
String pageNum = request.getParameter("pageNum");
int pn = Integer.parseInt(pageNum);

int cnt = bdao.deleteArticle(num,passwd); 

/* 남아있는 레코드 갯수: 17=>16 9p=>8p */
int pageSize = 2; 
int count = bdao.getArticleCount();
int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);


String msg;
String url;

if (cnt > 0) {
	msg = "삭제 성공";
	if(pageCount < pn){
		pn = pageCount;
	}
	url = "list.jsp?pageNum=" + pageNum;
} else {
	msg = "삭제 실패";
	url = "deleteForm.jsp?num=" + num +"&pageNum=" + pageNum;
}
%> 
<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href='<%=url%>';
</script>