package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIAdmin;
import www.cloudquestionbank.com.entity.Admin;

/**
 * DAOImpl【管理员】
 * @author ( 人 )
 *
 */
public class DAdminImpl extends HibernateDaoSupport implements DIAdmin{
	DI_Impl_Util Du;
	public void setDu(DI_Impl_Util du) {
		Du = du;
	}

	@Override
	public List loginDl(String sql, String... str) {
		return Du.GetList(sql, str);
	}
	@Override
	public List adminfindid(String sql, String... str) {
		return Du.GetList(sql, str);
	}
	@Override
	public String findAdminStatus(String sql, String... Strs) {
		return Du.GetString(sql, Strs);
	}
	@Override
	public String findAdminIsExistence(String sql,String...Strs) {
		return Du.GetString(sql,Strs);
	}

	@Override
	public boolean OptionAdmin(String sql, String... Strs) {
		return Du.update(sql, Strs);
	}

	@Override
	public List GetList(String sql, String... Strs) {
		return Du.GetList(sql, Strs);
	}

	@Override
	public List<Admin> GetObjectList(String hql) {
		return (List<Admin>) Du.GetObjectList(hql);
	}

}
