<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
.addFontColorRed {
	color: rgb(225, 39, 64);
}
.addFontColorBlue {
	color : blue;
}
</style>
</head>
<script type="text/javascript" defer="defer">
var gridData;
var grid;
var memCd = $('#memCdHidden').val();

//강의 계획서 버튼을 클릭했을 경우 해당 강의계획서 띄우기
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
	})
}	

	window.onload = function() {
		
		//전체 리스트 가져오기
		$.ajax({
			url : "/approval/proApprovalList",
			type : 'GET',
			dataType : 'JSON',
			success : function(result) {
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
						{header : '과목명', name : 'lecaNm', width : 230, align : 'center'},
						{header : '년도', name : 'lecaBook', filter : 'select', width : 140, align : 'center'},
						{header : '학기', name : 'lecaNote', filter : 'select', width : 140, align : 'center'},
						{header : '결재문서유형', name : 'lecaRoom', width : 160, align : 'center'},
						{header : '등록일자', name : 'lecaDt', width : 200, align : 'center'},
						{header : '승인일자', name : 'lecaAdt', width : 200, align : 'center'},
						{header : '결재상태', name : 'lecaCon', filter : 'select', width : 140, align : 'center'},
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
				
				
			    //반려내역 가져오기
			    $.ajax({
			       url : "/approval/returnHistory",
			       type : 'POST',
			       dataType : 'JSON',
			       success : function(res){
			          console.log(res);
			          grid1 = new tui.Grid({
			             el : document.getElementById('grid1'),
			             data : res,
			             scrollX : true,
			             scrollY : true,
			             minBodyHeight : 150,
			             bodyHeight: 250,
			             columns : [
			                {header : '년도', name : 'lecaBook',filter : 'select',width : 100,align : 'center'},
			                {header : '학기', name : 'lecaNote',filter : 'select',width : 100,align : 'center'},
			                {header : '등록일자', name : 'lecaDt', width : 150, align : 'center'},
			                {header : '승인일자', name : 'lecaAdt', width : 150, align : 'center'},
			                {header : '과목명', name : 'lecaNm', width : 200, align : 'center'},
			                {header : '결재상태', name : 'lecaCon', width : 80, align : 'center'},
			                {header : '반려사유', name : 'apprRsn',align : 'center'}
			               
			             ],
			             rowHeaders: ['rowNum'],
			             columnOptions: {
			                  resizable: true
			              }
			          });
			       }
			    });

				
				}
				
		

		});
		
	      

}

	
</script>
<body>

	<div>
		<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 결재 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획서 결재</span>
	</div>
	<input type="hidden" id="memCdHidden" value="${memCd}" />
	<br><br>
	<p>
		<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;결재내역
	</p>
	<div id="grid"></div>

	<br>
	<br>

	<p>
		<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;반려내역
	</p>
	<div id="grid1"></div>
</body>
</html>