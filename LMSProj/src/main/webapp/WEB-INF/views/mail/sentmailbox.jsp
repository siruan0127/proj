<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<script type="text/javascript" src="/resources/js/mail.js"></script>
<style type="text/css">
	.btn-group{
		position : relative;
		top: 40px;
	}
	.email-list>li .email-content .email-date{
		width: 200px;
	}
	
	.readDate{
		display: inline-block;
		width: 100px;
		text-align: right;
		float: right;
	}
	
	.read{
		font-size: 20px;
	}
	
	.clip{
		font-size: 17px;
	}
	
	.email-title{
		padding-left: 10px;
	}
	
	.email-list>li:hover .email-content .email-date{
		opacity: 100;
	}
	
	.email-list>li:hover {
	    background: #f1f3fa !important;
	    transition-duration: .05s;
    }
    
    .mailList{
    	min-height : 760px;
    }
    .email-list{
    	padding-top : 50px;
    }
    #checkboxRound{
    	margin-left:20px;
    }
    .btn-primary{
    	background : #001353;
    	border:#001353;
    	box-shadow : #001353;
    }
    .btn-primary:hover{
    	background : #2a5388;
    	border:#2a5388;
    	box-shadow : #2a5388;
    }
</style>
<script type="text/javascript" defer="defer">
var global = {}; // 하나의 네임스페이스로 작용
global.aaa = "ppp";
$(function() {
	
	$("#mailAll").on('click', function() {
		chk = [];
		 $("input[name=chk]:checked").each(function(){
			 chk.push($(this).data('read'));
		 });
		 
		if(chk[0] == "Y"){
			$('#readBtn').html("안읽음");
		}
		
		for(var i = 0; i < chk.length - 1; i++){
			if(chk[0] != chk[i]){
				$('#readBtn').html("읽음");
			}else{
				$('#readBtn').html("안읽음");
			}
		}
		
		if($("#mailAll").is(":checked")){
			$('input[name=chk]').prop("checked", true);
			$('.email-list>li').css('background', '#f1f3fa');
		}else{
			$("input[name=chk]").prop("checked", false);
			$(".email-list>li").css('background', 'none');
		}
	});
	
	$("input[name=chk]").on('click', function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#mailAll").prop("checked", false);
		else $("#mailAll").prop("checked", true); 
		
		if($(this).is(":checked")){
			$('li_'+$(this).val()).css('background', '#f1f3fa');
		}else{
			$('li_'+$(this).val()).css('background', 'none');
		}
		
		chk = [];
		 $("input[name=chk]:checked").each(function(){
			 chk.push($(this).data('read'));
		 });
		 
		if(chk[0] == "Y"){
			$('#readBtn').html("안읽음");
		}else{
			$('#readBtn').html("읽음");
		}
		
		for(var i = 1; i < chk.length; i++){
			if(chk[0] != chk[i]){
				$('#readBtn').html("읽음");
			}
		}
		
	});
	
	$('#delBtn').on('click', function(){
// 		alert("delBtn");
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}
		
		chkVal = [];
		$('input[name=chk]:checked').each(function(i){
			chkVal.push($(this).val());
		});
		
// 		alert(chkVal);
		
		console.log(JSON.stringify(chkVal));
		
		deleteAll(chkVal);
	});
	
	$('#readBtn').on('click', function(){
// 		alert("readBtn");
		
		chkVal = [];
		$('input[name=chk]:checked').each(function(i){
			if(document.querySelector("#mlcd_"+$(this).val()).dataset.senrcp == 0){
				chkVal.push($(this).val());
			}
		});
		
// 		alert(chkVal);
		
		readBtnTxt = $(this).text();
// 		alert(readBtnTxt);
		let data = "";
		
		if(readBtnTxt == "안읽음"){
			data = { 'chkVal' : chkVal, "mlYn" : 0 };
			for(var i=0; i < chkVal.length; i++){
				mlCd = chkVal[i];
				$('#mlcd_' + mlCd).attr('class', 'mdi mdi-email read');
//					console.log(document.querySelector("#mlcd_"+mlCd).dataset);
				document.querySelector("#mlcd_"+mlCd).dataset.read = "N"
				$('#li_' + mlCd).attr('class', 'unread');
			};
			
		}else{
			data = { 'chkVal' : chkVal, "mlYn" : 1 };
			for(var i=0; i < chkVal.length; i++){
				mlCd = chkVal[i];
				$('#mlcd_' + mlCd).attr('class', 'mdi mdi-email-open read');
//					console.log(document.querySelector("#mlcd_"+mlCd).dataset);
				document.querySelector("#mlcd_"+mlCd).dataset.read = "Y"
				$('#li_' + mlCd).attr('class', '');
			};
		}
		
		updateYN(data);
	});
});
</script>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String simDate = simpleDate.format(date);
%>
<div style="width: 100%;background:#fff;padding:2%;border-top: 2px solid #001353;
    border-radius: 10px;">
	<div style="width: 100%; min-width: 1200px; max-width: 1575px; margin: 0 auto;">
		<div class="app-search dropdown d-none d-lg-block" style="width: 300px;">
		    <form method="get" action="/mail/sentmailbox">
		        <div class="input-group">
		            <input type="text" class="form-control dropdown-toggle" placeholder="Search..." id="top-search" name="keyword" value="${ map.keyword }">
		            <span class="mdi mdi-magnify search-icon"></span>
		            <div class="input-group-append">
		                <button class="btn btn-primary" type="submit">Search</button>
		            </div>
		        </div>
		
		    </form>
		</div>
		<br>
		<div class="btn-group">
			<div class="custom-control custom-checkbox" id="checkboxRound">
				<input type="checkbox" class="custom-control-input" id="mailAll">
				<label class="custom-control-label" for="mailAll"></label>
			</div>
			<button type="button" class="btn btn-secondary btn-sm" id="readBtn" disabled>읽음</button>
			<button type="button" class="btn btn-secondary btn-sm" id="delBtn">삭제</button>
		</div>
		<c:set var="date" value="<%= simDate %>" />
		<div class="mt-3 mailList">
			<ul class="email-list">
				<c:forEach var="mailVO" items="${ list.content }">
					<fmt:formatDate var="mlTm" value='${ mailVO.mlTm }' pattern='yyyy-MM-dd' />
					<fmt:formatDate var="mlYndt" value='${ mailVO.mlYndt }' pattern='yyyy-MM-dd' />
						<li>
							<div class="email-sender-info">
								<div class="checkbox-wrapper-mail">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="chk_${ mailVO.mlCd }" value="${ mailVO.mlCd }" name="chk">
										<label class="custom-control-label" for="chk_${ mailVO.mlCd }"></label>
									</div>
								</div>
								<i class="mdi mdi-email-open read"></i>
								<c:if test="${ not empty mailVO.mailFileVOList }">
									<i class="mdi mdi-paperclip clip"></i>
								</c:if>
								<a class="email-title">
									${ mailVO.mlRcpnm }
								</a>
							</div>
							<div class="email-content">
								<a href="/mail/detail?mlCd=${ mailVO.mlCd }" class="email-subject">
									${ mailVO.mlTtl }
								</a>
								<div class="email-date">
									<c:if test="${ date == mlTm }">
										<fmt:formatDate value="${ mailVO.mlTm }" pattern="HH:mm"></fmt:formatDate>
									</c:if>
									<c:if test="${ date != mlTm }">
										<fmt:formatDate value="${ mailVO.mlTm }" pattern="MM-dd HH:mm"></fmt:formatDate>
									</c:if>
									<div class="readDate">
										<c:if test="${ mailVO.mlYndt == null }">
											읽지 않음
										</c:if>
										<c:if test="${ date == mailVO.mlYndt }">
											<fmt:formatDate value="${ mailVO.mlYndt }" pattern="HH:mm"></fmt:formatDate>
										</c:if>
										<c:if test="${ date != mailVO.mlYndt }">
											<fmt:formatDate value="${ mailVO.mlYndt }" pattern="MM-dd HH:mm"></fmt:formatDate>
										</c:if>
									</div>
								</div>
							</div>
						</li>
				</c:forEach>
			</ul>
		</div>
		<!-- end .mt-4 -->
		
		<div style="text-align: center;">
		    <button type="button" class="btn btn-light" <c:if test='${ list.startPage lt 6 }'>disabled</c:if> onclick="location.href='/mail/sentmailbox?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ list.startPage - 5 }'"><i class="uil-angle-double-left"></i></button>
		    <button type="button" class="btn btn-light" <c:if test='${ list.startPage == list.currentPage }'>disabled</c:if> onclick="location.href='/mail/sentmailbox?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ list.currentPage - 1 }'"><i class="uil uil-angle-left"></i></button>
		         	<c:forEach var="pNo" begin="${ list.startPage }" end="${ list.endPage }">
		         		<c:if test="${ pNo == 0 }"><c:set var="pNo" value="1"></c:set></c:if>
			    <button type="button" class="btn btn-<c:if test="${ list.currentPage != pNo }">light</c:if><c:if test="${ list.currentPage == pNo }">primary</c:if>"
		    		 onclick="location.href='/mail/sentmailbox?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ pNo }'">
			    	${ pNo }
		    	</button>
			</c:forEach>
		    <button type="button" class="btn btn-light" <c:if test='${ list.endPage == list.currentPage }'>disabled</c:if> onclick="location.href='/mail/sentmailbox?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ list.currentPage + 1 }'"><i class="uil uil-angle-right"></i></button>
		    <button type="button" class="btn btn-light" <c:if test="${ list.endPage ge list.totalPages }">disabled</c:if> onclick="location.href='/mail/sentmailbox?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ list.startPage + 5 }'"><i class="uil-angle-double-right"></i></button>
		</div>
	</div>
</div>
<!-- end row-->
