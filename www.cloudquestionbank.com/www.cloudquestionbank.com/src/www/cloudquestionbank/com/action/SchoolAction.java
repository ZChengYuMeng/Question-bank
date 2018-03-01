package www.cloudquestionbank.com.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Class;
import www.cloudquestionbank.com.entity.School;
import www.cloudquestionbank.com.services.SISchool;
import www.cloudquestionbank.com.services.SISchoolStatus;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
/**
 * ACtion【学校管理】
 * @author ( 人 )
 */
public class SchoolAction extends ActionSupport{
	Admin admin;			//管理员实体类
	School school;			//学校实体类
	SISchool        siSchool;//Services校区接口
	SISchoolStatus  SISS;	 //Services校区状态接口
	
	
	Gson gson=new Gson();	//json转换对象
	HashMap<String, Object> hmp=new HashMap<String, Object>();
	HttpServletResponse response=ServletActionContext.getResponse();					//响应对象
	public void GetList() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		hmp=siSchool.GetList(school);
		String json=gson.toJson(hmp);
		//System.out.println(json);
		response.getWriter().print(json);
	}
	
	//[获取校区集合]
	public void GetSchoolList()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		hmp=siSchool.GetSchoolList(school);
		String json=gson.toJson(hmp);
		//System.out.println(json);
		response.getWriter().print(json);
	}
	//[查询校区是否存在]
	public  void ISschoolName()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(siSchool.ISSchoolName(school)));
	}
	
	//[获取校区所有信息]
	public void GetSchoolJsonStr()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siSchool.GetOBJECtchoolList(school));
	}
	//[获取校区状态]
	public void GetSchoolStatus()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(SISS.GetJsonStrList());
	}
	//[修改学校信息]
	public void UpdatSchool()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siSchool.UpdSchool(school));
	}
	
	
	
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	public HashMap<String, Object> getHmp() {
		return hmp;
	}
	public void setHmp(HashMap<String, Object> hmp) {
		this.hmp = hmp;
	}
	public void setSiSchool(SISchool siSchool) {
		this.siSchool = siSchool;
	}

	public void setSISS(SISchoolStatus sISS) {
		SISS = sISS;
	}
	
	
}
