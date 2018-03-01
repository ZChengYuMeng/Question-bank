package www.cloudquestionbank.com.servicesImpl;

import www.cloudquestionbank.com.dao.DIExaminationPaperDetails;
import www.cloudquestionbank.com.entity.Examinationpaperdetails;
import www.cloudquestionbank.com.services.SIExaminationPaperDetails;

/**
 * ServicesImpl【试卷详情表】
 * @author ( 人 )
 *
 */
public class SExaminationPaperDetailsImpl implements SIExaminationPaperDetails{
	DIExaminationPaperDetails die;
	
	public void setDie(DIExaminationPaperDetails die) {
		this.die = die;
	}

	@Override
	public boolean AddExaminationPaperDetails(Examinationpaperdetails ex) {
		String sql="insert into ExaminationPaperDetails(number,subjectID,itemAnalysisID) values"+
				   "("+ex.getNumber()+","+ex.getSubjectId()+","+ex.getItemAnalysisId()+")";
		//System.out.println("新增试卷详情——"+sql);
		return die.OptionExaminationPaperDetails(sql);
	}
	
}
