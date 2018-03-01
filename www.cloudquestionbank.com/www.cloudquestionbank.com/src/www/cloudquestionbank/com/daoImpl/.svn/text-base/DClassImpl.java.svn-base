package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIClass;
import www.cloudquestionbank.com.entity.Class;

/**
 * DAOImpl°æ∞‡º∂±Ì°ø
 * @author ( »À )
 *
 */
public class DClassImpl extends HibernateDaoSupport implements DIClass {
	DI_Impl_Util DU;
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}
	@Override
	public List Getlist(String sql,String...Strs) {
		return DU.GetList(sql, Strs);
	}
	@Override
	public boolean OptionClass(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}

	

}
