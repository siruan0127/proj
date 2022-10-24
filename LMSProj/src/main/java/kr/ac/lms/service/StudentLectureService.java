package kr.ac.lms.service;

import java.util.List;

import java.util.Map;

import kr.ac.lms.vo.AttenadenceVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.LecQnaVO;
import kr.ac.lms.vo.LecQnarVO;
import kr.ac.lms.vo.StuLecVO;
import kr.ac.lms.vo.StuTestVO;
import kr.ac.lms.vo.TaskSubmitVO;
import kr.ac.lms.vo.TestVO;

public interface StudentLectureService {

	// 학생 대시보드
	public List<LecApplyVO> getStuLecList(Map<String, Object> map);
	
	// 대시보드 년도 검색
	public List<LecApplyVO> getLecaYr (int stuCd);
	
	// 대시보드 학기 검색
	public List<LecApplyVO> getLecaSem (Map<String, Object> map);

	// 학생 퀴즈 부모 insert
	public int stuTestInsert(StuTestVO stuTestVO);

	// 학생 퀴즈 자식 insert
	public int testDetailInsert(Map<String, Object> testDetailVOMap);
	
	// 학생 퀴즈 제출 확인
	public List<TestVO> checkQuizSubmit(int stuCd);
	
	// 학생 제출 답안 오답확인
	public TestVO stuTestDetail(Map<String, Object> map);
	
	// 질문게시판 조회
	public List<LecQnaVO> getLecQnaList(int lecCd);
	
	// 질문게시판 상세 조회
	public LecQnaVO getLecQnaDetail(int lqnaCd);
	
	// 질문게시판 수정
	public int lecQnaUpdate(LecQnaVO lecQnaVO);
	
	// 질문게시판 삭제
	public int lecQnaDelete(int lqnaCd);
	
	// 질문게시판의 모든 답글 삭제
	public int lecQnarAllDelete(int lqnaCd);
	
	// 질문게시판 등록
	public int lecQnaInsert(LecQnaVO lecQnaVO);
	
	// 질문게시판 조회수 증가
	public int lecQnaHit(int lqnaCd);
	
	// 질문게시판 답글 조회
	public List<LecQnarVO> getLecQnar (int lqnaCd);
	
	// 질문게시판 답글 등록
	public int lecqnarInsert(LecQnarVO lecQnarVO);
	
	// 질문게시판 답글 수정
	public int lecQnarUpdate(LecQnarVO lecQnarVO);
	
	// 질문게시판 답글 삭제
	public int lecQnarDelete(int lqnarCd);
	
	// 과제 및 평가 등록(학생)
	public int stuLecTaskInsert(TaskSubmitVO taskSubmitVO);
	
	// 과제 및 평가 제출 확인
	public List<TaskSubmitVO> lecTaskSubmit(int stuCd);
	
	// 과제 및 평가 제출 상세
	public TaskSubmitVO stuLecTaskDetail(Map<String, Object> map);
	
	// 과제 및 평가 수정(학생)
	public int stulecTaskUpdate(TaskSubmitVO taskSubmitVO);
	
	// 과제 및 평가 삭제(학생)
	public int stuLecTaskDelete(int tsubCd);
	
	// 출결 조회
	public List<AttenadenceVO> getStuLecAttend(Map<String, Object> map);
	
	// 최종 성적
	public StuLecVO getStuGrade(Map<String, Object> map);
	
	//포틀릿 당학기 조회(학생)
	public List<LecApplyVO> portGetCurrentLec(int stuCd);
	
	//포틀릿 당학기 조회(교수)
	public List<LecApplyVO> portGetCurrentLecPro(int proCd);
}
