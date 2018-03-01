package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIAdminStatus;
import www.cloudquestionbank.com.entity.Adminstatus;

/**
 * DAOImpl【管理员状态表】
 * @author ( 人 )
 *
 */
public class DAdminStatusImpl extends HibernateDaoSupport implements DIAdminStatus {
	DI_Impl_Util DU;
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	@Override
	public boolean upstatus(String sql, String... str) {
		return DU.update(sql, str);
	}

	@Override
	public List GetList(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}
}
