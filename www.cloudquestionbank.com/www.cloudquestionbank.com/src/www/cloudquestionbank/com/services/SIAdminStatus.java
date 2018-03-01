package www.cloudquestionbank.com.services;

import java.util.List;

/**
 * Services【管理员状态表业务接口】
 * @author ( 人 )
 *
 */
public interface SIAdminStatus {
	/**
	 * 功能修改管理员状态(原生sql)
	 * 可用于多条件修改
	 * 状态:[1:正常,2:繁忙,3:离线,4:审核中,5:失效]
	 * @param guest
	 * @return
	 */
	public boolean upstatus(String...str);
	
	/**
	 * 功能:登录时修改管理员状态并修改最后登录时间
	 * @param Strs
	 * @return
	 */
	public boolean LoginUpStatuslastLoginTime(String...Strs);
	
	/**
	 * 获取管理员状态
	 * @return
	 */
	List GetStatusStr();
}
