<%@page import="kr.ac.lms.vo.MemberVO"%>
<%@page import="kr.ac.lms.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="/resources/css/demo.css"/>
  <link rel="stylesheet" href="/resources/css/gridstack.min.css">
  <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
  <script src="https://gridstackjs.com/node_modules/gridstack/dist/gridstack-all.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인페이지</title>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">
	.mainTotalWrapper {
		width: 100%;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		
		position: relative;
	}
	
	#topMain {
		width: 100%;
		margin: 0 auto;
		min-width: 1090px;
		padding: 0 2%;
	}
	
	div#gridCont>div {
		width: 100%;
	}
	
	#gridCont {
		padding: 0 1%;
	}
	
	.lock {
		width: 31%;
		height: 460px;
		display: inline-block;
		float: left;
		margin-left: 22px;
	}
	
	.cLock{
		height: 230px;
	    border: #b7cae1 solid 1px;
	    border-radius: 0.1rem;
	    background: #fff;
	    border-top: 1px solid #fff;
	}
	
	.nameArea {
		color: #0f3970;
	    font-size: 19px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	
	.calLock{
		height: 460px;
 		border: 1px solid #999;
 		border-radius: 0.1rem;
 		background: white;
 		border: #b7cae1 solid 1px;
	}
	
	br {
		clear: both;
	}
	
	.main {
		margin: 0px, auto;
	}
	
	.memInfo {
		height: 28%;
		padding: 2%;
	}
	
	.stuCredit {
		height: 57%;
		border-top: #b7cae1 solid 1px;
		border-bottom: #b7cae1 solid 1px;
	}
	
	.memSer {
 		height: 100%;
		float: left;
		width: 40%;
	}
	
	.dougnut{
		width: 60%;
		float: left;
		height: 100%;
		padding: 3px;
	}
	
	.chat, .mail {
		height: 50%;
		background: #f5faff;
		border: #a4bcd7 solid 1px;
		padding: 5px;
	    height: 53px;
	    border-radius: 5px;
		margin-top: 7px;
		margin-right: 7px;
	}
	
	.ttl, .con{
		display: block;
	}
	
	.con{
		text-align: right;
	}

	.score{
		height: 15%;
	}	
	.score_info{
		float: left;
		width: 50%;
		height: 100%;
		text-align: center;
		padding-top: 2%;
	}
	
	.score_info:nth-child(1){
		border-right: #b7cae1 solid 1px;
	}
	
	.ntcTtl{
		font-size: 1.2em;
		margin-top: 10px;
		margin-bottom: 10px;
		color: #246ac5;
		font-weight: 700;
		font-size: 18px;
	}
	
	.ntc{
		width: 95%;
    	margin: 0px auto;
    	height: 75%;
	}
	
	.ntcCate{
		padding: 0px;
		height: 4%;
	}
	
	.ntcCate li{
		list-style: none;
		float: left;
		width: 25%;
		text-align: center;
		border-bottom: 1px solid #bbcee2;
		color: #163c6d;
	}
	
	.ntcCate li.on{
		border: 1px solid #bbcee2;
		border-radius: 6px 6px 0 0;
		border-bottom: none;
		background: #fff;
	}
	
	.ntcList{
		border: 1px solid #bbcee2;
		border-top: none;
		height: 85%;
		background: #fff;
	}
	
	.ntcList a {
		color: #6c757d;
	}
	
	.ntcCon{
		height: 23px;
	    padding: 15px 7px;
	}
	
	.ntc_ttl, .ntc_dt{
		margin-bottom: 0px;
	}
	
	.ntc_ttl{
		width: 75%;
		float: left;
		display: block;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.ntc_dt{
		width: 25%;
		float: left;
	}
	
	.total{
		text-align: right;
		font-size: 14px;
	    color: #7796b8;
	    color: #2e66a1;
	    width: 95%;
    	margin: 0px auto 5px;
	}
	
	.total > span{
	    font-weight: bold;
	    font-size: 14px;
	}
	
	.career{
		width: 95%;
		margin: 0px auto;
		color: #7796b8;
		border: 1px solid #b7cae1;
	}
	
	.career th, .career td{
		height: 28px;
		padding: 3px;
	}
	
	.career th{
		background: #f5faff;
		text-align: center;
	}
	
	.career th:nth-child(1){
		width: 60%;
	}
	
	.career th:not(:first-of-type){
		width: 20%;
	}
	
	.goalDivDiv{
		background: #edf5fe;
	}
	
	.goalDiv{
		padding : 0 2%;
		height: 62%;
	}
	
	.goalDiv2{
		height: 17%;
		background: white;
		border-top: 1px solid #b9cde4;
	}
	
	.goalDiv2 > div{
		float: left;
		width: 31%;
		text-align: center;
	}
	
	.goalDiv2 > div:not(:last-of-type){
		border-right: 1px solid #b9cde4;
	}
	
	.goalDiv2 > div:nth-child(2){
		float: left;
		width: 38%;
	}
	
	.goals{
		width: 95%;
		margin: 0px auto;
		height: 18%;
	}
	
	.goals:nth-child(1){
		border-bottom: 1px solid #bdd1e7;
	}
	
	.goal{
		float: left;
		width: 45%;
		color: #7796b8;
	}
	
	.goal > span{
		float: right;
		color: #2e66a1;
	}
	
	.gubun{
		color: #bdd1e7;
		float: left;
		width: 10%;
		text-align: center;
	}
	
	.toDo{
		border: #a4bcd7 solid 1px;
	    border-radius: 5px;
	    margin: 3px auto;
	    width: 90%;
        padding-left: 5px;
	}
	
	.ptitle {
		font-size: 1.3em;
		float: left;
		font-weight: bold;
	    color: #2c3e50;
	    margin-left: 20px;
    	margin-top: 10px;
	}
	
	.removeBut {
		float: right;
	}
	
	.ptable {
		float: left;
		border-collapse: collapse;
		border-top: 1px solid lightgray;
    	border-bottom: 1px solid lightgray;
    	border-right: hidden;
	}
	
	.ptable td{
		text-overflow: ellipsis;
	    white-space: nowrap;
	    max-width: 130px;
	    overflow: hidden;
	}
	
	.ptable th, .ptable td{
		border-bottom : 1px solid lightgray;
  		border-right: 1px solid lightgray; 
  		height: 28px;
	}
	
	.ptable th{
		background: #f5faff;
	}
	
	#saveBtn {
		background: #2a5388;
		box-shadow: #2a5388;
		border: #2a5388;
	}
	
	#saveBtn:hover {
		background: #4671af;
		box-shadow: #4671af;
		border: #4671af;
	}
	
	.mdi-leaf, .mdi-transition-masked, .mdi-bullseye-arrow, .mdi-alpha-m-circle-outline {
		margin-left: 10px;
		margin-right: 10px;
		color: #2a5388;
	}
	
	#weatherTable {
		text-align: center;
	}
	
	#weatherTable th{
		background: #f5faff;
		width : 30%;
	}
	
	#weatherTable td {
		width: 100px;
		height: 50px;
	}
	
	#weatherImg {
		width: 100px;
		padding: 5px;
	}
	
