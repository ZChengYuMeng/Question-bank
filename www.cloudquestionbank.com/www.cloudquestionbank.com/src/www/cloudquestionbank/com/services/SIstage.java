package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Stage;

/**
 * Services【stage业务接口】
 * @author ( 人 )
 *
 */
public interface SIstage {
	/**
	 * 功能：获取阶段与课程
	 * @param stage
	 * @return
	 */
	String GetStageAanCourse(Stage stage);
	/**
	 * 获取所有阶段
	 * @return
	 */
	String  GetStage();
	
	/**
	 * 获取某个阶段的可添加题目的课程
	 * @param stage
	 * @return
	 */
	String HahsMapStrGetStageAndCourse(Stage stage);
	
}
