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
 * ServicesImpl【试卷表】
 * @author ( 人 )
 *
 */
public class SitemAnalysisImpl implements SIitemAnalysis{
	DIitemAnalysis dii;				  //DAO试卷接口
	SsubjectImpl Sib;				  //Services题目接口
	SExaminationPaperDetailsImpl SEPD;//Services试卷详情接口
	Examinationpaperdetails		ex;	  //试卷详情表实体类	
	SNoticeImpl Sno;				  //Services公告表接口
	List list;						  //传值用
	Notice   notice;				  //公告表实体类
	My_RandomUtil  myrdm;			  //随机数帮助类
	List<Integer> sublist;			  //题目编号集合
	SSchoolImpl   Ssc;				  //Services学校接口
	School        school;			  //校区实体类
	VeDate        Vd;				  //时间格式化帮助类
	SIcourse      SIC;				  //Servicer课程接口
	SIClass       SIS;				  //Servicer班级接口
	SISchool      SIL;				  //Services学校接口
	VeDate        DU;				  //时间转换帮助类
	  
	
	
	
	@Override
	public boolean AddItemAnalysis(Itemanalysis itemanalysis,Admin admin) {
		boolean bool=false;//监听总过程
		boolean addItemAnalysis=false;//监听创建试卷
		boolean addExamin=false;      //监听插入试卷详情
		boolean addNotice=false;      //监听添加公告
		String subjects[]={};//存放查询出的题目集合 
		String sql="insert into itemAnalysis(stageID,courseID,count,name,fraction,minute,createAuthorType,createAuthorID,creaTeime,startTime,endTIme,schoolID,classID)"+
					"VALUES("+itemanalysis.getStageId()+",'"+itemanalysis.getCourseId()+"',"+itemanalysis.getCount()+",'"+itemanalysis.getName()+"',"+itemanalysis.getFraction()+
							","+itemanalysis.getMinute()+","+admin.getAdminTypeId()+",'"+admin.getAdminId()+"',now(),'"+itemanalysis.getStartTime()+"',"+
							"'"+itemanalysis.getEndTime()+"',"+itemanalysis.getSchoolId()+",'"+itemanalysis.getClassId()+"')";
		addItemAnalysis=dii.OptionItemAnalysis(sql);//插入试卷表
		if(addItemAnalysis){//如果试卷创建成功则生成试卷题目
			itemanalysis.setId(FindItemAnalysisID(itemanalysis));//获取刚刚插入的试卷编号
			list=Sib.FindAourseCourse(itemanalysis.getCourseId());
			//System.out.println("课程下题数："+list.size());
			int count=list.size()>itemanalysis.getCount()?itemanalysis.getCount():list.size();//获取循环次数(如果查询出的题目数大于定义的题目数最大循环次数为当前定义次数，否则为查询出的题目数)
			int []subjectIDs=new int[count];
			//System.out.println("循环次数——"+count);
			//获取题目编号集合
			for (int i = 0; i < count; i++) {
				int id=(Integer) list.get(i);
				subjectIDs[i]=id;  
			}
			sublist=myrdm.GetNoRepeat(subjectIDs, count);//获取题目编号集合
			for (int i = 0; i < count; i++) {//[2017-10-1ENDLooK!!!]------
				ex.setNumber((i+1));//题目序号
				ex.setSubjectId(sublist.get(i));//题目编号
				ex.setItemAnalysisId(itemanalysis.getId());
				addExamin=SEPD.AddExaminationPaperDetails(ex);//插入试卷详情
				if(addExamin){
					//System.out.println("第"+(i+1)+"条题目数据插入成功!");
				}
			}//插入完试卷表与试卷详情表后插入通知
			//--[给校区信息赋值]
			//System.out.println("校区查询————-_");
			school.setId(itemanalysis.getSchoolId());//赋值校区编号
			list=Ssc.GetSchool(school);				 //赋值校区信息
			Object []SchoolVal=(Object[])list.get(0);//获取校区集合中的第一条校区信息
			System.out.println(SchoolVal[1]);
			//school.setId(Integer.parseInt(SchoolVal[0].toString())); //获取学校编号
			school.setName(SchoolVal[1].toString()); //获取校区名称
			school.setIcon(SchoolVal[3].toString()); //获取校区的Logo
			//--[给公告表赋值]
			String time=Vd.GetHH_MM_SS(itemanalysis.getStartTime());
			notice.setTitle("今天:"+time+"有您的一套["+itemanalysis.getName()+"]试卷");//赋值title
			notice.setWindosBody(school.getName()+"祝您学习愉快！");//赋值windos弹框body
			String body="<div style=\"padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;\">"+
			        			""+school.getName()+"公告：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亲爱的同学<br>"+
			        			"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今天  "+time+"有您的一套<br>"+
			        			"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;["+itemanalysis.getName()+"]试卷<br>"+
			        			"<br><br>"+school.getName()+"祝您生活愉快 ^_^!</div>";
			notice.setBody(body);					    	   //赋值公告body
			notice.setNoticeSchoolId(school.getId());		   //赋值学校编号
			notice.setNoticeClassId(itemanalysis.getClassId());//赋值班级编号
			notice.setAdminAuthorId(admin.getAdminId());	   //管理员编号
			notice.setAdminAuthorTpeId(admin.getAdminTypeId());//赋值管理员类型
			notice.setStartTime(itemanalysis.getStartTime());  //赋值开始时间
			//System.out.println(notice);
			addNotice=Sno.AddNotice(notice);
			//如果以上步骤成功完成则新建试卷成功!
			//System.out.println(count+"//"+itemanalysis.getCount());
			if(count<itemanalysis.getCount())//如果查询出的题目数不足添加规定的题目数则修改该试卷总题数
			{
				itemanalysis.setCount(count);//修改总题数
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
			List clist=SIC.GetList(obj[2].toString()); //获取考试试卷课程
			String Cname="";//接收课程名
			for (Object c : clist) {Cname+=" ["+c+"] ";}
			List Slist=SIS.GetClassArr(obj[13].toString());
			String ClassName="";//接收班级名称
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

	

	//↓Get/Set区
	
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
