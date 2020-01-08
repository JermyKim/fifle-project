<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<jsp:useBean id="fMgr" class="fifle.FishingholeMgr" />
<% 
	String code = request.getParameter("code");

    boolean result = fMgr.FishingholeDelete(code);
	if(result) {
		%>
			<script>
				alert("수정되었습니다."); 
				location.href="sub01.jsp";
			</script>
		<% 
		}else{
		%>
			<script>
				alert("실패했습니다."); 
				location.href="fhole-details.jsp?code=<%=code %>";
			</script>
		<%
		}
		%>