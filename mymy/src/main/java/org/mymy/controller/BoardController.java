package org.mymy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mymy.model.BoardDTO;
import org.mymy.model.Criteria;
import org.mymy.model.GoodDTO;
import org.mymy.model.MemberDTO;
import org.mymy.model.PageDTO;
import org.mymy.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	@Autowired
	BoardService bservice;
	
	// 게시글 작성 페이지
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String boardWriteGet() {
		return "board/boardWrite";
	}
	
	// 게시글 작성
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String boardWritePost(BoardDTO bdto) {
		bservice.boardWritePost(bdto);
		return "redirect:/board";
	}
	
	// 게시판 리스트 불러오기
	@RequestMapping(value="/board", method=RequestMethod.GET)
	// ArrayList<boardDTO bdto> -> String
	public String boardList(Model model, Criteria cri){
		model.addAttribute("blist", bservice.boardList(cri));
		model.addAttribute("paging", new PageDTO(cri, bservice.getTotalCnt(cri)));
		return "board/boardList";
	}
	
	// 게시글 상세 페이지 조회
	@RequestMapping(value="/board/detail", method=RequestMethod.GET)
	public String boardDetail(int bno, Model model, HttpSession session, GoodDTO gdto) {
		model.addAttribute("bdetail", bservice.boardDetail(bno));
		
		if(session.getAttribute("login")!=null) {
			String memberId=((MemberDTO) session.getAttribute("login")).getId();
			gdto.setBno(bno);
			gdto.setMemberId(memberId);
		}
		
		model.addAttribute("goodChk", bservice.selectGood(gdto));
		model.addAttribute("goodCnt", bservice.getGoodCnt(bno));
		
		return "board/boardDetail";
	}
	
	// 게시글 수정 페이지
	@RequestMapping(value="/board/modify", method=RequestMethod.GET)
	public String boardModifyGet(int bno, Model model) {
		model.addAttribute("bmodify", bservice.boardDetail(bno));
		return "board/boardModify";
	}
	
	// 게시글 수정
	@RequestMapping(value="/board/modify", method=RequestMethod.POST)
	public String boardModifyPost(BoardDTO bdto) {
		bservice.boardModifyPost(bdto);
		return "redirect:/board/detail?bno="+bdto.getBno();
	}
	
	// 게시글 삭제
	@RequestMapping(value="/board/remove", method=RequestMethod.GET)
	public String boardRemove(int bno) {
		bservice.boardRemove(bno);
		return "redirect:/board";
	}
	
	// 좋아요 기능
	@ResponseBody
	@RequestMapping(value="/good", method=RequestMethod.POST, produces="application/json")
	public HashMap<String, Integer> good(@RequestBody Map<String, Object> param, GoodDTO gdto, Model model, HttpSession session) throws Exception{
		int goodVal=Integer.parseInt(String.valueOf(param.get("goodVal")));
		int bno=Integer.parseInt(String.valueOf(param.get("bno")));
		
		if(session.getAttribute("login")!=null) {
			String memberId=((MemberDTO) session.getAttribute("login")).getId();
			gdto.setBno(bno);
			gdto.setMemberId(memberId);
		}
		
		if(goodVal>0) {
			bservice.deleteGood(gdto);
			goodVal=0;
		} else {
			bservice.addGood(gdto);
			goodVal=1;
		}
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("goodVal", goodVal);
		map.put("goodCnt", bservice.getGoodCnt(bno));
		return map;
	}	
}