/* 	#weatherTable tr td:nth-child(2) { */
/* 		text-align: right; */
/* 	} */
	
	#portletTgradeTable, #portletRegHistoryTable {
		text-align: center;
	}
	
	.detail {
		display: inline-block;
		width: 82%;
		height: 95%;
		line-height: 25px;
	}
	
	.mainTop {
		float: left;
	}
	
	.svgWrapper {
		margin-right: 10px;
	    margin-top: 4px;
	}
	
	.editWrap {
		height: 100%;
		line-height: 30px;
	}
	
	.editWrap>a {
		color: #333;
	}
	
	#mainLock {
		min-height: 500px;
		margin-bottom: 1%;
	}
	
	.grid-stack-item-content {
/* 		border-top: 5px solid #112a63; */
		border-radius: 10px;
	}
	
	.deleteP{
		border-left: 1px solid lightgray;
	    border-bottom: 1px solid lightgray;
	    width: 80px;
	    height: 40px;
	    float: right;
	    display: inline-block;
	}
	
	.plusP{
	    width: 50%;
	    border-right: 1px solid lightgray;
	    height: 100%;
	    float : left;
	}
	
	.thColor{
		background: #f5faff;
	}
	
	.noticeDiv{
		margin-top: 8px;
    	height: 29px;
		
	}
	
	.noticeP{
		text-align:left; 
		min-width:80%; 
		text-overflow: ellipsis; 
		overflow: hidden; 
		white-space : nowrap; 
		width:100px;
		display: inline-block;
		cursor: pointer;
		
	}
	
	.noticeA:link, .noticeA:visited{
		color: #2c3e50;;
	}
	
	.noticeA:hover{
		color : black;
	}
	
	.mdi-plus, .deleteIcon{
		font-size: 15px;
	    display: inline-block;
	    margin-top: 8px;
	    color: #2b85e2;
	}
	
	.scrollDiv{
		width: 100%;
	    height: 310px;
	    overflow: auto;
	}
	
	.portleContent{
		padding : 20px;
		margin-top: 36px;
	}
	
	.cter {
		text-align: center;
	}
	
	.curpoint {
		cursor: pointer;
	}
	
	/* quick menu css */
	.menu {
		width : 100%;
		height: 95px;
		padding: 4%;
		border-bottom: 1px solid #e0e0e0;
		cursor: pointer;
	}
	
	.menu:hover {
		background: #eee;
		color: #fff;
	}
	
	
	.quickMenu {
		width: 90px;
		position: absolute;
 		top: 0;
		right: -57px;
/* 		z-index: 9999; */
		box-shadow: 0px 4px 5px rgb(0 0 0 / 20%);
/* 		border: #0f3970 solid 1px; */
		
		border-radius: 5px;
		background: #fff;
	}
	
	
	.quickAllShow {
 		border: #0f3970 solid 1px;
		height: 80px;
		background: #0f3970;
		border-radius: 5px 5px 0 0;
	}
	
	.allShow {
		font-size: 1.2em;
		font-weight: 600;
		color: #fff;
		text-align: center;
	}
	
	.quickIcon {
		font-size: 2em;
		display: block;
		text-align: center;
		color: #fff;
		line-height: 50px;
	}
	
	.quiIconCommon {
		display: block;
		text-align: center;
		color: #1dbdd5;
		font-size: 1.8em;
		line-height: 41px;
	}
	
	.quickMenuName {
		color: #333 !important;
		font-weight: 600;
		text-align: center;
	}
	
	.calendar-widget {
		padding: 1px;
	}
	
	.table-condensed {
		height: 40vh;
	}
	
	.quicksubmenu {
		border: #bdd1e7 solid 1px;
		border-top: none;
		border-radius: 0 0 5px 5px;
	}
	#portletTimeTable {
		text-align : center;
		border-top: 1px solid lightgray;
	    border-bottom: 1px solid lightgray;
	    border-left: hidden;
	    border-right: hidden;
	}
/* 	#portletTimeTable td{ */
/* 		height : 15px; */
/* 		width : 30px; */
/* 	} */
	#timeTableSub {
		text-align : left;
		float : left;
		width: 95%;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
	/* quick menu css */
	
	/* 당학기 css */
	.curLecWrap {
		background: #f9f9f9;
		border: 1px solid #eee;
		box-shadow: 0px 4px 5px rgb(0 0 0 / 10%);
		margin: 15px;
		cursor: pointer;
	}
	
	.curLecWrapper {
		height: 300px;
		overflow: auto;
	}
	/* 당학기 css 끝 */
	
	.todoTtl{
	    font-weight: bold;
    	margin: 0;
	}
	
	.todoTtl > i{
	    color: #246ac5;
    	font-size: 1.3em;
	}
