package org.zerock.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sql;
	// 회원가입

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {

		return sql.selectOne("memberMapper.login", vo);
	}

	// 서비스에서 보낸 파라미터들을 memberUpdate(MemberVO vo)에 담습니다.
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpdate", vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception{
		sql.delete("memberMapper.memberDelete", vo);
	}
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.passChk", vo);
		return result;
		}
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}
	}
	

