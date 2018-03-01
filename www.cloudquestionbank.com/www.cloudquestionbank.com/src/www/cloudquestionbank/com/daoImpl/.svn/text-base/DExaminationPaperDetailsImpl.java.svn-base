package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIExaminationPaperDetails;

/**
 * DAOImpl°æ ‘æÌœÍ«È±Ì°ø
 * @author ( »À )
 *
 */
public class DExaminationPaperDetailsImpl extends HibernateDaoSupport implements DIExaminationPaperDetails {
	DI_Impl_Util DU;
	@Override
	public List GetList(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}

	@Override
	public boolean OptionExaminationPaperDetails(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}

	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}
	
}
