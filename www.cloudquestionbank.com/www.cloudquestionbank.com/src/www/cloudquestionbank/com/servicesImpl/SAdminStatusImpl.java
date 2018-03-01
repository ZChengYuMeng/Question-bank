package www.cloudquestionbank.com.servicesImpl;

import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIAdminStatus;
import www.cloudquestionbank.com.services.SIAdminStatus;

/**
 * ServicesImpl【管理员状态表】
 * @author ( 人 )
 *
 */
public class SAdminStatusImpl implements SIAdminStatus {
	DIAdminStatus dia;
	String JsonStr="";
	Gson gson=new Gson();
	public void setDia(DIAdminStatus dia) {
		this.dia = dia;
	}

	@Override
	public boolean upstatus(String...str) {
		return dia.upstatus("update Admin set status=? where  admin_ID=?",str);
	}

	@Override
	public boolean LoginUpStatuslastLoginTime(String... Strs) {
		return dia.upstatus("update Admin set status="+Strs[0]+",lastLoginTime=now() where  admin_ID="+Strs[1]);
	}

	@Override
	public List GetStatusStr() {
		String sql="select Id,adminStatusName from AdminStatus ";
		return dia.GetList(sql);
	}
	
	
}
