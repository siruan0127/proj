/**
 * 학생, 교수 관리 js
 */

// (관리자) 전체 학생 목록 출력
function getStuList(){
	$.ajax({
			url : "/management/getStuList",
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
// 				console.log(result);

				$('#spancnt').text(parseInt(result.length).toLocaleString('ko-KR'));
				
				var data = [];
				
				$.each(result, function(i, v){
					var temp = {};
					$.each(Object.keys(v), function(i1, v1){
						if(v1 != 'memberVO'){
							temp[v1] = v[v1];
						}
					});
					$.each(v.memberVO, function(i1, v1){
						temp[i1] = v.memberVO[i1];
					});
					$.each(v.studentVO, function(i1, v1){
						temp[i1] = v.studentVO[i1];
					});
					$.each(v.studentVO.departmentVO, function(i1, v1){
						temp[i1] = v.studentVO.departmentVO[i1];
					});
					$.each(v.studentVO.departmentVO.collegeVO, function(i1, v1){
						temp[i1] = v.studentVO.departmentVO.collegeVO[i1];
					});
					
					data.push(temp);
				});
				
				
				$('#grid').empty();
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : data,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 500,
					bodyHeight: 250,
					width : 700,
					columns : [
						{header : '단과대학', name : 'colNm', filter : 'select', width : 130, align : 'center'},
						{header : '소속', name : 'depNm', filter : 'select',width : 120, align : 'center'},
						{header : '학년', name : 'stuYr', filter : 'select', width : 70, align : 'center'},
						{header : '학번', name : 'memCd',  width : 110, align : 'center'},
						{header : '이름', name : 'memNm', filter : 'select', width : 100, align : 'center'},
						{header : '연락처', name : 'memTel',  align : 'center'},
					],
					rowHeaders: ['rowNum'],
					columnOptions: { resizable: true }
				});
				
				closeLoadingWithMask();
				
				 grid.on('click', function(object){
					 $('#memFnm').empty();
					 $('#memFnm').append('<input type="text" style="height: 188px;" readonly>');
	                 var memCd = grid.getRow(object.rowKey).memCd;
	                 console.log(memCd);
					
	                 stuDetail(memCd, object);
           		});
				
			}
		});
}

// (관리자) 전체 교수 목록 출력
function getProList(){
	$.ajax({
			url : "/management/getProList",
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
// 				console.log(result);
				
				$('#spancnt').text(parseInt(result.length).toLocaleString('ko-KR'));
				
				var data = [];
				
				$.each(result, function(i, v){
					var temp = {};
					$.each(Object.keys(v), function(i1, v1){
						if(v1 != 'memberVO'){
							temp[v1] = v[v1];
						}
					});
					$.each(v.memberVO, function(i1, v1){
						temp[i1] = v.memberVO[i1];
					});
					$.each(v.professorVO, function(i1, v1){
						temp[i1] = v.professorVO[i1];
					});
					$.each(v.professorVO.departmentVO, function(i1, v1){
						temp[i1] = v.professorVO.departmentVO[i1];
					});
					$.each(v.professorVO.departmentVO.collegeVO, function(i1, v1){
						temp[i1] = v.professorVO.departmentVO.collegeVO[i1];
					});
					
					data.push(temp);
				});
				
				
				$('#grid').empty();
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : data,
					scrollX : true,
					scrollY : true,
					bodyHeight: 410,
					width : 700,
					columns : [
						{header : '단과대학', name : 'colNm', filter : 'select', width : 130, align : 'center'},
						{header : '소속', name : 'depNm', filter : 'select', width : 120, align : 'center'},
						{header : '직책', name : 'proPos', filter : 'select', width : 70, align : 'center'},
						{header : '교번', name : 'memCd', width : 110, align : 'center'},
						{header : '이름', name : 'memNm', filter : 'select', width : 100, align : 'center'},
						{header : '연락처', name : 'memTel', align : 'center'},
					],
					rowHeaders: ['rowNum'],
					columnOptions: { resizable: true }
				});
				
				closeLoadingWithMask();
				
				 grid.on('click', function(object){
					 $('#memFnm').empty();
					 $('#memFnm').append('<input type="text" style="height: 188px;" readonly>');
	                 var memCd = grid.getRow(object.rowKey).memCd;
	                 console.log(memCd);

					proDetail(memCd, object)
           		});
				
			}
		});
}

