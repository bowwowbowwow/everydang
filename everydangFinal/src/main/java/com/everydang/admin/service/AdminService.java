package com.everydang.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.everydang.admin.dao.AdminDAO;
import com.everydang.admin.dao.IAdminDAO;
import com.everydang.vo.AdminVO;
import com.everydang.vo.PageVO;

public class AdminService implements IAdminService{
	private IAdminDAO dao;
	private static IAdminService service;
	
	private AdminService() {
	   dao = AdminDAO.getInstance(); 
	}
	public static IAdminService getInstance() {
	   if(service == null) service = new AdminService();
	   return service;
	}

	@Override
	public int selectMemberTotalCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberTotalCount();
	}

	@Override
	public int selectTodayNewMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectTodayNewMemberCount();
	}

	@Override
	public int selectTodayNewReportCount() {
		// TODO Auto-generated method stub
		return dao.selectTodayNewReportCount();
	}

	@Override
	public List<AdminVO> selectNewPost() {
		// TODO Auto-generated method stub
		return dao.selectNewPost();
	}
	@Override
	public List<AdminVO> selectPopularPost() {
		// TODO Auto-generated method stub
		return dao.selectPopularPost();
	}
	@Override
	public List<AdminVO> selectNewMember() {
		// TODO Auto-generated method stub
		return dao.selectNewMember();
	}

	@Override
	public List<AdminVO> selectAllMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllMember(map);
	}

	@Override
	public PageVO getMemberInfo(int page) {
		
		int count = this.selectMemberTotalCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
	public PageVO getBlacklistInfo(int page) {
		
		int count = this.selectBlacklistTotalCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
	
	@Override
	public List<AdminVO> selectAllReport(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllReport(map);
	}
	@Override
	public int selectBlacklistTotalCount() {
		// TODO Auto-generated method stub
		return dao.selectBlacklistTotalCount();
	}
	@Override
	public List<AdminVO> selectAllBlacklist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllBlacklist(map);
	}
	@Override
	public int deleteReport(String rp_no) {
		// TODO Auto-generated method stub
		return dao.deleteReport(rp_no);
	}
	@Override
	public int updateBlacklist(String rp_no) {
		// TODO Auto-generated method stub
		return dao.updateBlacklist(rp_no);
	}
	@Override
	public int updateDefendentGrade(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updateDefendentGrade(map);
	}
	@Override
	public int selectReportCount() {
		// TODO Auto-generated method stub
		return dao.selectReportCount();
	}
	
	@Override
	public PageVO getReportInfo(int page) {
		
		int count = this.selectReportCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;

	}
	
	@Override
	public List<AdminVO> selectAllPost(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllPost(map);
	}
	
	@Override
	public int selectPostCount() {
		// TODO Auto-generated method stub
		return dao.selectPostCount();
	}
	
	@Override
	public PageVO getPostInfo(int page) {
		int count = this.selectPostCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
	@Override
	public int deletePost(String ps_no) {
		// TODO Auto-generated method stub
		return dao.deletePost(ps_no);
	}
	@Override
	public int deletePosts(List<String> list) {
		// TODO Auto-generated method stub
		return dao.deletePosts(list);
	}
	@Override
	public int selectCommentCount() {
		// TODO Auto-generated method stub
		return dao.selectCommentCount();
	}
	@Override
	public List<AdminVO> selectAllComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllComment(map);
	}
	@Override
	public PageVO getCommentInfo(int page) {
		int count = this.selectCommentCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
	@Override
	public int deleteComment(String ps_no) {
		// TODO Auto-generated method stub
		return dao.deleteComment(ps_no);
	}
	
	@Override
	public int insertBlacklist(String mm_id) {
		// TODO Auto-generated method stub
		return dao.insertBlacklist(mm_id);
	}
	@Override
	public int selectMyPostCount() {
		// TODO Auto-generated method stub
		return dao.selectMyPostCount();
	}
	
	@Override
	public int selectMyCommentCount() {
		// TODO Auto-generated method stub
		return dao.selectMyCommentCount();
	}
	
	@Override
	public List<AdminVO> selectAllMyPost(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllMyPost(map);
	}
	
	@Override
	public PageVO getMyPostInfo(int page) {
		// TODO Auto-generated method stub
		int count = this.selectMyPostCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}
	
	@Override
	public List<AdminVO> selectAllMyComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllMyComment(map);
	}
	
	@Override
	public PageVO getMyCommentInfo(int page) {
		// TODO Auto-generated method stub
		int count = this.selectMyCommentCount();
		
		int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());
		
		int start = (page-1) * PageVO.getPerList() + 1;
		int end = start + PageVO.getPerList() - 1;
		
		if(end>count) end = count;
		
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}

}
