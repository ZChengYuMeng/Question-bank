package www.cloudquestionbank.com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;













import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Guest;
import www.cloudquestionbank.com.entity.Stage;
import www.cloudquestionbank.com.services.SIGuest;
import www.cloudquestionbank.com.services.SIGuestStatus;
import www.cloudquestionbank.com.services.SIcourse;
import www.cloudquestionbank.com.servicesImpl.SGuestImpl;
import www.cloudquestionbank.com.util.My_RandomUtil;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
/**
 * �û�������
 * @author lucy
 *
 */
public class GuestAction extends ActionSupport{
	Guest guest;				//�û�ʵ����
	SIGuest siGuest;			//Servicre�û��ӿ�
	SIcourse scourse;   		//�γ̽ӿ�	
	SIGuestStatus sIGuestStatus;//�û�״̬ҵ��ӿ�
		
	Stage  stage;				//�׶α�
	Course course;				//�γ̱�
	List mainlist; 				//���յ�¼֮�������
	List loginlist;				//��¼ʱ��������
	List countlist;				//һ���γ���������
	List twolevel;				//�����γ�
	My_RandomUtil RDU;			//�����������
	Admin admin;				//����Ա
	HttpServletResponse response=ServletActionContext.getResponse();					//��Ӧ����
	List countlist2;		//һ���γ���������
	int status =0;      //״̬	
	int count1=0;
	int count2=0;
	
	//ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");

	private List<File> file;				//ͷ���ϴ�����
    private List<String> fileFileName;		//�ļ���
    private List<String> fileContentType;	//�ļ�����
    private List<String> dataUrl;			//�ļ�·��

    Gson gson=new Gson();					//jsonת������
	//һ���γ�

	//һ���γ�S2
  //S2�γ�

	public String courseFind(){
		//scourse = (SIcourse) ac.getBean("ScourseImpl");
		countlist = scourse.courseFind(guest.getGuestId().toString());
		if(countlist.size()==0){
			count1=13;
		}
		return "courseFind";
	}
	
