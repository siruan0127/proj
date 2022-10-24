<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획조회</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
#tgradeYellowBox, #courseInfo {
	border : 1px solid lightgray;
}
#courseInfo{
	margin : 10px;
}
#tgradeYellowBox {
	background : lightyellow;
	padding : 10px;
	margin:5px;
}
label {
	margin : 10px;
}
#tgradeGreenText {
	color : green;
}
#coursePreListRound{
	width : 100%;
}
#courseInfo {
	border: 1px solid #001353;
	padding: 10px;
	background: #F3F8FF;
	width: 100%;
	min-width: 1200px;
	max-width: 1700px;
	margin: 0 auto;
	border-radius : 10px;
}

#courseInfo input, select {
	width: 160px;
	height: 33px;
	background: #F9F9F9;
	border: 1px solid gray;
	border-radius: 5px;
	padding-left: 5px;
	text-align: center;
}

#courseInfo label {
	text-align: right;
	margin-right : 15px;
}

#courseInfo div {
	display: inline-block;
	margin-left:15px;
}
.round:last-child{
	float:right;
	margin-right : 40px;
}
#courseInfo span {
	margin-left: 15px;
}

#courseInfo button {
	margin-left: 14px;
}
#coursePreListSelect{
	display:inline-block;
}
#grid{
	margin-bottom : 50px;
}
#grid td {
	background: #f9f9f9;
}
</style>
</head>
<script type="text/javascript" defer="defer">

	var gridData;
	var grid;

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
		
		//개설학과 불러오기
		$.ajax({
			url : "/course/department",
			type : "GET",
			dataType : "JSON",
			success : function(res) {
				str = '';
				
				$.each(res, function(i, v) {
					str += '<option value="' + v + '">' + v + '</option>';
				});
				
				$('#department').append(str);
			}
		});
		
		//과목번호 및 과목명 입력 후 엔터키를 눌러도 조회 버튼 클릭으로 연결됨
		var inputSubject = document.getElementById("subject");
		
		inputSubject.addEventListener("keyup", function(event) {
	      if(event.keyCode === 13) {
	        event.preventDefault();
	        document.getElementById("btn2GetList").click();
	      }
	    });
		
		//당학기 리스트 가져오기
		year = $('#year').val();
		semester = $('#semester').val();
		
		let dataObject = {
			year :  year,
			semester : semester
		};
		
		$.ajax({
			url : "/course/getList",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				
				//강의계획서 버튼 만들기
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;"  onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd +')">강의계획서</button>';
				});
				
				//grid에 리스트 출력하기
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 400,
					columns : [
						{header : '개설학과', name : 'lecaCon', filter : 'select', width:150, align : 'center'},
						{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
						{header : '과목번호', name : 'subCd', filter : 'select', width : 100, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 260},
						{header : '제한인원', name : 'lecaMax', width : 100, align : 'center'},
						{header : '수강인원', name : 'lecaUnit', width : 100, align : 'center'},
						{header : '개설이수구분', name : 'lecaCate', width :110, align : 'center'},
						{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
						{header : '강의시간/강의실', name : 'lecaTt', width : 310},
						{header : '담당교수', name : 'proNm', width : 80, align : 'center'},
						{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
						{header : '강의계획서', name : 'btn', width : 120, align : 'center'}
					],
					columnOptions: {
				        resizable: true
				    }
				});
				
				//로딩중 화면 사라지기
				closeLoadingWithMask();
			}
		});
		
		//버튼 눌러서 검색 리스트 불러오기
		$('#btn2GetList').on('click', function() {
			
			year = $('#year').val();
			semester = $('#semester').val();
			department = $('#department').val();
			category = $('#category').val();
			subject = $('#subject').val();
			
			let dataObject = {
				year :  year,
				semester : semester,
				department : department,
				category : category,
				subject : subject
			};
			
			$.ajax({
				url : "/course/getListAgain",
				type : "POST",
				data : JSON.stringify(dataObject),
				contentType : "application/json;charset=utf-8",
				dataType : 'JSON',
				success : function(res) {
					$('#grid').empty();
					
					$.each(res, function(i,v){
						res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd + ')">강의계획서</button>';
					});
					
					grid = new tui.Grid({
						el : document.getElementById('grid'),
						data : res,
						scrollX : true,
						scrollY : true,
						bodyHeight : 400,
						columns : [
							{header : '개설학과', name : 'lecaCon', filter : 'select', width:110, align : 'center'},
							{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
							{header : '과목번호', name : 'subCd', filter : 'select', width : 100, align : 'center'},
							{header : '과목명', name : 'lecaNm', filter : 'select', width : 200},
							{header : '제한인원', name : 'lecaMax', width : 80, align : 'center'},
							{header : '수강인원', name : 'lecaUnit', width : 90, align : 'center'},
							{header : '개설이수구분', name : 'lecaCate', width :120, align : 'center'},
							{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
							{header : '강의시간/강의실', name : 'lecaTt', width : 300},
							{header : '담당교수', name : 'proNm', width : 90, align : 'center'},
							{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
							{header : '강의계획서', name : 'btn', width:70, align : 'center'}
						],
						columnOptions: {
					        resizable: true
					    }
					});
				}
			});
			
		});
	}
</script>
<body>
<div id="coursePreListRound">

    <div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 강의정보 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획조회</span>
  	</div>
  	 <br><br>
    <div id = "courseInfo">
    	<div class="round">
			<label>년도</label>
				<select name="year" id="year">
					<option value="${thisYearMap.YEAR}">${thisYearMap.YEAR}</option>
				</select>
		</div>
		<div class="round">
			<label>학기</label>
				<select name="semester" id="semester">
					<option value="${thisYearMap.SEMESTER}">${thisYearMap.SEMESTER}학기</option>
				</select>
		</div>
		<div class="round">
			<label>학과전공</label>
			<select name="department" id="department">
				<option value="">전체</option>
			</select>
		</div>
		<div class="round">
			<label>이수구분</label>
				<select name="category" id="category">
					<option value="">전체</option>
					<option value="전필">전공필수(전필)</option>
					<option value="전선">전공선택(전선)</option>
					<option value="교필">교양필수(교필)</option>
					<option value="교선">교양선택(교선)</option>
				</select>
		</div>
		<div class="round">
			<label>과목번호/명</label>
			<input type="text" name="subject" id="subject"> 미입력시 전체 조회
		</div>
		<button type="button" class="btn btn-secondary" id="btn2GetList">조회</button>
	</div>
	
	<br><br>
	
	<p id="coursePreListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의계획조회</p>
	
	<div id="tgradeYellowBox">
		<span id="tgradeGreenText"><i class="mdi mdi-square-medium"></i>&emsp;이전 학기의 경우 <b>수강편람</b>에서 조회할 수 있습니다.</span>
	</div>
	
	<br>
	
	<div id="grid"></div>
</div>
</body>
</html>