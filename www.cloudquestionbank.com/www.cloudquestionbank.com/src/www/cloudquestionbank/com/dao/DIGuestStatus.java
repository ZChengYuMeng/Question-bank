package www.cloudquestionbank.com.dao;

import www.cloudquestionbank.com.entity.*;

/**
 * DAO�㡾�û�״̬�ӿڡ�
 * @author ( �� )
 *
 */
public interface DIGuestStatus {
	/**
	 * �����޸��û���¼״̬(ԭ��sql)
	 * �����ڶ������޸�
	 * @param guest
	 * @return
	 */
		public boolean upstatus(String sql,String...str);
}
