package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;

/**
 * Services【后台管理导航条】
 * @author ( 人 )
 *
 */
public interface SIBackgroundManagementNavigationBar {
	/**
	 * 功能：加载后台管理导航条
	 * @param admin 
	 * @return 
	 */
	public List  GetBMN(String... Strs);
}
