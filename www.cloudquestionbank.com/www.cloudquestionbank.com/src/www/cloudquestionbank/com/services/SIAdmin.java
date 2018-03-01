package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;

/**
 * Services【管理员表业务接口】
 * @author ( 人 )
 *
 */
public interface SIAdmin {
	/**
	 * id查询后台用户数据
	 * @param sql
	 * @param str
	 * @return
	 */
	public List adminfindid(String...str);
	/**
	 * 功能:后台登录
	 * 
	 */
	public List loginDl(String...str);
	/**
	 * 功能:查询管理员活动状态
	 * @param Admin
	 * @return String
	 */
	public String FindAdminStatus(Admin admin);
	/**
	 * 查询管理员是否存在
	 * @param admin
	 * @return
	 */
	public boolean findAdminIsExistence(Admin admin);
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	boolean Addadmin(Admin admin);
	/**
	 * 是否存在管理员邮箱
	 * @param admin
	 * @return
	 */
	boolean AdminIsEmail(Admin admin);
	/**
	 * 是否存在管理员身份证 
	 * @param admin
	 * @return
	 */
	boolean AdminIsCardNo(Admin admin);
	/**
	 * 获取Json格式的Object集合
	 * @param admin
	 * @return
	 */
	String GetJsonObject(Admin admin);
	/**
	 * 修改管理员基本信息
	 * @param admin
	 * @return
	 */
	boolean UpdAdmin(Admin admin);
	/**
	 * 获取JSON格式的教员信息
	 * @param admin
	 * @return
	 */
	String GetJSonTeacher(Admin admin);
}
