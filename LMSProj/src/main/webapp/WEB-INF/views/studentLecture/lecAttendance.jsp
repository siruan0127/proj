<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		border-radius: 10px 10px 0 0 ;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		padding-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */
	
	#bodyWrapper {
		padding: 2% 0;
		width: 100%;
	    min-width: 900px;
	    max-width: 1300px;
	    margin: 0 auto;
	}
	
	.clear {
		clear: both;
	}
	
	.topBorder {
		border-top: 2px solid #112a63;
	}
	
	.lecApplyName {
		margin-bottom: 20px;
		width: 300px;
		float: left;
	}
	
	.attenTopWrap{
		min-height: 480px;
	    box-sizing: border-box;
	    width: 100%;
	}
	
	.attenBotWrap td {
		padding: 4px;
		text-align: center;
/* 		background: #f4f7fd; */
	}
	
	.attenBotWrap input[type=text] {
		text-align: center;
	}
	
	.attenBotWrap table {
		border: 1px solid #9b9b9b;
		width: 100%;
	}
	
	
	.informDetailBot {
/* 		border-bottom: 1px solid #9b9b9b; */
	}
	
	.informDetailBot table {
		border: 1px solid #9b9b9b;
		width: 100%;
		border: 1px solid #e0e0e0;
	}
	
	.informDetailBot table tbody > tr {
		height: 40px;
	}
	
	.W {
		background: #fff !important;
	}
	
	.H {
		height: 30px;
	}
	
	.attendSelect::-ms-expand { 
		display: none;
	}
	
	.attendSelect {
	  -o-appearance: none;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.1rem !important;
	}
	
	.attendSelect {
	  width: 41px;
	  height: 27px;
 	  padding: 0 13px; 
	  border-radius: 4px;
	  outline: 0 none;
	  color: #777;
	}
	.attendSelect option {
	  background: #fff;
	  color: #333;
	  padding: 3px 0;
	}
	
	.inputCustum {
		width: 30px;
	    border: none;
	    background: transparent;
	}
	
	.f9 {
		background: #f9f9f9 !important;
		border-radius: 0.1rem;
	}
	
	.informDetailBot table {
		border-top: none;
}
	
	.fitTable {
		border-top: 1px solid #9b9b9b;
	}
	
	.navTable {
		border-top: 2px solid #112a63;
		height: 42px;
		font-size: 1.02em;
		background: #e0e0e0;
		color: #333;
	}
	
	.attIcon {
		margin-right: 10px;
	}
	
	.OtherChapter, .firstChapter {
		font-weight: 700;
	}
	
	.attendInfoWrap {
		display : inline-block;
		float : left;
		font-size: 1.2em;
	}
	
	.attendInfoWrapRight {
		display : inline-block;
		float : right;
	}
	
	.attendInfoWrap:not(:last-child):after {
		content: "|";
		color: #bbb;
		margin: 0 10px;	
	}
	
	.topBorder {
		border-top: 2px solid #112a63;
	}
	
</style>

