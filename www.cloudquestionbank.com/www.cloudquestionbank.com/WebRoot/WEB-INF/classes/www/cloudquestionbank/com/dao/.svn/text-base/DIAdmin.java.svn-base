package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;

/**
 * DAO层【管理员接口】
 * @author ( 人 )
 *
 */
public interface DIAdmin {
	/**
	 * id查询后台用户数据
	 * @param sql
	 * @param str
	 * @return
	 */
	public List adminfindid(String sql,String...str);
	/**
	 * 功能:后台登录
	 * 
	 */
	public List loginDl(String sql,String...str);
	
	
	
	/**
	 * 功能：查询管理员状态
	 * @param sql
	 * @param Strs
	 * @return
	 */
	public String findAdminStatus(String sql,String... Strs);
	/**
	 * 查询管理员是否存在
	 * @param sql
	 * @param Strs
	 * @return
	 */
	public String findAdminIsExistence(String sql,String...Strs);
	/**
	 * 功能:操作管理员
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OptionAdmin(String sql,String...Strs);
	
	/**
	 * 功能:获取管理员集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	/**
	 * 功能：获取管理员集合
	 * @param hql
	 */
	List<Admin> GetObjectList(String hql);
}
