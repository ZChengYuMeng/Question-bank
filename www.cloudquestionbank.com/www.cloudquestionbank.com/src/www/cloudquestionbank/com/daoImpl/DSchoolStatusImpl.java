package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import www.cloudquestionbank.com.dao.DISchoolStatus;

/**
 *  DAOImpl��ѧУ״̬��
 * @author ( �� )
 *
 */
public class DSchoolStatusImpl implements DISchoolStatus{
	DI_Impl_Util DU;
	
	
	@Override
	public List Getlist(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}


	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}
	
	
	
}
