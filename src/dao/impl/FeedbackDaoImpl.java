package dao.impl;
import java.sql.SQLException;
import java.util.List;

import model.Feedback;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.FeedbackDao;

public class FeedbackDaoImpl extends HibernateDaoSupport implements FeedbackDao {

	

	public void deleteBean(Feedback bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Feedback bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Feedback selectBean(String where) {
		List<Feedback> list = this.getHibernateTemplate().find("from Feedback "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from Feedback  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Feedback> selectBeanList(final int start,final int limit,final String where) {
		return (List<Feedback>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<Feedback> list = session.createQuery(" from Feedback"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(Feedback bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
