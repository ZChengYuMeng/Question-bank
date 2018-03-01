package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIAdminType;
import www.cloudquestionbank.com.entity.Admintype;

/**
 * DAOImpl【管理员类型表】
 * @author ( 人 )
 *
 */
public class DAdminTypeImpl  implements  DIAdminType{
	DI_Impl_Util DU;
	@Override
	public List find(String sql, String... Strs) {
		return DU.GetList(sql,Strs);
	}
	
	
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

		
}
