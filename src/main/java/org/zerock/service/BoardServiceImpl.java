package org.zerock.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.dao.BoardDAO;
import org.zerock.util.FileUtils;
import org.zerock.vo.BoardVO;
import org.zerock.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

   @Resource(name="fileUtils")
   private FileUtils fileUtils;
   
   @Inject
   private BoardDAO dao;
   
   // 寃뚯떆湲   옉 꽦
   @Override
   public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
      dao.write(boardVO);
      
      List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
      int size = list.size();
      for(int i=0; i<size; i++){ 
         dao.insertFile(list.get(i)); 
      }
   }

   // 寃뚯떆臾  紐⑸줉 議고쉶
   @Override
   public List<BoardVO> list(SearchCriteria scri) throws Exception {

      return dao.list(scri);
   }
   // 寃뚯떆臾  珥  媛  닔
   public int listCount(SearchCriteria scri) throws Exception{
      
      return dao.listCount(scri);
   }
   
   // 게시물조회
   @Transactional(isolation = Isolation.READ_COMMITTED)
   @Override
   public BoardVO read(int bno) throws Exception {
	   dao.boardHit(bno);
      return dao.read(bno);
   }

   @Override
   public void update(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {

      dao.update(boardVO);
      
      List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
      Map<String, Object> tempMap = null;
      int size = list.size();
      for(int i = 0; i<size; i++) {
         tempMap = list.get(i);
         if(tempMap.get("IS_NEW").equals("Y")) {
            dao.insertFile(tempMap);
         }else {
            dao.updateFile(tempMap);
         }
      }
   }

   @Override
   public void delete(int bno) throws Exception {

      dao.delete(bno);
   }
   
   @Override
   public List<Map<String, Object>> selectFileList(int bno) throws Exception {
      // TODO Auto-generated method stub
      return dao.selectFileList(bno);
   }
   
   @Override
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
      // TODO Auto-generated method stub
      return dao.selectFileInfo(map);
   }
}