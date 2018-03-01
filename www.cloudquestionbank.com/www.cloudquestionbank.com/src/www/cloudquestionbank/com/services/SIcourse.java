package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Course;

/**
 * Services【课程表业务接口】
 * @author ( 人 )
 *
 */
public interface SIcourse {
	/**
	 * 功能:课程阶段题数查询
	 * @param sql查询语句
	 * @param str所需参数
	 * @returnObject[]
	 */
	public List courseFind(String...str);
	/**
	 * 功能:课程阶段题数查询
	 * @param sql查询语句
	 * @param str所需参数
	 * @returnObject[]
	 */
	public List courseFind2(String...str);
	/**
	 * 功能:课程阶段题数查询
	 * @param sql查询语句
	 * @param str所需参数1·一级课程的名字2·阶段ID
	 * @returnObject[]
	 * 课程级别:二级
	 */
	public List course2level(String...str);
	
	/**
	 * 功能：获取某个阶段下题库中有题目的所有课程
	 * @param course
	 * @return
	 */
	List GetCourseList(Course course);
	
	public List progressbar(String...str);
	public List find_Ranking(String...str);
	public List find_Ranking1(String...str);
	public List find_Ranking2(String...str);
	public List find_cuoTi(String...str);
	
	/**
	 * 获取某个课程下的一级分类下的课程
	 * @param course
	 * @return
	 */
	List GetStageFirstCourse(Course course);
	/**
	 * 获取某个阶段下的说有课程分类
	 * @param course
	 * @return
	 */
	String GetStageCourseList(Course course);
	
	/**
	 * 新增课程
	 * @param course
	 * @return
	 */
	boolean AddCourse(Course course);
	/**
	 * 是否在某个阶段下所属某个下已有此课程名
	 * @param course
	 * @return
	 */
	boolean ISexistenceCourse(Course course);
	/**
	 * 获取课程集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String IDarr);
	
	
}
