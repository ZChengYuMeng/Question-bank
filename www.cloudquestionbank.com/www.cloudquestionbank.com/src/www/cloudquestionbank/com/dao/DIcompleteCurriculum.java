package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Completecurriculum;


/**
 *DAO层【用户以完成课程接口】
 * @author ( 人 )
 *
 */
public interface DIcompleteCurriculum {
	/**
	 * 操作用户以完成课程表
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OPptionCompleteCurriculum(String sql,String...Strs);
	
}
