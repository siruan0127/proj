<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/resources/css/suwon.css">
<link rel="stylesheet" href="/resources/css/tui-grid.css"
	type="text/css">

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<style type="text/css">
.addFontColorRed {
	color: rgb(225, 39, 64);
}
.addFontColorBlue {
	color : blue;
}
#detailSearch {
	width: 100%;
	margin-top: 20px;
	border-left : hidden;
	border-right : hidden;
	border-top: 1px solid gray;
    border-bottom: 1px solid gray;
}

.intext {
	width: 40%;
}

.btn-danger {
	-webkit-box-shadow: #6c757d;
}

.tableTh {
	text-align: right;
	padding: 20px;
	border: 1px solid gray;
	background: #f5faff;
}

.tableTd {
	padding: 10px;
	text-align: center;
	background: white;
}

#searchBut{
	margin-top: 3px;
	font-size: 12px;
}

#noBut{
	float: right;
    width: 49%;
    margin: 0px;
}

#okBut{
	width: 49%;
	display: inline-block;
}

.bg-primarys{
	background: #4671af;
}
</style>
</head>
<script type="text/javascript" defer="defer">
//강의 계획서 버튼을 클릭했을 경우 해당 강의계획서 띄우기
function getSyllabus(lecaCd, proCd) {
	//팝업이 닫혔는지 알려주는 변수
	var popup;
	
	param = {"lecaCd" : lecaCd};
	
	$.ajax({
		url : '/approval/lecApplyPdf',
		type : 'post',
		data : JSON.stringify(param),
		dataType : 'JSON',
		contentType : 'application/json;charset=utf-8',
		success : function(result){
			console.log(result);
				window.open("/approval/lecApproPdfGetMgr/" + lecaCd, "a", "width=1400, height=900, left=100, top=50"); 
			}
		
	})
}

