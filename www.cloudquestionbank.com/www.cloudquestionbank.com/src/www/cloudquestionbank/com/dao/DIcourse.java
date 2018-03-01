package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Completecurriculum;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Topicselftesthistory;


/**
 * DAO层【课程表接口】
 * @author ( 人 )
 *
 */
public interface DIcourse {
	/**
	 * 功能:课程阶段题数查询
	 * @param sql查询语句
	 * @param str所需参数
	 * @returnObject[]
	 * 课程级别:一级
	 */
	public List courseFind(String sql,String...str);
	
	/**
	 * 功能:课程阶段题数查询
	 * @param sql查询语句
	 * @param str所需参数
	 * @returnObject[]
	 * 课程级别:二级
	 */
	public List course2level(String sql,String...str);
	public  List<Topicselftesthistory> find_topicselftesthistory(Topicselftesthistory tsty);
	public List<Completecurriculum> find_culum(String sql);
	
	/**
	 * 获取课程集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	/**
	 * 操作课程
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OPtionCourse(String sql,String...Strs);
	
	
	
	
}