</style>
<script type="text/javascript" defer="defer">
	var totalDiv;
	var colorArr = [
		"#fbf8cc", "#fde4cf", "#ffcfd2", "#f1c0e8", "#cfbaf0",
		"#a3c4f3", "#90dbf4", "#8eecf5", "#98f5e1", "#b9fbc0"
	];
	var colorNum = 0;
	
	//팝업 쿠키
	function getCookie(cName) {
		var x, y;
		var val = document.cookie.split(';');
		for(var i = 0; i < val.length; i++) {
			x = val[i].substr(0, val[i].indexOf('='));
			y = val[i].substr(val[i].indexOf('=') + 1);
			x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
			if (x == cName) {
				return unescape(y); // unescape로 디코딩 후 값 리턴
			}
		}
	}
	
	<%
		MemberVO memberVO2 = (MemberVO)session.getAttribute("memSession");
		if(memberVO2.getStudentVO() != null){
	%>
	
	//시간표 출력하기 - 학생
	function getTimeTable(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/tgrade/getTimeTable",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletTimeTable td').text('');
				$('#portletTimeTable td').css('background-color', '');
				$('#timeTableSub').empty();
				
				subject = '';
				str = '';
				
				$.each(res, function(i, v) {
					if(subject != v.subCd) {
						subject = v.subCd;
						colorNum ++;
						
						str += '<span style="color:'+ colorArr[colorNum - 1] + '">●</span>&nbsp;';
						str += v.lecaNm + "<br>";
						
						if(colorNum >= 10) {
							colorNum = 1;
						}
					}
					$('#portletTimeTable').find("tr").eq(v.lecCd).find("td").eq(v.lecaCd - 1)
					.css("background-color", colorArr[colorNum - 1]);
				});
				
				$('#timeTableSub').append(str);
			}
		});
	}
	
	<%
		}
    %>
    
	<%
		MemberVO memberVO5 = (MemberVO)session.getAttribute("memSession");
		if(memberVO5.getProfessorVO() != null){
	%>
	
	//시간표 출력하기 - 교수
	function getTimeTable(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/lecApply/getTimeTable",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletTimeTable td').text('');
				$('#portletTimeTable td').css('background-color', '');
				$('#timeTableSub').empty();
				
				subject = '';
				str = '';
				
				$.each(res, function(i, v) {
					if(subject != v.subCd) {
						subject = v.subCd;
						colorNum ++;
						
						str += '<span style="color:'+ colorArr[colorNum - 1] + '">●</span>&nbsp;';
						str += v.lecaNm + "<br>";
						
						if(colorNum >= 10) {
							colorNum = 1;
						}
					}
					$('#portletTimeTable').find("tr").eq(v.lecCd).find("td").eq(v.lecaCd - 1)
					.css("background-color", colorArr[colorNum - 1]);
				});
				
				$('#timeTableSub').append(str);
			}
		});
	}
	
	<%
		}
    %>
    
    function fn_counsel(){
    	window.open("/counsel/stuCounsel");
    }
	
	function fn_mail(){
		window.open("/mail/mailAll");
	}
	
	function fn_approvalPro(){
		window.open("/approval/list");
	}
	
	function fn_approvalMgr(){
		window.open("/approval/managerApprovalListGet");
	}
	
	function showPopup() { 
		window.open("/main/popupPortlet", "a", "width=1200, height=850, left=100, top=50"); 
	}
	//성적 조회 - 년도 및 학기별 수강 리스트
	function getTgradeList(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/tgrade/getTgradeList",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletTgradeTable').empty();
				
				str = '';
				str += '<tr><th>교과목명</th><th>이수구분</th><th>학점</th><th>평가</th></tr>';
				
				$.each(res, function(i, v) {
					str += '<tr><td style="text-align:left;">'+ v.lecaNm +'</td>';
					str += '<td>'+ v.lecaCon + '</td>';
					str += '<td>'+ v.lecaCrd + '</td>';
					str += '<td>'+ v.lecaBook + '</td></tr>';
				});
				
				$('#portletTgradeTable').append(str);
			}
		});
	}
	//성적 조회 - 취득학점, 이수학점
	function getTgradeCnt(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/tgrade/getTgradeCnt",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$("#tgradeCnt").text(res.total);
				$("#tgradeGetCnt").text(res.totalNotF);
				$("#regHistoryCnt").text(res.total);
			}
		});
	}
	//수강신청 내역 조회
	function getRegHistoryList(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/register/getRegHistoryList",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletRegHistoryTable').empty();
				
				str = '';
				str += '<tr><th>교과목명</th><th>학점/시수</th><th>이수구분</th><th>담당교수</th></tr>';
				
				$.each(res, function(i, v) {
					str += '<tr><td style="text-align:left;">'+ v.lecaNm +'</td>';
					str += '<td>'+ v.lecaCrd + '</td>';
					str += '<td>'+ v.lecaCon + '</td>';
					str += '<td>'+ v.lecaBook + '</td></tr>';
				});
				
				$('#portletRegHistoryTable').append(str);
			}
		});
	}
	
	//오늘의 대기/날씨
	//지금 시간 불러오기
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = today.getHours();
	var minutes = today.getMinutes();
	
	//날씨 정보에 들어갈 값 가공하기
	if(30 <= minutes && minutes <= 59) {
		hours += 1;
	}
	
	var wtDt = year + '' + month + '' + day;
	var wtTm = ('00' + hours).slice(-2);
	var weatherInfoStr = year + '.' + month + '.' + day + ' ' + wtTm + ":00 발표";
	
	wtTm += "00";

	
	function weatherInfo(res, num) {
		
		var weatherImgName = '';

		if(num == 1) {
			//weatherVO가 도착한 경우
			$('#weatherInfo').text(weatherInfoStr);
			$('#weatherTemp').text(res.wtTmp + "°C"); //1시간 기온
			//현재 날씨
			if(res.wtSky == 1) {
				$('#currentWeather').text("맑음");
				if(6 <= hours && hours < 18) {
					weatherImgName = 'sunny_day.png';
				}else {
					weatherImgName = 'sunny_night.png';
				}
			}else if(res.wtSky == 3) {
				$('#currentWeather').text("구름많음");
				if(6 <= hours && hours < 18) {
					weatherImgName = 'littleCloudy_day.png';
				}else {
					weatherImgName = 'littleCloudy_night.png';
				}
			}else if(res.wtSky == 4) {
				$('#currentWeather').text("흐림");
				//weatherImgName = 'cloudy.png';
				if(6 <= hours && hours < 18) {
					weatherImgName = 'cloudy_day.png';
				}else {
					weatherImgName = 'cloudy_night.png';
				}
			}
			if(res.wtPty == 1 || res.wtPty == 4) {
				weatherImgName = 'cloudyRainy.png';
			}else if(res.wtPty == 2) {
				weatherImgName = 'rainySnowy.png';
			}else if(res.wtPty == 3) {
				weatherImgName = 'cloudySnowy.png';
			}
			$('#weatherImg').attr("src", "/resources/weatherImg/" + weatherImgName); //날씨 이미지
			$('#precipitation').text(res.wtPop + "%"); //강수확률
			$('#windSpeed').text(res.wtWsd + "m/s"); //풍속
			$('#humidity').text(res.wtReh + "%"); //습도
			
			var windDirection = Math.floor((res.wtVec + 22.5 * 0.5) / 22.5);
			if(windDirection == 0) {
				$('#windDirection').text("북향");
			}else if(windDirection == 1) {
				$('#windDirection').text("북북동향");
			}else if(windDirection == 2) {
				$('#windDirection').text("북동향");
			}else if(windDirection == 3) {
				$('#windDirection').text("동북동향");
			}else if(windDirection == 4) {
				$('#windDirection').text("동향");
			}else if(windDirection == 5) {
				$('#windDirection').text("동남동향");
			}else if(windDirection == 6) {
				$('#windDirection').text("남동향");
			}else if(windDirection == 7) {
				$('#windDirection').text("남남동향");
			}else if(windDirection == 8) {
				$('#windDirection').text("남향");
			}else if(windDirection == 9) {
				$('#windDirection').text("남남서향");
			}else if(windDirection == 10) {
				$('#windDirection').text("남서향");
			}else if(windDirection == 11) {
				$('#windDirection').text("서남서향");
			}else if(windDirection == 12) {
				$('#windDirection').text("서향");
			}else if(windDirection == 13) {
				$('#windDirection').text("서남서향");
			}else if(windDirection == 14) {
				$('#windDirection').text("북서향");
			}else if(windDirection == 15) {
				$('#windDirection').text("북북서향");
			}else {
				$('#windDirection').text("북향");
			}
			
		}else if(num == 2) {
			//기상청 오류
			$('#weatherInfo').text("※ 기상청 서비스 일시 중단");
			$('#weatherImg').attr("src", "/resources/weatherImg/weatherError.png");
		}
	}

	// 중요 공지사항 출력
	ntcCateClick('hot');
	
	window.onload = function() {
		
		//팝업 띄우기
		$.ajax({
			url : "/popup/popupList",
			type : "GET",
			dataType : "JSON",
			success : function(res) {
				if(res != null) {
					var widthval = 500;
					var heightval = 510;
					
					var leftval = (screen.availWidth - widthval) / 2;
					if(window.screenLeft < 0){
						leftval += window.screen.width * -1;
					}else if(window.screenLeft > window.screen.width){
						leftval += window.screen.width;
					}
					
					var topval = (screen.availHeight - heightval) / 2 - 10;
					
					$.each(res, function(i, v) {
						if(getCookie('popCookie_' + v.popCd) == 'done') {
						}else {
							window.open(
									"/popup/popUpFrame?title=" + v.popTtl + "&name=" + v.popFnm + "&code=" + v.popCd,
									"pop" + v.popCd,
									"width = 500, height = 510, left = " + leftval + " top = " + topval + " history = no, resizable = no, status = no, scrollbars = yes, menubar = no"
							);
						}
					});
				}
			}
		});
		
		<%
			MemberVO memberVO3 = (MemberVO)session.getAttribute("memSession");
			if(memberVO3.getStudentVO() != null){
		%>
		
		//시간표 출력하기 - 학생
		let dataObject = {
			yrNsem : $('#portletTimeTableSelect option:selected').val()
		};
		
		$.ajax({
			url : "/tgrade/getTimeTable",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				subject = '';
				str = '';
				
				$.each(res, function(i, v) {
					if(subject != v.subCd) {
						subject = v.subCd;
						colorNum ++;
						
						str += '<span style="color:'+ colorArr[colorNum - 1] + '">●</span>&nbsp;';
						str += v.lecaNm + "<br>";
						
						if(colorNum >= 10) {
							colorNum = 1;
						}
					}
					$('#portletTimeTable').find("tr").eq(v.lecCd).find("td").eq(v.lecaCd - 1)
					.css("background-color", colorArr[colorNum - 1]);
				});
				
				$('#timeTableSub').append(str);
			}
		});
		
		<%
			}
	    %>
	    
		<%
			MemberVO memberVO4 = (MemberVO)session.getAttribute("memSession");
			if(memberVO4.getProfessorVO() != null){
		%>
		
		//시간표 출력하기 - 교수
		let dataObject = {
			yrNsem : $('#portletTimeTableSelect option:selected').val()
		};
		
		$.ajax({
			url : "/lecApply/getTimeTable",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				subject = '';
				str = '';
				
				$.each(res, function(i, v) {
					if(subject != v.subCd) {
						subject = v.subCd;
						colorNum ++;
						
						str += '<span style="color:'+ colorArr[colorNum - 1] + '">●</span>&nbsp;';
						str += v.lecaNm + "<br>";
						
						if(colorNum >= 10) {
							colorNum = 1;
						}
					}
					$('#portletTimeTable').find("tr").eq(v.lecCd).find("td").eq(v.lecaCd - 1)
					.css("background-color", colorArr[colorNum - 1]);
				});
				
				$('#timeTableSub').append(str);
			}
		});
		
		<%
			}
	    %>
		
		//평균평점 확인하기 클릭 이벤트
		$('#showDivInfoEvent').on('click', function() {
			if($('#showDivInfoEvent').hasClass('showCnt')) { //평점을 보여주고 있었던 상태
				$('#showDivInfoEvent').removeClass('showCnt');
				$('#showFirstDivInfo').show();
				$('#showWhenClickedDivInfo').hide();
			}else { //평점이 보이지 않았던 상태
				$('#showDivInfoEvent').addClass('showCnt'); //class 부여
				$('#showFirstDivInfo').hide();
				$('#showWhenClickedDivInfo').show();
			}
		});
		
		//오늘의 대기/날씨
		let wtData = {
				"wtDt" : wtDt,
				"wtTm" : wtTm
		};
		
		$.ajax({
			url : "/weather/getWeather",
			type : "POST",
			data : JSON.stringify(wtData),
			dataType : "JSON",
			contentType : "application/json;charset=utf-8",
			success : function(res) {
				
				if(res.wtCd == 1 && res.wtDt == 99999999) {
					//날씨 정보가 없는 경우
					//오늘 날씨 정보를 DB에 저장
					$.ajax({
						url : "/weather/updateWeather",
						type : "GET",
						dataType : "JSON",
						contentType : "application/json;charset=utf-8",
						success : function(res) {
							if(res.wtCd == 1 && res.wtDt == 99999999) {
								weatherInfo(res, 2);
							}else {
								weatherInfo(res, 1);
							}
						}
					});
				}else {
					//날씨 정보가 있는 경우
					weatherInfo(res, 1);
				}
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
			}     
		});
		
		
		//학사일정에 이번년도&달 띄우기
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var day2 = ('0' + (today.getDate() + 6)).slice(-2);
		var yearMonth = year + "." + month;
		var MonthDay = month + "." +day +"~" + month + "."+ day2;
		$('#aschDate').text(yearMonth);
		$('#weekDate').text(MonthDay);
		
		checkDay();
		 
	    $('#datepicker').datepicker({
	      }).on("changeMonth", function(e) {
	    	  checkDay();
	      });
	    $('#datepicker').datepicker({
	      }).on("changeDate", function(e) {
	    	  checkDay();
	      });
	    
	  //투두리스트 체크박스 선택 시 밑줄&밑으로 보내기
	  
	  $('.chkbox').each(function() {
 			if($(this).val()==1){
 			$(this).parent().css('text-decoration','line-through'); 
 			console.log($(this).val());
 			$(this).prop('checked',true);
		 	}
		 });
	  
		  
		$("input:checkbox").on('click', function() {
	      if($(this).prop('checked')){
	        $(this).parent().css('text-decoration','line-through');
	        $(this).val(1);
	      }else{
	        $(this).parent().css('text-decoration','none');
	        $(this).val(0);
	      }
	      
	  	var schYn = $(this).val();
	  	var schCd = $(this).attr('id');
		
		
		$.ajax({
			url:"/schedule/todoCheck",
			dataType:"json",
			data: JSON.stringify({
				"schYn" : schYn,
				"schCd" : schCd
			}),
			contentType : 'application/json;charset=utf-8',
			type:"POST",
			success:function(res){
				console.log(res);
			}
		})
		
	    });
		
		// 학생의 상담 건수 불러오기
		<%
			MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
			if(memberVO.getStudentVO() != null){
		%>
				$.ajax({
					url:"/counsel/getCnslCnt",
					dataType:"json",
					data: {"stuCd" : <%= memberVO.getMemCd() %>},
					type:"POST",
					success:function(result){
						console.log(result);
						
						$('.cnslCntn').text(result.cnslCntn);
						$('.cnslCnty').text(result.cnslCnty);
					}
				});
		<%
			}else if(memberVO.getProfessorVO() != null){
		%>
				$.ajax({
					url:"/approval/getProApprCnt",
					dataType:"json",
					data: {"proCd" : <%= memberVO.getMemCd() %>},
					type:"POST",
					success:function(result){
						console.log(result);
						
						$('.approvalCntn').text(result.apprCntn);
						$('.approvalCnty').text(result.apprCnty);
					}
				});
		<%
			}else{
		%>
				$.ajax({
					url:"/approval/getMgrApprCnt",
					dataType:"json",
					type:"POST",
					success:function(result){
						console.log(result);
						
						$('.approvalCntn').text(result.apprCntn);
						$('.approvalCnty').text(result.apprCnty);
					}
				});
		<%
			}
		%>
		
		// 안읽은 메일 건수 불러오기
		$.ajax({
			url:"/mail/getMlCnt",
			dataType:"json",
			data: {"memCd" : ${ sessionScope.memSession.memCd }},
			type:"POST",
			success:function(result){
				console.log(result);
				
				$('.mlCntN').text(result);
			}
		});
		
		
		// 스크롤바 이벤트
		var currentPostion = parseInt($('.quickMenu').css('top'));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$('.quickMenu').stop().animate({"top":position+currentPostion+"px"}, 1000);
		})
		
	};
	
	//개인캘린더에 일정 있는 날 표시하기
	function checkDay(){
		$.ajax({
			url:"/schedule/portCalendar",
			dataType:"json",
			type:"POST",
			success:function(res){
				$.each(res,function(i,v){
				    $('#datepicker td').each(function(){
				        if(moment($(this).data("date")).format('YYYY-MM-DD') == v.schSt){
				        	this.style = 'background-color : #2a5388 !important';
	 			        	$(this).css('color','white');
	 			        	$(this).css('border-radius', '0');
				     	    $(this).addClass('test');
				        }
				    })
				})
			}
		})
	}
	
	function ntcCateClick(cate){
		$(".on").css('background', '#fff7fa');
	    $(".on").attr('class', '');
	      
	    $('#' + cate).attr('class', 'on');
	      
	    $('#' + cate).css('background','#fff');
		console.log("cate : " + cate);
		
		$.ajax({
			url : "/notice/mainNtcList",
			dataType : "json",
			data : {"cate" : cate},
			type : "POST",
			success : function(result){
				console.log(result);
				var code = '';
				$.each(result, function(i, v){
					code += '<div class="ntcCon"><p class="ntc_ttl">';
					code += '<a href="/notice/ntcDetail?ntcCd=' + v.ntcCd + '"> [' + v.ntcCate + ']' + v.ntcTtl + '</a></p>';
					code += '<p class="ntc_dt">' + v.ntcDt + '</p></div>';
				});
				
				$('.ntcList').html(code);
			}
		});
	}
