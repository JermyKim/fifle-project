<%@page import="java.util.Vector"%>
<%@page import="fifle.FishingholeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
   
<jsp:useBean id="fBean" class="fifle.FishingholeBean" />
<jsp:useBean id="fMgr" class="fifle.FipleMgr" />

<% 
	String code = request.getParameter("code");
	FishingholeBean fb = fMgr.FishingHoleBrowse(code); 
%>


<div class="mod-wrap">
	<section> 
    	<h2>낚시터 수정</h2>
        <form name="modFrm" method="post" action="fhole-modPro.jsp">
            <ul>
            	<li><input type="text" class="code" name="code" value="<%=code %>" readonly></li>
                <li>
                	<p>낚시터 명</p>
                	<input type="text" class="mod-text mod-name" name="name" value="<%=fb.getName()%>">
                </li>
                <li>
                	<p>주소</p>
                	<select name="addr1" class="mod-evm">
                        <option value="0" disabled>지역 선택</option>
                        <% 
                        String[] region = 
                    		{"서울특별시", "부산광역시", "대구광역시", 
                    		"인천광역시", "광주광역시","대전광역시", 
                    		"울산광역시","세종시","경기도",
                    		"강원도","충청북도","충청남도",
                    		"전라북도","전라남도","경상북도",
                    		"경상남도","제주도"};
                        
                        for(int i = 0; i < region.length; i++){
                        %>
                        <option value= <% out.print("\""+region[i]+"\" ");
                        if(fb.getAddr1().equals(region[i])){ out.print("selected");} %>><%=region[i] %></option>
                        <%} %>
                    </select>
                	<input type="text" class="mod-text mod-addr" name="addr2" value="<%=fb.getAddr2()%>">
                </li>
                <li><p>낚시 환경</p>
                	<input type="text" class="mod-evm" name="evm" value="<%=fb.getEvm()%>">
                </li>
                <li><p>전화번호</p><input type="text" class="mod-text" name="tel" value="<%=fb.getTel() %>"></li>
                <li><p>유료/무료</p> 
                    유료<input type="radio" name="charge" value="1" <% if(fb.getCharge().equals("유료")){out.print("checked=\"checked\"");} %>>
                    무료<input type="radio" name="charge" value="2" <% if(fb.getCharge().equals("무료")){out.print("checked=\"checked\"");} %>>
                </li>
                <li><p>시간</p>
               		<input type="text" class="mod-evm" name="hours" value="<%=fb.getHours()%>">
                </li>  
                <li><p>어종</p><div class="fish-species">
                	<%
                	Vector<String> slist = fMgr.getFishSpecies();
                	Vector<String> fhole_slist = fb.getSpecies();
                	int j = 1;
                	boolean n = false;
                	String str = null;
                	
                	if(fhole_slist.size() > 0){
	                	n = true;
	                	str = fhole_slist.get(0);
                	}
                	
                	for(int i = 0; i < slist.size(); i++){
                	%>
                	<input type="checkbox" name="species" value="<%=slist.get(i)%>" 
                	<% 
                		if(n == true){
	                		if(slist.get(i).equals(str)){
	                			out.print("checked");
	                			if(j<fhole_slist.size()){str=fhole_slist.get(j++);}
	                		}
                		}
                	%>
                	><%=slist.get(i)%>
                	<%
                	}             	
                	%></div>
                </li>
                <li class="btn-group">
                	<button type="submit">수정하기</button>
                    <button class="btn-cancel" onClick="location.href('fhole-details.jsp?code=<%=code %>')">취소</button>
                </li>	
            </ul>
    	</form>
    </section>
</div>
</body>
</html>