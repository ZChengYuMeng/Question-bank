package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


/**
 * DAOImpl层帮助类PS:基于Hibernate的帮助类
 * @author ( 人 )
 */
public class DI_Impl_Util extends HibernateDaoSupport {
	/**
	 * [通用原生sql条件查询方法]
	 * @param sql SQL语句
	 * @param Strs 条件
	 * @return List
	 */
	public List<?> GetList(String sql,String...Strs){
		List list;
		Query query= this.getSession().createSQLQuery(sql);
		for (int i = 0; i < Strs.length; i++) {
			query.setString(i,Strs[i]);
		}
		list=query.list();
		return list;
	}
	
	/**
	 * [通用原生sql查询方法]
	 * @param sql SQL语句
	 * @param Strs 条件
	 * @return String
	 */
	public String GetString(String sql,String...Strs){
		String returnStr="";
		Query query= this.getSession().createSQLQuery(sql);
		for (int i = 0; i < Strs.length; i++) {
			query.setString(i,Strs[i]);
		}
		returnStr=query.uniqueResult().toString();
		//System.out.println("uniqueResult:"+returnStr);
		return returnStr;
	}
	
	/**
	 * [通用增删改语句]
	 * @param sql
	 * @param Strs
	 * @return boolean
	 */
	public boolean update(String sql, String... Strs) {
		Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < Strs.length; i++) {
			query.setString(i,Strs[i]);
		}
		boolean bool=(query.executeUpdate()>0);
		return bool;
	} 
	

	
	public List<?> GetObjectList(String hql){
		return this.getHibernateTemplate().find(hql);
	}
	/*public Object SingleField(String sql,String...Strs){
		System.out.println("ha");
		Query query = this.getSession().createSQLQuery(sql);
		System.out.println(query.getQueryString());
		for (int i = 0; i < Strs.length; i++) {
			query.setString(i,Strs[i]);
		}
		System.out.println(query.uniqueResult());
		System.out.println(query.list());
		return null;
	}*/
}
