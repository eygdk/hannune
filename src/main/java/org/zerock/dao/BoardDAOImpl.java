package org.zerock.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.vo.BoardVO;
import org.zerock.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

   @Inject
   private SqlSession sqlSession;

   // 寃뚯떆湲   옉 꽦
   @Override
   public void write(BoardVO boardVO) throws Exception {
      sqlSession.insert("boardMapper.insert", boardVO);

   }

   // 寃뚯떆臾  紐⑸줉 議고쉶
   @Override
   public List<BoardVO> list(SearchCriteria scri) throws Exception {

      return sqlSession.selectList("boardMapper.listPage", scri);

   }
   
   // 寃뚯떆臾  珥  媛  닔
   @Override
   public int listCount(SearchCriteria scri) throws Exception{
      
      return sqlSession.selectOne("boardMapper.listCount", scri);
   }
   
   

   @Override
   public BoardVO read(int bno) throws Exception {

      return sqlSession.selectOne("boardMapper.read", bno);
   }

   // 寃뚯떆臾   닔 젙
   @Override
   public void update(BoardVO boardVO) throws Exception {

      sqlSession.update("boardMapper.update", boardVO);
   }

   // 寃뚯떆臾   궘 젣
   @Override
   public void delete(int bno) throws Exception {

      sqlSession.delete("boardMapper.delete", bno);
   }
   // 泥⑤  뙆 씪  뾽濡쒕뱶
      @Override
      public void insertFile(Map<String, Object> map) throws Exception {
         // TODO Auto-generated method stub
         sqlSession.insert("boardMapper.insertFile", map);
      }
      
      @Override
      public List<Map<String, Object>> selectFileList(int bno) throws Exception {
         // TODO Auto-generated method stub
         return sqlSession.selectList("boardMapper.selectFileList", bno);
      }
      
      @Override
      public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
         // TODO Auto-generated method stub
         return sqlSession.selectOne("boardMapper.selectFileInfo", map);
      }
      
      @Override
      public void updateFile(Map<String, Object> map) throws Exception {
         // TODO Auto-generated method stub
         
         sqlSession.update("boardMapper.updateFile", map);
      }
      @Override
  	public void boardHit(int bno) throws Exception {
  		// TODO Auto-generated method stub
  		sqlSession.update("boardMapper.boardHit", bno);
  	}

}