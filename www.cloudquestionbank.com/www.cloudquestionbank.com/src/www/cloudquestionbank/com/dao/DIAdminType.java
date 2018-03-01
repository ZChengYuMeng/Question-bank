package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Admintype;


/**
 * DAO层【管理员类型接口】
 * @author ( 人 )
 *
 */
public interface DIAdminType {
	/**
	 * 署名：胡歌
	 * 方法名：这是查询管理类型表的查询方法
	 * @param sql 
	 * @param Strs 
	 * @return 返回一个List<Admintype>对象
	 */
	public List find(String sql,String...Strs);
	
}
