<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="fBean" class="fifle.FishingholeBean" />
<% String code = request.getParameter("code");%>

	<div class="title-info1"><h3>사진 변경 </h3></div>
	<div class="pic-wrap">
		<form id="upForm" method="post" enctype="multipart/form-data" action="fhole-picmodPro.jsp">
			<div id="form">
				<ul>
					<li><input type="text" name="code" class="frm-hidden" value="<%= code%>" readonly></li>
					<li><input type="file" name="file"></li>
					<li><input type='submit' id="upPro" value="UPLOAD"></li>
				</ul>
			</div>	
		</form>
	</div>
</body>
</html>