function doOpenCheck(chk){
    var obj = document.getElementsByName("aaa");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
	var gridData;
	var grid;

	
	var value = 0;
	var firstData = 0;

	function gridStart(){
		$('#grid').empty();
		
		$.ajax({
			url : '/approval/mgrLecApprovalList',
			type : 'POST',
			data : JSON.stringify(firstData),
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(result){
				console.log(result);
				$('#cntSpan').text(parseInt(result.length).toLocaleString('ko-KR'));
				$.each(result, function(i,v){
						result[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm lecPlanBtn"  style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd + ',' + v.proCd +')">강의계획서 </button>';
				});
					
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 500,
					bodyHeight: 250,
					columns : [
 						{header : '기안자 소속', filter : 'select', name : 'lecaTt', width : 200, align : 'center'},
 						{header : '기안자', filter : 'select', name : 'lecaNote', width : 150, align : 'center'},
 						{header : '신청일자', name : 'lecaDt', width : 180, align : 'center'},
 						{header : '검토자 소속', filter : 'select', name : 'lecaRoom', width : 200, align : 'center'},
 						{header : '검토자', filter : 'select', name : 'lecaNm', width : 150, align : 'center'},
 						{header : '결재일자', name : 'lecaAdt', width : 180, align : 'center'},
 						{header : '승인여부', filter : 'select', name : 'lecaCon', align : 'center'},
 						{header : '강의계획서', name : 'btn', align : 'center'}
					],
					rowHeaders: ['rowNum'],
					columnOptions: {
				        resizable: true
					}
				
				});
				
				//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(v1.lecaCon == '승인') {
						grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorBlue");
					}else if(v1.lecaCon == '반려') {
						grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorRed");
					}
				});
				
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(grid.getValue(v1.rowKey, "lecaAdt") == null) {
						grid.setValue(v1.rowKey, "lecaAdt", "-", false);
					}
				});

				//그리드 열 선택할 때마다
 				grid.on('click', function(object){
					$('#plusDiv').empty();
 					
 					lecaCd = grid.getRow(object.rowKey).lecaCd;
					proCd = grid.getRow(object.rowKey).proCd;
				
					data = {"proCd" : proCd, 
							"lecaCd" : lecaCd};
				
				
					$.ajax({
						url : '/approval/lecApplyView',
						type : 'post',
						data : JSON.stringify(data),
						dataType : 'JSON',
						contentType : 'application/json;charset=utf-8',
						success : function(result){
							console.log(result);
							subNm = result.lec.lecaNm;
							classNum = result.lec.subCd;
							depart = result.lec.departmentVO.depNm;
							sem = result.lec.lecaSem;
							gradeNum = result.lec.lecaPer + " / " + result.lec.commonDetailVO.comdNm;
						
							professor = result.lec.memberVO.memNm;
							proBelong = result.lec.collegeVO.colNm + " / " + result.lec.departmentVO.depNm;
							departCall = result.lec.departmentVO.depTel;
							proEmail = result.lec.memberVO.memMl;
							grade = result.lec.lecaCrd;
							classOutline = result.lec.lecaCon;
							midPer = result.lec.criteriaVO.crtrMp;
							finalPer = result.lec.criteriaVO.crtrFp;
							report = result.lec.criteriaVO.crtrTp;
							quiz = result.lec.criteriaVO.crtrQp;
							attend = result.lec.criteriaVO.crtrAp;
							book = result.lec.lecaBook;
							lecApplyDiv = result.lec.lecaCd;
// 							week = result.wee.wpNo;
// 							weekCon = result.wee.wpCon;
						
							$('#subNm').val(subNm);
							$('#classNum').val(classNum);
							$('#depart').val(depart);
							$('#sem').val(sem + "학기");
							$('#gradeNum').val(gradeNum);
							$('#professor').val(professor);
							$('#proBelong').val(proBelong);
							$('#departCall').val(departCall);
							$('#proEmail').val(proEmail);
							$('#grade').val(grade + "학점");
							$('#classOutline').val(classOutline);
							$('#midPer').text(midPer);
							$('#finalPer').text(finalPer);
							$('#report').text(report);
							$('#quiz').text(quiz);
							$('#attend').text(attend);
							$('#book').val(book);
							$('#lecApplyDiv').val(lecApplyDiv);
						
							mgrCdDiv = result.memCd
							$('#mgrCdDiv').val(mgrCdDiv);
							console.log(mgrCdDiv);
						
							var html = '';
						
							$.each(result.wee, function(i, v){
								html += '<table class="table table-bordered table-centered mb-0">';
								html += '<tr>';
								html += '<td style="width:20%;">' + v.wpNo + "주차" +'</td>';
								html += '<td style="width:80%;>' + v.wpCon +'</td>';
								html += '</tr>';
								html += '</table>';
							});
						
							$('#plusDiv').append(html);

							if(result.lec.lecaYn == 1){
								$('#okBut').hide();
								$('#noBut').hide();
							}else{
								$('#okBut').show();
								$('#noBut').show();
								$('#okBut').prop('disabled', false);
								$('#noBut').prop('disabled', false);
							}
						

						}
					});
      		 })
				

			}
		})
	}	
	
	window.onload = function() {
		
		$('#todayDate').val(new Date().toISOString().slice(0, 10));
		
		//지난 1개월로 처음 리스트 가져오기
		$.ajax({
			url : "/approval/dateCalFirst",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(result){
				console.log(result);
				$('#inputDate').val(result.MONTH);
				
				lecaDt = $('#inputDate').val();
				lecaAdt = $('#todayDate').val();
				value= $('input:checkbox[name="aaa"]:checked').data("value");
				
				firstData = {"lecaDt" : lecaDt,
							"lecaAdt" : lecaAdt,
							"value" : value};
				console.log(firstData);
				
				gridStart();

			}
		
		})
		
		//현재날짜 불러오기
		$("#selectId").on("change", function(){
		value = $('#selectId option:selected').val();
	     $.ajax({
	        url : "/approval/dateCalFirst",
	        type : "POST",
	        contentType : "application/json;charset=utf-8",
	        dataType : 'JSON',
	        success : function(result){
	           console.log(result);
	           if(value == 'day'){
	              $('#inputDate').val(result.DAY);
	           }else if(value == 'week'){
	              $('#inputDate').val(result.WEEK);
	           }else if(value == 'month'){
	              $('#inputDate').val(result.MONTH);
	           }else if(value == 'year'){
	              $('#inputDate').val(result.YEAR);
	           }else if(value = 'whole'){
	              $('#inputDate').val("");
	           }
	        }
	        
	     })
		});
		

		
		$('#noBut').on('click', function(){
			proNm = $('#professor').val();
			console.log(proNm);
			var proBelong = $('#proBelong').val();
			console.log(proBelong);
 			var word = proBelong.substring(proBelong.indexOf('/') + 2);
 			console.log(word);
			toText = "[" + word + "] " + proNm
			console.log(toText);
			subNm = $('#subNm').val();
			console.log(subNm);
			lecApplyDiv = $('#lecApplyDiv').val();
			console.log(lecApplyDiv);
			mgrCdDiv = $('#mgrCdDiv').val();
			
			
			
			$('#msgto').val(toText);
			$('#mailsubject').val(subNm);
			$('#lecApplyHidden').val(lecApplyDiv);
			$('#mgrCdHidden').val(mgrCdDiv);
			
			
			//반려사유 저장버튼을 누르는 경우
			$('#saveRsn').on('click', function(){
				lecApplyHidden = $('#lecApplyHidden').val();
				mgrCdHidden = $('#mgrCdHidden').val();
				simplemde1 = $('#simplemde1').val();
				data = {"mgrCd" : mgrCdHidden,
						"lecaCd" : lecApplyHidden,
						"lecaRsn" : simplemde1}
				
				
				if($.trim($('#simplemde1').val()) == ""){
					alert("반려사유 작성은 필수입니다.");
					return false;
				}
				
				$.ajax({
					url : '/approval/approvalNo',
					type : 'post',
					data : JSON.stringify(data),
					dataType : 'JSON',
					contentType : 'application/json;charset=utf-8',
					success : function(result){
						console.log(result);
						
						if(result > 0){
							alert("정상적으로 처리되었습니다");
							document.location.href= document.location.href;
						}
					}
				})

			})
			

	
		})
		
		//승인 버튼을 누르는 경우
		$('#okBut').on('click', function(){
			if(confirm('강의실 배정으로 넘어가시겠습니까?')){
				lecaCd = $('#lecApplyDiv').val();
				console.log(lecaCd);
				popup = window.open("/approval/lecaRoomAssignGet/" + lecaCd, "a", "width=1400, height=900, left=100, top=30"); 
				
				popup.addEventListener('beforeunload', function(){
					console.log("팝업창 닫힘");
					gridStart();
					window.scrollTo({top:0, left:0, behavior:'auto'});
				})
				return true;
			}else{
				alert("다시 처리해주세요");
				return false;
			}
		})
		
	
	//검색버튼을 누르는 경우
	$('#searchBut').on('click', function(){
		$('#grid').empty();
		lecaNote = $('#lecaNote').val();
		lecaNm = $('#lecaNm').val();
		lecaDt = $('#inputDate').val();
		lecaAdt = $('#todayDate').val();
		value= $('input:checkbox[name="aaa"]:checked').data("value");
		console.log(value);
		
		
		var dataObject = {
			"LECA_NOTE" : lecaNote,
			"LECA_NM" : lecaNm,
			"value" : value,
			"lecaDt" : lecaDt,
			"lecaAdt" : lecaAdt
		};
		console.log(dataObject);
		
		//로딩중 화면 띄우기
		loadingWithMask();
		
		//검색을 눌렀을 경우
		$.ajax({
			url : '/approval/mgrLecApprovalList',
			type : 'POST',
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(result){
				$('#cntSpan').text(parseInt(result.length).toLocaleString('ko-KR'));
				console.log(result);
				$('#grid').empty();
				
				$.each(result, function(i,v){
					result[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm lecPlanBtn"  style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd + ',' + v.proCd +')">강의계획서 </button>';
				});
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 500,
					bodyHeight: 250,
					columns : [
 						{header : '기안자 소속', filter : 'select', name : 'lecaTt', width : 200, align : 'center'},
 						{header : '기안자', filter : 'select', name : 'lecaNote', width : 150, align : 'center'},
 						{header : '신청일자', name : 'lecaDt', width : 180, align : 'center'},
 						{header : '검토자 소속', filter : 'select', name : 'lecaRoom', width : 200, align : 'center'},
 						{header : '검토자', filter : 'select', name : 'lecaNm', width : 150, align : 'center'},
 						{header : '결재일자', name : 'lecaAdt', width : 180, align : 'center'},
 						{header : '승인여부', filter : 'select', name : 'lecaCon', align : 'center'},
 						{header : '강의계획서', name : 'btn', align : 'center'}
					],
					rowHeaders: ['rowNum'],
					columnOptions: {
				        resizable: true
					}
				
				});
				
				//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(v1.lecaCon == '승인') {
						grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorBlue");
					}else if(v1.lecaCon == '반려') {
						grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorRed");
					}
				});
				
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(grid.getValue(v1.rowKey, "lecaAdt") == null) {
						grid.setValue(v1.rowKey, "lecaAdt", "-", false);
					}
				});

				
 				grid.on('click', function(object){
 					$('#plusDiv').empty();
 					
 					lecaCd = grid.getRow(object.rowKey).lecaCd;
 					proCd = grid.getRow(object.rowKey).proCd;
					
 					data = {"proCd" : proCd, 
 							"lecaCd" : lecaCd};
					
					
 					$.ajax({
 						url : '/approval/lecApplyView',
 						type : 'post',
 						data : JSON.stringify(data),
 						dataType : 'JSON',
 						contentType : 'application/json;charset=utf-8',
 						success : function(result){
 							console.log(result);
 							subNm = result.lec.lecaNm;
 							classNum = result.lec.subCd;
 							depart = result.lec.departmentVO.depNm;
 							sem = result.lec.lecaSem;
 							gradeNum = result.lec.lecaPer + " / " + result.lec.commonDetailVO.comdNm;
							
 							professor = result.lec.memberVO.memNm;
 							proBelong = result.lec.collegeVO.colNm + " / " + result.lec.departmentVO.depNm;
 							departCall = result.lec.departmentVO.depTel;
 							proEmail = result.lec.memberVO.memMl;
 							grade = result.lec.lecaCrd;
 							classOutline = result.lec.lecaCon;
 							midPer = result.lec.criteriaVO.crtrMp;
 							finalPer = result.lec.criteriaVO.crtrFp;
 							report = result.lec.criteriaVO.crtrTp;
 							quiz = result.lec.criteriaVO.crtrQp;
 							attend = result.lec.criteriaVO.crtrAp;
 							book = result.lec.lecaBook;
 							lecApplyDiv = result.lec.lecaCd;
// 							week = result.wee.wpNo;
// 							weekCon = result.wee.wpCon;
							
 							$('#subNm').val(subNm);
 							$('#classNum').val(classNum);
 							$('#depart').val(depart);
 							$('#sem').val(sem);
 							$('#gradeNum').val(gradeNum);
 							$('#professor').val(professor);
 							$('#proBelong').val(proBelong);
 							$('#departCall').val(departCall);
 							$('#proEmail').val(proEmail);
 							$('#grade').val(grade);
 							$('#classOutline').val(classOutline);
 							$('#midPer').text(midPer);
 							$('#finalPer').text(finalPer);
 							$('#report').text(report);
 							$('#quiz').text(quiz);
 							$('#attend').text(attend);
 							$('#book').val(book);
 							$('#lecApplyDiv').val(lecApplyDiv);
							
 							mgrCdDiv = result.memCd
 							$('#mgrCdDiv').val(mgrCdDiv);
 							console.log(mgrCdDiv);
							
 							var html = '';
							
 							$.each(result.wee, function(i, v){
 								html += '<table class="table table-bordered table-centered mb-0">';
 								html += '<tr>';
 								html += '<td style="width:20%;">' + v.wpNo + "주차" +'</td>';
 								html += '<td style="width:80%;>' + v.wpCon +'</td>';
 								html += '</tr>';
 								html += '</table>';
 							});
							
 							$('#plusDiv').append(html);
	
 							if(result.lec.lecaYn == 1){
 								$('#okBut').hide();
 								$('#noBut').hide();
 							}else{
 								$('#okBut').show();
 								$('#noBut').show();
 								$('#okBut').prop('disabled', false);
 								$('#noBut').prop('disabled', false);
 							}
							

 						}
 					});
          		 })
				
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(grid.getValue(v1.rowKey, "lecaAdt") == null) {
						grid.setValue(v1.rowKey, "lecaAdt", "-", false);
					}
				});

				
          		closeLoadingWithMask();
			}

		})
	})
}

	
</script>
<body>
	<div>
		<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i
			class="dripicons-chevron-right"></i> 결재 <i
			class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획서
			결재</span>
	</div>
	<br>
	<br>
	<p>
		<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;상세
		검색조건
	</p>
	<table border="1" id="detailSearch">
		<tr>
			<th class="tableTh">기간</th>
			<td class="tableTd"><select name="selectId" id="selectId"
				style="width: 150px; height: 30px;">
					<option value="whole">전체</option>
					<option value="day">지난 1일</option>
					<option value="week">지난 1주</option>
					<option value="month" selected="selected">지난 1개월</option>
					<option value="year">지난 1년</option>
			</select> <input type="date" style="width: 150px; height: 30px;"
				id="inputDate" /> <b>~</b> <input type="date" id="todayDate"
				style="width: 150px; height: 30px;" /> &nbsp;&nbsp;&nbsp; <label><input
					type="checkbox" checked data-value="LECA_DT"
					onclick="doOpenCheck(this);" name="aaa"> 기안일기준</label>&nbsp;&nbsp;
				<label><input type="checkbox" data-value="LECA_ADT"
					onclick="doOpenCheck(this);" name="aaa"> 결재일기준</label></td>
		</tr>
		<tr>
			<th class="tableTh">결재라인</th>
			<td class="tableTd">기안자 : <input type="text" class="intext"
				style="height: 30px;" id="lecaNote"><br> 결재자 : <input
				type="text" class="intext" style="margin-top: 5px; height: 30px;"
				id="lecaNm">
			</td>
		</tr>
	</table>
	<button type="button" class="btn btn-secondary btn-sm" id="searchBut" style="float: right;">검색하기</button>
	<br>
	<br>
	<p style="width: 50%; float: left;">
		<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의계획서 결재
	</p>
	<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>
	<div id="grid"></div>
</body>
</html>