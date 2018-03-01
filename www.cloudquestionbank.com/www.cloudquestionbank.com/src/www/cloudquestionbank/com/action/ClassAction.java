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
 * Action���༶��
 * @author ( �� )
 *
 */
public class ClassAction extends ActionSupport{
	//������
	Class classinfo;			//�༶ʵ����
	SIClass SIC;				//�༶ҵ��ӿ�
	SIClassState Sis;			//�༶״̬ҵ��ӿ�
	//������
	Gson gson=new Gson();		//JSOnת������
	HttpServletResponse response=ServletActionContext.getResponse();					//��Ӧ����
	//[��ѯ�༶�����Ƿ����]
	public void ISSchoolName() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(SIC.ISSchoolClassname(classinfo)));
	}
	//[����У���༶��Ϣ��ѯ]
	public void GetClassObj()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(SIC.GetClassArrObject(classinfo));
	}
	//[��ȡ�༶״̬]
	public void GetClassStatelist()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sis.GetClassStatelist());
	}
	
	
	
	//��Get/Set��
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
