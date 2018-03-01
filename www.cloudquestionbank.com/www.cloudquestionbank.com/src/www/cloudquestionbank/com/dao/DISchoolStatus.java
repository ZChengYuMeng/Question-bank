package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO层【学校状态】
 * @author ( 人 )
 *
 */
public interface DISchoolStatus {
	/**
	 * 获取学校状态集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List Getlist(String sql,String...Strs);
	
}
