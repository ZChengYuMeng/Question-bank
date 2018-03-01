package www.cloudquestionbank.com.servicesImpl;

import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIAdminType;
import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Admintype;
import www.cloudquestionbank.com.services.SIAdminType;

/**
 * ServicesImpl【管理员类型表】
 * @author ( 人 )
 *
 */
public class SAdminTypeImpl implements SIAdminType{
	DIAdminType dia;
	Gson gson=new Gson();
	public void setDia(DIAdminType dia) {
		this.dia = dia;
	}

	@Override
	public String GetJSonString(Admin admin) {
		String sql="select id,typeName from  AdminType where id>"+admin.getAdminTypeId();
		return gson.toJson(dia.find(sql));
	}

	@Override
	public List GetAdminTypeList(Admin admin) {
		String sql="select Id,typeName from AdminType where id>"+admin.getAdminTypeId();
		return dia.find(sql);
	}

	
	
}
