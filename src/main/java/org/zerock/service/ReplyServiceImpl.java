package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.dao.ReplyDAO;
import org.zerock.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
		@Inject
		private ReplyDAO dao;
		
		@Override
		public List<ReplyVO> readReply(int bno) throws Exception {
			return dao.readReply(bno);
		}
		
		@Override
		public void writeReply(ReplyVO vo) throws Exception {
			dao.writeReply(vo);
		}
		

		//댓글 수정
		public void updateReply(ReplyVO vo) throws Exception {
			dao.updateReply(vo);
		}
		
		//댓글 삭제
		public void deleteReply(ReplyVO vo) throws Exception {
			dao.deleteReply(vo);
		}
		
		//선택된 댓글 조회
		public ReplyVO selectReply(int rno) throws Exception {
			return dao.selectReply(rno);
		}
		
		

}
