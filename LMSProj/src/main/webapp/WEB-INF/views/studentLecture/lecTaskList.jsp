<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
</script>
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
	}
	
	.card-body {
		width: 100%;
	}
	
	/* 기본 틀 잡기 끝 */
	
	.emphasisR {
		color: red;
	}
	
	.table-responsive-sm {
		margin-bottom: 40px;
		min-height: 500px;
	}
</style>

<%
      Date date = new Date();
   	  date.setDate(date.getDate()-6);
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
      String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>" />

<div class="quizWrapper">
	<div class="col-lg-12">
		<div class="card" style="min-height: 700px;">
			<div class="card-body">
				<h4>${data.lecaNm }&emsp;&#45;&emsp;과목 과제</h4>
				<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding: 20px;line-height: 34px;border: 1px solid #eee;">
					<p>
						<strong>&#8251; 과제 안내 사항</strong>
						<br>
						1) 과제에 대한 제출기간을 잘 확인하여 불이익이 없도록 합니다.<br>
						2) 담당교수 채점 후 과제에 대한 점수를 확인할 수 있습니다.
					</p>
				</div>
	
				<p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color: red;">${fn:length(list) }</span>건의 게시물이 있습니다.</p>
				<div class="tab-content">
					<div class="tab-pane show active" id="hoverable-rows-preview">
						<div class="table-responsive-sm">
							<table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
								<thead class="table-light">
									<tr style="border-top: 2px solid #112a63">
										<th style="width: 10%; text-align: center;">NO</th>
										<th style="width: 40%;text-align: center;">제목</th>
										<th style="width: 10%;text-align: center;">작성자</th>
										<th style="width: 15%;text-align: center;">등록일</th>
										<th style="width: 15%;text-align: center;">마감일</th>
										<th style="width: 10%;text-align: center;">제출여부</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty list}">
								
								<tr style="border-bottom: 1px solid #eef2f7">
									<td colspan="5" style="text-align: center;color: #888;">예정된 과제가 없습니다.</td>
								</tr>
							
								</c:if>
								<c:if test="${not empty list}">
								
									<c:forEach var="list" items="${list }">
									<fmt:formatDate var="taskReg" value="${list.taskReg }" pattern="yyyy.MM.dd"/>
										<tr>
											<td style="text-align: center;">${list.rnum }</td>
											<td>
												<c:forEach var="chk" items="${check }">
													<c:if test="${list.taskCd == chk.taskCd}">
														<c:set var="flag" value="1" />
														<a href="/studentLecture/lecTaskDetailComplete?tsubCd=${chk.tsubCd }&&taskCd=${list.taskCd}" style="color:#6c757d;">
															${list.taskNm }
														</a>
													</c:if>
												</c:forEach>
												
												<c:if test="${flag != 1 }">
													<!-- 기본 주소 -->
													<a href="/studentLecture/lecTaskDetail?taskCd=${list.taskCd }" style="color:#6c757d;">
														${list.taskNm }
													</a>
												</c:if>
												
												<c:if test="${ date <= taskReg }">
					                              <span class="badge badge-outline-warning badge-pill" style="float:right;">NEW</span>
					                           </c:if>
											</td>
											<td style="text-align: center;">${data.memberVO.memNm }</td>
											<td style="text-align: center;">
												${taskReg }
											</td>
											<td style="text-align: center;font-weight: 700;"> 
												<fmt:formatDate value="${list.taskEt }" pattern="MM.dd HH:mm" />
											</td>
											<td style="text-align: center;">
												<c:forEach var="chk" items="${check }">
													<c:if test="${list.taskCd == chk.taskCd}">
														<strong>제출 완료</strong>
													</c:if>
												</c:forEach>
												
												<c:if test="${flag != 1 }">
													미제출
												</c:if>
											</td>
										</tr>
										<c:set var="flag" value="0" />
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id="pageBarBtn" style="text-align:center;">
			    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil-angle-double-left"></i></button>
			    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil uil-angle-left"></i></button>
			         	
			         		
				    <button type="button" class="btn btn-primary" onclick="#">
				    	1
			    	</button>

			    <button type="button" class="btn btn-light" onclick="#"><i class="uil uil-angle-right"></i></button>
			    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil-angle-double-right"></i></button>
			</div>
		</div>
	</div>
</div>


