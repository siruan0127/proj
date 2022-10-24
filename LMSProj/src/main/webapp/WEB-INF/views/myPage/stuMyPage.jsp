<%@page import="kr.ac.lms.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/myPage.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="https://malsup.github.io/jquery.form.js"></script> 
<style>
</style>
<script type="text/javascript" defer="defer">

function setThumbnail(event){
   var reader = new FileReader();
   
   reader.onload = function(event){
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("class", "profileImg");
      document.querySelector("div#image_container").appendChild(img);
      
   };
   
   reader.readAsDataURL(event.target.files[0]);
   
}
$(function(){
   //확장자가 exe, sh, zip, alz이니?
   let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
   let maxSize = 5242880;   //5MB
   
   //파일의 확장자, 크기 체킹
   function checkExtension(fileName, fileSize){
      if(fileSize >=maxSize){
         alert("파일 사이즈가 초과되었습니다.");
         return false;
      }
      if(regex.test(fileName)){
         alert("해당 종류의 파일은 업로드할 수 없습니다.");
         return false;
      }
      return true;
   }

$('#saveProfile').on('click',function(){
   var memFpt = $('#profile').val();
   
   var fileValue = $('#profile').val().split("\\");//경로
   var fileName = fileValue[fileValue.length-1];//파일명
   $("#fileNm").val(fileName);//hidden에 파일명 넣어줌
   ////////////////////////////////시작///////////////////////////////////
   //가상의 form태그 생성<form></form>
   let formData = new FormData();
   let inputFile = $("input[name='memFpt']");
   //inputFile[0] : input type="file"
   //.files : 그 안에 들어온 파일 객체들
   let files = inputFile[0].files;
   
   console.log("files : " + files);
   
   //formdata에다 filedata를 추가해보자
   for(let i = 0; i < files.length; i++){
      //파일 확장자 체킹(확장자, exe, sh, zip, alz니? => 통과시 true가 return됨)
//       if(!checkExtension(files[i].name, files[i].size)){
//          //반복문 종료 및 함수 종료
//          return false;
//       }
      
      //<form>
      //   <input type="file" name="uploadFile">
      //</form>
      formData.append("uploadFile", files[i]);
   }
   
////////////////////////////////끝///////////////////////////////////
   $.ajax({
      url : "/myPage/saveProfile",
      type : "POST",
      processData:false,
      contentType:false,
      data : formData,
      success: function(res){
         console.log(res);
         
         if(res=="1"){
            alert("저장되었습니다.");
            
            $.ajax({
            url:"/myPage/reloadImg",
            type:"POST",
            success:function(result){
               console.log("result" + result.memFnm);
            },
            dataType : 'json'
         });
         }else{
            alert("저장을 실패하였습니다.");
         }
         
         
      }
   });
})

//마이페이지 버튼 조작
   
   //마이페이지
   $("#subtitle").on('click',function(){
      $("#subtitle").css("background","#001353")
      .css("color","#fff");
      $("#subtitle2").css("background","#fff")
      .css("color","black");
      
      $("#changePw").css("display","none");
      $("#myPage").css("display","block");
   });
   //비밀번호 변경
   $("#subtitle2").on('click',function(){
      $("#subtitle2").css("background","#001353")
      .css("color","#fff");
      $("#subtitle").css("background","#fff")
      .css("color","black");
      
      $("#myPage").css("display","none");
      $("#changePw").css("display","block");
   });
//비밀번호 변경

   $("#changePwBtn").on('click',function(){
      
      let regex = new RegExp("(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$");
      //숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
      
      if($("#prePw").val()==""){
         alert("현재 비밀번호를 입력해주세요");
         $("#prePw").focus();
         return false
      }
      
      if($("#newPw").val()==""){
         alert("변경비밀번호를 입력해주세요");
         $("#newPw").focus();
         return false
      }
      if(!regex.test($("#newPw").val())){
         alert("숫자, 특수문자를 1회 이상, 영문은 2개 이상으로 이루어진 8자리 이상의 비밀번호를 설정해주세요.");
         $("#newPw").focus();
         return false
      }
      if($("#newPwCon").val()==""){
         alert("변경비밀번호를 한번 더 입력해주세요");
         $("#newPwCon").focus();
         return false
      }
      if ($("#newPw").val() != $("#newPwCon").val()) {
         alert("변경비밀번호가 일치하지 않습니다.");
         $("#newPwCon").focus();
      }
      
      var prePw = $("#prePw").val();
      var newPwCon = $("#newPwCon").val();
      
      $.ajax({
         url : "/myPage/pwCheck",
         type : "POST",
         dataType : "json",
         data : {
            prePw : prePw,
            newPwCon : newPwCon
         },
         success: function(data){
            
            if(data==0){
               alert("패스워드가 틀렸습니다.");
               return;
            }else{
               //메시지가 뜨지 않는 상황
               if(confirm("변경하시겠습니까?")){
                  $("#changePw").submit();
                 }
               
            }
         }
      });
   });


});
</script>
</head>
<body>
<!-- aside 타일즈가 필요 -->
<div id="allRound">
<i id="home" class="mdi mdi-home" style="font-size: 1.3em"></i>
<i class="dripicons-chevron-right"></i>
마이페이지
<i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">신상정보</span>
<br><br>
<h4 id="subtitle">마이페이지</h4>
<h4 id="subtitle2">비밀번호 변경</h4>
<div class="card">
<div class="card-body">
<div id="myPage">
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;프로필 관리</p>