</script>
</head>
<body id="bgImg">
<!-- 학생페이지 -->
<!-- 
session.setAttribute("data", res);
session.setAttribute("mem", map);
 -->
<%-- ${sessionScope.mem.id} --%>
<div class="mainTotalWrapper">

	<!-- 퀵 메뉴 -->
		<div class="quickMenu">
			
			<div class="quickAllShow">
				<i class="uil uil-apps quickIcon"></i>
				<p class="allShow">퀵메뉴</p>
			</div>
			
			<div class="quicksubmenu">
				
				<!-- 메뉴 -->
				<div class="menu">
					<i class="mdi mdi-home-city-outline quiIconCommon"></i>
					<p class="quickMenuName" style="line-height: 38px;">대학소개</p>
				</div>
				<!-- 메뉴 -->
				<div class="menu">
					<i class="dripicons-graduation quiIconCommon"></i>
					<p class="quickMenuName"><a href="https://www.kosaf.go.kr/ko/main.do" style="color: #333;">한국<br>장학재단</a></p>
				</div>
				<!-- 메뉴 -->
				<div class="menu">
					<i class="mdi mdi-file-download-outline quiIconCommon"></i>
					<p class="quickMenuName"><a href="https://certpia.com/renewalType1/" style="color: #333;">증명서 발급<br>certpia</a></p>
				</div>
				<!-- 메뉴 -->
				<div class="menu">
					<i class="mdi mdi-book-open-variant quiIconCommon"></i>
					<p class="quickMenuName"><a href="https://www.dbpia.co.kr/" style="color: #333;">논문<br>dbpia</a></p>
				</div>
				<!-- 메뉴 -->
				<div class="menu">
					<i class="mdi mdi-book-outline quiIconCommon"></i>
					<p class="quickMenuName"><a href="https://plus.cnu.ac.kr/_prog/rule/?site_dvs_cd=kr&menu_dvs_cd=06050101&gubun=1" style="color: #333;line-height: 38px;">학칙규정</a></p>
				</div>
				<!-- 메뉴 -->
				<div class="menu">
					<i class="mdi mdi-map-outline quiIconCommon"></i>
					<p class="quickMenuName">캠퍼스<br>안내</p>
				</div>
				
			</div>
		</div>
	
	<!-- 퀵 메뉴 끝-->
	<div id="topMain">
	<div id="mainLock">
		<c:if test="${ not empty sessionScope.memSession.studentVO }">
			<div style="width: 100%;">
				<div class="lock">
					<div class="cLock">
						<div class="memInfo">
							<div class="svgWrapper mainTop">
								<svg width="40" height="40" xmlns="http://www.w3.org/2000/svg">
									<image width="40" height="40" href="/resources/images/logo.png" />
								</svg>
							</div>
							<div class="detail mainTop"><strong style="font-weight: 900;color: #0f3970;font-size: 19px;">${ sessionScope.memSession.memNm }</strong><br>${ sessionScope.memSession.studentVO.depNm }</div>
							<div class="editWrap mainTop">
								<a href="/myPage/stuMyPage"><i class="mdi mdi-cog" style="font-size: 1.1em; cursor: pointer; color: #888;"></i></a>
							</div>
						</div>
						<div class="stuCredit">
							<div class="dougnut">
								<canvas id="myChart" style="width:200px; height:120px;"></canvas>
							</div>
							<div class="memSer">
								<div class="chat curpoint" onclick="fn_counsel()">
									<span class="ttl">
										<i class="uil uil-chat-bubble-user"></i>
										상담신청/완료
									</span>
									<span class="con"><span class="cnslCntn"></span>&nbsp;/&nbsp;<span class="cnslCnty"></span>&nbsp;건</span>									
								</div>
								<div class="mail curpoint" onclick="fn_mail()">
									<span class="ttl">
										<i class="mdi mdi-email-variant"></i>
										안읽은 메일
									</span>
									<span class="con"><span class="mlCntN"></span>&nbsp;건</span>
								</div>
							</div>
						</div>
						<div class="score">
							<div class="score_info" id="scoreTotalCrdInfo">이수학점</div>
							<div class="score_info curpoint" id="showDivInfoEvent">
								<span id="showFirstDivInfo">평균평점 확인하기</span>
								<span id="showWhenClickedDivInfo" style="display:none;"></span>
							</div>
						</div>
					</div>
					<div class="cLock goalDivDiv">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i><span style="letter-spacing:2px;">IJU</span> With U</p>
						<div class="goalDiv">
							<p><i class='mdi mdi-bullseye-arrow'></i>나의 진로 목표</p>
							<div class="goals">
								<p class="goal">진로<span>-</span></p>
								<p class="gubun">|</p>
								<p class="goal">직무<span>-</span></p>
							</div>
							<p><i class='mdi mdi-alpha-m-circle-outline'></i>마일리지</p>
							<div class="goals">
								<p class="goal">총 시간<span>-시간</span></p>
								<p class="gubun">|</p>
								<p class="goal">직무<span>-점</span></p>
							</div>
						</div>
						<div class="goalDiv2">
							<div>경력개발 현황</div>
							<div>이력서/자기소개서</div>
							<div>포트폴리오</div>
						</div>
					</div>
				</div>
				<div class="lock">
					<div class="cLock" style="background : #fff7fa !important">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i>공지사항</p>
						<div class="ntc">
							<ul class="ntcCate curpoint">
								<li id="hot" class="on" onclick="ntcCateClick('hot')">중요</li>
								<li id="N101" onclick="ntcCateClick('N101')">학사</li>
								<li id="N102" onclick="ntcCateClick('N102')">장학</li>
								<li id="N103" onclick="ntcCateClick('N103')">행사</li>
							</ul>
							<div class="ntcList"></div>
						</div>
					</div>
					<div class="cLock">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i>나의 경력개발 현황</p>
						<p class="total">총 합계 <span>0시간/0점</span></p>
						<table border="1" class="career">
							<tr>
								<th>역량개발</th>
								<th>시간</th>
								<th>점수</th>
							</tr>
							<tr>
								<td>역량개발프로그램현황</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>상담현황</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>대외활동</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>대외활동(봉사활동)</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="lock">
					<div class="calLock">
						<p class="ntcTtl" style="margin-bottom: 0px;"><i class='mdi mdi-transition-masked'></i>개인 달력</p>
						<div data-provide="datepicker-inline" data-date-today-highlight="true" class="calendar-widget" id="datepicker"></div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ not empty sessionScope.memSession.professorVO }">
			<div style="width: 100%;">
				<div class="lock">
					<div class="cLock">
						<div class="memInfo">
							<div class="svgWrapper mainTop">
								<svg width="40" height="40" xmlns="http://www.w3.org/2000/svg">
									<image width="40" height="40" href="/resources/images/logo.png" />
								</svg>
							</div>
							<div class="detail mainTop"><strong style="font-weight: 900;color: #0f3970;font-size: 19px;">${ sessionScope.memSession.memNm }</strong><br>${ sessionScope.memSession.professorVO.depNm }</div>
							<div class="editWrap mainTop">
								<a href="/myPage/stuMyPage"><i class="mdi mdi-cog" style="font-size: 1.1em; cursor: pointer; color: #888;"></i></a>
							</div>
						</div>
						<div class="stuCredit">
							<div class="dougnut">
								<p class="todoTtl" style="padding-left : 7px;"><i class="uil uil-check"></i> TO DO LIST</p>
								<div data-simplebar style="height: 71%; overflow: auto;">
									<c:forEach var="toDo" items="${toDo }">
										<div class="toDo">
											<input class="chkbox" type="checkbox" value="${toDo.schYn }" id="${toDo.schCd }"><font size="3">&nbsp;${toDo.schSt}&emsp;${toDo.schTtl }</font>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="memSer">
								<div class="chat curpoint" onclick="fn_approvalPro()">
									<span class="ttl">
										<i class="uil uil-chat-bubble-user"></i>
										결재신청/완료
									</span>
									<span class="con"><span class="approvalCntn"></span>&nbsp;/&nbsp;<span class="approvalCnty"></span>&nbsp;건</span>									
								</div>
								<div class="mail curpoint" onclick="fn_mail()">
									<span class="ttl">
										<i class="mdi mdi-email-variant"></i>
										안읽은 메일
									</span>
									<span class="con"><span class="mlCntN"></span>&nbsp;건</span>
								</div>
							</div>
						</div>
						<div class="score">
							<div class="score_info" id="scoreTotalCrdInfo">이수학점</div>
							<div class="score_info curpoint" id="showDivInfoEvent">
								<span id="showFirstDivInfo">평균평점 확인하기</span>
								<span id="showWhenClickedDivInfo" style="display:none;"></span>
							</div>
						</div>
					</div>
					<div class="cLock goalDivDiv">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i><span style="letter-spacing:2px;">IJU</span> With U</p>
						<div class="goalDiv">
							<p><i class='mdi mdi-bullseye-arrow'></i>나의 진로 목표</p>
							<div class="goals">
								<p class="goal">진로<span>-</span></p>
								<p class="gubun">|</p>
								<p class="goal">직무<span>-</span></p>
							</div>
							<p><i class='mdi mdi-alpha-m-circle-outline'></i>마일리지</p>
							<div class="goals">
								<p class="goal">총 시간<span>-시간</span></p>
								<p class="gubun">|</p>
								<p class="goal">직무<span>-점</span></p>
							</div>
						</div>
						<div class="goalDiv2">
							<div>경력개발 현황</div>
							<div>이력서/자기소개서</div>
							<div>포트폴리오</div>
						</div>
					</div>
				</div>
				<div class="lock">
					<div class="cLock" style="background : #fff7fa !important">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i>공지사항</p>
						<div class="ntc">
							<ul class="ntcCate curpoint">
								<li id="hot" class="on" onclick="ntcCateClick('hot')">중요</li>
								<li id="N101" onclick="ntcCateClick('N101')">학사</li>
								<li id="N102" onclick="ntcCateClick('N102')">장학</li>
								<li id="N103" onclick="ntcCateClick('N103')">행사</li>
							</ul>
							<div class="ntcList"></div>
						</div>
					</div>
					<div class="cLock">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i>나의 경력개발 현황</p>
						<p class="total">총 합계 <span>0시간/0점</span></p>
						<table border="1" class="career">
							<tr>
								<th>역량개발</th>
								<th>시간</th>
								<th>점수</th>
							</tr>
							<tr>
								<td>역량개발프로그램현황</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>상담현황</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>대외활동</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>대외활동(봉사활동)</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="lock">
					<div class="calLock">
						<p class="ntcTtl" style="margin-bottom: 0px;"><i class='mdi mdi-transition-masked'></i>개인 달력</p>
						<div data-provide="datepicker-inline" data-date-today-highlight="true" class="calendar-widget" id="datepicker"></div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ not empty sessionScope.memSession.managerVO }">
			<div style="width: 100%;">
				<div class="lock">
					<div class="cLock">
						<div class="memInfo">
							<div class="svgWrapper mainTop">
								<svg width="40" height="40" xmlns="http://www.w3.org/2000/svg">
									<image width="40" height="40" href="/resources/images/logo.png" />
								</svg>
							</div>
							<div class="detail mainTop"><strong style="font-weight: 900;color: #0f3970;font-size: 19px;">${ sessionScope.memSession.memNm }</strong><br>${ sessionScope.memSession.managerVO.mgrDivNm }</div>
							<div class="editWrap mainTop">
								<a href="/myPage/stuMyPage"><i class="mdi mdi-cog" style="font-size: 1.1em; cursor: pointer; color: #888;"></i></a>
							</div>
						</div>
						<div class="stuCredit">
							<div class="dougnut">
								<p class="todoTtl" style="padding-left : 7px;"><i class="uil uil-check"></i> TO DO LIST</p>
								<div data-simplebar style="height: 71%; overflow: auto;">
									<c:forEach var="toDo" items="${toDo }">
										<div class="toDo">
											<input class="chkbox" type="checkbox" value="${toDo.schYn }" id="${toDo.schCd }"><font size="3">&nbsp;${toDo.schSt}&emsp;${toDo.schTtl }</font>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="memSer">
								<div class="chat curpoint" onclick="fn_approvalMgr()">
									<span class="ttl">
										<i class="uil uil-chat-bubble-user"></i>
										결재신청/완료
									</span>
									<span class="con"><span class="approvalCntn"></span>&nbsp;/&nbsp;<span class="approvalCnty"></span>&nbsp;건</span>									
								</div>
								<div class="mail curpoint" onclick="fn_mail()">
									<span class="ttl">
										<i class="mdi mdi-email-variant"></i>
										안읽은 메일
									</span>
									<span class="con"><span class="mlCntN"></span>&nbsp;건</span>
								</div>
							</div>
						</div>
						<div class="score">
							<div class="score_info" id="scoreTotalCrdInfo">이수학점</div>
							<div class="score_info curpoint" id="showDivInfoEvent">
								<span id="showFirstDivInfo">평균평점 확인하기</span>
								<span id="showWhenClickedDivInfo" style="display:none;"></span>
							</div>
						</div>
					</div>
					<div class="cLock goalDivDiv">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i><span style="letter-spacing:2px;">IJU</span> With U</p>
						<div class="goalDiv">
							<p><i class='mdi mdi-bullseye-arrow'></i>나의 진로 목표</p>
							<div class="goals">
								<p class="goal">진로<span>-</span></p>
								<p class="gubun">|</p>
								<p class="goal">직무<span>-</span></p>
							</div>
							<p><i class='mdi mdi-alpha-m-circle-outline'></i>마일리지</p>
							<div class="goals">
								<p class="goal">총 시간<span>-시간</span></p>
								<p class="gubun">|</p>
								<p class="goal">직무<span>-점</span></p>
							</div>
						</div>
						<div class="goalDiv2">
							<div>경력개발 현황</div>
							<div>이력서/자기소개서</div>
							<div>포트폴리오</div>
						</div>
					</div>
				</div>
				<div class="lock">
					<div class="cLock" style="background : #fff7fa !important">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i>공지사항</p>
						<div class="ntc">
							<ul class="ntcCate curpoint">
								<li id="hot" class="on" onclick="ntcCateClick('hot')">중요</li>
								<li id="N101" onclick="ntcCateClick('N101')">학사</li>
								<li id="N102" onclick="ntcCateClick('N102')">장학</li>
								<li id="N103" onclick="ntcCateClick('N103')">행사</li>
							</ul>
							<div class="ntcList"></div>
						</div>
					</div>
					<div class="cLock">
						<p class="ntcTtl"><i class='mdi mdi-transition-masked'></i>나의 경력개발 현황</p>
						<p class="total">총 합계 <span>0시간/0점</span></p>
						<table border="1" class="career">
							<tr>
								<th>역량개발</th>
								<th>시간</th>
								<th>점수</th>
							</tr>
							<tr>
								<td>역량개발프로그램현황</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>상담현황</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>대외활동</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
							<tr>
								<td>대외활동(봉사활동)</td>
								<td class="cter">0</td>
								<td class="cter">0</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="lock">
					<div class="calLock">
						<p class="ntcTtl" style="margin-bottom: 0px;"><i class='mdi mdi-transition-masked'></i>개인 달력</p>
						<div data-provide="datepicker-inline" data-date-today-highlight="true" class="calendar-widget" id="datepicker"></div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<!-- <button type="submit" onClick="location.href='logout'">로그아웃</button> -->
	
	    <div id="gridCont">
	    	<div class="grid-stack"></div>
	    </div>
	    <hr/>
	    <div style="display:none">
	    <textarea id="saved-data" cols="100" rows="20" readonly="readonly"></textarea>
	    </div>
	</div>
