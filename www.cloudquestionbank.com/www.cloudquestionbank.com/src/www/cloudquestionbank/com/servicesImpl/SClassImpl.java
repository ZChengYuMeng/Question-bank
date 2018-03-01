package www.cloudquestionbank.com.servicesImpl;

import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIClass;
import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Class;
import www.cloudquestionbank.com.services.SIClass;

/**
 * ServicerImpl¡¾°à¼¶±í¡¿
 * @author ( ÈË )
 *
 */
public class SClassImpl implements SIClass{
	DIClass dic;
	Gson gson=new Gson();
	List list;
	String JsonStr;
	
	public void setDic(DIClass dic) {
		this.dic = dic;
	}

	@Override
	public List GetList(String... Strs) {
		String sql="select id,cname from Class where schoolID=?";
		return dic.Getlist(sql, Strs);
	}

	@Override
	public String AddClass(Class Cs) {
		String sql="insert Class(cname,schoolID,state,classSize,admin_ID,createTime,updateTime) "+
					"VALUES('"+Cs.getCname()+"',"+Cs.getSchoolId()+",0,"+Cs.getClassSize()+",'"+Cs.getAdminId()+"',now(),now()) ";
		return gson.toJson(dic.OptionClass(sql));
	}

	@Override
	public boolean ISSchoolClassname(Class CS) {
		boolean bool=false;
		String  sql="select cname from Class where cname='"+CS.getCname()+"' and schoolID="+CS.getSchoolId();
		//System.out.println(sql);
		bool=dic.Getlist(sql).size()>0;
		return bool;
	}

	@Override
	public List GetClassArr(String IDArr) {
		String sql="select cname from Class where Id in("+IDArr+")";
		return dic.Getlist(sql);
	}

	@Override
	public String GetClassArrObject(Class Cs) {
		String sql="select a.Id,a.cname,d.name,b.classStateName,a.classSize,c.realName,a.createTime,a.updateTime,a.admin_ID,a.state,a.schoolID "+
				    " from Class a,ClassState b ,Admin c,School d "+
				    " where a.state=b.classStateId and a.admin_ID=c.admin_ID and a.schoolID=d.id ";
		sql+=Cs.getSchoolId()!=0?"and a.schoolID="+Cs.getSchoolId():"";
		list=dic.Getlist(sql);
		JsonStr="[";int i=0;
		for (Object o : list) {
			Object []obj=(Object[]) o;
			JsonStr+="{\"Id\":\""+obj[0]+"\",\"cname\":\""+obj[1]+"\",\"name\":\""+obj[2]+"\",\"classStateName\":\""+obj[3]+"\",\"classSize\":\""+obj[4]+"\",\"realName\":\""+obj[5]+"\",\"createTime\":\""+obj[6]+"\",\"updateTime\":\""+obj[7]+"\",\"admin_ID\":\""+obj[8]+"\",\"state\":\""+obj[9]+"\",\"schoolID\":\""+obj[10]+"\"}";
			JsonStr+=i==list.size()-1?"":",";
			i++;
		}
		JsonStr+="]";
		return JsonStr;
	}
	
	
	
}
