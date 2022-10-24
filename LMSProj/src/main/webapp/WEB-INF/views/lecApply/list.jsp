<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서 조회</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/topTable.css" type="text/css">
<style type="text/css">
#personalProInfo, #lecApplyOrangeBox {
	border : 1px solid lightgray;
}
#personalProInfo{
	padding : 10px;
}
#lecApplyOrangeBox {
	background : lightyellow;
	padding : 3px;
	line-height : center;
}
#lecApplyOrangeBox select{
	padding : 2px;
	margin-left : 7px;
}
.addFontColorRed {
	color: rgb(225, 39, 64);
}
.addFontColorBlue {
	color : blue;
}
#tgradeGreenText {
	color : green;
}
#lecApplyList{
	width : 100%;
	margin-left : auto;
	margin-right : auto;
}
.lecApplySelect{
	display:inline-block;
	margin-left : 2%;
}
#personalProInfo{
	border: 1px solid #001353;
	padding: 10px;
	background: #F3F8FF;
	width: 100%;
	min-width: 1200px;
	max-width: 1700px;
	margin: 0 auto;
	border-radius : 10px;
}
#personalProInfo div{
	display : inline-block;
	width : 24%;
}
#personalProInfo input{
	width : 200px;
 	height: 33px;
 	background: #F2F2F2;
 	border: 1px solid gray;
 	border-radius : 5px;
	padding-left : 5px;
}
#personalProInfo label{
	text-align : right;
	width : 100px;
}
#grid td{
	background: #f9f9f9;
}
</style>
</head>
<script type="text/javascript" defer="defer">

	var memFnm;
	var grid;
	
	//onchange 이벤트
	//grid 리스트 다시 불러오기
	function getListAgain(yrNsem) {
		
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/lecApply/getListAgain",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				
				//그리드 비우고 다시 불러오기
				$('#grid').empty();
				
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd +')">강의계획서</button>';
				});
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 400,
					columns : [
						{header : '년도/학기', name : 'lecaCon', filter : 'select', width:120, align : 'center'},
						{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
						{header : '과목번호', name : 'subCd', filter : 'select', width : 100, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 220},
						{header : '제한인원', name : 'lecaMax', width : 70, align : 'center'},
						{header : '개설이수구분', name : 'lecaCate', width : 100, align : 'center'},
						{header : '학점', name : 'lecaCrd', width : 70, align : 'center'},
						{header : '강의시간/강의실', name : 'lecaTt', width : 300},
						{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
						{header : '승인여부', name : 'lecaBook', filter : 'select', width : 120, align : 'center'},
						{header : '자세히 보기', name : 'btn', align : 'center'}
					],
					columnOptions: {
				        resizable: true
				    }
				});
				
				//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(v1.lecaBook == '승인') {
						grid.addCellClassName(v1.rowKey, 'lecaBook', "addFontColorBlue");
					}else if(v1.lecaBook == '반려') {
						grid.addCellClassName(v1.rowKey, 'lecaBook', "addFontColorRed");
					}
				});
			}
		});
	}
	
	//count 불러오기
	function getCnt(yrNsem) {
		
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/lecApply/getCnt",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {

				$("#cntSpan").text(res);
			}
		});
	}
	
	//강의계획서 버튼 클릭 이벤트
	function getSyllabus(lecaCd, proCd) {
		
		param = {"lecaCd" : lecaCd};
		
		$.ajax({
			url : '/approval/lecApplyPdf',
			type : 'post',
			data : JSON.stringify(param),
			dataType : 'JSON',
			contentType : 'application/json;charset=utf-8',
			success : function(result){
				console.log(result);
				window.open("/approval/lecApproPdfGet/" + lecaCd, "a", "width=1200, height=850, left=100, top=50"); 
			}
		});
	}
	
	window.onload = function() {
		
		//로딩중 화면 띄우기
		loadingWithMask();
		setTimeout(closeLoadingWithMask, 2000);
		
		getCnt();
		
		//교수 개인정보 가져오기
		$.ajax({
			url : "/lecApply/getInfo",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				//교번(memCd), 이름(memNm), 생년월일(memReg1), 연락처(memTel),
				//소속(memNme), 직책(memAddr1), 재직상태(memAddr2)
				$('#proCd').val(res.memCd);
				$('#memName').val(res.memNm);
				$('#memReg1').val(res.memReg1);
				$('#memTel').val(res.memTel);
				$('#college').val(res.memNme);
				$('#position').val(res.memAddr1);
				$('#joinYN').val(res.memAddr2);
				
				memFnm = res.memFnm;
			}
		});
		
		//년도 및 학기 불러오기
		$.ajax({
			url : "/lecApply/getYrNSem",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				str = '';
				
				$.each(res, function(i, v) {
					str += '<option value="'+ v.lecaYr + v.lecaSem + '">' + v.lecaYr + '/' + v.lecaSem + '학기</option>';
				});
				
				$('#cateYrNSem').append(str);
			}
		});
		
		//강의계획서 리스트 가져오기
		$.ajax({
			url : "/lecApply/getList",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd +')">강의계획서</button>';
				});
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 340,
					columns : [
						{header : '년도/학기', name : 'lecaCon', filter : 'select', width:120, align : 'center'},
						{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
						{header : '과목번호', name : 'subCd', filter : 'select', width : 110, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 280},
						{header : '제한인원', name : 'lecaMax', width : 90, align : 'center'},
						{header : '개설이수구분', name : 'lecaCate', width : 120, align : 'center'},
						{header : '학점', name : 'lecaCrd', width : 70, align : 'center'},
						{header : '강의시간/강의실', name : 'lecaTt', width : 310},
						{header : '성적평가방식', name : 'lecaGrade', width : 110, align : 'center'},
						{header : '승인여부', name : 'lecaBook', filter : 'select', width : 120, align : 'center'},
						{header : '자세히 보기', name : 'btn', width : 150, align : 'center'}
					],
					columnOptions: {
				        resizable: true
				    }
				});
				
				//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(v1.lecaBook == '승인') {
						grid.addCellClassName(v1.rowKey, 'lecaBook', "addFontColorBlue");
					}else if(v1.lecaBook == '반려') {
						grid.addCellClassName(v1.rowKey, 'lecaBook', "addFontColorRed");
					}
				});
			}
		});
		
		//사진 띄우기
		$('#photoBtn').on('click', function() {
			
			//memFnm : 이미지 이름.확장자
			if(memFnm == null) {
				alert("등록된 사진이 없습니다.");
			}else {
				
				const img = new Image();
				img.src = "/resources/profileImg/" + memFnm;
				console.log("width : " + img.width + ", height : " + img.height);
				
				window.open(
						"/tgrade/getPhoto?memFnm=" + memFnm,
						"photo",
						"width = 175, height = 210, left = 300, top = 150, history = no, resizable = no, status = no, scrollbars = yes, menubar = no"
				);
			}
		});
	}
