package www.cloudquestionbank.com.daoImpl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIPurchaseStage;
import www.cloudquestionbank.com.entity.Purchasestage;

/**
 * DAOImpl【用户购买阶段表】
 * @author ( 人 )
 *
 */
public class DPurchaseStageImpl implements DIPurchaseStage {
	DI_Impl_Util DU;
	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	@Override
	public boolean OPtionPurchaseStage(String sql,String...Strs) {
		return DU.update(sql, Strs);
	}

}
