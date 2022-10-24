<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.cardBasic {
		min-height: 530px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0 ;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 15px;
	}
	
	.cardPreNext {
		width: 100%;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */

.hrwid {
	clear: both;
}

.boardTitleWrap {
	border-top: 2px solid #112a63;
/* 	width: 174%; */
}

#frm {
	margin-top: 40px;
}

.boardWrapper {
	min-height: 330px;
}

.boardTitle {
	border: none;
	font-weight: 700;
	padding: 30px 8px;
	float: left;
	display: inline-block;
	font-size: 1.2em;
}

.boardTitleH {
	border: none;
	font-weight: 700;
	padding: 16px 8px;
	float: left;
	display: inline-block;
	font-size: 1.2em;
}

.form-control {
	width: 57%;
	margin: 5px 0 8px 0;

}

.boardDetail {
 	position: absolute; 
 	top : 47px; 
 	right : 25px; 
	display : inline-block;
	float: right;
	line-height: 45px;
}

.underMargin {
	margin-left: 8px;
}

.modiBtn {
/*  	position: absolute;  */
/*  	bottom: 20px;  */
/*  	right: 32px;  */
	width: 100%;
}

.modiBtnshow {
	width: 100%;
}

.afterEvent {
	display: inline-block;
	float: left;
}


.replyBtn {
	width: 155px;
	height: 102px;
	float: left;
	margin: 5px 0 30px 20px;
}

.lecQnarName{
	width: 6%;
	height: 50px;
	text-align: center;
	text-decoration: underline;
		
}

.applyBtnWrap {
	float: rigth;
}

a {
	color: #6c757d;
}

a:hover {
	color : #6c757d;
	text-decoration: underline;
}

.goList {
	float: left;
}

#edit, #delete {
	float: right;
	margin-left: 6px;
}

.afterEvent {
	display: inline-block;
	float: left;
}

.canBtn{
	float	
}


.afterEvent:nth-child(1):after {
	content: "|";
	color: #bbb;
	margin: 0 10px;
}
 .afterEvent:nth-child(2):after { 
 	content: "|"; 
 	color: #bbb; 
 	margin: 0 10px; 
 } 

/* 파일 업로드(수정) */
	.filebox {
		margin-top: 15px;
	}
	
	.filebox input[type="file"] {
		  position: absolute;
		  width: 1px;
		  height: 1px;
		  padding: 0;
		  margin: -1px;
		  overflow: hidden;
		  clip:rect(0,0,0,0);
		  border: 0;
	}
	
	.filebox label {
		  display: inline-block;
		  padding: .5em .75em;
		  color: #999;
		  font-size: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #fdfdfd;
		  cursor: pointer;
		  border: 1px solid #ebebeb;
		  border-bottom-color: #e2e2e2;
		  border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
		  display: inline-block;
		  padding: .5em .75em;  /* label의 패딩값과 일치 */
		  font-size: inherit;
		  font-family: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #f5f5f5;
		  border: 1px solid #ebebeb;
		  border-bottom-color: #e2e2e2;
		  border-radius: .25em;
		  -webkit-appearance: none; /* 네이티브 외형 감추기 */
		  -moz-appearance: none;
		  appearance: none;
		  margin-top: 2px;
	}

#taskScore {
		width: 25%;
		display: inline-block;
		margin-right: 5px;
}


</style>

<%
      Date Today = new Date();
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd HH:mm");
      String simDate = simpleDate.format(Today);
%>
<c:set var="Today" value="<%= simDate %>" />
<fmt:formatDate var="taskEt" value="${data.taskEt }" pattern="yyyy.MM.dd HH:mm"/>

