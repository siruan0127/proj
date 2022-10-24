<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
#detailView{
    display: inline-block;
    width: 100%;
}
.inputDiv{
    width: 163px;
    height: 30px;
    border: 1px solid lightgray;
    margin: 5px;
    background: #f4f4f4;
}
.detailTh{
    width: 100px;
    text-align: right;
    padding: 8px;
    background: #f4f7fd;
}
#detailTable {
	border : 1px solid lightgray;
}
#etcContent{
	width : 100%;
}
.detailTd{
	background: white;
}

#etcContent{
	background: white;
	width: 100%;
	padding: 10px; 
	border : 1px solid lightgray;
}
#etcContent tr{
	height : 35px;
}

#etcContent th{
	background: #dcdcdc;
}
#etcContent tbody tr:hover {
   	color: #6c757d;
   	background-color: #f1f3fa;
   }
#cntP{
	width: 18%;
    float: right;
    text-align: right;
}
.searchLabel{
	display: inline-block;
    width: 115px;
    float: left;
    height: 37px;
    text-align: center;
    padding: 7px;
}

#stuInfoTable{
	width : 100%;
	border-left: 1px solid #001353;
   border-right: 1px solid #001353;
   border-top: 1px solid #001353;
   border-bottom: 1px solid #001353;
}
#stuInfoTable1{
	width : 100%;
	border-left: 1px solid #001353;
   border-right: 1px solid #001353;
   border-top: 1px solid #001353;
   border-bottom: 1px solid #001353;
}
#stuInfoTable th{
	width : 9%;
	text-align: right;
	padding-right: 10px;
	background: #F3F8FF;
	color : #001353;
}
#stuInfoTable td{
	width: 45px;
	background: #F3F8FF;
}
#stuInfoTable1 th{
	width : 9%;
	text-align: right;
	padding-right: 10px;
	background: #F3F8FF;
	color : #001353;
}
#stuInfoTable1 td{
	width: 45px;
	background: #F3F8FF;
}
.infoText{
   margin: 1px;
   width: 98%;
   height: 28px;
   padding-left : 5px;
   font-size : 0.9em;
   background : white;
   border : 1px solid lightgray;
   border-radius : 0.15em;
}
</style>
<script type="text/javascript" defer="defer">
function noticeBtn(lecCd){
	if (!confirm("평가하지 않은 학생들에게 알림을 보내시겠습니까?")) {
        // 취소(아니오) 버튼 클릭 시 이벤트
        return false;
    } else {
        // 확인(예) 버튼 클릭 시 이벤트
        param = {"lecCd" : lecCd};
        
        $.ajax({
        	url : "/lecEval/notFinishStucd",
    		type : 'POST',
    		data : JSON.stringify(param),
    		contentType : 'application/json;charset=utf-8',
    		dataType : 'JSON',
    		success : function(result) {
    			console.log(result);
    		}
        })
    }
}