	//S1�γ�
	public String courseFind2(){
		//System.out.println("S1�γ�");
		//System.out.println("==="+countlist2.size());
		if(countlist2.size()==0){
			count2=12;
		}
		return "courseFind2";
	}
	//�����γ�
	public String twolevelfind(){
		//System.out.println(123);
		//scourse = (SIcourse) ac.getBean("ScourseImpl");
		//System.out.println("123"+course.getCourseName());
		//System.out.println("123"+course.getStageId());
		twolevel = scourse.course2level(course.getCourseName(),course.getStageId().toString());
		return "twolevelfind";
	}
	List listcount;
	List list=new ArrayList();
	

	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public List getListcount() {
		return listcount;
	}
	public void setListcount(List listcount) {
		this.listcount = listcount;
	}
	public String sanlevalfind(){
		twolevel = scourse.course2level(course.getCourseName(),course.getStageId().toString());
		for (Object object : twolevel) {
			Object[] obj = (Object[])object;
			//System.out.println(obj[0]+"---"+obj[1]);
			listcount=scourse.progressbar(obj[0].toString());
			//System.out.println(listcount.get(0));
			list.add(listcount.get(0));
		}
		return "sanlevalfind";
	}
	/*
	 * ��¼�ɹ�����������ʾ������
	 */
	public String loginfind(){
		//siGuest = (SIGuest) ac.getBean("SGuestImpl");
		mainlist=siGuest.loginfind(guest.getGuestId());
		if(mainlist.size()>0){
			return "loginfind";
		}else{
			return ERROR;
		}
	}
	/*
	 * ǰ̨��¼
	 */
	HttpServletRequest request =ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	/*
	 * ע���Ự
	 */
	public String zhixiao(){
		//System.out.println(123);
		//sIGuestStatus = (SIGuestStatus) ac.getBean("SGuestStatusImpl");
		if(sIGuestStatus.upstatus2(guest.getGuestId().toString())==true){
			//System.out.println("�ɹ�");
			status=3;
			session.invalidate();
			return "zhixiao";
		}else{
			status=1;
			return "status";
		}
	}/*
	 * �жϵ�¼...��¼�ɹ�����תҳ��
	 */
	public String logindl(){
		loginlist=siGuest.loginDl(guest.getPwd(),guest.getEmail());
		if(loginlist.size()!=0){
			for (Object obj : loginlist) {
				Object []ob =(Object[]) obj;
				
				status=(Integer) ob[6];
				guest.setGuestId((Integer)ob[0]);
				
			
			//�������жϵ�¼״̬
			if(status==1){
				//session.invalidate();
				return "status";
			}else{
				//���� �û�ID int���ͺ�String���Ͳ���ͻ
				if(sIGuestStatus.upstatus1(guest.getGuestId().toString())==true){
					//System.out.println("�ɹ�");
					status=5;
					session.setAttribute("uid",ob[0]);//�洢�û���¼ID
					session.setAttribute("classid",ob[15]);//�û�У��ID
					session.setAttribute("schoolid",ob[16]);//�û��༶ID
					return "logindl";
				}else{
					return "status";
				}
			}
			
			}
		}else{
			status=6;
			return "status";
		}
		return "status";
	}
	public String loginname(){
		//siGuest = (SIGuest) ac.getBean("SGuestImpl");
		loginlist=siGuest.loginname(guest.getEmail());
		if(loginlist.size()==0){
			status=11;
		}
		return "loginname";
	}
	
	
	//�����û�
	public String AddGuest()  throws Exception{
		//д��ͼƬ
		String returnStr="Upload";
		String url="";String SuffixName="";
		dataUrl = new ArrayList<String>();
		String imgpath = "/ST/Guest";
        for (int i = 0; i < file.size(); ++i) {
            InputStream is = new FileInputStream(file.get(i));
            String path = ServletActionContext.getServletContext().getRealPath("/");
            dataUrl.add(imgpath+this.getFileFileName().get(i));
            //�����ļ���
            SuffixName=this.getFileFileName().get(i).substring(this.getFileFileName().get(i).length()-4,this.getFileFileName().get(i).length());
            url=RDU.generateZeroString(10)+RDU.generateString(10)+RDU.getDate()+SuffixName;
            guest.setImgUrl("ST/Guest/"+url);			//����imgurl
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
       // System.out.println(guest);
        returnStr=siGuest.AddGuest(guest)?returnStr:"ADDerror";
		return returnStr;
	}
	//[�жϸ������Ƿ����]
	public void emailIsExistence() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String json=gson.toJson(siGuest.EmailIsExistence(guest));
		//System.out.println(json);
		response.getWriter().print(json);
	}
	//[�жϸ����֤���Ƿ����]
	public void CardNoIsExistence() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String json=gson.toJson(siGuest.CardNoIsExistence(guest));
		//System.out.println(json);
		response.getWriter().print(json);
	}
	//[��ѯ�û���Ϣ����]
	public void GetGuestList() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siGuest.GetJsonList(guest));
	}
	//[����Ա�޸��û�������Ϣ]
	public void OperationGuest()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String json=siGuest.AdminUpdGuest(guest, admin);
		//System.out.println(json);
		response.getWriter().print(json);
	}
	
	//[��ȡ�û�ͬһ��У���༶����]
	public void GetCommonSchoolAndClassGuest()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		//System.out.println(guest);
		response.getWriter().print(siGuest.GetGuestCommonSchoolAndClass(guest,stage));
	}
	
	
	
	//��Get/Set��
	public Guest getGuest() {
		return guest;
	}
	public void setGuest(Guest guest) {
		this.guest = guest;
	}
	public void setSiGuest(SIGuest siGuest) {
		this.siGuest = siGuest;
	}
	public SIcourse getScourse() {
		return scourse;
	}
	public void setScourse(SIcourse scourse) {
		this.scourse = scourse;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public List getMainlist() {
		return mainlist;
	}
	public void setMainlist(List mainlist) {
		this.mainlist = mainlist;
	}
	public List getLoginlist() {
		return loginlist;
	}
	public void setLoginlist(List loginlist) {
		this.loginlist = loginlist;
	}
	public List getCountlist() {
		return countlist;
	}
	public void setCountlist(List countlist) {
		this.countlist = countlist;
	}
	public List getTwolevel() {
		return twolevel;
	}
	public void setTwolevel(List twolevel) {
		this.twolevel = twolevel;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setsIGuestStatus(SIGuestStatus sIGuestStatus) {
		this.sIGuestStatus = sIGuestStatus;
	}
	
 
     public List<String> getDataUrl() {
         return dataUrl;
     }
     public void setDataUrl(List<String> dataUrl) {
         this.dataUrl = dataUrl;
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
	public void setRDU(My_RandomUtil rDU) {
		RDU = rDU;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public int getCount1() {
		return count1;
	}

	public void setCount1(int count1) {
		this.count1 = count1;
	}

	public int getCount2() {
		return count2;
	}

	public void setCount2(int count2) {
		this.count2 = count2;
	}

	public Stage getStage() {
		return stage;
	}

	public void setStage(Stage stage) {
		this.stage = stage;
	}
	
}