<div class="row">
	<div class="col-12">
		<div class="card cardBasic" style="position: relative;">
			<div class="card-body">
				<div style="min-height: 530px;">
					<div>
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
							<h4>과목 과제</h4>
								<input type="hidden" name="taskCd" id="taskCd" value="${data.taskCd }" />
								<input type="hidden" name="lecCd" id="lecCd" value="${data.lecCd }" />

								<div class="mb-3 boardTitleWrap boardT">
									<h5 class="boardTitleH">${data.taskNm}</h5>
								</div>
								<div class="mb-3 boardTitleWrap boardTInput" style="display: none;padding-top: 11px;">
									<input type="text" name="taskNm" value="${data.taskNm}" id="taskNm"
										class="form-control boardTitle" maxlength="50" required
										data-toggle="maxlength" data-placement="top"/>
								</div>

								<div class="boardDetail">
									<p class="afterEvent">
										작성자&emsp;${lec.memberVO.memNm }
									</p>
									<p class="afterEvent">
										등록일&emsp;<fmt:formatDate value="${data.taskReg }" pattern="yyyy-MM-dd" />
									</p>
									<p class="afterEvent">
										<strong>마감일&emsp;${taskEt }</strong>
									</p>
								</div>
								
								<hr class="hrwid">

								<div class="underMargin">
									<div class="notModifyMode" style="min-height: 150px;">
										<p>${data.taskCon}</p>
									</div>
									<hr>
									<div class="row">
										<div class="col-xl-4">
											<div class="card mb-1 shadow-none border">
												<div class="p-2">
													<div class="row align-items-center">
														<div class="col-auto">
															<div class="avatar-sm">
																<span class="avatar-title bg-secondary rounded">${ fn:substring(data.taskFnm, fn:indexOf(data.taskFnm, '.') + 1, fn:length(data.taskFnm))}</span>
															</div>
														</div>
														<div class="col pl-0">
															<a href="javascript:void(0);" class="text-muted font-weight-bold">${ fn:substring(data.taskFnm, fn:indexOf(data.taskFnm, '_') + 1, fn:length(data.taskFnm)) }</a>
														</div>
														<div class="col-auto">
															<!-- Button -->
															<a href="javascript:void(0);" onclick="fn_download('${data.taskFnm}')" class="btn btn-link btn-lg text-muted"> <i class="dripicons-download"></i>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
				<hr>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- 학생 제출란 -->
	<form id="frm" method="post" action="/studentLecture/stuLecTaskInsert" enctype="multipart/form-data">
	<input type="hidden" name="taskCd" value="${data.taskCd }"/>
	<input type="hidden" name="lecCd" value="${data.lecCd }"/>
	
	<!-- 작성자 세션 처리 완-->
	<c:set var="session" value="${sessionScope.memSession.memCd}" />
	<c:choose>
		<c:when test="${empty session }">
			<input type="hidden" name="stuCd" value="20182696" />
		</c:when>
		<c:when test="${not empty session }">
			<input type="hidden" name="stuCd" value="${session }" />
		</c:when>
	</c:choose>

<!-- <div class="row"> -->
<!-- 	<div class="col-12"> -->
<!-- 		<div class="card" style="position: relative;"> -->
<!-- 			<div class="card-body"> -->
<!-- 				<div style="min-height: 300px;"> -->
					<div>
					<div class="alert alert-warning" role="alert" style="font-size: 0.9em;">	
						과제 제출 시 <strong>마감일 이내에 수정이 가능</strong>합니다.<br>
						<strong>마감일 이후</strong>에는 <strong>제출 또는 수정</strong>할 수 없으므로 기한을 잘 확인하여 불이익 없도록 주의하시길 바랍니다.
					</div>
						<table class="table mb-4" style="border-bottom: 1px solid #eef2f7;">
							<tr>
								<th style="width: 15%;background: #f8f8f8;">첨부파일</th>
								<td style="width: 85%;">
									<div class="filebox">
										<input class="upload-name" placeholder="파일선택" disabled="disabled">
										
										<label for="ex_filename" style="cursor: pointer;margin: 2px 0 0 5px;color: #333;">파일첨부</label> 
										<input type="file" id="ex_filename" name="mpf" class="upload-hidden"> 
									</div>
									<p style="color: #999; font-size: 0.8em;margin-top: 15px;">&#8251;&nbsp;동영상 파일은 MP4,AVI등이 아닌 압축파일&#40;ZIP&#41;을 첨부해 주세요.</p>
								</td>
							</tr>
							<tr style="border-bottom: 1px solid #eef2f7;">
								<th style="width: 15%;background: #f8f8f8;">내용</th>
								<td style="width: 85%;">
									<textarea name="tsubCon" id="summernote" minlength="1" required></textarea>
								</td>
							</tr>
							<tr>
								<th style="width: 15%;background: #f8f8f8;">과제 점수</th>
								<td>
									<input type="text" name="tsubScore" id="taskScore" class="form-control" disabled />&nbsp;/&nbsp;${data.taskScore }
								</td>
							</tr>
						</table>

						<div class="notModifyMode modiBtn">
		<!-- 					<button type="button" id="delete" class="btn btn-secondary btn-sm">삭제</button> -->
		<!-- 					<button type="button" id="edit" class="btn btn-secondary btn-sm">수정</button> -->
							<a href="/studentLecture/lecTaskList?lecCd=${data.lecCd }"
								class="btn btn-light btn-sm goList">목록</a>
							<c:if test="${ Today > taskEt }">
								<button type="button" class="btn btn-primary btn-sm noSubmit" style="float: right;">등록</button>
							</c:if>
							<c:if test="${ Today <= taskEt }">
								<button type="submit" class="btn btn-primary btn-sm" style="float: right;">등록</button>
							</c:if>
						</div>
						<div class="ModifyMode modiBtnshow" style="display: none;">
							<div style="float: right;">
							<button type="submit" class="btn btn-primary btn-sm">등록</button>
							<a href="/professorLecture/lecTaskDetail?taskCd=${data.taskCd }" class="btn btn-secondary btn-sm">취소</a>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 학생 제출란 끝-->

