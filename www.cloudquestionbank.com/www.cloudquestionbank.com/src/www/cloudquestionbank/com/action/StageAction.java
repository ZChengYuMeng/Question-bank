package www.cloudquestionbank.com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import www.cloudquestionbank.com.entity.Stage;
import www.cloudquestionbank.com.services.SIstage;

import com.opensymphony.xwork2.ActionSupport;
/**
 * Action���׶α���
 * @author ( �� )
 *
 */
public class StageAction extends ActionSupport {
	Stage stage;		//�׶α�ʵ����
	SIstage Sistage;		//�׶α�ҵ��ӿ�
	HttpServletResponse response=ServletActionContext.getResponse();					//��Ӧ����
	/**
	 * ����:��ȡ�׶���γ�
	 * @throws Exception
	 */
	public void GetStage() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sistage.GetStageAanCourse(stage));
	}
	/**
	 * ����:��ȡĳ���׶��µĿ�������Ŀ�γ�
	 * @throws Exception
	 */
	public void GetStatgeAndCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sistage.HahsMapStrGetStageAndCourse(stage));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//��Get/Set��
	public Stage getStage() {
		return stage;
	}
	public void setStage(Stage stage) {
		this.stage = stage;
	}
	public void setSistage(SIstage sistage) {
		Sistage = sistage;
	}
	
	
	
	
	
	
}