<!-- 프로필사진이 보이는 곳 -->
<div id="image_container">
<img id="profile" alt="profile" src="<%= request.getContextPath() %>/resources/profileImg/${sessionScope.memSession.memFnm}" class="profile">
</div>
<form id="uploadForm" enctype="multipart/form-data" action="/myPage/saveProfile" method="post">
   <label id="uploadBtn" class="btn btn-secondary">
      사진 변경
      <input type="file" name="memFpt" id="profile" onchange="setThumbnail(event);" style="display:none;">
      <input type="hidden" name="memFnm" id="fileNm"/>
   </label>
<input type="button" id="saveProfile" class="btn btn-primary" value="저장"/>
</form>
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;내 정보 관리</p>
<form action="/myPage/updateInfo" method="post" id="updateInfo">
   <!-- 관리자/교수 : 교번 | 학생 : 학번 -->
   <c:if test="${memSession.studentVO.stuCd ==null }">
      <label class="myPageLab">교번</label>
      <input type="text" name="memCd" id="memCd" value="${sessionScope.memSession.memCd}" readonly>
   </c:if>
   <c:if test="${memSession.studentVO.stuCd !=null }">
      <label class="myPageLab">학번</label>
      <input type="text" name="memCd" id="memCd" value="${sessionScope.memSession.memCd}" readonly>
   </c:if>
   <!-- 관리자/교수 : 직책 | 학생 : 학년 -->
   <c:if test="${memSession.managerVO.mgrCd !=null}">
      <label class="myPageLab">직책</label>
      <input type="text" name="stuYr" id="stuYr" value="${sessionScope.memSession.managerVO.mgrPosNm}" readonly>
   </c:if>
   <c:if test="${memSession.professorVO.proCd !=null}">
      <label class="myPageLab">직책</label>
      <input type="text" name="stuYr" id="stuYr" value="${sessionScope.memSession.professorVO.proPosNm}" readonly>
   </c:if>
   <c:if test="${memSession.studentVO.stuCd != null }">
      <label class="myPageLab">학년</label>
      <input type="text" name="stuYr" id="stuYr" value="${sessionScope.memSession.studentVO.stuYr }" readonly>
   </c:if>
   <!-- 학생만 담당교수있음 -->
   <c:if test="${memSession.studentVO.stuCd != null}">
      <label class="myPageLab">담당 교수</label>
      <input type="text" name="stuPro" id="stuPro" value="${sessionScope.memSession.studentVO.stuProNm }" readonly>
   </c:if>
   <br/>
   <label class="myPageLab">성명(한글)</label>
   <input type="text" name="memNm" id="memNm" value="${sessionScope.memSession.memNm }" readonly>
   <label class="myPageLab">성명(영문)</label>
   <input type="text" name="memNme" id="memNme" value="${sessionScope.memSession.memNme }" readonly>
   <!-- 교수:담당학과 | 학생 : 단과대학 | 관리자 : 담당부서 -->
   <c:if test="${memSession.studentVO.stuCd != null }">
      <label class="myPageLab">단과대학</label>
      <input type="text" name="colNm" id="colNm" value="${sessionScope.memSession.studentVO.colNm}" readonly>
   </c:if>
   <c:if test="${memSession.professorVO.proCd != null }">
      <label class="myPageLab">담당학과</label>
      <input type="text" name="colNm" id="colNm" value="${sessionScope.memSession.professorVO.depNm}" readonly>
   </c:if>
   <c:if test="${memSession.managerVO.mgrCd != null }">
      <label class="myPageLab">담당부서</label>
      <input type="text" name="colNm" id="colNm" value="${sessionScope.memSession.managerVO.mgrDivNm}" readonly>
   </c:if>
   <br>
   <!-- 학생 : 학과  관리자/교수 : 입사일-->
   <c:if test="${memSession.studentVO.stuCd != null  }">
      <label class="myPageLab">학과</label>
      <input type="text" name="depNm" id="depNm" value="${sessionScope.memSession.studentVO.depNm }" readonly>
   </c:if>
   <c:if test="${memSession.managerVO.mgrCd != null }">
      <label class="myPageLab">입사일</label>
      <input type="text" name="depNm" id="depNm" 
      value="&#09;&nbsp;&nbsp;<fmt:formatDate value="${sessionScope.memSession.managerVO.mgrJoin}" />
         " readonly>
   </c:if>
   <c:if test="${memSession.professorVO.proCd != null }">
      <label class="myPageLab">입사일</label>
      <input type="text" name="depNm" id="depNm" value="
         <fmt:formatDate value="${sessionScope.memSession.professorVO.proJoin}" />
         " readonly>
   </c:if>
   <!-- 학생 : 바로 생년월일이 뜸 | 교수/관리자 : 퇴사일이 있음 -->
   <c:if test="${memSession.managerVO.mgrCd != null }">
      <label class="myPageLab">퇴사일</label>
      <input type="text" style="text-align:center;" name="recCate" id="recCate" value="
         <fmt:formatDate value="${sessionScope.memSession.managerVO.mgrRet}" />
         " readonly>
   </c:if>
   <c:if test="${memSession.professorVO.proCd != null }">
      <label class="myPageLab">퇴사일</label>
      <input type="text" style="text-align:center;" name="recCate" id="recCate" value="
         <fmt:formatDate value="${sessionScope.memSession.professorVO.proRet}" />
         " readonly>
   </c:if>
   <label class="myPageLab">생년월일</label>
   <input type="text" name="memReg1" id="memReg1" value="${sessionScope.memSession.memReg1 }" readonly>
   <br>
   <label class="myPageLab">전화번호</label>
   <input type="tel" name="memTel" id="memTel" value="${sessionScope.memSession.memTel }">
   <label class="myPageLab">E-Mail</label>
   <input type="email" name="memMl" id="memMl" value="${sessionScope.memSession.memMl }">
   <br/>
   <label class="myPageLab">우편번호</label>
   <input type="text" name="memZip" id="memZip" value="${sessionScope.memSession.memZip }" readonly>
   <label class="myPageLab">주소</label>
   <input type="text" name="memAddr1" id="memAddr1" value="${sessionScope.memSession.memAddr1 }" readonly>
   <label class="myPageLab">상세주소</label>
   <input type="text" name="memAddr2" id="memAddr2" value="${sessionScope.memSession.memAddr2 }">
   <br/>
   <label class="myPageLab">은행</label>
   <select name="memBank" id="memBank">
      <option value="카카오뱅크">카카오뱅크</option>
      <option value="국민은행">국민은행</option>
      <option value="IBK기업은행">IBK기업은행</option>
      <option value="NH농협은행">NH농협은행</option>
      <option value="신한은행">신한은행</option>
      <option value="KDB산업은행">KDB산업은행</option>
      <option value="우리은행">우리은행</option>
      <option value="한국씨티은행">한국씨티은행</option>
      <option value="하나은행">하나은행</option>
      <option value="SC제일은행">SC제일은행</option>
      <option value="경남은행">경남은행</option>
      <option value="광주은행">광주은행</option>
      <option value="대구은행">대구은행</option>
      <option value="케이뱅크">케이뱅크</option>
      <option value="수협은행">수협은행</option>
      <option value="부산은행">부산은행</option>
      <option value="제주은행">제주은행</option>
      <option value="전북은행">전북은행</option>
      <option value="금융결제원">금융결제원</option>
      <option value="신협은행">신협은행</option>
      <option value="MG새마을금고">MG새마을금고</option>
      <option value="우체국">우체국</option>
   </select>
   <script type="text/javascript" defer="defer">
   $('#memBank option[value="${sessionScope.memSession.memBank}"]').attr("selected","selected");
   </script>
   <label class="myPageLab">예금주</label>
   <input type="text" name="memDepo" id="memDepo" value="${sessionScope.memSession.memDepo }">
   <label class="myPageLab">계좌번호</label>
   <input type="text" name="memAct" id="memAct" value="${sessionScope.memSession.memAct }">
