package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO�㡾�����
 * @author ( �� )
 *
 */
public interface DINotice {
	/**
	 * ��ȡ�����
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List GetList(String sql,String...Strs);
	/**
	 * ���������
	 * @return
	 */
	boolean OptionNotice(String sql,String...Strs);
	
	
}
