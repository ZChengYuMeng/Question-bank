package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Completecurriculum;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Topicselftesthistory;


/**
 * DAO�㡾�γ̱�ӿڡ�
 * @author ( �� )
 *
 */
public interface DIcourse {
	/**
	 * ����:�γ̽׶�������ѯ
	 * @param sql��ѯ���
	 * @param str�������
	 * @returnObject[]
	 * �γ̼���:һ��
	 */
	public List courseFind(String sql,String...str);
	
	/**
	 * ����:�γ̽׶�������ѯ
	 * @param sql��ѯ���
	 * @param str�������
	 * @returnObject[]
	 * �γ̼���:����
	 */
	public List course2level(String sql,String...str);
	public  List<Topicselftesthistory> find_topicselftesthistory(Topicselftesthistory tsty);
	public List<Completecurriculum> find_culum(String sql);
	
	/**
	 * ��ȡ�γ̼���
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	/**
	 * �����γ�
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OPtionCourse(String sql,String...Strs);
	
	
	
	
}
