package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DISchool;

/**
 * DAOImpl¡¾Ñ§Ð£¡¿
 * @author ( ÈË )
 *
 */
public class DSchoolImpl extends HibernateDaoSupport implements DISchool{
	DI_Impl_Util DU;
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}
	@Override
	public List GetList(String sql, String... Strs) {
		return DU.GetList(sql,Strs);
	}
	@Override
	public boolean OptionSchool(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}
	@Override
	public boolean IsSchoolName(String sql, String... Strs) {
		boolean Isbool=DU.GetList(sql, Strs).size()>0;
		return Isbool;
	}
	
}
