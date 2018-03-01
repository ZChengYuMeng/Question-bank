package www.cloudquestionbank.com.servicesImpl;

import java.util.Date;
import java.util.List;

import www.cloudquestionbank.com.dao.DIitemAnalysis;
import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Examinationpaperdetails;
import www.cloudquestionbank.com.entity.Itemanalysis;
import www.cloudquestionbank.com.entity.Notice;
import www.cloudquestionbank.com.entity.School;
import www.cloudquestionbank.com.services.SIClass;
import www.cloudquestionbank.com.services.SISchool;
import www.cloudquestionbank.com.services.SIcourse;
import www.cloudquestionbank.com.services.SIitemAnalysis;
import www.cloudquestionbank.com.util.My_RandomUtil;
import www.cloudquestionbank.com.util.VeDate;

/**
 * ServicesImpl���Ծ��
 * @author ( �� )
 *
 */
public class SitemAnalysisImpl implements SIitemAnalysis{
	DIitemAnalysis dii;				  //DAO�Ծ�ӿ�
	SsubjectImpl Sib;				  //Services��Ŀ�ӿ�
	SExaminationPaperDetailsImpl SEPD;//Services�Ծ�����ӿ�
	Examinationpaperdetails		ex;	  //�Ծ������ʵ����	
	SNoticeImpl Sno;				  //Services�����ӿ�
	List list;						  //��ֵ��
	Notice   notice;				  //�����ʵ����
	My_RandomUtil  myrdm;			  //�����������
	List<Integer> sublist;			  //��Ŀ��ż���
	SSchoolImpl   Ssc;				  //ServicesѧУ�ӿ�
	School        school;			  //У��ʵ����
	VeDate        Vd;				  //ʱ���ʽ��������
	SIcourse      SIC;				  //Servicer�γ̽ӿ�
	SIClass       SIS;				  //Servicer�༶�ӿ�
	SISchool      SIL;				  //ServicesѧУ�ӿ�
	VeDate        DU;				  //ʱ��ת��������
	  
	
	
	
	@Override
	public boolean AddItemAnalysis(Itemanalysis itemanalysis,Admin admin) {
		boolean bool=false;//�����ܹ���
		boolean addItemAnalysis=false;//���������Ծ�
		boolean addExamin=false;      //���������Ծ�����
		boolean addNotice=false;      //������ӹ���
		String subjects[]={};//��Ų�ѯ������Ŀ���� 
		String sql="insert into itemAnalysis(stageID,courseID,count,name,fraction,minute,createAuthorType,createAuthorID,creaTeime,startTime,endTIme,schoolID,classID)"+
					"VALUES("+itemanalysis.getStageId()+",'"+itemanalysis.getCourseId()+"',"+itemanalysis.getCount()+",'"+itemanalysis.getName()+"',"+itemanalysis.getFraction()+
							","+itemanalysis.getMinute()+","+admin.getAdminTypeId()+",'"+admin.getAdminId()+"',now(),'"+itemanalysis.getStartTime()+"',"+
							"'"+itemanalysis.getEndTime()+"',"+itemanalysis.getSchoolId()+",'"+itemanalysis.getClassId()+"')";
		addItemAnalysis=dii.OptionItemAnalysis(sql);//�����Ծ��
		if(addItemAnalysis){//����Ծ����ɹ��������Ծ���Ŀ
			itemanalysis.setId(FindItemAnalysisID(itemanalysis));//��ȡ�ող�����Ծ���
			list=Sib.FindAourseCourse(itemanalysis.getCourseId());
			//System.out.println("�γ���������"+list.size());
			int count=list.size()>itemanalysis.getCount()?itemanalysis.getCount():list.size();//��ȡѭ������(�����ѯ������Ŀ�����ڶ������Ŀ�����ѭ������Ϊ��ǰ�������������Ϊ��ѯ������Ŀ��)
			int []subjectIDs=new int[count];
			//System.out.println("ѭ����������"+count);
			//��ȡ��Ŀ��ż���
			for (int i = 0; i < count; i++) {
				int id=(Integer) list.get(i);
				subjectIDs[i]=id;  
			}
			sublist=myrdm.GetNoRepeat(subjectIDs, count);//��ȡ��Ŀ��ż���
			for (int i = 0; i < count; i++) {//[2017-10-1ENDLooK!!!]------
				ex.setNumber((i+1));//��Ŀ���
				ex.setSubjectId(sublist.get(i));//��Ŀ���
				ex.setItemAnalysisId(itemanalysis.getId());
				addExamin=SEPD.AddExaminationPaperDetails(ex);//�����Ծ�����
				if(addExamin){
					//System.out.println("��"+(i+1)+"����Ŀ���ݲ���ɹ�!");
				}
			}//�������Ծ�����Ծ����������֪ͨ
			//--[��У����Ϣ��ֵ]
			//System.out.println("У����ѯ��������-_");
			school.setId(itemanalysis.getSchoolId());//��ֵУ�����
			list=Ssc.GetSchool(school);				 //��ֵУ����Ϣ
			Object []SchoolVal=(Object[])list.get(0);//��ȡУ�������еĵ�һ��У����Ϣ
			System.out.println(SchoolVal[1]);
			//school.setId(Integer.parseInt(SchoolVal[0].toString())); //��ȡѧУ���
			school.setName(SchoolVal[1].toString()); //��ȡУ������
			school.setIcon(SchoolVal[3].toString()); //��ȡУ����Logo
			//--[�������ֵ]
			String time=Vd.GetHH_MM_SS(itemanalysis.getStartTime());
			notice.setTitle("����:"+time+"������һ��["+itemanalysis.getName()+"]�Ծ�");//��ֵtitle
			notice.setWindosBody(school.getName()+"ף��ѧϰ��죡");//��ֵwindos����body
			String body="<div style=\"padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;\">"+
			        			""+school.getName()+"���棺<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�װ���ͬѧ<br>"+
			        			"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����  "+time+"������һ��<br>"+
			        			"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;["+itemanalysis.getName()+"]�Ծ�<br>"+
			        			"<br><br>"+school.getName()+"ף��������� ^_^!</div>";
			notice.setBody(body);					    	   //��ֵ����body
			notice.setNoticeSchoolId(school.getId());		   //��ֵѧУ���
			notice.setNoticeClassId(itemanalysis.getClassId());//��ֵ�༶���
			notice.setAdminAuthorId(admin.getAdminId());	   //����Ա���
			notice.setAdminAuthorTpeId(admin.getAdminTypeId());//��ֵ����Ա����
			notice.setStartTime(itemanalysis.getStartTime());  //��ֵ��ʼʱ��
			//System.out.println(notice);
			addNotice=Sno.AddNotice(notice);
			//������ϲ���ɹ�������½��Ծ�ɹ�!
			//System.out.println(count+"//"+itemanalysis.getCount());
			if(count<itemanalysis.getCount())//�����ѯ������Ŀ��������ӹ涨����Ŀ�����޸ĸ��Ծ�������
			{
				itemanalysis.setCount(count);//�޸�������
				UpdItemAnalysis(itemanalysis);
			}
			bool=addItemAnalysis==true&&addExamin==true&&addNotice==true?true:false;
		}
		return bool;
	}
	
