<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="fifle.FipleBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="fifle.FipleMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("idKey");
	Vector<FipleBean> vlist=null;
	vlist = mMgr.searchfish(request.getParameter("addr1"), request.getParameter("evm"), request.getParameter("charge"));
%>
	<div class="fp-search">	
        	<div class="fp-banner"><h4>낚시터 추천</h4></div>
            <div class="input-fp">        	 
            	<form name="seaFrm" method="post" action="sub01.jsp">
                	<ul class="input-search">
                		<li>지역 :  
                        	전체 <input type="radio" name="addr1" value="*" checked="checked">,
                        	전라남도 <input type="radio" name="addr1" value="전라남도">,
                        	<span>경상남도 <input type="radio" name="addr1" value="경상남도">,
                        	경기도 <input type="radio" name="addr1" value="경기도">,</span>
                        	<span>강원도 <input type="radio" name="addr1" value="강원도">,
                        	제주도 <input type="radio" name="addr1" value="제주특별자치도"></span>
                        </li>                    	
                        <li>낚시 환경 :  
                        	전체 <input type="radio" name="evm" value="*" checked="checked">,
                        	갯바위 <input type="radio" name="evm" value="갯바위">,
                        	<span>선상 <input type="radio" name="evm" value="선상">,
                        	가옥 <input type="radio" name="evm" value="가옥"></span>
                        </li>
                        <li>요금 : 
                        	전체 <input type="radio" name="charge" value="*" checked="checked">,
                        	무료 <input type="radio" name="charge" value="무료">,
                        	유료 <input type="radio" name="charge" value="유료">
                        </li>
                        <li>
                            <button type="submit" name="submit-btn" value="검색">검색</button>
<%
	if(id != null) { if (id.equals("admin")){
%>
                            <button class="create-btn"><a href="adminAddPlace.jsp">등록</a></button>
<%
	}}
%>
                        </li>
                    </ul>
                    <input type="hidden" name="check" value="n">
                </form>  
            </div>
            <table class="list-table">
                <tr>
                    <th>낚시터 이름</th>
                    <th>전화번호</th>
                    <th colspan=2 >주소</th>
                    <th>낚시환경</th>
                    <th>요금</th>
                </tr>
				 <% if(vlist.isEmpty()){ %>
				<tr>
					<td align="center" colspan=25 ><br>검색된 결과가 없습니다.</td>
				</tr>
				<%}
							for (int i = 0; i < vlist.size( ); i++) {
										FipleBean bean = vlist.get(i);
										String name = bean.getName();
										String evm = bean.getEvm();
										String addr1 = bean.getAddr1();
										String addr2 = bean.getAddr2();
										String hours = bean.getHours();
										String charge = bean.getCharge();
										String tel = bean.getTel();
										String code = bean.getCode();
										String fileName = bean.getFileName();
				%>
				<tr>
					<td><a href="fhole-details.jsp?code=<%=code %>" ><%=name %></a></td>
                    <td><%=tel %></td>
                    <td><%=addr1 %></td>
                    <td><%=addr2 %></td>
                    <td><%=evm %></td>
                    <td><%=charge %></td>
				</tr>
				<%
					}//for
				%>
				<!-- 검색결과 끝 -->
            	
            </table>           
        </div>

