<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="fifle.FipleMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg = "로그인에 실패했습니다.";
	String url = "login.jsp";
	
	boolean result = mMgr.loginMember(id, pwd);
	if(result) {
		session.setAttribute("idKey", id);
		msg = "로그인에 성공했습니다.";
		url = "index.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url%>";
</script>











