package dao.impl;

import java.sql.SQLException;
import java.util.List;


import model.Lease;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.LeaseDao;



public class LeaseDaoImpl extends HibernateDaoSupport implements LeaseDao {

	

	public void deleteBean(Lease bean) {
		this.getHibernateTemplate().delete(bean);
		
	}

	public void insertBean(Lease bean) {
		this.getHibernateTemplate().save(bean);
		
	}

	@SuppressWarnings("unchecked")
	public Lease selectBean(String where) {
		List<Lease> list = this.getHibernateTemplate().find("from Lease "+where);
		if(list.size()==0){
			return null;
		}
		return list.get(0);
	}

	public long selectBeanCount(final String where) {
		long count = (Long)this.getHibernateTemplate().find(" select count(*) from Lease  "+where).get(0);
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Lease> selectBeanList(final int start,final int limit,final String where) {
		return (List<Lease>)this.getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(final Session session) throws HibernateException, SQLException {
				List<Lease> list = session.createQuery(" from Lease"+where).setFirstResult(start).setMaxResults(limit).list();
				return list;
			}
		});
		
	}

	public void updateBean(Lease bean) {
		this.getHibernateTemplate().update(bean);
		
	}
	
	
	
	
	
	
	
}
