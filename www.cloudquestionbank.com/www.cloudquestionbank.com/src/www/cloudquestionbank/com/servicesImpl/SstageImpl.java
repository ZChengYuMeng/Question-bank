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
 * ServicesImpl���׶α�
 * @author ( �� )
 *
 */
public class SstageImpl implements SIstage{
		DIstage dis;
		SIcourse sic;
		Course course;
		HashMap<String, Object> hmp=new HashMap<String, Object>();	//��������
		List list;						//��������
		Gson gson=new Gson();			//JSOnת������
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
		
		
		//��Get/Set������
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
