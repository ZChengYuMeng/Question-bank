package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIcourse;
import www.cloudquestionbank.com.entity.Completecurriculum;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Topicselftesthistory;

/**
 * DAOImpl¡¾¿Î³Ì±í¡¿
 * @author ( ÈË )
 *
 */
public class DcourseImpl extends HibernateDaoSupport implements DIcourse {
	DI_Impl_Util DU;
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	
	
/*-------------------------------------------------------------------------*/
	@Override
	public List courseFind(String sql, String... str) {
		return DU.GetList(sql, str);
	}

	@Override
	public List course2level(String sql, String... str) {
		return DU.GetList(sql, str);
	}

	@Override
	public List<Topicselftesthistory> find_topicselftesthistory(Topicselftesthistory tsty) {
		return this.getHibernateTemplate().find(" from Topicselftesthistory where coursed="+tsty.getCoursed());
	}

	@Override
	public List<Completecurriculum> find_culum(String sql) {
		//System.out.println(sql);
		return (List<Completecurriculum>)this.getHibernateTemplate().find(sql);
	}



	@Override
	public List GetList(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}



	@Override
	public boolean OPtionCourse(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}

		
}
