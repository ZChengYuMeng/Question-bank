package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO�㡾�Ծ�ӿڡ�
 * @author ( �� )
 *
 */
public interface DIitemAnalysis {
	/**
	 * ��ȡ������Ϣ����
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	/**
	 * ����������Ϣ����
	 * @param sql
	 * @param Strs
	 * @return
	 */
	boolean OptionItemAnalysis(String sql,String...Strs);
	
	
}
