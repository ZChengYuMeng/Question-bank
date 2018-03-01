package www.cloudquestionbank.com.servicesImpl;

import java.util.List;

import www.cloudquestionbank.com.dao.DIBackgroundManagementNavigationBar;
import www.cloudquestionbank.com.services.SIBackgroundManagementNavigationBar;

/**
 * ServicesImpl【后台管理导航条】
 * @author ( 人 )
 *
 */
public class SBackgroundManagementNavigationBarImpl implements SIBackgroundManagementNavigationBar{
	DIBackgroundManagementNavigationBar DIB;
	public void setDIB(DIBackgroundManagementNavigationBar dIB) {
		DIB = dIB;
	}
	@Override
	public List GetBMN(String... Strs) {
		//8,10,11,12
		String sql="select id,url,icon,name,belongToID from  BackgroundManagementNavigationBar where belongToID ="+Strs[0]+"  and id not in("+Strs[1]+") or  id ="+Strs[2]+" ORDER BY id";
		//System.out.println("DImpl>>> "+sql);
		return DIB.GetBMN(sql);
	}
	
}
