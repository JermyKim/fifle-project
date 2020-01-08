<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<jsp:useBean id="fMgr" class="fifle.FishingholeMgr" />
<% 
String code = request.getParameter("code");
%>

<script>
	var conf = confirm("페이지를 삭제하시겠습니까?");
	if(conf == true){
		location.href='fhole-delPro.jsp?code=<%=code %>';
	}else{
		history.back();
	}
</script>