	@Override
	public int FindItemAnalysisID(Itemanalysis it) {
		String sql="select id from itemAnalysis where stageID="+it.getStageId()+" and courseID='"+it.getCourseId()+"' and count="+it.getCount()+" and name='"+it.getName()+"' and fraction="+it.getFraction()+" and "+
				    " minute="+it.getMinute()+" and createAuthorType="+it.getCreateAuthorType()+" and createAuthorID='"+it.getCreateAuthorId()+"' and  startTime='"+it.getStartTime()+"' and endTIme='"+it.getEndTime()+"' and "+ 
				    " schoolID="+it.getSchoolId()+" and classID='"+it.getClassId()+"' ";
		int id=Integer.parseInt(dii.GetList(sql).get(0)+"");
		return id;
	}

	@Override
	public boolean UpdItemAnalysis(Itemanalysis itemanalysis) {
		String sql="update itemAnalysis set count="+itemanalysis.getCount()+" where id="+itemanalysis.getId();
		return dii.OptionItemAnalysis(sql);
	}
	

	@Override
	public String OBjectList(Admin admin) {
		String sql="select a.id,d.stage_name,a.courseID,a.count,a.name,a.fraction,a.minute,f.typeName,e.realName,a.creaTeime,a.startTime,a.endTIme,a.schoolID ,a.classID "+ 
					" from  itemAnalysis a,class b,School c,stage d,admin e,admintype f "+
					" where a.schoolID=c.id and a.stageID=d.id and a.createAuthorID=e.admin_ID and a.createAuthorType=f.Id "+ 
					" and b.id=a.classID  ";
		sql+=admin.getSchoolId()!=0?" and c.id="+admin.getSchoolId():"";
		list=dii.GetList(sql);
		String JsonStr="[";int i=0;
		for (Object o : list) {
			Object []obj=(Object[]) o;
			List clist=SIC.GetList(obj[2].toString()); //��ȡ�����Ծ�γ�
			String Cname="";//���տγ���
			for (Object c : clist) {Cname+=" ["+c+"] ";}
			List Slist=SIS.GetClassArr(obj[13].toString());
			String ClassName="";//���հ༶����
			for (Object S : Slist) {ClassName+=" ["+S+"] ";}
			List sclist= SIL.GetOneSchool(obj[12].toString());
			JsonStr+="{\"id\":\""+obj[0]+"\",\"stageName\":\""+obj[1]+"\",\"courseName\":\""+Cname+"\",\"count\":\""+obj[3]+"\",\"name\":\""+obj[4]+"\",\"fraction\":\""+obj[5]+"\",\"minute\":\""+obj[6]+"\",\"createAuthorType\":\""+obj[7]+"\",\"createAuthorID\":\""+obj[8]+"\",\"creaTeime\":\""+obj[9].toString()+"\",\"startTime\":\""+obj[10].toString()+"\",\"endTIme\":\""+obj[11]+"\",\"schoolID\":\""+sclist.get(0).toString()+"\",\"classID\":\""+ClassName+"\"}";
			JsonStr+=i==list.size()-1?"":",";
			i++;
		}
		JsonStr+="]";
		return JsonStr;
	}

