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
	//������
	Admin 	admin;								//����Ա
	SIAdmin siAdmin;							//����Աҵ��ӿ�
	SIAdminStatus siAdminStatus;				//����Ա��¼״̬�ӿ�
	SBackgroundManagementNavigationBarImpl sbnm;//��̨���ؽӿ�
	SitemAnalysisImpl  Sit;						//�Ծ�ҵ��ӿ�
	Itemanalysis  itemanalysis;					//�Ծ�ʵ����
	SIAdminType   STy;							//����Ա���ͽӿ�
	My_RandomUtil RDU;							//�����������
	SIAdminStatus Sis;							//����Ա״̬�ӿ�
	SIAdminType   SItype;						//����Ա���ͽӿ�
	private List<File> file;					//ͷ���ϴ�����
    private List<String> fileFileName;			//�ļ���
    private List<String> fileContentType;		//�ļ�����
    private List<String> dataUrl;				//�ļ�·��
	School school;								//У��ʵ����
	SISchool  Sic;								//У��ҵ��ӿ�
	SIClass   Siclass;							//�༶ҵ��ӿ�
	Class     Cs;								//�༶ʵ����
	SIstage  istage;							//�׶νӿ�
	SIPurchaseStage  Sip;						//����γ̽ӿ�
	String GuestIDArr;						    //���ն���û����
	Purchasestage   pe;							//����γ�ʵ����
	SIcourse      SCE;							//�γ̱�ҵ��ӿ�
	Course        course;						//�γ̱�ʵ����
	
	
	int status = 0;   //״̬
	List adminlogin;  //����Ա����
	List adminfindid; //���ع���Ա����
	HttpServletRequest request =ServletActionContext.getRequest();						//�������
	HttpServletResponse response=ServletActionContext.getResponse();					//��Ӧ����
	HttpSession session = request.getSession();										    //�㻰����
	String pas[];										//action�㴫��ServicerImpl����������
	List list;										//ͨ����JSon�������
	HashMap<String, Object> Out=new HashMap<String, Object>();						//ͨ����JSon���Map
	Gson gson=new Gson();								//JSonת������
	String text="";
	//[ע������Ա]
	public String admin_zhuxiao(){
		if(siAdminStatus.upstatus("3",admin.getAdminId())==true){
			//System.out.println("����Աע���ɹ�");
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
	//[��֤�˺��Ƿ����]
	public void FindAdminExistence() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		admin.setPwd(null);//�������
		//System.out.println(admin);
		text=gson.toJson(siAdmin.findAdminIsExistence(admin));
		response.getWriter().print(text);
	}
	
	
	//[ͨ������Ա�˺������жϹ���Ա���صĽ���&&���ع���Ա������Ϣ]
	public void LoadBMN() throws Exception{
		HashMap<String, Object> map=new HashMap<String, Object>();
		response.setContentType("text/html;charset=utf-8");
		//System.out.println("load_"+admin);
		adminfindid =siAdmin.adminfindid(admin.getAdminId());
		int frequency=1;//ѭ����ʼ��
		for (Object ob : adminfindid) {
			Object []o =(Object[]) ob;
			/*for (int i = 0; i < o.length; i++) {
				System.out.println(o[i]);
			}*/
			admin.setAdminTypeId(Integer.parseInt(o[3].toString()));//���ù���Ա���ͱ��
		}
		//System.out.println("H_"+admin);
		if(admin.getAdminTypeId()<=3){
			//System.out.println("jll");
			boolean bo=admin.getAdminTypeId()>1;
			//System.out.println("bo_"+bo);
			text=bo?"10,11,12,5":"0";
			//�������Ա��У������Ա����ͨ����Ա���ɲ鿴[�γ̽׶ι���/�γ̹���/�����γ�/����У��]
		}else{
			//�������ԱΪ��Ա���ɲ鿴[�γ̽׶ι���/�γ̹���/�����γ�/�����༶/����У��/У������/����γ�]Ϊ������Աʱֻ����������������
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
	
	//[����Ա��¼]
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
				//System.out.println("��ѯ��״̬������"+status);
				if(adminlogin.size()>0 && status==3){
					for (Object obj : adminlogin) {
						Object []ob =(Object[]) obj;
						session.setAttribute("adminid",ob[0].toString());	   //�洢����Ա���
						session.setAttribute("adminTypeID", ob[4]);//�洢����Ա����
						session.setAttribute("schoolID", ob[6]);   //�洢����ԱѧУ���
						//System.out.println("����Ա���ͣ�����"+ob[4]+"����ԱУ�����"+ob[6]);
						status=(Integer) ob[3];
						admin.setAdminId(ob[0].toString());
					}
					//System.out.println("״̬��"+status);
					siAdminStatus.LoginUpStatuslastLoginTime("1",admin.getAdminId());//��½���޸Ĺ���Ա״̬
					text="true";	
				}else{
					
					if(status==1 || status==2){text="���Ĺ���Ա���ڵ�½״̬~";}
					if(status==4){text="���Ĺ���Ա�˺���������С���";}
					if(status==5){text="���Ĺ���Ա�˺���ʧЧ����";}
				}
			}else{
				text="false";
			}
			text=gson.toJson(text);
			//System.out.println(text);
			response.getWriter().print(text);
	}
	
	
	
	//[��������]
	public void AddItemAnalysis()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		itemanalysis.setCreateAuthorId(admin.getAdminId());//��ֵ�½����Թ���Ա���
		itemanalysis.setCreateAuthorType(admin.getAdminTypeId());//��ֵ�½����Թ���Ա���ͱ��
		//System.out.println(admin);
		//System.out.println(itemanalysis);
		response.getWriter().print(gson.toJson(Sit.AddItemAnalysis(itemanalysis, admin)));
	}
	
	//[��ȡ����Ա����]
	public void GetAdminType()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(STy.GetJSonString(admin));
	}
	/**
	 * ��������Ա
	 * @return
	 * @throws Exception
	 */
	public String AddAdmin()throws Exception{
				response.setContentType("text/html;charset=utf-8");
				//д��ͼƬ
				String returnStr="Upload";
				String url="";String SuffixName="";//Url,��׺��
				dataUrl = new ArrayList<String>();
				String imgpath = "/ST/Admin";
		        for (int i = 0; i < file.size(); ++i) {
		            InputStream is = new FileInputStream(file.get(i));
		            String path = ServletActionContext.getServletContext().getRealPath("/");
		            dataUrl.add(imgpath+this.getFileFileName().get(i));
		            //�����ļ���
		            SuffixName=this.getFileFileName().get(i).substring(this.getFileFileName().get(i).length()-4,this.getFileFileName().get(i).length());
		            url=RDU.generateZeroString(10)+RDU.generateString(10)+RDU.getDate()+SuffixName;
		          //  System.out.println("imgName = "+url);
		            admin.setImgUrl("ST/Admin/"+url);			//����imgurl
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
	 * ��ѯ����Ա�����Ƿ����
	 * @throws Exception
	 */
	public void IsEmile()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String jsonStr=gson.toJson(siAdmin.AdminIsEmail(admin));
		//System.out.println("Email"+jsonStr);
		response.getWriter().print(jsonStr);
	}
	/**
	 * ��ѯ����Ա���֤���Ƿ����
	 * @throws Exception
	 */
	public void IsCardNo()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		String jsonStr=gson.toJson(siAdmin.AdminIsCardNo(admin));
		response.getWriter().print(jsonStr);
	}
	
	/**
	 * ��ѯ����Ա����
	 * @throws Exception
	 */
	public void GetObjectListAdmin()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siAdmin.GetJsonObject(admin));
	}
	
	/**
	 * [��ȡ����Ա״̬������]
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
	
	
	//[����У��]
	public String AddSchool() throws Exception{
		response.setContentType("text/html;charset=utf-8");
		//д��ͼƬ
		String returnStr="UploadSchool";
		String url="";String SuffixName="";//Url,��׺��
		dataUrl = new ArrayList<String>();
		String imgpath = "/ST/SchoolIoc";
        for (int i = 0; i < file.size(); ++i) {
            InputStream is = new FileInputStream(file.get(i));
            String path = ServletActionContext.getServletContext().getRealPath("/");
            dataUrl.add(imgpath+this.getFileFileName().get(i));
            //�����ļ���
            SuffixName=this.getFileFileName().get(i).substring(this.getFileFileName().get(i).length()-4,this.getFileFileName().get(i).length());
            url=RDU.generateZeroString(10)+RDU.generateString(10)+RDU.getDate()+SuffixName;
           // System.out.println("imgName = "+url);
            school.setIcon("ST/SchoolIoc/"+url);			//����imgurl
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
	//[�޸Ĺ���Ա������Ϣ]
	public void UpdAdmin()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(siAdmin.UpdAdmin(admin)));
	}
	//[��ȡ��Ա��Ϣ]
	public void GetTacher()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(siAdmin.GetJSonTeacher(admin));
	}
	//[�����༶]
	public void AddClass()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Siclass.AddClass(Cs));
	}
	//[��ȡ���н׶�]
	public void GetStage()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(istage.GetStage());
	}
	//[�û�����׶�]
	public void GuestByStage()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(Sip.AddPurchaseStage(pe, GuestIDArr)));
	}
	//[��ȡĳ���׶��µ�ȫ���γ�]
	public void GetCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(SCE.GetStageCourseList(course));
	}
	
	//[�����γ�]
	public void AddCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(SCE.AddCourse(course)));
	}
	//[��ĳ���׶�������ĳ���׶����Ƿ��Դ��ڸÿγ�]
	public void ISexistenceCourse()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(SCE.ISexistenceCourse(course)));
	}
	
	//[���Թ����ѯ]
	public void GetItemAnalysisList()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(Sit.OBjectList(admin));
	}
	//[�޸��Ծ�ʼ����ʱ��]
	public void UpdItemAnalysisStartTimeAndEndTIme()throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(gson.toJson(Sit.UpdItemAnalysisStartTimeAndEndTIme(itemanalysis)));
	}
	
	
	
	
	//��Get/Set��
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
