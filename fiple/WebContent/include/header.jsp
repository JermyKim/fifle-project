<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 입력폼에 대한 인코딩 처리
	String id = (String)session.getAttribute("idKey");
%>

	<header>
    	<div class="hd-wrap hd-desktop">
            <div class="logo"><a href="index.jsp"><img src="imgs/logo.png" alt="피플 로고"></a></div>
            <nav>
            	<a href="#" id="trigger" class="trigger"></a> <!--모바일버전 트리거 버튼-->
                <ul id="main-menu">
                    <li><a href="#">낚시 가이드</a>	
                        <ul class="sub-menu">
                            <li><a href="#">낚시 기본 상식</a></li>
                            <li><a href="#">캐스팅 & 챔질</a></li>
                            <li><a href="#">낚시 용품</a></li>
                        </ul>
                    </li>
                    <li><a href="#">맞춤 서비스</a>
                        <ul class="sub-menu">
                            <li><a href="#">낚시 용품 추천 및 견적</a></li>
                            <li><a href="sub01.jsp">낚시터 추천</a></li>
                        </ul>
                    </li>
                    <li><a href="#">커뮤니티</a>
                       	<ul class="sub-menu">
                            <li><a href="#">낚시 소식</a></li>
                            <li><a href="#">체험 후기</a></li>
                            <li><a href="#">자주 묻는 질문</a></li>
                            <li><% if(id != null) { if (id.equals("admin")){ %><a href="logout.jsp"  >관리자로그아웃</a><%}}else { %><a href="login.jsp" >관리자 로그인</a><% } %></li>
                        </ul>
                    </li>
                </ul>
            </nav>
       	</div><!-- desktop:end -->
   	</header>