$(function(){
	//로딩중 화면 띄우기
	loadingWithMask();
	
	$('#year').on('change', function(){
		var year = $('#year option:selected').val();
		
		if(year == 'wholeYear'){
			$('#sem option[value="wholeSem"]').attr("selected", true);
		}
	})
	
	var proCd = $('#proCdDiv').text();
	var year = 0;
	var sem = 0;
	
	year = $('#year option:selected').val();
	sem = $('#sem option:selected').val();
	
	firstData = {"lecaYr" : year,
				"lecaSem" : sem};
	console.log(firstData);

	//처음 수강강의 보여주기
	$.ajax({
		url : "/lecEval/selectAllLec",
		type : 'POST',
		data : JSON.stringify(firstData),
		contentType : 'application/json;charset=utf-8',
		dataType : 'JSON',
		success : function(result) {
			console.log(result);
			//btn btn-secondary btn-sm
			$.each(result, function(i,v){
				result[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="noticeBtn(' + v.lecCd +')">알림</button>';
			});
			
			console.log(result);
			
			$('#cntSpan').text(parseInt(result.length).toLocaleString('ko-KR'));
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : result,
				scrollX : true,
				scrollY : true,
				minBodyHeight : 500,
				bodyHeight: 250,
				columns : [
					{header : '학수번호', name : 'subCd', filter : 'select', width : 110, align : 'center'},
					{header : '과목명', name : 'lecaNm', filter : 'select', width : 200, align : 'center'},
					{header : '담당교수', name : 'lecaCate', filter : 'select', width : 110, align : 'center'},
					{header : '평가점수', name : 'lecaRoom', filter : 'select',width: 100, align : 'center'},
					{header : '강의평가 고지', name : 'btn', align : 'center'}
				],
				rowHeaders: ['rowNum'],
				columnOptions: {
			        resizable: true
				}

			});
			
			closeLoadingWithMask();
			
			//해당 grid row를 선택했을 경우
			grid.on('click', function(object){
				if(object.columnName == 'btn'){
					return false;
				}else{
					console.log(grid.getRow(object.rowKey));
					var lecCd = grid.getRow(object.rowKey).lecCd;
					var jsonLecCd = {"lecCd" : lecCd}
					
					if(grid.getRow(object.rowKey).lecaRoom == '-'){
						alert("아직 평가되지 않았습니다.");
						
						//기타의견 css 바꾸기
						var etcDiv = document.getElementById('etcDiv');
						etcDiv.style.backgroundColor = '#f4f4f4';
						
						//기타의견 없애기
						$('#etcDiv').empty();
						
						//상세정보 div 없애기
							$('#subCd').val("");
							$('#lecaCate').val("");
							$('#lecaNm').val("");
							$('#depNm').val("");
							$('#colNm').val("");
							$('#memNm').val("");
							$('#stuLecNum').val("");
							$('#stuEvalNum').val("");
					}else{
						$('#etcDiv').empty();
						$.ajax({
							url : "/lecEval/proLecEvalDetail",
							data : JSON.stringify(jsonLecCd),
							type : 'POST',
							contentType : 'application/json;charset=utf-8',
							dataType : 'JSON',
							success : function(result){
								console.log(result);
								//상세정보 div 채우기
		 						$('#subCd').val(result.SUBCD);
		 						$('#lecaCate').val(result.LECACATE);
		 						$('#lecaNm').val(result.LECANM);
		 						$('#depNm').val(result.DEPNM);
		 						$('#colNm').val(result.COLNM);
		 						$('#memNm').val(result.MEMNM);
		 						$('#stuLecNum').val(result.STULECNUM);
		 						$('#stuEvalNum').val(result.STUEVALNUM);
		 						
		 						var min = parseInt(result.STULECNUM);
		 						var max = parseInt(result.STUEVALNUM);
		 						var percent = (Math.round((max / min) * 100) / 100) * 100;
		 						$('#percent').val(percent + " %");
		 						
		 						$.ajax({
		 							url : "/lecEval/selectEctList",
		 							data : JSON.stringify(jsonLecCd),
		 							type : 'POST',
		 							contentType : 'application/json;charset=utf-8',
		 							dataType : 'JSON',
		 							success : function(result){
		 								console.log(result);
		 								
		 								//기타의견 css 바꾸기
		 								var etcDiv = document.getElementById('etcDiv');
		 								etcDiv.style.backgroundColor = 'white';
		 								
		 								var str = '';
			 								str += '<table border = "1" id="etcContent">';
			 								str += '<tr>                                ';
			 								str += '<th style="width: 10%; text-align : center;">No</th> ';
			 								str += '<th style="text-align : center;">의견내용</th>                   ';
			 								str += '</tr>                               ';
		 								$.each(result, function(i, v){
			 								str += '<tr>                                ';
			 								str += '<td style="text-align : center;">'+v.evlScore+'</td>                           ';
			 								str += '<td style="padding-left : 7px;">'+v.evlEtc+'</td>                           ';
			 								str += '</tr>                               ';
		 								})
			 								str += '</table>                            ';


		 								$('#etcDiv').append(str);
		 							}
		 						})
							}
						})
						

					}
				}
				
				
			})
		}
	});
	
	//조회버튼 클릭했을 경우
	$('#searchBtn').on('click', function(){
		
		//로딩중 화면 띄우기
		loadingWithMask();
		
		$('#grid').empty();
		year = $('#year option:selected').val();
		sem = $('#sem option:selected').val();
		proNm = $('#proNmText').val();
		subCd = $('#subCdText').val();
		lecaNm = $('#lecaNmText').val();
		depNm = $('#depnmInput').val();
		lecaGubunSelect = $('#lecaGubunSelect option:selected').val();
		
		if(lecaGubunSelect == 'all'){
			lecaGubun = "";
		}else if(lecaGubunSelect == 'jp'){
			lecaGubun = "전필";
		}else if(lecaGubunSelect == 'js'){
			lecaGubun = "전선"
		}else if(lecaGubunSelect == 'gp'){
			lecaGubun = "교필";
		}else if(lecaGubunSelect == 'gs'){
			lecaGubun = "교선";
		}
		
		if(year == 'wholeYear'){
			year = "";
		}
		
		if(sem == 'wholeSem'){
			sem = "";
		}
		
		$('#year').on('change', function(){
			var result = $('#year option:selected').val();
			
			if(result == ''){
				year = "";
				sem = "";
			}
		})
		
		var data = {"lecaYr" : year,
					"lecaSem" : sem,
					"subCd" : subCd,
					"lecaNm" : lecaNm,
					"lecaNote" : depNm,
					"lecaGubun" : lecaGubun,
					"lecaCate" : proNm}
		
		console.log(data);
		
		//조회버튼 클릭했을 경우 조건에 맞는 수강강의 리스트 가져오기
		$.ajax({
			url : "/lecEval/selectAllLec",
			data : JSON.stringify(data),
			type : 'POST',
			contentType : 'application/json;charset=utf-8',
			dataType : 'JSON',
			success : function(result) {
				
				//btn btn-secondary btn-sm
				$.each(result, function(i,v){
					result[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;">알림</button>';
				});
				
				console.log(result);
				$('#cntSpan').text(parseInt(result.length).toLocaleString('ko-KR'));
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 500,
					bodyHeight: 250,
					columns : [
						{header : '학수번호', name : 'subCd', filter : 'select', width : 110, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 200, align : 'center'},
						{header : '담당교수', name : 'lecaCate', filter : 'select', width : 110, align : 'center'},
						{header : '평가점수', name : 'lecaRoom', filter : 'select',width: 100, align : 'center'},
						{header : '강의평가고지', name : 'btn', align : 'center'}
					],
					rowHeaders: ['rowNum'],
					columnOptions: {
				        resizable: true
					}

				});
				
				closeLoadingWithMask();
				
				//해당 grid row를 선택했을 경우
				grid.on('click', function(object){
					console.log(grid.getRow(object.rowKey));
					var lecCd = grid.getRow(object.rowKey).lecCd;
					var jsonLecCd = {"lecCd" : lecCd}
					
					if(grid.getRow(object.rowKey).lecaRoom == '-'){
						alert("아직 평가되지 않았습니다.");
						
						//기타의견 없애기
						$('#etcDiv').empty();
						
						//상세정보 div 없애기
 						$('#subCd').val("");
 						$('#lecaCate').val("");
 						$('#lecaNm').val("");
 						$('#depNm').val("");
 						$('#colNm').val("");
 						$('#memNm').val("");
 						$('#stuLecNum').val("");
 						$('#stuEvalNum').val("");
					}else{
						$('#etcDiv').empty();
						$.ajax({
							url : "/lecEval/proLecEvalDetail",
							data : JSON.stringify(jsonLecCd),
							type : 'POST',
							contentType : 'application/json;charset=utf-8',
							dataType : 'JSON',
							success : function(result){
								console.log(result);
								//상세정보 div 채우기
		 						$('#subCd').val(result.SUBCD);
		 						$('#lecaCate').val(result.LECACATE);
		 						$('#lecaNm').val(result.LECANM);
		 						$('#depNm').val(result.DEPNM);
		 						$('#colNm').val(result.COLNM);
		 						$('#memNm').val(result.MEMNM);
		 						$('#stuLecNum').val(result.STULECNUM);
		 						$('#stuEvalNum').val(result.STUEVALNUM);
		 						
		 						var min = parseInt(result.STULECNUM);
		 						var max = parseInt(result.STUEVALNUM);
		 						var percent = (max / min) * 100;
		 						$('#percent').val(percent + " %");
		 						
		 						$.ajax({
		 							url : "/lecEval/selectEctList",
		 							data : JSON.stringify(jsonLecCd),
		 							type : 'POST',
		 							contentType : 'application/json;charset=utf-8',
		 							dataType : 'JSON',
		 							success : function(result){
		 								console.log(result);
		 								
		 								//기타의견 css 바꾸기
		 								var etcDiv = document.getElementById('etcDiv');
		 								etcDiv.style.backgroundColor = 'white';
		 								
		 								var str = '';
			 								str += '<table border = "1" id="etcContent">';
			 								str += '<tr>                                ';
			 								str += '<th style="width: 10%; text-align : center;">No</th> ';
			 								str += '<th style="text-align : center;">의견내용</th>                   ';
			 								str += '</tr>                               ';
		 								$.each(result, function(i, v){
			 								str += '<tr>                                ';
			 								str += '<td style="text-align : center;">'+v.evlScore+'</td>                           ';
			 								str += '<td style="padding-left : 7px;">'+v.evlEtc+'</td>                           ';
			 								str += '</tr>                               ';
		 								})
			 								str += '</table>                            ';


		 								$('#etcDiv').append(str);
		 							}
		 						})
							}
						})
						

					}
				})
			}
		})
	})
	

})
</script>
</head>
<body>
<div>
	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 평가 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의평가</span>
