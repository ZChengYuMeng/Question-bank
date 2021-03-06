package www.cloudquestionbank.com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import www.cloudquestionbank.com.entity.Stage;
import www.cloudquestionbank.com.services.SIstage;

import com.opensymphony.xwork2.ActionSupport;
/**
 * Action【阶段表】
 * @author ( 人 )
 *
 */
public class StageAction extends ActionSupport {
	Stage stage;		//阶段表实体类
	SIstage Sistage;		//阶段表业务接口
	HttpServletResponse response=ServletActionContext.getResponse();					//响应对象
	/**
	 * 功能:获取阶段与课程
	 * @throws Exception
	 */
	public void GetStage() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sistage.GetStageAanCourse(stage));
	}
	/**
	 * 功能:获取某个阶段下的可添加题目课程
	 * @throws Exception
	 */
	public void GetStatgeAndCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sistage.HahsMapStrGetStageAndCourse(stage));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//↓Get/Set区
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
