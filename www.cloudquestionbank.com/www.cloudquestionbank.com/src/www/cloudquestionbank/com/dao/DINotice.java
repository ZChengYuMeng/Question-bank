package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO层【公告表】
 * @author ( 人 )
 *
 */
public interface DINotice {
	/**
	 * 获取公告表
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	/**
	 * 操作公告表
	 * @return
	 */
	boolean OptionNotice(String sql,String...Strs);
	
	
}