<script type="text/javascript" defer="defer">
	$(function() {
		
		var lateCnt = $('#atenLate').val();
		var AbsentCnt = $('#atenAbsent').val();
		
		var cnt = parseInt(lateCnt/3) + parseInt(AbsentCnt);
		
		$('#totalAbsent').html(cnt);
		
		var stuCd = $('#memCd').val();
		var lecCd = $('#lecCd').val();
		var lecaCd = $('#lecaCd').val();
		
		// 출결 ajax
		$.ajax({
			url : "/studentLecture/getStuAttend",
			data : {
				"stuCd" : stuCd,
				"lecCd"	: lecCd
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				$.each(result, function(i1,v1) {
					console.log(" 주차 : " + v1.atenWk + " 차시 : " + v1.atenHr + " 현황 : " + v1.atenCate );
					
					// 1주차 값 넣어주기
					$.each($('.firstChapter'), function(i2, v2) {
						if($(this).data('wh') == (v1.atenWk + "_" + v1.atenHr)) {
							console.log("같은거 " + $(this).data('wh') + "/" + (v1.atenWk + "_" + v1.atenHr))
							$(this).html(v1.atenCate);
						
							if($(this).text() == 'A101') {
								$(this).html('<i class="mdi mdi-check-circle attIcon come" ></i>출석');
								$(this).css('background','#e1f5fe')
										.css('color','#0d47a1')
										.css('font-size','1.2em;');
							}else if($(this).text() == 'A102') {
								$(this).html('<i class="mdi mdi-alert attIcon late" ></i>지각');
								$(this).css('background','#fff8e1')
										.css('color','#f57f17')
										.css('font-size','1.2em;');
							}else if($(this).text() == 'A103') {
								$(this).html('<i class="mdi mdi-close-circle attIcon noCome" ></i>결석');
								$(this).css('background','#ffebee')
										.css('color','#b71c1c')
										.css('font-size','1.2em;');
							}else if($(this).text() == 'A104'){
								$(this).html('<i class="mdi mdi-check-underline-circle attIcon reasonNocome" ></i>공결');
								$(this).css('background','#e8f5e9')
								.css('color','#1b5e20')
								.css('font-size','1.2em;');
							}
						}
						
					})
					
					// n주차 값 넣어주기
					$.each($('.OtherChapter'), function(i3, v3) {
// 						console.log("OtherChapter의 data : " + $(this).data('wh'));
						
						if($(this).data('wh') == (v1.atenWk + "_" + v1.atenHr)) {
							$(this).html(v1.atenCate);
							
							if($(this).text() == 'A101') {
								$(this).html('<i class="mdi mdi-check-circle attIcon come" ></i>출석');
								$(this).css('background','#e1f5fe')
										.css('color','#0d47a1')
										.css('font-size','1.2em;');
							}else if($(this).text() == 'A102') {
								$(this).html('<i class="mdi mdi-alert attIcon late" ></i>지각');
								$(this).css('background','#fff8e1')
										.css('color','#f57f17')
										.css('font-size','1.2em;');
							}else if($(this).text() == 'A103') {
								$(this).html('<i class="mdi mdi-close-circle attIcon noCome" ></i>결석');
								$(this).css('background','#ffebee')
										.css('color','#b71c1c')
										.css('font-size','1.2em;');
							}else if($(this).text() == 'A104') {
								$(this).html('<i class="mdi mdi-check-underline-circle attIcon reasonNocome" ></i>공결');
								$(this).css('background','#e8f5e9')
									.css('color','#1b5e20')
									.css('font-size','1.2em;');
							}
						}
					})
					
				})
				
			}
		})
		
		
		// 학습목표 ajax
		$.ajax({
			url : "/studentLecture/getWeekCon",
			data : {
				"lecaCd" : lecaCd
			},
			type : 'post',
			dataType : 'json',
			success : function(result) {

				console.log("result : " + result);
				
				$.each(result, function(i,v) {
					
					console.log(" 주차 : " + v.wpNo + " 제목 : " + v.wpCon );
					$.each($('.weekGoal'), function(i4, v4) {
						if($(this).data('week') == v.wpNo)
							$(this).html(v.wpCon);
						
							if($(this).data('week') == 8) {
								$(this).css('font-weight','700');
							}else if($(this).data('week') == 16) {
								$(this).css('font-weight','700');
							}
					})
				})
			}
	})
})

</script>

<input type="hidden" id="lecCd" value="${data.lecCd }" />
<input type="hidden" id="lecaCd" value="${data.lecaCd }" />
<input type="hidden" id="memCd" name="stuCd" class="form-control f9" value="${memInfo.memCd }"/>
<input type="hidden" id="atenCome" class="form-control f9" disabled placeholder="출석일수가 보여집니다." value="${attenCnt.atenCome }" />
<input type="hidden" id="atenLate" class="form-control f9" disabled placeholder="지각일수가 보여집니다." value="${attenCnt.atenLate }"/>
<input type="hidden" id="atenAbsent" class="form-control f9" disabled placeholder="결석일수가 보여집니다." value="${attenCnt.atenAbsent }"/>
<input type="hidden" id="atenOfiAbsent" class="form-control f9" disabled placeholder="공결일수가 보여집니다." value="${attenCnt.atenOfiAbsent }"/>
<input type="hidden" id="memNm" class="form-control f9" value="${memInfo.memNm }"/>
<!-- 출결 -->
<div class="col-lg-12">
	<div class="card" style="min-height: 700px;padding-bottom: 15%;">
		<div class="card-body">
				<h4	class="lecApplyName">${data.lecaNm }&emsp;&#45;&emsp;출결 현황</h4>
				
				<div class="attenBotWrap">
