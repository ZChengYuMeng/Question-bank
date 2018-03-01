package www.cloudquestionbank.com.services;

import java.util.HashMap;
import java.util.List;

import www.cloudquestionbank.com.entity.School;

/**
 * Services��ѧУҵ��ӿڡ�
 * @author ( �� )
 *
 */
public interface SISchool {
	/**
	 * ���ܣ���ȡУ���������µİ༶
	 * @param school
	 * @return
	 */
	HashMap<String, Object> GetList(School school);
	
	/**
	 * ����:��ȡУ������
	 * @param school
	 * @return
	 */
	HashMap<String, Object>GetSchoolList(School school);
	
	/**
	 * ���ܣ���ȡѧУ��Ϣ
	 * @param school
	 * @return
	 */
	List GetSchool(School school);
	/**
	 * ����:����У��
	 * @param school
	 * @return
	 */
	boolean AddSchool(School school);
	/**
	 * ��ѯУ�������Ƿ����
	 * @param school
	 * @return
	 */
	boolean ISSchoolName(School school);
	/**
	 * ��ȡУ��JsonStr����
	 * @param school
	 * @return
	 */
	String GetOBJECtchoolList(School school);
	/**
	 * ��ȡ����ѧУ��Ϣ
	 * @param school
	 * @return
	 */
	public List GetOneSchool(String id);
	
	/**
	 * �޸ĸ�ѧУ��Ϣ
	 * @param school
	 * @return
	 */
	boolean UpdSchool(School school);
	
}
