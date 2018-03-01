package www.cloudquestionbank.com.action;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.jws.soap.SOAPBinding.Style;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Class;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Itemanalysis;
import www.cloudquestionbank.com.entity.Purchasestage;
import www.cloudquestionbank.com.entity.School;
import www.cloudquestionbank.com.services.*;
import www.cloudquestionbank.com.servicesImpl.SBackgroundManagementNavigationBarImpl;
import www.cloudquestionbank.com.servicesImpl.SitemAnalysisImpl;
import www.cloudquestionbank.com.util.My_RandomUtil;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
public class AdminAction extends ActionSupport{
	//属性区
	Admin 	admin;								//管理员
	SIAdmin siAdmin;							//管理员业务接口
	SIAdminStatus siAdminStatus;				//管理员登录状态接口
	SBackgroundManagementNavigationBarImpl sbnm;//后台加载接口
	SitemAnalysisImpl  Sit;						//试卷业务接口
	Itemanalysis  itemanalysis;					//试卷实体类
	SIAdminType   STy;							//管理员类型接口
	My_RandomUtil RDU;							//随机数生成器
	SIAdminStatus Sis;							//管理员状态接口
	SIAdminType   SItype;						//管理员类型接口
	private List<File> file;					//头像上传接收
    private List<String> fileFileName;			//文件名
    private List<String> fileContentType;		//文件类型
    private List<String> dataUrl;				//文件路径
	School school;								//校区实体类
	SISchool  Sic;								//校区业务接口
	SIClass   Siclass;							//班级业务接口
	Class     Cs;								//班级实体类
	SIstage  istage;							//阶段接口
	SIPurchaseStage  Sip;						//购买课程接口
	String GuestIDArr;						    //接收多个用户编号
	Purchasestage   pe;							//购买课程实体类
	SIcourse      SCE;							//课程表业务接口
	Course        course;						//课程表实体类
	
	
	int status = 0;   //状态
	List adminlogin;  //管理员数据
	List adminfindid; //加载管理员数据
	HttpServletRequest request =ServletActionContext.getRequest();						//请求对象
	HttpServletResponse response=ServletActionContext.getResponse();					//响应对象
	HttpSession session = request.getSession();										    //汇话对象
	String pas[];										//action层传递ServicerImpl参数用数组
	List list;										//通用型JSon输出集合
	HashMap<String, Object> Out=new HashMap<String, Object>();						//通用型JSon输出Map
	Gson gson=new Gson();								//JSon转换对象
	String text="";
	//[注销管理员]
	public String admin_zhuxiao(){
		if(siAdminStatus.upstatus("3",admin.getAdminId())==true){
			//System.out.println("管理员注销成功");
			session.invalidate();
			return "admin_zhuxiao";
		}else{
			return ERROR;
		}
	}
	public String admin_findid(){
		//adminfindid =siAdmin.adminfindid(admin.getId().toString()); 
		return "admin_findid";
	}
	//[验证账号是否存在]
	public void FindAdminExistence() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		admin.setPwd(null);//清空密码
		//System.out.println(admin);
		text=gson.toJson(siAdmin.findAdminIsExistence(admin));
		response.getWriter().print(text);
	}
	
	
	//[通过管理员账号类型判断管理员加载的界面&&加载管理员基本信息]
	public void LoadBMN() throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		response.setContentType("text/html;charset=utf-8");
		//System.out.println("load_"+admin);
		adminfindid =siAdmin.adminfindid(admin.getAdminId());
		int frequency=1;//循环开始数
		for (Object ob : adminfindid) {
			Object []o =(Object[]) ob;
			/*for (int i = 0; i < o.length; i++) {
				System.out.println(o[i]);
			}*/
			admin.setAdminTypeId(Integer.parseInt(o[3].toString()));//设置管理员类型编号
		}
		//System.out.println("H_"+admin);
		if(admin.getAdminTypeId()<=3){
			//System.out.println("jll");
			boolean bo=admin.getAdminTypeId()>1;
			//System.out.println("bo_"+bo);
			text=bo?"10,11,12,5":"0";
			//如果管理员是校区管理员和普通管理员不可查看[课程阶段管理/课程管理/新增课程/新增校区]
		}else{
			//如果管理员为教员不可查看[课程阶段管理/课程管理/新增课程/新增班级/新增校区/校区管理/购买课程]为题库操作员时只可添加试题试题管理
			text=admin.getAdminTypeId()==4?"10,11,12,5,4,15,7":"0";//
			frequency=admin.getAdminTypeId()==4?frequency:3;
		}
		//System.out.println(text+"  cnm!");
		
		for (int i=frequency; i < 4; i++) {
			map.put("ld"+i, sbnm.GetBMN(i+"",text,i+""));
		}
		Out.put("load",map);
		Out.put("admin", adminfindid);
		//System.out.println(gson.toJson(Out));
		response.getWriter().print(gson.toJson(Out));
	}
	
	//[管理员登录]
	public void admin_logindl() throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
			adminlogin = siAdmin.loginDl(admin.getEmail(),admin.getPwd());
			if(adminlogin.size()>0){
				for (Object l: adminlogin) {
					Object []ob =(Object[]) l;
					for (int i = 0; i < ob.length; i++) {
						admin.setAdminId(ob[0].toString());
						//System.out.println(ob[i]);
					}
					
				}
				status=Integer.parseInt(siAdmin.FindAdminStatus(admin));
				//System.out.println("查询的状态？——"+status);
				if(adminlogin.size()>0 && status==3){
					for (Object obj : adminlogin) {
						Object []ob =(Object[]) obj;
						session.setAttribute("adminid",ob[0].toString());	   //存储管理员编号
						session.setAttribute("adminTypeID", ob[4]);//存储管理员类型
						session.setAttribute("schoolID", ob[6]);   //存储管理员学校编号
						//System.out.println("管理员类型：——"+ob[4]+"管理员校区编号"+ob[6]);
						status=(Integer) ob[3];
						admin.setAdminId(ob[0].toString());
					}
					//System.out.println("状态："+status);
					siAdminStatus.LoginUpStatuslastLoginTime("1",admin.getAdminId());//登陆后修改管理员状态
					text="true";	
				}else{
					
					if(status==1 || status==2){text="您的管理员正在登陆状态~";}
					if(status==4){text="您的管理员账号正在审核中……";}
					if(status==5){text="您的管理员账号已失效……";}
				}
			}else{
				text="false";
			}
			text=gson.toJson(text);
			//System.out.println(text);
			response.getWriter().print(text);
	}
	
	
	
	//[新增考试]
	public void AddItemAnalysis()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		itemanalysis.setCreateAuthorId(admin.getAdminId());//赋值新建考试管理员编号
		itemanalysis.setCreateAuthorType(admin.getAdminTypeId());//赋值新建考试管理员类型编号
		//System.out.println(admin);
		//System.out.println(itemanalysis);
		response.getWriter().print(gson.toJson(Sit.AddItemAnalysis(itemanalysis, admin)));
	}
	
	//[获取管理员类型]
	public void GetAdminType()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(STy.GetJSonString(admin));
	}
	/**
	 * 新增管理员
	 * @return
	 * @throws Exception
	 */
	public String AddAdmin()throws Exception{
				response.setContentType("text/html;charset=utf-8");
				//写入图片
				String returnStr="Upload";
				String url="";String SuffixName="";//Url,后缀名
				dataUrl = new ArrayList<String>();
				String imgpath = "/ST/Admin";
		        for (int i = 0; i < file.size(); ++i) {
		            InputStream is = new FileInputStream(file.get(i));
		            String path = ServletActionContext.getServletContext().getRealPath("/");
		            dataUrl.add(imgpath+this.getFileFileName().get(i));
		            //生成文件名
		            SuffixName=this.getFileFileName().get(i).substring(this.getFileFileName().get(i).length()-4,this.getFileFileName().get(i).length());
		            url=RDU.generateZeroString(10)+RDU.generateString(10)+RDU.getDate()+SuffixName;
		          //  System.out.println("imgName = "+url);
		            admin.setImgUrl("ST/Admin/"+url);			//设置imgurl
		            File destFile = new File(path+imgpath, url);
		            OutputStream os = new FileOutputStream(destFile);
		            byte[] buffer = new byte[400];
		            int length = 0;
		            while ((length = is.read(buffer)) > 0) {
		                os.write(buffer, 0, length);
		            }
		            is.close();
		            os.close();
		        }//END
		        returnStr=siAdmin.Addadmin(admin)?returnStr:"ADDerror";
		        return returnStr;
	}
	/**
	 * 查询管理员邮箱是否存在
	 * @throws Exception
	 */
	public void IsEmile()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String jsonStr=gson.toJson(siAdmin.AdminIsEmail(admin));
		//System.out.println("Email"+jsonStr);
		response.getWriter().print(jsonStr);
	}
	/**
	 * 查询管理员身份证号是否存在
	 * @throws Exception
	 */
	public void IsCardNo()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String jsonStr=gson.toJson(siAdmin.AdminIsCardNo(admin));
		response.getWriter().print(jsonStr);
	}
	
	/**
	 * 查询管理员集合
	 * @throws Exception
	 */
	public void GetObjectListAdmin()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siAdmin.GetJsonObject(admin));
	}
	
	/**
	 * [获取管理员状态和类型]
	 * @throws Exception
	 */
	public void GetAdminStatusAndType()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, Object> hmp=new HashMap<String, Object>();
		hmp.put("Status", Sis.GetStatusStr());
		hmp.put("type", SItype.GetAdminTypeList(admin));
		String jsonstr=gson.toJson(hmp);
		//System.out.println(jsonstr);
		response.getWriter().print(jsonstr);
	}
	
	
	//[新增校区]
	public String AddSchool() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		//写入图片
		String returnStr="UploadSchool";
		String url="";String SuffixName="";//Url,后缀名
		dataUrl = new ArrayList<String>();
		String imgpath = "/ST/SchoolIoc";
        for (int i = 0; i < file.size(); ++i) {
            InputStream is = new FileInputStream(file.get(i));
            String path = ServletActionContext.getServletContext().getRealPath("/");
            dataUrl.add(imgpath+this.getFileFileName().get(i));
            //生成文件名
            SuffixName=this.getFileFileName().get(i).substring(this.getFileFileName().get(i).length()-4,this.getFileFileName().get(i).length());
            url=RDU.generateZeroString(10)+RDU.generateString(10)+RDU.getDate()+SuffixName;
           // System.out.println("imgName = "+url);
            school.setIcon("ST/SchoolIoc/"+url);			//设置imgurl
            File destFile = new File(path+imgpath, url);
            OutputStream os = new FileOutputStream(destFile);
            byte[] buffer = new byte[400];
            int length = 0;
            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
            }
            is.close();
            os.close();
        }//END
        returnStr=Sic.AddSchool(school)?returnStr:"ADDerror";
        return returnStr;
		
	}
	//[修改管理员基本信息]
	public void UpdAdmin()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(siAdmin.UpdAdmin(admin)));
	}
	//[获取教员信息]
	public void GetTacher()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siAdmin.GetJSonTeacher(admin));
	}
	//[新增班级]
	public void AddClass()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Siclass.AddClass(Cs));
	}
	//[获取所有阶段]
	public void GetStage()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(istage.GetStage());
	}
	//[用户购买阶段]
	public void GuestByStage()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(Sip.AddPurchaseStage(pe, GuestIDArr)));
	}
	//[获取某个阶段下的全部课程]
	public void GetCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(SCE.GetStageCourseList(course));
	}
	
	//[新增课程]
	public void AddCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(SCE.AddCourse(course)));
	}
	//[在某个阶段下所属某个阶段下是否以存在该课程]
	public void ISexistenceCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(SCE.ISexistenceCourse(course)));
	}
	
	//[考试管理查询]
	public void GetItemAnalysisList()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sit.OBjectList(admin));
	}
	//[修改试卷开始结束时间]
	public void UpdItemAnalysisStartTimeAndEndTIme()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(Sit.UpdItemAnalysisStartTimeAndEndTIme(itemanalysis)));
	}
	
	
	
	
	//↓Get/Set区
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public void setSiAdmin(SIAdmin siAdmin) {
		this.siAdmin = siAdmin;
	}
	public List getAdminlogin() {
		return adminlogin;
	}
	public void setAdminlogin(List adminlogin) {
		this.adminlogin = adminlogin;
	}
	public void setSiAdminStatus(SIAdminStatus siAdminStatus) {
		this.siAdminStatus = siAdminStatus;
	}
	public List getAdminfindid() {
		return adminfindid;
	}
	public void setAdminfindid(List adminfindid) {
		this.adminfindid = adminfindid;
	}
	public void setSbnm(SBackgroundManagementNavigationBarImpl sbnm) {
		this.sbnm = sbnm;
	}
	public String[] getPas() {
		return pas;
	}
	public void setPas(String[] pas) {
		this.pas = pas;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public HashMap<String, Object> getOut() {
		return Out;
	}
	public void setOut(HashMap<String, Object> out) {
		Out = out;
	}
	public void setSit(SitemAnalysisImpl sit) {
		Sit = sit;
	}
	public Itemanalysis getItemanalysis() {
		return itemanalysis;
	}
	public void setItemanalysis(Itemanalysis itemanalysis) {
		this.itemanalysis = itemanalysis;
	}
	public void setSTy(SIAdminType sTy) {
		STy = sTy;
	}
	public void setRDU(My_RandomUtil rDU) {
		RDU = rDU;
	}
	public List<File> getFile() {
		return file;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	public List<String> getDataUrl() {
		return dataUrl;
	}
	public void setDataUrl(List<String> dataUrl) {
		this.dataUrl = dataUrl;
	}
	public void setSis(SIAdminStatus sis) {
		Sis = sis;
	}
	public void setSItype(SIAdminType sItype) {
		SItype = sItype;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	public void setSic(SISchool sic) {
		Sic = sic;
	}
	public School getSchool() {
		return school;
	}
	public Class getCs() {
		return Cs;
	}
	public void setCs(Class cs) {
		Cs = cs;
	}
	public void setSiclass(SIClass siclass) {
		Siclass = siclass;
	}
	public void setIstage(SIstage istage) {
		this.istage = istage;
	}
	public void setSip(SIPurchaseStage sip) {
		Sip = sip;
	}
	public String getGuestIDArr() {
		return GuestIDArr;
	}
	public void setGuestIDArr(String guestIDArr) {
		GuestIDArr = guestIDArr;
	}
	public Purchasestage getPe() {
		return pe;
	}
	public void setPe(Purchasestage pe) {
		this.pe = pe;
	}
	public void setSCE(SIcourse sCE) {
		SCE = sCE;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	
}