<!-- 						<p style="margin-top: 30px;display: inline-block;float: left;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강생 출결 정보</p> -->
<!-- 						<p style="margin-top: 29px;display: inline-block;float: right;width: 26%;height: 24px;"> -->
<!-- 							<span style="float: left;"> -->
<!-- 								<span class="badge badge-outline-danger">총 결석일</span>&emsp; -->
<!-- 								<span id="totalAbsent" style="line-height: 24px;color: #fa5c7c;font-weight: 700;">-</span>&nbsp;일 -->
<!-- 							</span> -->
<!-- 							<span style="font-size: 0.9em;float: left;line-height: 28px;color: #999;margin-right: 22px;">지각/조퇴 3회는 결석 1회로 산정됨</span> -->
<!-- 						</p> -->
						<!-- 학생 정보 -->
						<div class="informDetailTop clear">
							<p class="attendInfoWrap">출석<span style="color: #0d47a1;font-weight: 700">&nbsp;${attenCnt.atenCome }</span></p>
							<p class="attendInfoWrap">지각<span style="color: #f57f17;font-weight: 700">&nbsp;${attenCnt.atenLate }</span></p>
							<p class="attendInfoWrap">결석<span style="color: #b71c1c;font-weight: 700">&nbsp;${attenCnt.atenAbsent }</span></p>
							<p style="display: inline-block;font-size: 1.2em;">공결<span style="color: #1b5e20;font-weight: 700">&nbsp;${attenCnt.atenOfiAbsent }</span></p>
							<p class="attendInfoWrapRight">
								<span style="float: right;">
									<span class="badge badge-outline-danger" style="margin-right: 15px;">총 결석일</span>
									<span id="totalAbsent" style="color: #fa5c7c;font-weight: 700;">-</span>&nbsp;<span>일</span>
								</span>
								<br>
								<span style="font-size: 0.9em;color: #999;display: block;margin-top: 10px;">지각/조퇴 3회는 결석 1회로 산정됨</span>
							</p>
						</div>
						
						<!-- 출결 상세 -->
						
						<div class="informDetailBot clear">
<!-- 							<p style="margin-top: 30px;display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;출결표</p> -->
								
							<input type="hidden" id="lecCd" name="lecCd" value="${data.lecCd }" />
							
							<table class="mb-0" border="1">
								<thead>
									<tr class="navTable">
										<td style="width: 20%;"><strong>주차</strong></td>
										<td style="width: 50%;"><strong>학습제목</strong></td>
										<td style="width: 20%;"><strong>차시</strong></td>
										<td style="width: 10%;"><strong>출결현황</strong></td>
									</tr>
								</thead>
								<!-- 주차별 출석 -->
								<tbody>
								<c:forEach var="j" begin="1" end="16" step="1">
										<tr>
											<td rowspan="${data.lecaPer }">${j}주차</td>
											<td rowspan="${data.lecaPer }" class="weekGoal" data-week="${j}"></td>
											<td>1차시</td>
											<td class="firstChapter" data-wh="${j }_1"></td>
										</tr>
										<c:if test="${data.lecaPer != 1 }">
											<c:forEach var="i" begin="2" end="${data.lecaPer }" step="1" >
												<tr>
													<td>${i}차시</td>
													<td class="OtherChapter" data-wh="${j }_${i}" ></td>
												</tr>
											</c:forEach>
										</c:if>
								</c:forEach>
								</tbody>
								<!-- 1줄 완성 -->
								
							</table>
						</div>
				</div>
				<!-- attenBotWrap End -->
		</div>
	</div>
</div>