</div>
<br><br>
<p style="width : 39%; display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353; "></i>&ensp;상세 검색조건</p><br>

<table id="stuInfoTable">
	<tr>
		<td colspan="7" style="background: #F3F8FF; height: 10px;"></td>
	</tr>
	<tr>
		<th>기간</th>
		<td>
			<select class="infoText" name="year" id="year" style="width : 130px; float: left;">
				<option value="wholeYear">전체</option>
				<option value="2022" selected="selected">2022</option>
				<option value="2021">2021</option>
				<option value="2020">2020</option>
				<option value="2019">2019</option>
				<option value="2018">2018</option>
			</select>
			<select class="infoText" name="sem" id="sem" style="width : 130px;">
				<option value="wholeSem">전체</option>
				<option value="1">1학기</option>
				<option value="2" selected="selected">2학기</option>
			</select>
		</td>
		<th>담당교수</th>
		<td>
			<input type="text" class="infoText" style="width: 260px;" id="proNmText">
		</td>
		<th>이수구분</th>
		<td>
			<select class="infoText" style="width: 260px;" id="lecaGubunSelect">
				<option value="all" selected="selected">전체</option>
				<option value="jp">전필</option>
				<option value="js">전선</option>
				<option value="gp">교필</option>
				<option value="gs">교선</option>
			</select>
		</td>
		<th></th>
	</tr>
	<tr>
		<td colspan="7" style="background: #F3F8FF; height: 5px;"></td>
	</tr>
	<tr>
		<th>학수번호</th>
		<td>
			<input type="text" class="infoText" style="width: 260px;" id="subCdText">
		</td>
		<th>과목명</th>
		<td>
			<input type="text" class="infoText" style="width: 260px;" id="lecaNmText" placeholder="미입력시 전체조회">
		</td>
		<th>학과</th>
		<td colspan = "2">
			<input type="text" class="infoText" id="depnmInput" style="width: 260px; float: left;">
			<button type="button" class="btn btn-secondary" style="height: 28px; margin-left: 52px;" id="searchBtn"><p style="margin-top: -4px;">조회</p></button>
		</td>
		<th></th>
	</tr>
	<tr>
		<td colspan="7" style="background: #F3F8FF; height: 10px;"></td>
	</tr>
