<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>

<jsp:useBean id="mMgr" class="fifle.FipleMgr"/>
<jsp:useBean id="bean" class="fifle.FipleBean"/>


<%

	String saveFolder ="D:/workspace/FipleProject/WebContent/imgupload"; 
	String encType = "utf-8";
	int maxSize = 10 * 1024 * 1024; // 10mb
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType);
	
	bean.setCode(multi.getParameter("code")) ; 
	bean.setName(multi.getParameter("name")) ; 
	bean.setTel(multi.getParameter("tel")) ; 
	bean.setAddr1(multi.getParameter("addr1")) ; 
	bean.setAddr2(multi.getParameter("addr2")) ; 
	bean.setHours(multi.getParameter("hours")) ; 
	bean.setCharge(multi.getParameter("charge")) ; 
	bean.setEvm(multi.getParameter("evm")) ;
	bean.setFileName(multi.getOriginalFileName("fileName"));
	
	 
	boolean result = mMgr.insertMember(bean);
	if(result) { // insert문의 성공적으로 실행되었으면
%>
	<script>alert("낚시터 등록에 성공했습니다."); location.href="adminAddPlace.jsp";</script>
<%
	}else { // insert문이 실행이 실패했으면
%>
	<script>alert("낚시터 등록에 실패했습니다."); history.back( );</script>
<%
	}
%>
