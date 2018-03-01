package www.cloudquestionbank.com.servicesImpl;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIcourse;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.daoImpl.DI_Impl_Util;
import www.cloudquestionbank.com.entity.Topicselftesthistory;
import www.cloudquestionbank.com.services.SIcourse;

/**
 * ServicesImpl【课程表】
 * @author ( 人 )
 *
 */
public class ScourseImpl implements SIcourse {
	DIcourse dic;
	public void setDic(DIcourse dic) {
		this.dic = dic;
	}
	Gson gson=new Gson();//JSON转换对象
	@Override
	public List courseFind(String... str) {
		return dic.courseFind("select * from completeCurriculum c,course s where c.courseID=s.id and c.Guestid=?", str);
	}

	@Override
	public List course2level(String... str) {
		//System.out.println("sql");
		return dic.course2level("select * from course where attribute_ID=(select id from course where course_name=? and stageID=?)", str);
	}

	@Override
	public List GetCourseList(Course course) {
		String sql="select * from course where attribute_ID not in((select id from course where attribute_ID=0)) and stageID=? and attribute_ID!=0 and Id in (select aourse_id from subject )";
		return dic.courseFind(sql,course.getStageId()+"");
	}

	@Override
	public List progressbar(String... str) {
		//System.out.println("进来了");
		List list= new ArrayList();
		Topicselftesthistory tst = new Topicselftesthistory();
		tst.setCoursed(Integer.parseInt(str[0]));
		List<Topicselftesthistory> tsty =dic.find_topicselftesthistory(tst);
		List listcount= dic.courseFind("select * from subject where aourse_id=?", str[0].toString());
		int Count= 0;
		for (int i = 0; i < tsty.size(); i++) {
			Count+=tsty.get(i).getAnswerCount();
		}
		//|| listcount.size()==0 其要假设没有题目
		if(Count>listcount.size() ){
			list.add(100);
		}else if(Count<listcount.size() || Count>0){
			list.add(Count/listcount.size());
		}else{
			list.add(0);
		}
		return list;
	}

	@Override
	public List find_Ranking(String... str) {
		//System.out.println("hi");
	List list=dic.find_culum("select s.name, cs.cname,g.realName, sum(c.completedQuantity),s.address from School s,Guest g , "+
			"Completecurriculum c ,Class cs "+
			"where s.id = g.schoolId and g.guestId=c.guestId  and g.classId=cs.id "+
			"and s.id=cs.schoolId "+
			"GROUP BY s.name, cs.cname,g.realName "+
			"order by sum(c.completedQuantity)  desc ");
		return list;
	}

	@Override
	public List find_cuoTi(String... str) {
		// TODO Auto-generated method stub
		//System.out.println("哈哈哈哈哈啊哈哈哈哈哈");
		List Count = dic.find_culum("select c.courseName, (t.answerCount-t.whenreally),c.stageId  from Topicselftesthistory t,Course c "
				+ " where t.answerCount!=t.whenreally and t.guestId="+str[0].toString()+" "
				+ " and t.coursed=c.id  group by c.courseName  ");
		//System.out.println("CountSize"+Count.get(0));
		/*
		List list = new  ArrayList();
		for (Object object : Count) {
			Object[] obj = (Object[])object;
			 list = dic.find_culum("select c.courseName,Floor(sum((t.answerCount-t.whenreally)/"+obj[1]+"))"
				+",c.stageId from Topicselftesthistory t,Course c "
				+ " where t.answerCount!=t.whenreally and t.guestId="+str[0].toString()+" and t.coursed=c.id "
						+ " ");
		}
		
		System.out.println(list.size());
		*/
		return Count;
	}

	@Override
	public List courseFind2(String... str) {
		List list = dic.courseFind("select * from completeCurriculum c,course s where c.courseID=s.id and c.Guestid=?  and s.stageID=1", str);
		return list;
	}

	@Override
	public List find_Ranking1(String... str) {
		//System.out.println("hi");
		List list=dic.find_culum("select s.name, cs.cname,g.realName, sum(c.completedQuantity),s.address from School s,Guest g , "+
				"Completecurriculum c ,Class cs "+
				"where s.id = g.schoolId and g.guestId=c.guestId  and g.classId=cs.id "+
				"and s.id=cs.schoolId and s.id="+str[0]+" and cs.id="+str[1]+" "+
				"GROUP BY s.name, cs.cname,g.realName "+
				"order by sum(c.completedQuantity)  desc ");
			return list;
	}

	@Override
	public List find_Ranking2(String... str) {
		List list=dic.find_culum("select s.name, cs.cname,g.realName, sum(c.completedQuantity),s.address from School s,Guest g , "+
				"Completecurriculum c ,Class cs "+
				"where s.id = g.schoolId and g.guestId=c.guestId  and g.classId=cs.id "+
				"and s.id=cs.schoolId  and s.id="+str[0]+" "+
				"GROUP BY s.name, cs.cname,g.realName "+
				"order by sum(c.completedQuantity)  desc ");
			return list;
	}

	@Override
	public List GetStageFirstCourse(Course course) {
		String sql="select id from course where stageID="+course.getStageId()+" and attribute_ID=0";
		return dic.courseFind(sql);
	}

	@Override
	public String GetStageCourseList(Course course) {
		String sql="select Id,course_name from course where stageID="+course.getStageId();
		//System.out.println(sql);
		return gson.toJson(dic.GetList(sql));
	}

	@Override
	public boolean AddCourse(Course course) {
		boolean bool=false;
		String sql="insert into course(course_name,attribute_ID,stageID)"+
				    "VALUES('"+course.getCourseName()+"',"+course.getAttributeId()+","+course.getStageId()+")";
		//System.out.println(sql);
		return dic.OPtionCourse(sql);
	}

	@Override
	public boolean ISexistenceCourse(Course course) {
		boolean bool=false;
		String sql="select course_name from  course where  stageID="+course.getStageId()+" and attribute_ID="+course.getAttributeId()+" and course_name='"+course.getCourseName()+"'";
		//System.out.println(sql);
		bool=dic.GetList(sql).size()>0;
		return bool;
	}

	@Override
	public List GetList(String IDarr) {
		String sql="select course_name from course where id in("+IDarr+")";
		return dic.GetList(sql);
	}
	
}
