package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import www.cloudquestionbank.com.dao.DINotice;

/**
 * DAOImpl【公告表】
 * @author ( 人 )
 *
 */
public class DNoticeImpl  implements DINotice{
	DI_Impl_Util DU;
	
	@Override
	public boolean OptionNotice(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}

	@Override
	public List GetList(String sql, String... Strs) {
		return DU.GetList(sql, Strs);
	}

	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}
}
