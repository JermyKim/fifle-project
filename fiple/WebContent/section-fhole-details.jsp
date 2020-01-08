<%@page import="java.util.Vector"%>
<%@page import="fifle.FishingholeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%> 

   
<jsp:useBean id="fBean" class="fifle.FishingholeBean" />
<jsp:useBean id="fMgr" class="fifle.FipleMgr" />

<% 
	String code=request.getParameter("code");
	FishingholeBean fb = fMgr.FishingHoleBrowse(code); 
%>
<div class="detail-wrap">
	<section>
    	<div class="title-info1">
        	<h2>상세정보</h2>
        </div>
        <article class="info-summary">
        	<div class="info-summary-pic">
            	<img src="imgupload/<%=fb.getFileName() %>" alt="<%=fb.getName()%>사진">
            </div>
            <div class="info-summary-text">
				<h3 class="name"><%=fb.getName() %></h3>
				<p class="addr"><%=fb.getAddr1() %>&nbsp;<%=fb.getAddr2() %></p>
                <p class="tel"><%=fb.getTel() %></p>
              <%   if(id != null) { if (id.equals("admin")){ %> 
                <div class="info-manage">
                    <button onClick="location.href='fhole-picmod.jsp?code=<%=code %>'">사진변경</button>
                    <button onClick="location.href='fhole-mod.jsp?code=<%=code %>'">수정</button>
                    <button onClick="location.href='fhole-del.jsp?code=<%=code %>'">삭제</button>
				</div>
				<% }} %>
            </div>
        </article>
        <div class="clear"></div>
        <article class="info-details">
            	<div class="evm">
                	<h3>낚시환경</h3>
                    <p><%=fb.getEvm() %></p>
                </div>
                <div class="hours">
                	<h3>운영시간</h3>
                	<p><%=fb.getHours() %></p>
                </div>
                <div class="charge">
                	<h3>요금</h3>
                	<p><%=fb.getCharge() %></p>
                </div>
                <div class="spicies">
                	<h3>주요어종</h3>
                	<%   
                	Vector<String> fhole_slist = fb.getSpecies();
                	
                	if(fhole_slist.size() > 0){
	                	for(int i = 0; i < fhole_slist.size(); i++){
                	%>
                	<ul>
                	<li><p><%=fhole_slist.get(i) %></p></li>
                    	<% } %>
                    </ul>
                    <% } %>
				</div>
        </article>
    </section>
    <div class="clear"></div>
</div>
</body>
</html>