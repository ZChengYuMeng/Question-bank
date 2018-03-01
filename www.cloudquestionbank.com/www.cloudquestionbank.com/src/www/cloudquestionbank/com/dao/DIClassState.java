package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO层【班级状态】
 * @author ( 人 )
 *
 */
public interface DIClassState {
	/**
	 * 获取班级状态集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List getlist(String sql,String...Strs);
}
