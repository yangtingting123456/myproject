package dao.impl;

import java.sql.SQLException;
import java.util.List;


import model.Dianping;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.DianpingDao;



public class DianpingDaoImpl extends HibernateDaoSupport implements DianpingDao {

	

	public void deleteBean(Dianping bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Dianping bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Dianping selectBean(String where) {
		List<Dianping> list = this.getHibernateTemplate().find("from Dianping "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from Dianping  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Dianping> selectBeanList(final int start,final int limit,final String where) {
		return (List<Dianping>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<Dianping> list = session.createQuery(" from Dianping"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(Dianping bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