</script>
<body>
<div id="lecApplyList">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 강의개설관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획서 조회</span>
  	</div>
  	
  	<br>
  	
  	<table id="stuInfoTable">
  		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
		<tr>
			<th>교번</th>
			<td>
				<input class="infoText" type="text" name="proCd" id="proCd" readonly="readonly" style="width:68.5%;">
				<button type="button" class="btn btn-secondary photoBtn" id="photoBtn">
				<p class="photoP">사진</p>
				</button>
			</td>
			<th>성명</th>
			<td>
				<input class="infoText" type="text" name="memName" id="memName" readonly="readonly">
			</td>
			<th>연락처</th>
			<td>
				<input class="infoText" type="text" name="memTel" id="memTel" readonly="readonly">
			</td>
			<th colspan="2"></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>소속</th>
			<td>
				<input class="infoText" type="text" name="college" id="college" readonly="readonly">
			</td>
			<th>직책</th>
			<td>
				<input class="infoText" type="text" name="position" id="position" readonly="readonly">
			</td>
			<th>재직상태</th>
			<td>
				<input class="infoText" type="text" name="joinYN" id="joinYN" readonly="readonly">
			</td>
			<th>생년월일</th>
			<td>
				<input class="infoText" type="text" name="memReg1" id="memReg1" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
  	</table>
  	
	<br><br>
	
	<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의계획서
	<p id="tellCnt">
		[총 <span id="cntSpan"></span>건]
	</p>
	
	<br><br>
	
	<div id="tgradeYellowBox" style="height:47px;">
		<label>년도/학기
			<select name="cateYrNSem" id="cateYrNSem" onchange="javascript:getListAgain(this);getCnt(this);">
				<option value="">전체</option>
			</select>
		</label>
		<span id="tgradeGreenText">&emsp;<i class="mdi mdi-square-medium"></i>&nbsp;임시저장한 강의계획서는 강의계획서 신청에서 조회할 수 있습니다.</span>
	</div>
	
	<br>
	
	<div id="grid"></div>
	
	<br>
</div>
</body>
</html>