package www.cloudquestionbank.com.servicesImpl;

import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIstage;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Stage;
import www.cloudquestionbank.com.services.SIcourse;
import www.cloudquestionbank.com.services.SIstage;

/**
 * ServicesImpl【阶段表】
 * @author ( 人 )
 *
 */
public class SstageImpl implements SIstage{
		DIstage dis;
		SIcourse sic;
		Course course;
		HashMap<String, Object> hmp=new HashMap<String, Object>();	//传递数据
		List list;						//传递数据
		Gson gson=new Gson();			//JSOn转换对象
		@Override
		public String GetStageAanCourse(Stage stage) {
			int sid=stage.getId()!=0?stage.getId():1;
			course.setStageId(sid);
			String sql="select id,stage_name from stage";
			list=dis.GetList(sql);
			hmp.put("stage", list);
			hmp.put("course",sic.GetCourseList(course));
			return gson.toJson(hmp);
		}
		@Override
		public String GetStage() {
			String  sql="select id,stage_name from stage ";
			hmp.put("stage", dis.GetList(sql));		
			return gson.toJson(hmp);
		}
		@Override
		public String HahsMapStrGetStageAndCourse(Stage stage) {
			String sql="select id,course_name from course where attribute_ID not in((select id from course where attribute_ID=0)) and stageID="+stage.getId()+" and attribute_ID!=0";
			System.out.println(sql);
			hmp.put("course", dis.GetList(sql));
			  	   sql="select id,stage_name from stage ";
		  	hmp.put("stage", dis.GetList(sql));		 	   
			return gson.toJson(hmp);
		}
		
		
		//↓Get/Set方法区
		public void setDis(DIstage dis) {
			this.dis = dis;
		}
		public void setSic(SIcourse sic) {
			this.sic = sic;
		}

		public Course getCourse() {
			return course;
		}

		public void setCourse(Course course) {
			this.course = course;
		}
}
