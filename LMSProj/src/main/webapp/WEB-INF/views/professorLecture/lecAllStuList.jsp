<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="kr.ac.lms.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
	}
	
	.card-body {
		width: 100%;
	}

	.clear {
		clear: both;
	}
	
	.topBorder {
		border-top: 2px solid #112a63;
	}
	
	.mail{
		color: #112a63;
		float: right;
		font-size: 1.5em;
		cursor: pointer;
	}
	
	#grid td {
		background: #fff;
	}
	
	#grid th {
		background: #fafbfd;
	}
</style>
<script type="text/javascript" defer="defer">
// 		수강생 목록 출력하기
	$(function(){
		
		<%
			MemberVO member = (MemberVO)session.getAttribute("memSession");
			if(member.getStudentVO() != null){
		%>
// 				alert("stu");
				$.ajax({
					url : "/professorLecture/lecAttendanceStuList",
					type : 'post',
					data : {
						lecCd : ${ data.lecCd },
					},
					dataType : 'JSON',
					success : function(result) {
						console.log(result);
					
						$.each(result, function(i, v){
							if(v.memMl != null){
								v.memMl = v.memMl + '<i class="mdi mdi-email-send-outline mail" onclick="fn_mailWrite(' + v.memCd + ')"></i>';
							}
						});
						
						grid = new tui.Grid({
							el : document.getElementById('grid'),
							data : result,
							scrollX : true,
							scrollY : true,
							minBodyHeight : 580,
							bodyHeight : 580,
		// 					width : 1100,
							columns : [
								{header : '단과대학', name : 'colNm', filter : 'select', width : 150, align : 'center'},
								{header : '학과', name : 'depNm', filter : 'select', width : 150, align : 'center'},
								{header : '학년', name : 'stuYrs', filter : 'select', width : 150, align : 'center'},
								{header : '학번', name : 'memCd', filter : 'select', width : 150, align : 'center'},
								{header : '이름', name : 'memNm', filter : 'select', width : 150, align : 'center'},
								{header : '메일', name : 'memMl', align : 'left'}
							],
							rowHeaders: ['rowNum'],
							columnOptions: { resizable: true }
						});
					
						grid.on('click', function(object) {
							
						});
					
					}
				});
				
		<%
			}else if(member.getProfessorVO() != null){
		%>
				$.ajax({
					url : "/professorLecture/lecAttendanceStuList",
					type : 'post',
					data : {
						lecCd : ${ data.lecCd },
					},
					dataType : 'JSON',
					success : function(result) {
						console.log(result);
					
						$.each(result, function(i, v){
							if(v.memMl != null){
								v.memMl = v.memMl + '<i class="mdi mdi-email-send-outline mail" onclick="fn_mailWrite(' + v.memCd + ')"></i>';
							}
						});
						
						grid = new tui.Grid({
							el : document.getElementById('grid'),
							data : result,
							scrollX : true,
							scrollY : true,
							minBodyHeight : 580,
							bodyHeight : 580,
		// 					width : 1100,
							columns : [
								{header : '단과대학', name : 'colNm', filter : 'select', width : 150, align : 'center'},
								{header : '학과', name : 'depNm', filter : 'select', width : 150, align : 'center'},
								{header : '학년', name : 'stuYrs', filter : 'select', width : 120, align : 'center'},
								{header : '학번', name : 'memCd', filter : 'select', width : 150, align : 'center'},
								{header : '이름', name : 'memNm', filter : 'select', width : 150, align : 'center'},
								{header : '연락처', name : 'memTel',  width : 150, align : 'center'},
								{header : '메일', name : 'memMl', align : 'left'}
							],
							rowHeaders: ['rowNum'],
							columnOptions: { resizable: true }
						});
					
						grid.on('click', function(object) {
							
						});
					
					}
				});
		<%
			}
		%>
	});

	function fn_mailWrite(memCd){
// 		alert(memCd);
		window.open("/mail/write?memCd=" + memCd);
	}
</script>
<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
				<h4 style="margin-bottom: 20px;">${data.lecaNm }&emsp;&#45;&emsp;수강생 목록</h4>
				<div id="grid"></div>
		</div>
	</div>
</div>