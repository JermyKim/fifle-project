<%@page import="fifle.FishingholeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% request.setCharacterEncoding("UTF-8"); %>  
    
<jsp:useBean id="fBean" class="fifle.FishingholeBean" />
<jsp:useBean id="fMgr" class="fifle.FipleMgr" />

<%
	FishingholeBean bean = new FishingholeBean();
	bean.setCode(request.getParameter("code"));
	bean.setName(request.getParameter("name"));
	bean.setEvm(request.getParameter("evm"));
	bean.setAddr1(request.getParameter("addr1"));
	bean.setAddr2(request.getParameter("addr2"));
	bean.setTel(request.getParameter("tel"));
	bean.setHours(request.getParameter("hours"));
	if(Integer.parseInt(request.getParameter("charge"))  == 1){
		bean.setCharge("유료");
	} else {
		bean.setCharge("무료");
	}
	
	String[] val = request.getParameterValues("species");
	boolean result = fMgr.FishingHoleModify(bean,val);
	if(result) {
		%>
			<script>
				alert("수정되었습니다."); 
				location.href=  "fhole-details.jsp?code=<%=bean.getCode() %>";
			</script>
		<% 
		}else{
		%>
			<script>
				alert("실패했습니다."); 
				history.back( );
			</script>
		<%
		}
		%>