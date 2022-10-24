<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<script type="text/javascript" src="/resources/js/management.js"></script>
<style>
	#grid{
		display: inline-block;
		float: left;
	}
	
	.stuDetail{
		background-color: #eee;
		border: 1px solid #999;
	}
	
	tr{
		min-width:100%;
		height: 49px;
	}
	
	th{
		min-width: 170px;
		text-align: right;
		padding: 3px;
		background:#f4f7fd;
	}
	
	td{
		min-width: 180px;
		padding: 3px;
		background: white;
	}
	
	.detailDiv{
		float: right;
		box-sizing: border-box;
	}
	
	input[type="text"]{
		width: 100%;
	}
	
	#recNrsn{
		resize: none;
	}
	
</style>
<script type="text/javascript" defer="defer">
	$(function(){
		//로딩중 화면 띄우기
		loadingWithMask();
		
		getProList();
	});
</script>
<div>
   <i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 교수관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">교수목록조회</span>
</div>
<br><br>
<div style="float:left;display:inline-block;">
<p id="headL"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;교수 목록<span style="float:right;">[총 <span id="spancnt" style="color: #001353;"></span>건]</span></p>
<div id="grid"></div>
</div>
<div style="float:right;display:inline-block;width:53%;">
<p id="headD"><i class="mdi mdi-record-circle" style="color: #001353;float:left;"></i>&ensp;교수 상세정보</p>
<div class="detailDiv" style="clear:both;width:100%;">
	<table class="stuDetail" style="width:100%;">
		<tr>
			<th>No</th>
			<td><input type="text" id="no" readonly></td>
			<th rowspan="4" style="padding-bottom: 150px;">사진</th>
			<td rowspan="4" id="memFnm"><input type="text" style="height: 188px;" readonly></td>
		</tr>
		<tr>
			<th>소속</th>
			<td><input type="text" id="colDepNm" readonly></td>
		</tr>
		<tr>
			<th>교번</th>
			<td><input type="text" id="memCd" readonly></td>
		</tr>
		<tr>
			<th>이름(한글/영문)</th>
			<td><input type="text" id="memNmNE" readonly></td>
		</tr>
		<tr>
			<th>재직상태</th>
			<td><input type="text" id="recCate" readonly></td>
			<th>직책</th>
			<td><input type="text" id="proPos" readonly></td>
		</tr>
		<tr>
			<th>입사일</th>
			<td><input type="text" id="proJoin" readonly></td>
			<th>퇴사일</th>
			<td><input type="text" id="proRet" readonly></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="memTel" readonly></td>
			<th>이메일</th>
			<td><input type="text" id="memMl" readonly></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" id="memZip" readonly></td>
			<th>주소</th>
			<td><input type="text" id="memAddr" readonly></td>
		</tr>
		<tr>
			<th>은행</th>
			<td><input type="text" id="memBank" readonly></td>
			<th>계좌번호(예금주)</th>
			<td><input type="text" id="memDepoAct" readonly></td>
		</tr>
	</table>
</div>
</div>