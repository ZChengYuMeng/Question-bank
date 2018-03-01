package www.cloudquestionbank.com.daoImpl;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIGuestStatus;
import www.cloudquestionbank.com.entity.Guest;

/**
 * DAOImpl���û�״̬��
 * @author ( �� )
 *
 */
public class DGuestStatusImpl extends HibernateDaoSupport implements DIGuestStatus {

	@Override
	public boolean upstatus(String sql, String... str) {
		// TODO Auto-generated method stub
		Query query = this.getSession().createSQLQuery(sql);
		query.setString(0,str[0]);//���ڵ�������ѯ
		int i=query.executeUpdate();
		if(i>0){
			return true;
		}else{
			return false;
		}
	}

	

}
