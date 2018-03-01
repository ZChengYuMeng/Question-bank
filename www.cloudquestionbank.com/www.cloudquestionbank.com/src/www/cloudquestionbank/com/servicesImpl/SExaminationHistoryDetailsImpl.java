package www.cloudquestionbank.com.servicesImpl;

import www.cloudquestionbank.com.dao.DIExaminationHistoryDetails;
import www.cloudquestionbank.com.services.SIExaminationHistoryDetails;

/**
 * ServicesImpl【考试历史详情表】
 * @author ( 人 )
 *
 */
public class SExaminationHistoryDetailsImpl implements SIExaminationHistoryDetails{
	DIExaminationHistoryDetails die;

	public void setDie(DIExaminationHistoryDetails die) {
		this.die = die;
	}
	
}
