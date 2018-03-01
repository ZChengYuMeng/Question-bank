package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Course;

/**
 * Services���γ̱�ҵ��ӿڡ�
 * @author ( �� )
 *
 */
public interface SIcourse {
	/**
	 * ����:�γ̽׶�������ѯ
	 * @param sql��ѯ���
	 * @param str�������
	 * @returnObject[]
	 */
	public List courseFind(String...str);
	/**
	 * ����:�γ̽׶�������ѯ
	 * @param sql��ѯ���
	 * @param str�������
	 * @returnObject[]
	 */
	public List courseFind2(String...str);
	/**
	 * ����:�γ̽׶�������ѯ
	 * @param sql��ѯ���
	 * @param str�������1��һ���γ̵�����2���׶�ID
	 * @returnObject[]
	 * �γ̼���:����
	 */
	public List course2level(String...str);
	
	/**
	 * ���ܣ���ȡĳ���׶������������Ŀ�����пγ�
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
	 * ��ȡĳ���γ��µ�һ�������µĿγ�
	 * @param course
	 * @return
	 */
	List GetStageFirstCourse(Course course);
	/**
	 * ��ȡĳ���׶��µ�˵�пγ̷���
	 * @param course
	 * @return
	 */
	String GetStageCourseList(Course course);
	
	/**
	 * �����γ�
	 * @param course
	 * @return
	 */
	boolean AddCourse(Course course);
	/**
	 * �Ƿ���ĳ���׶�������ĳ�������д˿γ���
	 * @param course
	 * @return
	 */
	boolean ISexistenceCourse(Course course);
	/**
	 * ��ȡ�γ̼���
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String IDarr);
	
	
}
