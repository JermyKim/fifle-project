<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>

<jsp:useBean id="mMgr" class="fifle.FipleMgr"/>
<jsp:useBean id="bean" class="fifle.FipleBean"/>
<jsp:setProperty property="*" name="bean"/>


<%

	String saveFolder = "D:/workspace/FipleProject/WebContent/imgupload";
	String encType = "utf-8";
	int maxSize = 10 * 1024 * 1024; // 10mb
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType);
	
	
	String code = multi.getParameter("code");
	String imgsrc = multi.getFilesystemName("file");
	
	boolean result = mMgr.changeImage(code,imgsrc);

 
	if (result == true){
%>
		<script> 
			alert("변경 성공");
			location.href=  "fhole-details.jsp?code=<%=code %>";
		</script>
	<%
	}
	else{
	%>
		<script>
			alert("변경 실패");
			location.href=  "fhole-details.jsp?code=<%=code %>";
		</script>
	<%
	}
	%>
