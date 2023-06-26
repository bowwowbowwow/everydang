package com.everydang.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.everydang.mybatis.config.MyBatisSqlSessionFactory;
import com.everydang.vo.BoardVO;
import com.everydang.vo.PostVO;
import com.everydang.vo.ProductVO;

public class SearchPostDAO implements ISearchPostDAO {
	private static ISearchPostDAO dao;
	private SearchPostDAO() {}
	public static ISearchPostDAO getInstance() {
		if(dao == null)dao = new SearchPostDAO();
		return dao;
	}
	
	@Override
	public List<BoardVO> SearchPostList(String keyword) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = session.selectList("search.searchBoard",keyword);
		} finally {
			if (session != null) {session.close();}
		}
		
		return list;
	}
	
	@Override
	public List<ProductVO> SearchProdList(String keyword) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
		List<ProductVO> list = null;
		
		try {
			list = session.selectList("search.searchProd",keyword);
		} finally {
			if (session != null) {session.close();}
		}
		return list;
	}

}