</table>
<br><br>

<div  style="width : 45%; float: left;">
<p style="width : 39%; display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353; "></i>&ensp;수강강의</p>
<p id = "cntP">총 <span style="color : #00008C; font-weight: bold;" id="cntSpan"></span> 건</p>
<div id="grid"></div>
</div>
<div style="float: left; display: inline-block; margin-left: 34px;">
<p style=" float: left; width: 130px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;상세조회</p>
<div style="clear: both;"></div>
<div id="detailView">
<table border="1" id="detailTable">
<tr>
	<th class="detailTh">대학</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="colNm" disabled></td>
	
	<th class="detailTh">학과</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="depNm" disabled></td>
	<th class="detailTh">담당교수</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="memNm" disabled></td>
</tr>
<tr>
	<th class="detailTh">교과목명</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="lecaNm" disabled></td>
	<th class="detailTh">학수번호</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="subCd" disabled></td>
	<th class="detailTh">이수구분</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="lecaCate" disabled></td>
</tr>
<tr>
	<th class="detailTh">수강생수</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="stuLecNum" disabled></td>
	<th class="detailTh">응답자수</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="stuEvalNum" disabled></td>
	<th class="detailTh">응답비율</th>
	<td class="detailTd"><input type="text" class="inputDiv" id="percent" disabled></td>
</tr>
</table>
</div>
<br><br>
<div>
<p style=" float: left; width: 130px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;기타의견</p>
<br><br>
<div style="height: 326px;" data-simplebar>
<div id="etcDiv" style="border : 1px solid lightgray; height: 326px; background: #f4f4f4;">
</div>
</div>
</div>
</div>
</body>
</html>