</div>
</body>

  <script type="text/javascript" defer="defer">
  	let grid = GridStack.init({
      minRow: 1, // don't let it collapse when empty
      cellHeight: '7rem'
    });
    
	
  	var RC001 = "";
	  	RC001 += "<div id='RC001' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
	  	RC001 += "<br>";
		RC001 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>학적변동조회</span></p>"
		RC001 += "<div class='portleContent'>";
		RC001 += "<div class='scrollDiv' data-simplebar>"
        RC001 += "<table class='ptable' style='width : 100%;'>";
        RC001 += "<thead>";
        RC001 += "<tr><th>년도/학기</th>";
        RC001 += "<th>변동구분</th>";
        RC001 += "<th>변동일자</th>";
        RC001 += "<th>진행상태</th></tr>";
        RC001 += "</thead>";
        RC001 += "<tbody>";
        if('${history[0].lecaBook}' == ''){
        	RC001 += "<tr><td colspan = '4'>변동 내역이 존재하지 않습니다.</td>";
        	RC001 += "</tr>";
        }else{
            RC001 += "<c:forEach var='history' items='${history}'>";
            RC001 += "<tr><td>${history.lecaCate}</td>";
            RC001 += "<td>${history.lecaBook}</td>";
            RC001 += "<td>${history.lecaCon}</td>";
            RC001 += "<td>${history.lecaRoom}</td></tr>";
            RC001 += "</c:forEach>"; 
        }
        RC001 += "</tbody>";
        RC001 += "</table>";
        RC001 += "</div>";
        RC001 += "</div>";
	
	var RC002 = "";
		RC002 += "<div id='RC002' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC002 += "<br>";
		RC002 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>성적 조회</span></p>"
		RC002 += '<div class="portleContent"><select id="portletTgrade" onchange="javascript:getTgradeList(this);getTgradeCnt(this);" style="border:1px solid lightgray; height:27px; float:left;">';
		RC002 += '<c:forEach var="yrVal" items="${yrNSem}">';
		RC002 += '<option value = "${yrVal.lecaYr}${yrVal.lecaSem}">${yrVal.lecaYr}학년도 ${yrVal.lecaSem}학기</option>';
		RC002 += '</c:forEach></select>';
		RC002 += '<p style="display: inline-block; float: right; margin-top: 2px;">신청(평점평균반영) : <span id="tgradeCnt" style="color:#246ac5;;">${totalMap.total }</span>&nbsp;';
		RC002 += '&nbsp;&nbsp;취득 : <span id="tgradeGetCnt" style="color:rgb(225, 39, 64);">${totalMap.totalNotF }</span></p><br>';
		RC002 += '<table id="portletTgradeTable" class="ptable" style="width:100%;">';
		RC002 += '<tr><th>교과목명</th><th>이수구분</th><th>학점</th><th>평가</th></tr>';
		RC002 += '<c:forEach var="gradeVal" items="${gradeList}">';
		RC002 += '<tr><td style="text-align:left;">${gradeVal.lecaNm}</td><td>${gradeVal.lecaCon}</td>';
		RC002 += '<td>${gradeVal.lecaCrd}</td><td>${gradeVal.lecaBook}</td></tr>';
		RC002 += '</c:forEach></table></div>';

	var RC003 = "";
		RC003 += "<div id='RC003' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC003 += "<br>";
		RC003 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>상담신청 현황</span></p>"
		RC003 += "<div class='portleContent'>";
		RC003 += "<c:if test = '${not empty sessionScope.memSession.studentVO && not empty stuCounsel}'>";
		RC003 += "<table class='ptable' style='width : 100%;'>";
        RC003 += "<thead>";
        RC003 += "<tr><th style='width :100px;'>일자</th>";
        RC003 += "<th style='width :300px;'>제목</th>";
        RC003 += "<th style='width :100px;'>상담여부</th><tr>";
        RC003 += "</thead>";
        RC003 += "<tbody>";
        RC003 += "<c:forEach var='stuCounsel' items='${stuCounsel}'>";
        RC003 += "<tr><td><fmt:formatDate value='${stuCounsel.cnslReg}' pattern='yyyy.MM.dd' /></td>";
        RC003 += "<td style='text-align:left;'>&nbsp;[${stuCounsel.cnslCate}] ${stuCounsel.cnslTtl}</td>";
        RC003 += "<td>${stuCounsel.cnslYn}</td></tr>";
        RC003 += "</c:forEach>";
        RC003 += "</tbody>";
        RC003 += "</table>";
        RC003 += "</c:if>";
        RC003 += "<c:if test = '${not empty sessionScope.memSession.studentVO && empty stuCounsel}'>";
        RC003 += "<div>신청한 상담이 없습니다.</div>";
        RC003 += "</c:if>";
        RC003 += "<c:if test = '${not empty sessionScope.memSession.professorVO && not empty proCounsel}'>";
		RC003 += "<table class='ptable' style='width : 100%;'>";
        RC003 += "<thead>";
        RC003 += "<tr><th style='width :100px;'>신청일자</th>";
        RC003 += "<th style='width :300px;'>제목</th>";
        RC003 += "<th style='width :100px;'>신청자</th><tr>";
        RC003 += "</thead>";
        RC003 += "<tbody>";
        RC003 += "<c:forEach var='proCounsel' items='${proCounsel}'>";
        RC003 += "<tr><td><fmt:formatDate value='${proCounsel.cnslReg}' pattern='yyyy.MM.dd' /></td>";
        RC003 += "<td style='text-align: left;'>[${proCounsel.cnslCate}] ${proCounsel.cnslTtl}</td>";
        RC003 += "<td>${proCounsel.memNm}</td></tr>";
        RC003 += "</c:forEach>";
        RC003 += "</tbody>";
        RC003 += "</table>";
        RC003 += "</div>";
        RC003 += "</c:if>";
        RC003 += "<c:if test = '${not empty sessionScope.memSession.professorVO && empty proCounsel}'>";
        RC003 += "<div>신청된 상담이 없습니다.</div>";
        RC003 += "</c:if>";
		
	var RC004 = "";
		RC004 += "<div id='RC004' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC004 += "<br>";
		RC004 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>수강신청 내역</span></p>";
		RC004 += '<div class="portleContent"><select id="portletRegHistory" onchange="javascript:getRegHistoryList(this);getRegHistoryCnt(this);" style="border:1px solid lightgray; height:27px; float:left;">';
		RC004 += '<c:forEach var="yrVal" items="${yrNSem}">';
		RC004 += '<option value = "${yrVal.lecaYr}${yrVal.lecaSem}">${yrVal.lecaYr}학년도 ${yrVal.lecaSem}학기</option>';
		RC004 += '</c:forEach></select>';
		RC004 += '<p style="display: inline-block; float: right; margin-top: 2px;">신청학점 : <span id="regHistoryCnt" style="color:rgb(225, 39, 64);">${totalMap.total}</span></p><br>';
		RC004 += '<div data-simplebar style="width: 100%; height: 253px; overflow: auto;"><table id="portletRegHistoryTable" class="ptable" style="width:100%;">';
		RC004 += '<tr><th>교과목명</th><th>학점/시수</th><th>이수구분</th><th>담당교수</th></tr>';
		RC004 += '<c:forEach var="regHistory" items="${regHistoryList}">';
		RC004 += '<tr><td style="text-align:left;">${regHistory.lecaNm}</td><td>${regHistory.lecaCrd}</td>';
		RC004 += '<td>${regHistory.lecaCon}</td><td>${regHistory.lecaBook}</td></tr>';
		RC004 += '</c:forEach></table></div></div>';
		
	var RC005 = "";
		RC005 += "<div id='RC005' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC005 += "<br>";
		RC005 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>결재 내역</span></p>";
		RC005 += '<div class="portleContent">';
		RC005 += "<div class='scrollDiv' data-simplebar>";
		RC005 += '<c:if test="${not empty proApprovalTh}">';
		RC005 += '<table class="ptable" style="width: 100%;">';
		RC005 += '	<tr>                                               ';
		RC005 += '		<th>${proApprovalTh.subCd}</th>                              ';
		RC005 += '		<th>${proApprovalTh.lecaNm}</th>                              ';
		RC005 += '		<th>${proApprovalTh.lecaRoom}</th>                              ';
		RC005 += '		<th>${proApprovalTh.lecaCon}</th>                              ';
		RC005 += '	</tr>                                              ';
		RC005 += '<c:forEach var="pro" items="${proApprovalList}">';
		RC005 += '	<tr>                                               ';
		RC005 += '		<td>${pro.subCd}</td>                                      ';
		RC005 += '		<td>${pro.lecaNm}</td>                                      ';
		RC005 += '		<td>${pro.lecaRoom}</td>                                      ';
		RC005 += '		<td>${pro.lecaCon}</td>                                      ';
		RC005 += '	</tr>                                              ';
		RC005 += '</c:forEach>                                             ';
		RC005 += '</table>                                             ';
		RC005 += '</c:if>                                            ';
		RC005 += '<c:if test="${not empty mgrApprovalTh}">';
		RC005 += '<table class="ptable" style="width: 100%;">';
		RC005 += '	<tr>                                               ';
		RC005 += '		<th>${mgrApprovalTh.lecaBook}</th>                              ';
		RC005 += '		<th>${mgrApprovalTh.lecaNote}</th>                              ';
		RC005 += '		<th>${mgrApprovalTh.lecaDt}</th>                              ';
		RC005 += '		<th>${mgrApprovalTh.lecaCon}</th>                              ';
		RC005 += '	</tr>                                              ';
		RC005 += '<c:forEach var="mgr" items="${mgrApprovalList}">';
		RC005 += '	<tr>                                               ';
		RC005 += '		<td>${mgr.lecaBook}</td>                                      ';
		RC005 += '		<td>${mgr.lecaNote}</td>                                      ';
		RC005 += '		<td><fmt:formatDate pattern="yyyy/MM/dd" value="${mgr.lecaDt}"/></td>                                      ';
		RC005 += '		<td>${mgr.lecaCon}</td>                                      ';
		RC005 += '	</tr>                                              ';
		RC005 += '</c:forEach>                                             ';
		RC005 += '</table>                                             ';
		RC005 += '</c:if>                                            ';
		RC005 += '</div>';
		RC005 += '</div>';
		
	var RC006 = "";
		RC006 += "<div id='RC006' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC006 += "<br>";
		RC006 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>당학기 강의조회</span></p>";
		RC006 += "<div class='portleContent'>";
		RC006 += "<c:if test='${not empty currentLecture}'><div class='curLecWrapper' data-simplebar><c:forEach var='curLec' items='${currentLecture}'>";
		RC006 += "<div class='toast-body curLecWrap'><span style='float:left;margin-left:10px;font-weight: 600;font-size:1.1em;color:#555;line-height:25px;'>${curLec.lecaNm}</span><span style='float:right;color:#888;line-height:25px;'>${curLec.lecaCon}</span><div style='clear:both;'></div>";
		RC006 += "<div class='mt-2 pt-2 border-top'><span style='float:left;margin-left:10px;color:#888;font-size:0.8em;line-height: 20px;'>${curLec.lecaYr}년&nbsp;${curLec.lecaSem}학기</span>";
		RC006 += "<a href='/professorLecture/lecApply?lecCd=${curLec.lecCd }' style='float:right'>강의실로 이동<i class='dripicons-arrow-thin-right'></i></a><div style='clear:both;'></div></div></div>";
		RC006 += "</c:forEach></div></c:if>";
		RC006 += "<c:if test='${empty currentLecture}'><div class='toast-body'>당학기 수강중인 강의가 없습니다.</div></c:if>";
		RC006 += "</div>";
	
	var RC007 = ""
		RC007 += "<div id='RC007' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC007 += "<br>";
		RC007 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>학사일정</span></p>"
		RC007 += "<div class='portleContent'>";
 		RC007 += "<h3 id='aschDate'></h3>"
 		RC007 += "<c:if test='${not empty aschedule}'>";
		RC007 += "<c:forEach var='aschedule' items='${aschedule}'>";
		RC007 += "<hr style='border:1px solid lightgray;'><p style='text-align:left; margin : 10px;'><span style='font-weight:bold;font-size:12pt;'>${aschedule.aschSt}</span>&nbsp;<span>${aschedule.aschCon}</span></p>";
		RC007 += "</c:forEach>";
		RC007 += "</c:if>";
		RC007 += "<c:if test='${empty aschedule}'>";
		RC007 += "<div>이번 달 학사일정은 없습니다.</div>";
		RC007 += "</c:if>";
		RC007 += "</div>";

		
	var RC008 = ""
		RC008 += "<div id='RC008' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC008 += "<br>";
		RC008 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>오늘의 대기/날씨</span></p>";
		RC008 += '<div class="portleContent"><span style="color : #246ac5;">대전광역시 중구 오류동</span><br><span id="weatherInfo"></span>';
		RC008 += '<table id="weatherTable" border="1" style="width:100%; border:1px solid lightgray; margin-top: 15px;">';
		RC008 += '<tr><td rowspan="5" id="totalInfo"><img id="weatherImg" /><br><span id="weatherTemp"></span></td>';
		RC008 += '<th>현재날씨</th><td id="currentWeather"></td></tr>';
		RC008 += '<tr><th>강수확률</th><td id="precipitation"></td></tr>';
		RC008 += '<tr><th>풍향</th><td id="windDirection"></td></tr>';
		RC008 += '<tr><th>풍속</th><td id="windSpeed"></td></tr>';
		RC008 += '<tr><th>습도</th><td id="humidity"></td></tr>';
		RC008 += '</table></div>';
	
	var RC009 = ""
		RC009 += "<div id='RC009' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC009 += "<br>";
		RC009 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>공지사항</span></p>";
		RC009 += "<div class='portleContent' >";
		RC009 += "<c:forEach var='ntcVO' items='${ ntcList }'>";
		RC009 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
	  	RC009 += "<div class='noticeDiv'><p class='noticeP' style='text-align:left; display:inline-block; min-width:80%;'><a class='noticeA' href='/notice/ntcDetail?ntcCd=${ ntcVO.ntcCd }'>[${ ntcVO.ntcCate }] ${ ntcVO.ntcTtl }</a></p><p style='text-align:right; display:inline-block; min-width:20%; float: right;'><span style='color : gray;'><fmt:formatDate pattern='yy.MM.dd' value='${ ntcVO.ntcDt }'/></span></p></div>";
	    RC009 += "</c:forEach>";
	    RC009 += "</div>";
		
	var RC010 = ""
		RC010 += "<div id='RC010' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC010 += "<br>";
		RC010 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>개인일정<span></p>"
		RC010 += "<div class='portleContent'><h3 id='weekDate'></h3>"
 		RC010 += "<c:if test='${not empty weekCal}'>";
		RC010 += "<c:forEach var='weekCal' items='${weekCal}'>";
		RC010 += "<hr style='border : 1px solid lightgray;'><p style='text-align:left; margin : 10px;'><span style='font-weight:bold;font-size:12pt;'>${weekCal.schSt}</span>&nbsp;<span>${weekCal.schTtl}</span></p>";
		RC010 += "</c:forEach>";
		RC010 += "</c:if>";
		RC010 += "<c:if test='${empty weekCal}'>";
		RC010 += "<div>이번 주 개인일정이 없습니다.</div>";
		RC010 += "</c:if>";
		RC010 += "</div>";
		
	var RC011 = ""
		RC011 += "<div id='RC011' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC011 += "<br>";
		RC011 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>코로나 19 공지</span></p>";
		RC011 += "<div class='portleContent'>";
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>[교육부] 코로나19 재유행에 따른 2022학년도 여름방학 기간 대학 방역관리 철저 요청</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.08.29</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>일상회복 지원위원회 제26차(2022. 6. 27.) 서면회의 결과 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.06.28</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>일상회복 지원위원회 제 25차(2022. 6. 7.) 서면회의 결과 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.06.09</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>[교육부] 스포츠 관람, 공연 등 대학 행사 시 실외마스크 착용의마 준수 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.05.31</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>일상회복 지원위원회 제 24차(2022. 5. 23.) 서면회의 결과 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.05.27</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>[교육부] 생활 방역 세부수칙 안내서(6-1판) 일부 개정 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.05.20</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>일상회복 지원위원회 제 23차(2022. 5. 16.) 서면회의 결과 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.05.17</span></p></div>"
		RC011 += "<hr style='margin: 0px; border: 0; background: lightgray; height:1px;'>";
		RC011 += "<div class='noticeDiv'><p class='noticeP' style='margin-left: -15px;'>일상회복 지원위원회 제 22차(2022. 5. 2.) 회의결과 안내 서면회의 결과 안내</p><p style='display:inline-block; float: right;'><span style='color : gray;'>22.05.04</span></p></div>"
		RC011 += "</div>";
		
	var RC012 = "";
		RC012 += "<div id='RC012' onClick = 'grid.removeWidget(this.parentNode.parentNode)' class='deleteP'><p class='plusP'><i class='mdi mdi-plus'></i></p><p class='deletePIcon'><i class='mdi mdi-close deleteIcon'></i></p></div>";
		RC012 += "<br>";
        RC012 += "<p class='ptitle'><img style='padding-bottom: 7px;' src='https://portal.cnu.ac.kr/eXPortal/cnu/images/ico_bul_tit02.png'></img><span style='margin-left:11px;'>강의시간표</span></p>";
        RC012 += '<div class="portleContent">'
        RC012 += '<div style="float:left; width:40%;"><select id="portletTimeTableSelect" onchange="javascript:getTimeTable(this);" style="border:1px solid lightgray; height:27px; float:left;">';
        RC012 += '<c:forEach var="yrVal" items="${yrNSem}">';
        RC012 += '<option value = "${yrVal.lecaYr}${yrVal.lecaSem}">${yrVal.lecaYr}학년도 ${yrVal.lecaSem}학기</option>';
        RC012 += '</c:forEach></select><br><br>';
        RC012 += '<div id="timeTableSub" style="float:left;"></div></div>';
        RC012 += '<table id="portletTimeTable" border="1" style="float:left; width: 60%; height: 318px;">';
        RC012 += '<tr><th class="thColor" style="width:45px; height:5px;"></th><th class="thColor">월</th><th class="thColor">화</th><th class="thColor">수</th><th class="thColor">목</th><th class="thColor">금</th></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">1교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">2교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">3교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">4교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">5교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">6교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">7교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">8교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><th rowspan="2" class="thColor">9교시</th><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '<tr><td></td><td></td><td></td><td></td><td></td></tr>';
        RC012 += '</table>';
        RC012 += '</div>';
	
		let serializedData = [
			<c:forEach var='list' items='${list}'>
				{x: ${list.poX}, y: ${list.poY}, w: ${list.poW}, h: ${list.poH}, id: '${list.poCate}', content: ${list.poCate}}, 	
			</c:forEach>
		];

    
  	/* serializedData.forEach((n, i) =>
   	n.content = `<button onClick="grid.removeWidget(this.parentNode.parentN ode)">X</button><br> ${i}<br> ${n.content ? n.content : ''}`);*/
  	
	$.each(serializedData, function(n, i){
  		n.content = `<button onClick="grid.removeWidget(this.parentNode.parentNode)">X</button><br> ${i}<br> ${n.content ? n.content : ''}`;
  	}) 
  	let serializedFull;

    // 2.x method - just saving list of widgets with content (default)
    loadGrid = function() {
      grid.load(serializedData, true); // update things
    }

    var poDel = new Array();	//포틀릿 삭제될 배열 선언
	  var cnt = 0;
	  
	    
	    
