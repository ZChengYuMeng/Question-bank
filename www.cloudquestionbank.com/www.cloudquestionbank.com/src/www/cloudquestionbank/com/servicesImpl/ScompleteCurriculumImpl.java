package www.cloudquestionbank.com.servicesImpl;

import www.cloudquestionbank.com.dao.DIcompleteCurriculum;
import www.cloudquestionbank.com.entity.Completecurriculum;
import www.cloudquestionbank.com.services.SIcompleteCurriculum;

/**
 * ServicesImpl【用户以完成课程】
 * @author ( 人 )
 *
 */
public class ScompleteCurriculumImpl implements SIcompleteCurriculum{
	DIcompleteCurriculum dic;

	public void setDic(DIcompleteCurriculum dic) {
		this.dic = dic;
	}

	@Override
	public boolean AddCompleteCurriculum(Completecurriculum completecurriculum) {
		String sql="insert into completeCurriculum(guestID,courseID,completedQuantity)"+
					"VALUES("+completecurriculum.getGuestId()+","+completecurriculum.getCourseId()+",0)";
		return dic.OPptionCompleteCurriculum(sql);
	}
	
	
	
}
