package www.cloudquestionbank.com.servicesImpl;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DISchoolStatus;
import www.cloudquestionbank.com.services.SISchoolStatus;

public class SSchoolStatusImpl implements SISchoolStatus{
	DISchoolStatus DIS;
	Gson gson=new Gson();//JSon×ª»»¶ÔÏó
	@Override
	public String GetJsonStrList() {
		String sql="select id,sname from SchoolStatus ";
		return gson.toJson(DIS.Getlist(sql));
	}
	public void setDIS(DISchoolStatus dIS) {
		DIS = dIS;
	}
	
	
	
}