</form>
<br>
<c:if test="${sessionScope.memSession.studentVO.stuCd != null }">
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;학적 변동 현황</p>
<table  id="record"  class="table mb-0">
<thead class="table-light">
   <tr style="border-top: 2px solid #112a63">
      <th>년도</th>
      <th>학기</th>
      <th>변동일자</th>
      <th>학적상태</th>
      <th>학적 변동</th>
      <th>변동사유</th>
      <th>복학예정일자</th>
   </tr>
</thead>
   <c:forEach var="record" items="${list }">
   <tr>
      <td>${record.recYr }</td>
      <td>${record.recSem }</td>
      <td><fmt:formatDate value="${record.recDt }" pattern="yyyy/MM/dd"/></td>
      <td>${record.recCate }</td>
      <td>
         <c:if test="${record.recYn eq 0 }"><span style="color:#828282;">승인대기</span></c:if>
         <c:if test="${record.recYn eq 1 }"><span style="color:#2828CD;">승인</span></c:if>
         <c:if test="${record.recYn eq 2 }"><span style="color:#CD3861;">반려</span></c:if>
      </td>
      <td>${record.recRsn }</td>
      <td>${record.endExpect }</td>
      </tr>
   </c:forEach>
</table>
</c:if>
</div>
<div id="passRound">
<form action="/myPage/pwUpdate" method="post" id="changePw">
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;비밀번호 변경</p>

<div id="tgradeYellowBox">
      <span id="tgradeGreenText">※ 비밀번호 설정 조건</span>
      <br>
      <span id="tgradeGreenText"> - 숫자, 특수문자(~`!@#$%\^&*()-+=) 1회 이상, 영문은 2회 이상이어야 합니다.</span>
      <br>
      <span id="tgradeGreenText"> - 8자리 이상으로 이루어져야 합니다.</span>
</div>
<div style="text-align:center;margin-top : 15px;">
<div id="inputRound">
<input type="password" name="prePw" id="prePw" placeholder="현재 비밀번호 입력">
<br>
<input type="password" name="newPw" id="newPw" placeholder="새 비밀번호 입력">
<br>
<input type="password" name="newPwCon" id="newPwCon" placeholder="새 비밀번호 확인">
</div>
<Button type="button" id="changePwBtn" class="btn btn-primary">변경하기</Button>
<br style="clear:both;">
<img alt="" src="/resources/images/logoName.png" style="display : inline-block;">
</div>
</form>
</div>

</div>
</div>
</div>
</body>
</html>