<!-- 이전글, 다음글 -->
<div class="row">
	<div class="col-12">
		<div class="card cardPreNext">
			<div class="card-body">
				<table>
					<tr style="height:40px;">
						<td style="width: 110px;"><i class="dripicons-chevron-up"></i>&emsp;<strong>이전글</strong></td>
						<c:if test="${preNext.lasttitle == '9999'}">
							<td>이전글이 없습니다.</td>
						</c:if>
						<c:if test="${preNext.lasttitle != '9999'}">
							<td><a href="/studentLecture/lecTaskDetail?taskCd=${preNext.last }">${preNext.lasttitle }</a></td>
						</c:if>
					</tr>
					<tr>
						<td><i class="dripicons-chevron-down"></i>&emsp;<strong>다음글</strong></td>
						<c:if test="${preNext.nexttitle == '9999'}">
							<td>다음글이 없습니다.</td>
						</c:if>
						<c:if test="${preNext.nexttitle != '9999'}">
							<td><a href="/studentLecture/lecTaskDetail?taskCd=${preNext.next }">${preNext.nexttitle }</a></td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<iframe id="ifrm" name="ifrm" style="display:none;"></iframe>
<script type="text/javascript" defer="defer">
 	
	function fn_download(fileName) {
 		let vIfrm = document.getElementById("ifrm");
 		vIfrm.src = "/professorLecture/download?fileName=" + fileName;
 	}
 	
	$('#summernote').summernote({
        placeholder: '',
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
           ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
         fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });
 	
 	function fn_download(fileName) {
 		let vIfrm = document.getElementById("ifrm");
 		vIfrm.src = "/professorLecture/download?fileName=" + fileName;
 	}
 	
	$(function() {
		$('.noSubmit').on('click', function() {
			alert("제출 기한이 지나서 제출할 수 없습니다.")
			return false;
		})
		
		$('#edit').on('click', function() {
			$(".notModifyMode").css("display", "none");
			$(".ModifyMode").css("display", "block");
			// 입력란 활성화
			$('.form-control').removeAttr('disabled');
			$('.form-control').removeClass('boardTitle');
			$(".boardTInput").css("display", "block");
			$(".boardT").css("display", "none");
// 			CKEDITOR.instances['lqnaCon'].setReadOnly(false);
			
			$("#frm").attr("action", "/professorLecture/lecTaskUpdate");
		})
		
		$("#delete").on('click', function() {
			if(!confirm("과제를 삭제 하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
				return false;
			}
			$("#frm").attr("action","/professorLecture/lecTaskDelete");
			
			$("#frm").submit();
			
		})
		
		$('.applyEdit').on('click', function() {
			if($('.apply_' + $(this).data("idx")).css('display')=='none') {
				$('.apply_' + $(this).data("idx")).css('display', 'contents');
				$('.applyModify_' + $(this).data("idx")).css('display', 'none');
			}else {
				$('.applyModify_' + $(this).data("idx")).css('display', 'contents');
				$('.apply_' + $(this).data("idx")).css('display', 'none');
				$('.uptextfoc').select();
			}
			
		})
		
		$('.applyDel').on('click', function() {
			if(!confirm("답글을 삭제 하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
				return false;
			}
			$('#aplFrm').attr("action","/studentLecture/lecqnarDelete");
		})
		
		$('#notEdit').on('click', function() {
			alert("답글이 있는 게시글은 수정할 수 없습니다.");
			return false;
		})
		
		
		var fileTarget = $('.filebox .upload-hidden');
		
		  fileTarget.on('change', function(){  // 값이 변경되면
		    if(window.FileReader){  // modern browser
		      var filename = $(this)[0].files[0].name;
		    } 
		    else {  // old IE
		      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		    }
		    
		    // 추출한 파일명 삽입
		    $(this).siblings('.upload-name').val(filename);
		  });
		
		  	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			let maxSize = 5242880; //5MB
				
			// 파일의 확장자, 크기 체킹
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize) {
					alert("파일 사이즈가 초과되었습니다..");
					// 함수 종료
					return false;
				}
				if(regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			// 현재 시간과 비교하여 이전 날짜 선택 불가
			let EndDate = document.getElementById('EndDate');
//	 		let dateEnd = document.getElementById('quizEndDate');
			let date = new Date(new Date().getTime() - new Date().getTimezoneOffset()*60000).toISOString().slice(0,-8);
			EndDate.value = date;
			EndDate.setAttribute("min",date);
//	 		dateEnd.value = dateStart.value;
//	 		dateEnd.setAttribute("min",dateStart.value);
			

			$('#EndDate').change(function() {
	            if(EndDate.value < date) {
	                alert('현재 시간보다 이전의 시간은 설정할 수 없습니다.');
	                EndDate.value = date;
	            }
//	 			dateEnd.value = dateStart.value;
//	 			dateEnd.setAttribute("min",dateStart.value);
			})
	})
</script>




