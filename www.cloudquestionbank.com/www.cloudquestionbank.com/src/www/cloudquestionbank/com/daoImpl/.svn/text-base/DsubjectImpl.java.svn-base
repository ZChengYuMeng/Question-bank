package www.cloudquestionbank.com.daoImpl;


import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIsubject;
import www.cloudquestionbank.com.entity.Subject;
import www.cloudquestionbank.com.entity.Topicselftesthistory;
import www.cloudquestionbank.com.entity.Topicselftesthistorydetails;

/**
 * DAOImpl【题目表】
 * @author ( 人 )
 *
 */
public class DsubjectImpl extends HibernateDaoSupport implements DIsubject{
	DI_Impl_Util DU;
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	
	@Override
	public void insertsb(Subject sbj) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(sbj);
	}

	@Override
	public List findkc(String sql) {
		// TODO Auto-generated method stub
		return this.getSession().createSQLQuery(sql).list();
	}

	@Override
	public List findkc_couse(String sql, String... str) {
		// TODO Auto-generated method stub
		/*Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		query.getQueryString();*/
		return DU.GetList(sql, str);
	}

	@Override
	public void insert_tsy(Topicselftesthistory tsy) {
		this.getHibernateTemplate().save(tsy);
	}

	@Override
	public void insert_tsyDetails(Topicselftesthistorydetails tsyd) {
		this.getHibernateTemplate().save(tsyd);
	}

	@Override
	public List find_tsyDetails(String sql, String... str) {
		// TODO Auto-generated method stub
		/*Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		query.getQueryString();*/
		return DU.GetList(sql, str);
	}

	@Override
	public List find_tsy(String sql, String... str) {
		// TODO Auto-generated method stub
		/*Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		query.getQueryString();*/
		return DU.GetList(sql, str);
	}

	@Override
	public List find_timu(String sql, String... str) {
		// TODO Auto-generated method stub
		/*Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
			System.out.println("str[i]  "+str[i]);
		}
		//System.out.println("sql:_"+sql);
		query.getQueryString();*/
		return DU.GetList(sql, str);
	}

	@Override
	public List find_all() {
		// TODO Auto-generated method stub
		return this.getSession().createSQLQuery("select * from Topicselftesthistory where endTime is null").list();
	}

	@Override
	public void update_paper(String sql,String...str) {
	Query query = this.getSession().createSQLQuery(sql);
	for (int i = 0; i < str.length; i++) {
		query.setString(i, str[i]);
	}
	//System.out.println(query.getQueryString());
	query.executeUpdate();
	//System.out.println(query.executeUpdate());
	}

	@Override
	public List FindID(String sql, String... Strs) {
	/*	System.out.println("进来了"+Strs);
		Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < Strs.length; i++) {
			query.setString(i, Strs[i]);
		}
		System.out.println(query.list().size());*/
		return DU.GetList(sql, Strs);
	}

	@Override
	public void update_tsyDetails(String sql, String... str) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		query.executeUpdate();
	}

	@Override
	public Object[] find_paper_count(String sql, String... str) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subject> find_Subject(int cid) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Subject where aourse_id="+cid);
	}

	@Override
	public List find_bool(String sql, String... str) {
		/*// TODO Auto-generated method stub
		Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		System.out.println(query.list().size()+"=={}");*/
		return DU.GetList(sql, str);
	}

	@Override
	public void update_answer(String sql, String... str) {
		// TODO Auto-generated method stub
		System.out.println("123123");
		Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		System.out.println(query.getQueryString());
		query.executeUpdate();
	}
	@Override
	public void update_TestHistory(String sql, String... str) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createSQLQuery(sql);
		for (int i = 0; i < str.length; i++) {
			query.setString(i, str[i]);
		}
		query.executeUpdate();
	}

	@Override
	public List Getlist(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}

	@Override
	public List find_avgToDay(String sql, String... str) {
		return DU.GetList(sql, str);
	}
}
