package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIGuest;
import www.cloudquestionbank.com.services.SIGuest;
import www.cloudquestionbank.com.servicesImpl.SGuestImpl;

/**
 * DAOImpl【用户表】
 * @author ( 人 )
 *
 */
public class DGuestImpl extends HibernateDaoSupport implements DIGuest {
	DI_Impl_Util DU;
	
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	@Override
	public List loginfind(String sql) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createSQLQuery(sql);
		return query.list();
	}

	@Override
	public List loginDl(String sql,String... str) {
		// TODO Auto-generated method stub
		/*Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i,str[i]);
		}*/
		return DU.GetList(sql, str);
	}

	@Override
	public List loginname(String sql,String name) {
		/*Query query = this.getSession().createSQLQuery(sql);
		query.setString(0,name);*/
		return DU.GetList(sql, name);
	}

	@Override
	public boolean OperationGuest(String sql,String...Strs) {
		return DU.update(sql,Strs);
	}

	@Override
	public List ISexistence(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}

	@Override
	public List<?> GetOBjectList(String hql) {
		return this.getHibernateTemplate().find(hql);
	}

}
