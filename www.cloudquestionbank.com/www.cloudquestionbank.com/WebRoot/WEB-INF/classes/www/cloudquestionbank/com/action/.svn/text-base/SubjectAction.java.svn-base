package www.cloudquestionbank.com.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Guest;
import www.cloudquestionbank.com.entity.Subject;
import www.cloudquestionbank.com.entity.Topicselftesthistory;
import www.cloudquestionbank.com.entity.Topicselftesthistorydetails;
import www.cloudquestionbank.com.services.SIAdmin;
import www.cloudquestionbank.com.services.SIsubject;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class SubjectAction extends ActionSupport{
	Course course;				//课程表
	Subject subject;  			//题目表
	static SIsubject sisubject;		//题目业务实体类
	Guest guest;				//用户实体类
	List kcall;					//所有课程
	Admin 	admin;				//管理员
	SIAdmin siAdmin;			//Servicer管理员接口
	List adminfindid;			//通过id查询admin的数据
	List TopicSelfTestHistory;  //题目自测历史表集合
	/*Topicselftest tst ; 	    //题目自测表
	Topicselftestdetails tstt;  //题目自测详情表
*/	
	HttpServletResponse response=ServletActionContext.getResponse();					//响应对象
	String map;					//接受用户做题信息
	String maps[];				//切割信息
	Gson gson=new Gson();		//json转换对象
	List topicfind ;			//查询题目的集合
	List errorList;
	
	public List getErrorList() {
		return errorList;
	}
	public void setErrorList(List errorList) {
		this.errorList = errorList;
	}
	//定义application.xml
	int i=0;
	int ErrorCount=0;
	int kCount;
	
	public int getErrorCount() {
		return ErrorCount;
	}
	public void setErrorCount(int errorCount) {
		ErrorCount = errorCount;
	}
	public int getkCount() {
		return kCount;
	}
	public void setkCount(int kCount) {
		this.kCount = kCount;
	}
	ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	public String Checkerror(){
		//System.out.println("进来了");
		//System.out.println(course.getCourseName());
		//System.out.println(course.getStageId());
		//System.out.println(guest.getGuestId());
		errorList=sisubject.Thewrongquestion(course.getCourseName(),course.getStageId().toString(),guest.getGuestId().toString());
		//System.out.println(errorList.size());
		return "Checkerror";
	}
	//错题本
	public String Thewrongquestion(){
		
		List listrong=sisubject.find_Thewrong(course.getCourseName(),course.getStageId().toString(),guest.getGuestId().toString());
		System.out.println("1."+listrong.size());
		List listarray =new ArrayList();
		for (Object obj : listrong) {
			Object[] ob = (Object[])obj;
			listarray.add(ob[1]);
		}
		//System.out.println("2."+listarray.get(0));
		Topicselftesthistory tsy = new Topicselftesthistory(guest.getGuestId(), ErrorCount, 0, 0.0,(Integer)listarray.get(0), course.getCourseName(), 100.0,null,ts);
		if(sisubject.insert_tsy(tsy)==true){
			list=sisubject.find_tsy(guest.getGuestId().toString(),((Integer)listarray.get(0)).toString());
			List listtsy = new ArrayList();
			for (Object object : list) {
				Object[] obs = (Object[])object;
				//System.out.println("====?"+obs[0]);
				listtsy.add(obs[0]);
			}
			int j=1;
			//System.out.println("listtsy的sie"+listtsy.get(0));
		
			for (Object obj3 : listrong) {
				Object[] ob = (Object[])obj3;
				System.out.println("(Integer)ob[0]"+(Integer)ob[0]);
				Topicselftesthistorydetails tsyd = new Topicselftesthistorydetails((Integer)listtsy.get(0), (Integer)ob[0], j, -1, "-1");
				if(sisubject.insert_tsyDetails(tsyd)==true){
					j++;
					
				}else{
					return ERROR;
				}
				
			}
		}
		return "Thewrongquestion";
	}
	
	
	
	public String find_subject(){
		//sisubject= (SIsubject) ac.getBean("SsubjectImpl");
		List list= sisubject.find_Subject(subject.getAourseId());
		System.out.println(list.size());
		kCount=list.size();
		//System.out.println(kCount);
		return "find_subject";
	}
	/**
	 * 查询所有的课程
	 * @return
	 */
	public String kcall(){
		//sisubject= (SIsubject) ac.getBean("SsubjectImpl");
		//System.out.println("所有课程");
		kcall =sisubject.findkc();
		//System.out.println(kcall.size());
		return "kcall";
	};
	HttpServletRequest request =ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	//第一系统时间
	static Timestamp ts = new Timestamp(System.currentTimeMillis()); 
	/*public static void main(String[] args) {
		//String time =ts;
		System.out.println(time);
	}*/
	public void ins_subject() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		System.out.println(subject);
		//siAdmin =(SIAdmin) ac.getBean("SAdminImpl");
		System.out.println(admin.getAdminId());
		adminfindid =siAdmin.adminfindid(admin.getAdminId());
		for (Object obj : adminfindid) {
			Object []ob =(Object[]) obj;
			subject.setUploadAuthorType((Integer) ob[3]);		//获取上传管理员类型编号
			subject.setUploadAuthorId(admin.getAdminId());		//获取上传管理员编号
			subject.setUpdateAuthorType((Integer) ob[3]);		//获取修改管理员类型编号
			subject.setUpdateAuthorId(admin.getAdminId());		//获取修改管理员编号
		}
		subject.setCreatetime(ts);								//获取创建时间
		subject.setUpdateTime(ts);								//获取修改时间
		response.getWriter().print(gson.toJson(sisubject.insertsb(subject)));
	}
	private int []a;
	private List list;
	private List listtimu; //页面题目显示
	//前台题目页面功能
	public String  find_topic(){
		//sisubject = (SIsubject) ac.getBean("SsubjectImpl");
		//course.getCourseName(),course.getStageId().toString()
		//Topicselftesthistory tst = new Topicselftesthistory();
		System.out.println("进来了");

		List<Topicselftesthistory> listtory=sisubject.find_all();
		System.out.println("listtory===="+listtory.size());
		if(listtory.size()==0){
		topicfind = sisubject.findkc_couse(course.getCourseName(),course.getStageId().toString());
		//获取数据
		System.out.println("topicfind的size大小:"+topicfind.size());
		List listarray =new ArrayList();
		for (Object obj : topicfind) {
			Object[] ob = (Object[])obj;
			listarray.add(ob[7]);
		}
	System.out.println("卧槽 "+guest.getGuestId());
		Topicselftesthistory tsy = new Topicselftesthistory(guest.getGuestId(), topicfind.size(), 0, 0.0,(Integer)listarray.get(0), course.getCourseName(), 100.0,null,ts);//
		if(sisubject.insert_tsy(tsy)==true){
			list=sisubject.find_tsy(guest.getGuestId().toString(),((Integer)listarray.get(0)).toString());
			List listtsy = new ArrayList();
			for (Object object : list) {
				Object[] obs = (Object[])object;
				System.out.println("====?"+obs[0]);
				listtsy.add(obs[0]);
			}
			int j=1;
			//System.out.println("listtsy的sie"+listtsy.get(0));
		
			for (Object obj3 : topicfind) {
				Object[] ob = (Object[])obj3;
				System.out.println("(Integer)ob[0]"+(Integer)ob[0]);
				Topicselftesthistorydetails tsyd = new Topicselftesthistorydetails((Integer)listtsy.get(0), (Integer)ob[0], j, -1, "-1");
				if(sisubject.insert_tsyDetails(tsyd)==true){
					j++;
					
				}else{
					return ERROR;
				}
				
			}
		}else{
			
			return ERROR;
		}
		}
	
		//System.out.println("设置的假的数据"+list.size()+"-->object 数组的长度"+topicfind.size());
		// Topicselftest ts1 = new Topicselftest((Integer)list.get(7),course.getCourseName(), topicfind.size(), 100.0, ts);
		// sisubject.insert_topic(ts1);
		//List<Topicselftest> list1 = sisubject.find_topic(ts1);
		//System.out.println(list1.get(0).getName());
		return "find_topic";
	}
	public String find_timu(){
		//sisubject = (SIsubject) ac.getBean("SsubjectImpl");
		//System.out.println("进来了");
		//System.out.println(course.getCourseName()+"课程名字===>>>>"+course.getStageId().toString());
		listtimu = sisubject.find_timu(course.getCourseName(),course.getStageId().toString());
		//System.out.println(listtimu.size());
		return "find_timu";
	}
	public String update_paper(){
		Map TopMap=new HashMap();
		maps=map.split("!");
		List listString = new ArrayList();//接受单条题目
		for (int i = 0; i < maps.length; i++) {
			listString.add(maps[i]);
		}
		String TLS="";//题目自测历史表编号
		ArrayList Tlist=new ArrayList();
		String Str[] = {};
		//System.out.println("size:"+listString.size());
		for (int i = 0; i < listString.size(); i++) {
			System.out.println("listString的值"+listString.get(i));
			Str=listString.get(i).toString().split(":");//切割改题题号 于 作答
			System.out.println("length"+Str.length);
			if(Str.length>1){
				String  id=Str[0];
				String  val=Str[1];
				//System.out.println(id+"/"+val);
				//System.out.println("1111");
				//System.out.println(sisubject.update_paper(val,id));
				if(sisubject.update_paper(val,id)==true){
					//System.out.println("修改成功");
				}else{
					//return ERROR;
				//	System.out.println("CUWU!");
				}
				//这里是判断用户答题业务
			}
		}
		//System.out.println("CNM");
		//System.out.println("0-------=>"+Str[0]);
		if( sisubject.find_Assignment(Str[0].toString())==true){
			if(sisubject.find_guestID(course.getCourseName(),course.getStageId().toString(),Str[0].toString(),guest.getGuestId().toString())==true){
				System.out.println("题目业务成功");
			}
		}else{
			return ERROR;
		}
		return "update_paper";
	}
	public static void main(String[] args) {
		  String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(ts);
	        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
	        if (w < 0)
	            w = 0;
	        //System.out.println(weekDays[w]);
	}
	
	public List getListtimu() {
		return listtimu;
	}
	public void setListtimu(List listtimu) {
		this.listtimu = listtimu;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public List getKcall() {
		return kcall;
	}
	public void setKcall(List kcall) {
		this.kcall = kcall;
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
	public void setSisubject(SIsubject sisubject) {
		this.sisubject = sisubject;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public void setSiAdmin(SIAdmin siAdmin) {
		this.siAdmin = siAdmin;
	}
	public List getAdminfindid() {
		return adminfindid;
	}
	public void setAdminfindid(List adminfindid) {
		this.adminfindid = adminfindid;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Guest getGuest() {
		return guest;
	}
	public void setGuest(Guest guest) {
		this.guest = guest;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	


	
	
	
	
	
	
	
	
}
