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
 * ServicesImpl���û�����׶α�
 * @author ( �� )
 *
 */
public class SPurchaseStageImpl implements SIPurchaseStage{
	DIPurchaseStage dip;
	SIcourse  Sic;  //�γ̽ӿ�
	SIcompleteCurriculum SiM;		//�û�����ɿγ̽ӿ�
	Course   course  ;				//�γ̱�ʵ����
	Completecurriculum  completecurriculum;//�û�����ɿγ�ʵ����
	public void setDip(DIPurchaseStage dip) {
		this.dip = dip;
	}
	List list;//���մ�������

	@Override
	public boolean AddPurchaseStage(Purchasestage pe,String GuestIDArr) {
		System.out.println("GuestIDArr_"+GuestIDArr);
		String []Gurst=GuestIDArr.split(",");
		boolean bool=false;boolean ByStage=false;boolean AddCm=false;
		course.setStageId(pe.getStageId());
		list=Sic.GetStageFirstCourse(course);//��ȡ����γ��µ�һ������iD����
		System.out.println("��ȡ����γ��µ�һ������iD����_"+list.size());
		try{
			for (int i = 0; i < Gurst.length; i++) {//ѭ����������û�����׶�
				String sql="insert into PurchaseStage(guestID,stageID,purchaseTime,expirationDate)"+
						"VALUES("+Gurst[i]+","+pe.getStageId()+",now(),'"+pe.getExpirationDate()+"')";
				//System.out.println("�û�����׶Ρ���"+sql);
				ByStage=dip.OPtionPurchaseStage(sql);//ִ�й���γ�
				//�����û�����ɿγ�һ������
				for (int j = 0; j < list.size(); j++) {
					//System.out.println("j"+j+"/Gurst[i]"+Gurst[i]+"//list.get(j)"+list.get(j));
					completecurriculum.setGuestId(Integer.parseInt(Gurst[i]));//�����û����
					completecurriculum.setCourseId(Integer.parseInt(list.get(j).toString()));//���ÿγ�һ��������
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
