function inputCheck( ) {
	if(document.regFrm.code.value=="") { 
		alert("아이디를 입력하세요."); 
		document.regFrm.code.focus( );
		return; //제어문을 종료한다.
	}
	if(document.regFrm.name.value=="") {
		alert("낚시터 상호명을 입력해 주세요.");
		document.regFrm.name.focus( );
		return;
	}

	if(document.regFrm.tel.value=="") {
		alert("전화번호를 입력해주세요.");
		document.regFrm.tel.focus( );
		return;
	}
	
	if(document.regFrm.addr1.value=="") {
		alert("도/시를 입력해주세요.");
		document.regFrm.addr1.focus( );
		return;
	}
	
    if(document.regFrm.addr2.value=="") {
		alert("나머지 주소를 입력해 주세요.");
		document.regFrm.addr2.focus( );
		return;
	}
	
	if(document.regFrm.hours.value=="") {
		alert("운영시간을 입력해 주세요.");
		document.regFrm.hours.focus( );
		return;
	}
	if(document.regFrm.evm.value=="0") {
		alert("낚시터 환경을 선택해 주세요.");
		return;
	}
	if(document.regFrm.fileName.value=="0") {
		document.regFrm.fileName.value = "deimg.jpg"
		return;
	}
	
	document.regFrm.submit( ); //문서의 서브밋을 실행
}

function win_close( ) {
	self.close( );
}