	@Override
	public boolean UpdItemAnalysisStartTimeAndEndTIme(Itemanalysis it) {
		String sql="update itemAnalysis set startTime='"+it.getStartTime()+"',endTIme='"+it.getEndTime()+"' where id="+it.getId();
		System.out.println(sql);
		return dii.OptionItemAnalysis(sql);
	}

	

	//��Get/Set��
	
		public void setDii(DIitemAnalysis dii) {
			this.dii = dii;
		}
		public void setSib(SsubjectImpl sib) {
			Sib = sib;
		}
		public void setSEPD(SExaminationPaperDetailsImpl sEPD) {
			SEPD = sEPD;
		}
		public void setEx(Examinationpaperdetails ex) {
			this.ex = ex;
		}

		public void setSno(SNoticeImpl sno) {
			Sno = sno;
		}

		public void setMyrdm(My_RandomUtil myrdm) {
			this.myrdm = myrdm;
		}

		public void setSsc(SSchoolImpl ssc) {
			Ssc = ssc;
		}

		public void setSchool(School school) {
			this.school = school;
		}

		public void setVd(VeDate vd) {
			Vd = vd;
		}

		public void setNotice(Notice notice) {
			this.notice = notice;
		}

		public void setSIC(SIcourse sIC) {
			SIC = sIC;
		}

		public void setSIS(SIClass sIS) {
			SIS = sIS;
		}

		public void setSIL(SISchool sIL) {
			SIL = sIL;
		}

		public void setDU(VeDate dU) {
			DU = dU;
		}
}
