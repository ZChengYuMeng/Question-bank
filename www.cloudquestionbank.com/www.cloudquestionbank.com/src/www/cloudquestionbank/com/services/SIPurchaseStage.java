package www.cloudquestionbank.com.services;

import www.cloudquestionbank.com.dao.DIPurchaseStage;
import www.cloudquestionbank.com.entity.Purchasestage;

/**
 * Services���û�����׶α�ҵ��ӿڡ�
 * @author ( �� )
 *
 */
public interface SIPurchaseStage {
	/**
	 * ����γ�
	 * @param pe
	 * @return
	 */
	boolean AddPurchaseStage(Purchasestage pe,String GuestIDArr);
	
}
