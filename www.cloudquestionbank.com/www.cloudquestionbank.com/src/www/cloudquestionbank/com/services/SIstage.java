package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Stage;

/**
 * Services��stageҵ��ӿڡ�
 * @author ( �� )
 *
 */
public interface SIstage {
	/**
	 * ���ܣ���ȡ�׶���γ�
	 * @param stage
	 * @return
	 */
	String GetStageAanCourse(Stage stage);
	/**
	 * ��ȡ���н׶�
	 * @return
	 */
	String  GetStage();
	
	/**
	 * ��ȡĳ���׶εĿ������Ŀ�Ŀγ�
	 * @param stage
	 * @return
	 */
	String HahsMapStrGetStageAndCourse(Stage stage);
	
}
