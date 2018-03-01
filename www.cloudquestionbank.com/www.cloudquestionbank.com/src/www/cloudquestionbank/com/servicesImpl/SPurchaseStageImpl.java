package www.cloudquestionbank.com.servicesImpl;

import java.util.List;

import www.cloudquestionbank.com.dao.DIPurchaseStage;
import www.cloudquestionbank.com.entity.Completecurriculum;
import www.cloudquestionbank.com.entity.Course;
import www.cloudquestionbank.com.entity.Purchasestage;
import www.cloudquestionbank.com.services.SIPurchaseStage;
import www.cloudquestionbank.com.services.SIcompleteCurriculum;
import www.cloudquestionbank.com.services.SIcourse;

/**
 * ServicesImpl【用户购买阶段表】
 * @author ( 人 )
 *
 */
public class SPurchaseStageImpl implements SIPurchaseStage{
	DIPurchaseStage dip;
	SIcourse  Sic;  //课程接口
	SIcompleteCurriculum SiM;		//用户以完成课程接口
	Course   course  ;				//课程表实体类
	Completecurriculum  completecurriculum;//用户以完成课程实体类
	public void setDip(DIPurchaseStage dip) {
		this.dip = dip;
	}
	List list;//接收传递数据

	@Override
	public boolean AddPurchaseStage(Purchasestage pe,String GuestIDArr) {
		System.out.println("GuestIDArr_"+GuestIDArr);
		String []Gurst=GuestIDArr.split(",");
		boolean bool=false;boolean ByStage=false;boolean AddCm=false;
		course.setStageId(pe.getStageId());
		list=Sic.GetStageFirstCourse(course);//获取购买课程下的一级分类iD数组
		System.out.println("获取购买课程下的一级分类iD数组_"+list.size());
		try{
			for (int i = 0; i < Gurst.length; i++) {//循环插入多名用户购买阶段
				String sql="insert into PurchaseStage(guestID,stageID,purchaseTime,expirationDate)"+
						"VALUES("+Gurst[i]+","+pe.getStageId()+",now(),'"+pe.getExpirationDate()+"')";
				//System.out.println("用户购买阶段——"+sql);
				ByStage=dip.OPtionPurchaseStage(sql);//执行购买课程
				//插入用户以完成课程一级分类
				for (int j = 0; j < list.size(); j++) {
					//System.out.println("j"+j+"/Gurst[i]"+Gurst[i]+"//list.get(j)"+list.get(j));
					completecurriculum.setGuestId(Integer.parseInt(Gurst[i]));//设置用户编号
					completecurriculum.setCourseId(Integer.parseInt(list.get(j).toString()));//设置课程一级分类编号
					AddCm=SiM.AddCompleteCurriculum(completecurriculum);
				}
				
			}
			if(ByStage==true && AddCm==true){bool=true;};
		}catch(Exception e){bool=false;}
		return bool;
	}

	public void setSic(SIcourse sic) {
		Sic = sic;
	}

	public void setSiM(SIcompleteCurriculum siM) {
		SiM = siM;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void setCompletecurriculum(Completecurriculum completecurriculum) {
		this.completecurriculum = completecurriculum;
	}

	public Completecurriculum getCompletecurriculum() {
		return completecurriculum;
	}
	
}
