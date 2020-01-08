<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
</script>
	<section>
        <div class="place">
            <div class="fp-banner"><h4>낚시터 등록</h4></div>
            <form name="regFrm" method="post" enctype="multipart/form-data" action="addPlacePro.jsp" >
                <ul>
                    <li><p>낚시터 코드 : </p><input type="text" name="code" placeholder="낚시터 코드" class="form-control input-id"></li>
                    <li><p>낚시터 상호명 : </p><input type="text" name="name" placeholder="낚시터 상호명" class="form-control"></li>
                   	<li><p>낚시터 전화번호 : </p><input type="tel" name="tel" placeholder="전화번호" class="form-control"></li>
                    <li><p>낚시터 주소명 : </p><input type="text" name="addr1" placeholder="(도/시) " class="form-control"></li>
                    <li><p>낚시터 주소명 : </p><input type="text" name="addr2" placeholder="(나머지 주소) " class="form-control"></li>
                    <li><p>낚시터 운영시간 : </p><input type="text" name="hours" placeholder="운영시간" class="form-control"></li>
                    <li>요금: 무료 <input type="radio" name="charge" value="무료" checked="checked">, 유료 <input type="radio" name="charge" value="유료"></li>
                    <li>
                        <select name="evm" class="fishcon">
                            <option value="0" selected>낚시환경</option>
                            <option value="갯바위">갯바위 낚시</option>
                            <option value="선상">선상 낚시</option>
                            <option value="가옥">가옥 낚시터</option>
                        </select>
                    </li>
                    <li><input type="file" name="fileName" ></form></li>
                    <li class="btn-group">
                        <button onClick="inputCheck( )" class="btn-add">등록</button>
                        <button type="reset" class="btn-reset">다시쓰기</button>
                    </li>
                </ul>
            </form>	
        </div>
