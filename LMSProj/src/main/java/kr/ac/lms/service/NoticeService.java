package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.MailVO;
import kr.ac.lms.vo.NoticeVO;

public interface NoticeService {

	/**
	 * 공지사항 목록 출력
	 * @return
	 */
	public List<NoticeVO> ntcList(Map<String, String> map);

	/**
	 * 중요 공지사항 목록 출력
	 * @return
	 */
	public List<NoticeVO> ntcHotList();
	
	/**
	 * 전체 글 개수
	 * @param map
	 * @return
	 */
	public int getTotal(Map<String, String> map);

	/**
	 * 공지사항 상세 정보
	 * @return
	 */
	public NoticeVO ntcDetail(int ntcCd);
	
	/**
	 * 공지사항 작성
	 * @param mailVO
	 * @return
	 */
	public int ntcWrite(NoticeVO noticeVO);
	
	/**
	 * 공지사항 수정
	 * @param noticeVO
	 * @return
	 */
	public int updateNtc(NoticeVO noticeVO);

	/**
	 * 공지사항 삭제
	 * @param ntcCd
	 * @return
	 */
	public int deleteNtc(int ntcCd);
	
	/**
	 * 포틀릿을 위한 공지사항 출력
	 * @return
	 */
	public List<NoticeVO> portletNtc();
	
	/**
	 * 메인메뉴 상단 공지사항 출력
	 * @param cate
	 * @return
	 */
	public List<NoticeVO> mainNtcList(String cate);
}
