package www.cloudquestionbank.com.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import www.cloudquestionbank.com.dao.DIcompleteCurriculum;
import www.cloudquestionbank.com.entity.Completecurriculum;

/**
 * DAOImpl【用户以完成课程】
 * @author ( 人 )
 *
 */
public class DcompleteCurriculumImpl  implements DIcompleteCurriculum {
	DI_Impl_Util DU;
	
	@Override
	public boolean OPptionCompleteCurriculum(String sql, String... Strs) {
		return DU.update(sql, Strs);
	}

	public void setDU(DI_Impl_Util dU) {
		DU = dU;
	}

	
}
