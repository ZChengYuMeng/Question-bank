package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIitemAnalysis;

/**
 * DAOImpl°æ ‘æÌ±Ì°ø
 * @author ( »À )
 *
 */
public class DitemAnalysisImpl extends HibernateDaoSupport implements DIitemAnalysis {
	DI_Impl_Util DU;
	
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	@Override
	public List GetList(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}

	@Override
	public boolean OptionItemAnalysis(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}

}
