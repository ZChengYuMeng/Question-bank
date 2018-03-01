package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 *  DAO层【后台管理导航条接口】
 * @author ( 人 )
 *
 */
public interface DIBackgroundManagementNavigationBar {
	/**
	 * 功能:查询后台管理导航条
	 * @param sql
	 * @param Strs
	 * @return
	 */
	public List GetBMN(String sql);
}