//	     grid.on('added removed change', function(e, items) {
//	       let str = '';
//	       items.forEach(function(item) {
//	     	  str += ' (x,y)=' + item.x + ',' + item.y  + '(w,h)=' + item.w +  ',' + item.h;
		      
//	       }

//	       );
//	       console.log(e.type + ' ' + items.length + ' items:' + str);
//	       console.log(e.detail[0].id);
//	     });
	    
	    //삭제버튼 누른 포틀릿 배열로 담기
	    grid.on('removed', function(e, items){
	    	console.log(e.detail[0].id);
	    	for(var i=0; i<=cnt; i++){
	    		poDel[cnt] = e.detail[0].id;
	    	}
	    	cnt += 1;
	    })
	
	// 2.x method
  //Save 버튼 눌렀을때 onclick 이벤트
  saveGrid = function() {
	   alert("화면 배치가 완료되었습니다.\n다음 접속 시에도 변경된 화면으로 보입니다.");
	  console.log("poDel > " + poDel);
    delete serializedFull;
    serializedData = grid.save();
    document.querySelector('#saved-data').value = JSON.stringify(serializedData, null, '  ');
		
		var memCd = ${ memCd };
		
		for(var i=0; i< serializedData.length; i++){
			serializedData[i].memCd = memCd;
		}

		let data = {"serializedData" : serializedData};
		
		console.log("serializedData : " + JSON.stringify(serializedData));
		
		$.ajax({
			url : '/main/portletSavePost',
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(serializedData),
			type : "post",
			success : function(result){
				console.log("data : " + JSON.stringify(data));
				console.log("result : " + JSON.stringify(result));
				if(poDel.length != 0){
	 				//삭제 배열 controller로 보내기
	 				$.ajax({
	 					url : '/main/updateDelete',
	 					contentType : "application/json;charset=utf-8",
	 					data : JSON.stringify({"memCd" : memCd,
	 											"poCate" : poDel}),
	 					dataType : 'JSON',
	 					type : 'post',
	 					success : function(result){
	 						console.log(result);
	 					}
	 				})
				}

			}
		});
  }

    // 3.1 full method saving the grid options + children (which is recursive for nested grids)
    saveFullGrid = function() {
      serializedFull = grid.save(true, true);
      serializedData = serializedFull.children;
      document.querySelector('#saved-data').value = JSON.stringify(serializedFull, null, '  ');
    }

    // 3.1 full method to reload from scratch - delete the grid and add it back from JSON
    loadFullGrid = function() {
      if (!serializedFull) return;
      grid.destroy(true); // nuke everything
      grid = GridStack.addGrid(document.querySelector('#gridCont'), serializedFull);
    }

    clearGrid = function() {
      grid.removeAll();
    };

    loadGrid();
    
    <%
		MemberVO memberVO1 = (MemberVO)session.getAttribute("memSession");
		if(memberVO1.getStudentVO() != null){
	%>
		    //chart.js를 이용한 doughnut chart
		    $.ajax({
		    	url : "/tgrade/getDoughnut",
		    	type : "POST",
		    	dataType : "JSON",
		    	success : function(res) {
		    		$('#scoreTotalCrdInfo').html("이수학점 <b>" + res.JGSUM + "</b>");
		    		$('#showWhenClickedDivInfo').html("<b>" + res.TOTALDIV + "</b>");
		    		
		    		const context = document.getElementById('myChart').getContext('2d');
		    		const data = {
		    				labels : ['전필', '전선', '교필', '교선', '잔여'],
		    				datasets : [{
		    					label : 'My First Dataset',
		    					data : [res.JP, res.JS, res.GP, res.GS, res.RESSUM],
		    					backgroundColor : [
		    						'#304D63',
		    						'#B2E7E8',
		    						'#8FB9AA',
		    						'#F2D096',
		    						'#ED8975'
		    					],
		    					hoverOffset : 4,
		    				}]
		    		};
		    		const myChart = new Chart(context, {
		    			type : 'doughnut',
		    			data : data, 
		    			options : {
		    				responsive : false,
		    				legend : {
		    					position : 'right',
		    					labels : {
		    						pointStyle : 'circle',
		    						usePointStyle : true,
		    						padding : 10
		    					}
		    				}
		    			}
		    		});
		    		Chart.pluginService.register({
		    			beforeDraw : function(chart) {
		    				var width = chart.chart.width,
		    					height = chart.chart.height,
		    					ctx = chart.chart.ctx;
		    		
		    				ctx.restore();
		    				
		    				var fontSize = (height / 150).toFixed(2);
		    				ctx.font = fontSize + "em sans-serif";
		    				ctx.textBaseline = "middle";
		    				
		    				var text = res.DEPSUM + "(" + res.RESSUM + ")",
		    					textX = Math.round((width - ctx.measureText(text).width) / 3.5),
		    					textY = height / 2;
		    				ctx.fillText(text, textX, textY);
		    				ctx.save();
		    			}
		    		});
		    	}
		    });
    <%
		}
    %>
  </script>
  
  
</html>