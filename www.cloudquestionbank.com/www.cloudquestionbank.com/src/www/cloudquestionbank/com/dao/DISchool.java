package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO�㡾ѧУ�ӿڡ�
 * @author ( �� )
 *
 */
public interface DISchool {
	/**
	 * ��ѯУ��	
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	
	/**
	 * ����:����У��
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OptionSchool(String sql,String...Strs);
	/**
	 * ����:��ѯУ���Ƿ����
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean IsSchoolName(String sql,String...Strs);
}
