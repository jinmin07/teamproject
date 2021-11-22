package com.example.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.NoticeMapper";
	
	@Override
	public List<NoticeVO> list(String receiver) {
		return session.selectList(namespace+".list", receiver);

	}

	@Override
	public int noticeUnreadCount(String u_id) {
		return session.selectOne(namespace + ".notice_unread_count", u_id);

	}

	@Override
	public void noticeReadDate(String u_id) {
		session.update(namespace+".notice_read_date", u_id);
	}

	@Override
	public void insert(NoticeVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(int n_id) {
		session.delete(namespace + ".delete", n_id);

	}

}
