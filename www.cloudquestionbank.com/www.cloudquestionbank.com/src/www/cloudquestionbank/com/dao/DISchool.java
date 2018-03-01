package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO层【学校接口】
 * @author ( 人 )
 *
 */
public interface DISchool {
	/**
	 * 查询校区	
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	
	/**
	 * 功能:操作校区
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OptionSchool(String sql,String...Strs);
	/**
	 * 功能:查询校区是否存在
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean IsSchoolName(String sql,String...Strs);
}