// (교수) 교수 학과에 해당하는 학생 목록 출력
function getProStuList(){
	$.ajax({
		url : "/management/getProStuList",
		type : 'post',
		dataType : 'JSON',
		success : function(result) {
			console.log(result);
			
			$('#spancnt').text(parseInt(result.length).toLocaleString('ko-KR'));
			
			var data = [];
			
			$.each(result, function(i, v){
				var temp = {};
				$.each(Object.keys(v), function(i1, v1){
					if(v1 != 'memberVO'){
						temp[v1] = v[v1];
					}
				});
				$.each(v.memberVO, function(i1, v1){
					temp[i1] = v.memberVO[i1];
				});
				$.each(v.studentVO, function(i1, v1){
					temp[i1] = v.studentVO[i1];
				});
				$.each(v.studentVO.departmentVO, function(i1, v1){
					temp[i1] = v.studentVO.departmentVO[i1];
				});
				$.each(v.studentVO.departmentVO.collegeVO, function(i1, v1){
					temp[i1] = v.studentVO.departmentVO.collegeVO[i1];
				});
				
				data.push(temp);
			});
			
			
			$('#grid').empty();
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : data,
				scrollX : true,
				scrollY : true,
				minBodyHeight : 500,
				bodyHeight: 250,
				width : 700,
				columns : [
					{header : '단과대학', name : 'colNm', filter : 'select', width : 100, align : 'center'},
					{header : '소속', name : 'depNm', filter : 'select',width : 110, align : 'center'},
					{header : '학년', name : 'stuYr', filter : 'select', width : 70, align : 'center'},
					{header : '학번', name : 'memCd',  width : 100, align : 'center'},
					{header : '이름', name : 'memNm', filter : 'select', width : 80, align : 'center'},
					{header : '연락처', name : 'memTel', width : 100,  align : 'center'},
					{header : '담당여부', name : 'proStu',  filter : 'select', align : 'center'},
				],
				rowHeaders: ['rowNum'],
				columnOptions: { resizable: true }
			});
			
			closeLoadingWithMask();
			
			 grid.on('click', function(object){
				 $('#memFnm').empty();
				 $('#memFnm').append('<input type="text" style="height: 188px;" readonly>');
                 var memCd = grid.getRow(object.rowKey).memCd;
                 console.log(memCd);

				stuDetail(memCd, object)
       		});
			
		}
	});

}

// 학생의 상세 정보 출력
function stuDetail(memCd, object){
	$.ajax({
			url : "/management/stuDetail",
			data : { "memCd" : memCd },
			type : 'post',
			success : function(result) {
				console.log(JSON.stringify(result));
                 $('#no').val(grid.getRow(object.rowKey)._attributes.rowNum);
                 $('#recCate').val(result.studentVO.recCate);
                 $('#colDepNm').val(result.studentVO.departmentVO.collegeVO.colNm + " " + result.studentVO.departmentVO.depNm);
                 $('#stuPronm').val(result.studentVO.stuPronm);
                 if(result.memFnm != null){
                	 $('#memFnm').empty();
	                 $('#memFnm').append('<img id="memFnm" src="/resources/profileImg/' + result.memFnm + '" style="height:188px">');
                 }
                 $('#stuYrSem').val(result.studentVO.stuYr + "학년" + "(" + result.studentVO.stuSem + "학기)");
                 $('#memCd').val(result.memCd);
                 $('#memNmNE').val(result.memNm + " / " + result.memNme);
                 $('#first').val(result.first);
                 $('#memTel').val(result.memTel);
                 $('#memMl').val(result.memMl);
                 $('#memZip').val(result.memZip);
                 $('#memAddr').val(result.memAddr1 + " " + result.memAddr2);
                 $('#memBank').val(result.memBank);
                 if(result.memAct != null && result.memDepo != null){
	                 $('#memDepoAct').val(result.memAct + "(" + result.memDepo + ")");
                 }
                 $('#stuMrc').val(result.studentVO.stuMrc + "학점 / " + result.studentVO.departmentVO.depMrc + "학점");
                 $('#stuMoc').val(result.studentVO.stuMoc + "학점 / " + result.studentVO.departmentVO.depMoc + "학점");
                 $('#stuCrc').val(result.studentVO.stuCrc + "학점 / " + result.studentVO.departmentVO.depCrc + "학점");
                 $('#stuCoc').val(result.studentVO.stuCoc + "학점 / " + result.studentVO.departmentVO.depCoc + "학점");
			},
			dataType : 'json'
		});
}

// 교수의 상세 정보 출력
function proDetail(memCd, object){
	$.ajax({
			url : "/management/proDetail",
			data : { "memCd" : memCd },
			type : 'post',
			success : function(result) {
				console.log(JSON.stringify(result));
		         $('#no').val(grid.getRow(object.rowKey)._attributes.rowNum);
		         if(result.memFnm != null){
		        	 $('#memFnm').empty();
		             $('#memFnm').append('<img id="memFnm" src="/resources/profileImg/' + result.memFnm + '" style="height:188px">');
		         }
		         if(result.professorVO.proRet == null){
		             $('#recCate').val("재직");
		         }else{
		             $('#recCate').val("퇴직");
		         }
		         $('#colDepNm').val(result.professorVO.departmentVO.collegeVO.colNm + " " + result.professorVO.departmentVO.depNm);
		         $('#proPos').val(result.professorVO.proPos);
		         $('#memCd').val(result.memCd);
		         $('#memNmNE').val(result.memNm + " / " + result.memNme);
		         $('#proJoin').val(result.professorVO.proJoin);
		         if(result.professorVO.proRet != null){
		             $('#proRet').val(result.professorVO.proRet);
		         }
		         $('#memTel').val(result.memTel);
		         $('#memMl').val(result.memMl);
		         $('#memZip').val(result.memZip);
		         $('#memAddr').val(result.memAddr1 + " " + result.memAddr2);
		         $('#memBank').val(result.memBank);
		         $('#memDepoAct').val(result.memAct + "(" + result.memDepo + ")");
			},
			dataType : 'json'
		});

}