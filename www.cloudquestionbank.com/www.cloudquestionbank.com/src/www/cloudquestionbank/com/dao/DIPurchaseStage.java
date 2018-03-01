package www.cloudquestionbank.com.dao;

import www.cloudquestionbank.com.entity.Purchasestage;

/**
 * DAO层【用户购买阶段接口】
 * @author ( 人 )
 *
 */
public interface DIPurchaseStage {
	/**
	 * 操作购买阶段
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OPtionPurchaseStage(String sql,String...Strs);
}
