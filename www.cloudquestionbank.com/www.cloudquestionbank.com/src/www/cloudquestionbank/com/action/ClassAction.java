package www.cloudquestionbank.com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import www.cloudquestionbank.com.entity.Class;
import www.cloudquestionbank.com.services.SIClass;
import www.cloudquestionbank.com.services.SIClassState;
import www.cloudquestionbank.com.servicesImpl.SClassImpl;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
/**
 * Action【班级】
 * @author ( 人 )
 *
 */
public class ClassAction extends ActionSupport{
	//属性区
	Class classinfo;			//班级实体类
	SIClass SIC;				//班级业务接口
	SIClassState Sis;			//班级状态业务接口
	//方法区
	Gson gson=new Gson();		//JSOn转换对象
	HttpServletResponse response=ServletActionContext.getResponse();					//响应对象
	//[查询班级名称是否存在]
	public void ISSchoolName() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(SIC.ISSchoolClassname(classinfo)));
	}
	//[管理校区班级信息查询]
	public void GetClassObj()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(SIC.GetClassArrObject(classinfo));
	}
	//[获取班级状态]
	public void GetClassStatelist()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sis.GetClassStatelist());
	}
	
	
	
	//↓Get/Set区
	public Class getClassinfo() {
		return classinfo;
	}
	public void setClassinfo(Class classinfo) {
		this.classinfo = classinfo;
	}
	public void setSIC(SIClass sIC) {
		SIC = sIC;
	}
	public void setSis(SIClassState sis) {
		Sis = sis;
	}
	
	
	
}
