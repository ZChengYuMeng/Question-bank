package www.cloudquestionbank.com.dao;

import java.util.List;

/**
 * DAO�㡾�༶״̬��
 * @author ( �� )
 *
 */
public interface DIClassState {
	/**
	 * ��ȡ�༶״̬����
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List getlist(String sql,String...Strs);
}
