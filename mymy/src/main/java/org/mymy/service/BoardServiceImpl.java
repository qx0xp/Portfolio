package org.mymy.service;

import java.util.ArrayList;

import org.mymy.dao.BoardDAO;
import org.mymy.dao.GoodDAO;
import org.mymy.model.BoardDTO;
import org.mymy.model.Criteria;
import org.mymy.model.GoodDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO bdao;
	@Autowired
	GoodDAO gdao;
	
	// 공지 게시판 글쓰기
	public void boardWritePost(BoardDTO bdto) {
		bdao.boardWritePost(bdto);
	}
	
	// 공지 게시판 리스트 불러오기
	public ArrayList<BoardDTO> boardList(Criteria cri){
		return bdao.boardList(cri);
	}
	
	// 공지 게시판 전체 건 수 조회(검색 고려)
	public int getTotalCnt(Criteria cri) {
		return bdao.getTotalCnt(cri);
	}
	
	// 공지 게시글 상세 페이지 조회
	// 트랜잭션 명시
	@Transactional
	public BoardDTO boardDetail(int bno) {
		bdao.boardCntUp(bno);
		return bdao.boardDetail(bno);
	}
	
	// 공지 게시글 수정
	public void boardModifyPost(BoardDTO bdto) {
		bdao.boardModifyPost(bdto);
	}
	
	// 공지 게시글 삭제
	public void boardRemove(int bno) {
		bdao.boardRemove(bno);
	}
	
	// 좋아요 추가
	public void addGood(GoodDTO gdto) {
		gdao.addGood(gdto);
		gdao.updateGood(gdto);
	}
	
	// 좋아요 삭제
	public void deleteGood(GoodDTO gdto) {
		gdao.deleteGood(gdto);
		gdao.updateGood(gdto);
	}
	
	// 좋아요 여부 확인
	public int selectGood(GoodDTO gdto) {
		return gdao.selectGood(gdto);
	}
	
	// 해당 게시글 좋아요 총 개수 확인
	public int getGoodCnt(int bno) {
		return gdao.getGoodCnt(bno);
	}
}
