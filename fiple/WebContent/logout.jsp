<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate( ); // 세션에 저장된 모든 정보를 제거
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="index.jsp";
</script>