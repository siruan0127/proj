package kr.ac.lms.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.lms.service.MyPageService;
import kr.ac.lms.service.loginTestService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RecordVO;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@RequestMapping("/myPage")
@Controller
public class myPageController {
	
	@Autowired
	MyPageService myPageService;
	@Autowired
	loginTestService logintestService;
	
	
	
	/**
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping("/stuMyPage")
	public String myPage(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		List<RecordVO> list = this.myPageService.selectRecord(memCd);
		log.info("list : " + list);
		
		model.addAttribute("list", myPageService.selectRecord(memCd));
		
		return "myPage/stuMyPage";
	}

	
	/**
	 * @param memFnm
	 * @param uploadFile
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping("/saveProfile")
	public String saveInfo(String memFnm, MultipartFile uploadFile ,HttpServletRequest request,
			HttpServletResponse response,Model model){
		log.info("controller들어옴, uploadFile : " + uploadFile);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
//		int memCd = 20220001;
		log.info("session값 들고옴");
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath  = servletContext.getRealPath("/");
		log.info("경로찾기 :" + realPath);
		int idx = realPath.indexOf(".metadata");
		String uploadFolder = realPath.substring(0, idx);
		uploadFolder += "LMSProj\\src\\main\\webapp\\resources\\profileImg";
//		realPath += "resources\\profileImg\\";
		
		log.info("uploadFolder : " + uploadFolder);
		
		//* UUID를 사용해서 파일명이 중복되지 않도록 처리
		UUID uid = UUID.randomUUID();
		//* DB에도 UUID가 들어간 파일명으로 처리되어야함
		memFnm =  uid.toString() + uploadFile.getOriginalFilename();
		File saveFile = new File(uploadFolder, memFnm);
		
		log.info("파일저장함");
		
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		log.info("map세팅");
		String path = uploadFolder + memFnm;
		model.addAttribute("memFpt",path);
		
		log.info("memCd : " + memCd);
		log.info("memFnm : " + memFnm);
		log.info("memFpt : " + path);
		
		map.put("memCd", memCd);
		map.put("memFnm",memFnm);
		map.put("memFpt", path);
		log.info("sql접근예정");
		int res = myPageService.uploadProfile(map);
		log.info("res 저장");
		String msg;
		if(res==1)
			msg="1";
		else
			msg="0";
		
		log.info("msg 저장");
		
		HashMap<String, Object> newMap = new HashMap<String, Object>();
		String memPass = memberVO.getMemPass();
		newMap.put("memCd", memCd);
		newMap.put("memPass", memPass);
		int result = logintestService.login(newMap);
		
		if(result == 1) {//1번은 학생
			MemberVO memVO = logintestService.stuSession(memCd);
			
			//res(1) -> memVO : MemberVO [memCd=20220001, memNm=이도현, memNme=Lee Do Hyeon
			//, memTel=010-4929-0808, memZip=54321, memAddr1=대전 중구 오류동 사공 빌딩
			//, memAddr2=101동 102호, memReg1=950411, memReg2=1234567, memMl=lehgus0411@naver.com
			//, memPass=e5708cbc, memBank=국민은행, memDepo=이도현, memAct=1234543212121, memFnm=0
			//, memFpt=null, birth=null, sex=null, depNm=null, stuSem=0, stuYr=0, first=null]
			
			log.info("res(1) -> memVO : " + memVO);
			//null세팅
			
			session.setAttribute("memSession", logintestService.stuSession(memCd));
			log.info("memSession : " + session.getAttribute("memSession"));
		}
		else if(result == 2) {//2번은 교수
			MemberVO memVO = logintestService.proSession(memCd);
			
			log.info("res(2) -> memVO : " + memVO);
			
			session.setAttribute("memSession", logintestService.proSession(memCd));
		} 
		else if(result == 3) {//3번은 관리자
			MemberVO memVO = logintestService.mgrSession(memCd);
			
			log.info("res(3) -> memVO : " + memVO);
			
			session.setAttribute("memSession", logintestService.mgrSession(memCd));
		} 
		
		
		return msg;
	}
	
	/**
	 * @param model
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/reloadImg")
	public MemberVO reloadImg(Model model,HttpServletRequest request) {
		log.info("== reloadImg ==");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		String res = myPageService.selectProfile(memCd);
		log.info("res >> " + res);
		MemberVO memberVO1 = new MemberVO();
		memberVO1.setMemFnm(res);
		
		return memberVO1;
	}
	
	/**
	 * @param request
	 * @param prePw
	 * @param newPwCon
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/pwCheck")
	@ResponseBody
	public int pwCheck(HttpServletRequest request,String prePw, String newPwCon) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		
		String memberPw = myPageService.selectPW(memCd);
		if( memberVO == null || !prePw.equals(memberPw)) {
			return 0;
		}
		
		return 1;
	}
	
	/**
	 * @param newPwCon
	 * @param rttr
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/pwUpdate")
	public String pwUpdate(String newPwCon,RedirectAttributes rttr,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memCd", memCd);
		map.put("memPass", newPwCon);
		
		myPageService.updatePW(map);
		return "redirect:/myPage/stuMyPage";
	}
	
}
