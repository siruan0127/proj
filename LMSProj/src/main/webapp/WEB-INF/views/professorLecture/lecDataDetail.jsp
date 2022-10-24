<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
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
	margin: 260px 0 30px 8px;
}

.modiBtn {
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


</style>


<form name="frm" id="frm" method="post" action="/professorLecture/lecDataUpdate" enctype="multipart/form-data">
	<div class="col-12">
		<div class="card cardBasic" style="position: relative;">
			<div class="card-body">
				<div style="min-height: 400px;">
					<div>
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
							<h4>강의자료실</h4>
								<input type="hidden" name="ldtCd" id="lqnaCd" value="${data.ldtCd }" />
								<input type="hidden" name="lecCd" id="lecCd" value="${data.lecCd }" />

								<div class="mb-3 boardTitleWrap boardT">
									<h5 class="boardTitleH">${data.ldtTtl}</h5>
								</div>
								<div class="mb-3 boardTitleWrap boardTInput" style="display: none;padding-top: 11px;">
									<input type="text" name=ldtTtl value="${data.ldtTtl}" id="ldtTtl"
										class="form-control boardTitle" maxlength="50" required
										data-toggle="maxlength" data-placement="top"/>
								</div>

								<div class="boardDetail">
									<p class="afterEvent">
										작성자&emsp;${lec.memberVO.memNm }
									</p>
									<p class="afterEvent">
										등록일&emsp;<fmt:formatDate value="${data.ldtDt }" pattern="yyyy-MM-dd HH:mm" />
									</p>
									<p class="afterEvent">
										조회수&emsp;${data.ldtHit }
									</p>
								</div>
								
								<hr class="hrwid">

								<div class="underMargin">
<!-- 									<div class="mt-4 notModifyMode"> -->
<!-- 										<div class="col-xxl-3 col-lg-6"> -->
<!--                                              <div class="card m-1 shadow-none border"> -->
<!--                                                  <div class="p-2"> -->
<!--                                                      <div class="row align-items-center"> -->
<!--                                                          <div class="col-auto"> -->
<!--                                                              <div class="avatar-sm"> -->
<!--                                                                  <span class="avatar-title bg-light text-secondary rounded"> -->
<%--                                                                      	${ fn:substring(data.ldtFnm, fn:indexOf(data.ldtFnm, '.') + 1, fn:length(data.ldtFnm))} --%>
<!--                                                                  </span> -->
<!--                                                              </div> -->
<!--                                                          </div> -->
<!--                                                          <div class="col ps-0"> -->
<%--                                                              <a href="javascript:void(0);" class="text-muted fw-bold" onClick="fn_download('${data.ldtFnm}')" >${ fn:substring(data.ldtFnm, fn:indexOf(data.ldtFnm, '_') + 1, fn:length(data.ldtFnm)) }</a> --%>
<!--                                                          </div> -->
<!--                                                      </div> end row -->
<!--                                                  </div> end .p-2 -->
<!--                                              </div> end col -->
<!--                                          </div> -->
<!-- 									</div> -->
									
									<div class="row notModifyMode">
										<div class="col-xl-4">
											<div class="card mb-1 shadow-none border">
												<div class="p-2">
													<div class="row align-items-center">
														<div class="col-auto">
															<div class="avatar-sm">
																<span class="avatar-title bg-secondary rounded">${ fn:substring(data.ldtFnm, fn:indexOf(data.ldtFnm, '.') + 1, fn:length(data.ldtFnm))}</span>
															</div>
														</div>
														<div class="col pl-0">
															<a href="javascript:void(0);" class="text-muted font-weight-bold">${ fn:substring(data.ldtFnm, fn:indexOf(data.ldtFnm, '_') + 1, fn:length(data.ldtFnm)) }</a>
														</div>
														<div class="col-auto">
															<!-- Button -->
															<a href="javascript:void(0);" onclick="fn_download('${data.ldtFnm}')" class="btn btn-link btn-lg text-muted"> <i class="dripicons-download"></i>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="mt-4 ModifyMode" style="display: none;">
										<div class="filebox">
											<input class="upload-name" placeholder="파일선택" disabled="disabled">
											
											<label for="ex_filename" style="cursor: pointer;margin: 2px 0 0 5px;color: #333;">파일첨부</label> 
											<input type="file" id="ex_filename" name="mpf" class="upload-hidden"> 
										</div>
										<p style="color: #999; font-size: 0.8em;margin-top: 15px;">&#8251;&nbsp;동영상 파일은 MP4,AVI등이 아닌 압축파일&#40;ZIP&#41;을 첨부해 주세요.</p>
									</div>
								</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="notModifyMode modiBtn">
					<c:if test="${ memSession.professorVO.proCd != null }">
						<button type="button" id="delete" class="btn btn-primary btn-sm">삭제</button>
						<button type="button" id="edit" class="btn btn-primary btn-sm">수정</button>
					</c:if>
					<a href="/professorLecture/lecDataList?lecCd=${data.lecCd }"
						class="btn btn-light btn-sm goList">목록</a>
				</div>
				<div class="ModifyMode modiBtnshow" style="display: none;">
					<div">
						<button type="submit" class="btn btn-primary btn-sm" style="float: right;">등록</button>
						<a href="/professorLecture/lecDataDetail?ldtCd=${data.ldtCd }" class="btn btn-light btn-sm">취소</a>
					</div>
				</div>
				
			</div>
		</div>
		
		<!-- 이전글, 다음글 -->
		<div class="card cardPreNext">
			<div class="card-body">
				<table>
					<tr style="height:40px;">
						<td style="width: 110px;"><i class="dripicons-chevron-up"></i>&emsp;<strong>이전글</strong></td>
						<c:if test="${preNext.lasttitle == '9999'}">
							<td>이전글이 없습니다.</td>
						</c:if>
						<c:if test="${preNext.lasttitle != '9999'}">
							<td><a href="/professorLecture/lecDataDetail?ldtCd=${preNext.last }">${preNext.lasttitle }</a></td>
						</c:if>
					</tr>
					<tr>
						<td><i class="dripicons-chevron-down"></i>&emsp;<strong>다음글</strong></td>
						<c:if test="${preNext.nexttitle == '9999'}">
							<td>다음글이 없습니다.</td>
						</c:if>
						<c:if test="${preNext.nexttitle != '9999'}">
							<td><a href="/professorLecture/lecDataDetail?ldtCd=${preNext.next }">${preNext.nexttitle }</a></td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
		
	</div>

</form>
<iframe id="ifrm" name="ifrm" style="display:none;"></iframe>
<script type="text/javascript" defer="defer">
 	
 	function fn_download(fileName) {
 		let vIfrm = document.getElementById("ifrm");
 		vIfrm.src = "/professorLecture/download?fileName=" + fileName;
 	}
 	
	$(function() {
		$('#edit').on('click', function() {
			$(".notModifyMode").css("display", "none");
			$(".ModifyMode").css("display", "block");
			// 입력란 활성화
			$('.form-control').removeAttr('disabled');
			$('.form-control').removeClass('boardTitle');
			$(".boardTInput").css("display", "block");
			$(".boardT").css("display", "none");
// 			CKEDITOR.instances['lqnaCon'].setReadOnly(false);
			
			$("#frm").attr("action", "/professorLecture/lecDataUpdate");
		})
		
		$("#delete").on('click', function() {
			if(!confirm("자료를 삭제 하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
				return false;
			}
			$("#frm").attr("action","/professorLecture/lecDataDelete");
			
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
	})
</script>




