package www.cloudquestionbank.com.services;

import www.cloudquestionbank.com.dao.DIPurchaseStage;
import www.cloudquestionbank.com.entity.Purchasestage;

/**
 * Services【用户购买阶段表业务接口】
 * @author ( 人 )
 *
 */
public interface SIPurchaseStage {
	/**
	 * 购买课程
	 * @param pe
	 * @return
	 */
	boolean AddPurchaseStage(Purchasestage pe,String GuestIDArr);
	
}
