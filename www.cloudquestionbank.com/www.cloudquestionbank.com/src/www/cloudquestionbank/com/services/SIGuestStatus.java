package www.cloudquestionbank.com.services;

import www.cloudquestionbank.com.entity.Guest;

/**
 * Services【用户状态表业务接口】
 * @author ( 人 )
 *
 */
public interface SIGuestStatus {
	/**
	 * 功能修改用户登录状态(原生sql)
	 * 可用于多条件修改
	 * 状态:繁忙
	 * @param guest
	 * @return
	 */
	public boolean upstatus(String...str);
	/**
	 * 功能修改用户登录状态(原生sql)
	 * 可用于多条件修改
	 * 状态:正常
	 * @param guest
	 * @return
	 */
	public boolean upstatus1(String...str);
	/**
	 * 功能修改用户登录状态(原生sql)
	 * 可用于多条件修改
	 * 状态:离线
	 * @param guest
	 * @return
	 */
	public boolean upstatus2(String...str);
	/**
	 * 功能修改用户登录状态(原生sql)
	 * 可用于多条件修改
	 * 状态:无效
	 * @param guest
	 * @return
	 */
	public boolean upstatus3(String...str);
}
