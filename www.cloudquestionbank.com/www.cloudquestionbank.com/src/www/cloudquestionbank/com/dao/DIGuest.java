package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO层【用户表接口】
 * @author ( 人 )
 *
 */
public interface DIGuest {
	/**
	 * 前台主页登录成功
	 * 参数类型:String sql(sql语句),String []str(参数数组)
	 * @author业务层传进所需参数sql,str
	 * @author用到原生sql语句进行多表连接
	 */
	public List loginfind(String sql);
	/**
	 * 判断用户是否存在
	 * @param sql
	 * @param str
	 * @return
	 */
	public List loginDl(String sql,String...str);
	/*
	 * 用户名查询
	 */
	public List loginname(String sql,String name);
	/**
	 * 操作用户
	 * @param sql
	 * @return
	 */
	public boolean OperationGuest(String sql,String...Strs);
	/**
	 * 获取一个集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	public List	ISexistence(String sql,String...Strs);
	/**
	 * 获取对象集合
	 * @param hql
	 * @return
	 */
	public List<?> GetOBjectList(String hql);
	
	
}
