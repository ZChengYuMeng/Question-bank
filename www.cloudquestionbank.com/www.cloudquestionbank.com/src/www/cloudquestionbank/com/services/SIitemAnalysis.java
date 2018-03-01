package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Itemanalysis;

/**
 * Services【试卷表业务接口】
 * @author ( 人 )
 *
 */
public interface SIitemAnalysis {
	/**
	 * 功能:新增考试
	 * @return
	 */
	 boolean AddItemAnalysis(Itemanalysis itemanalysis,Admin admin); 
	/**
	 * 功能:查询试卷编号
	 * @param itemanalysis
	 * @return
	 */
	 int FindItemAnalysisID(Itemanalysis it);
	 /**
	  * 修改试卷
	  * @param itemanalysis
	  * @return
	  */
	 boolean UpdItemAnalysis(Itemanalysis itemanalysis);
	 /**
	  * 考试信息管理查询
	  * @param admin
	  * @return
	  */
	 String OBjectList(Admin admin); 
	 
	 /**
	  * 修改试卷开始时间和结束时间
	  * @param it
	  * @return
	  */
	 boolean UpdItemAnalysisStartTimeAndEndTIme(Itemanalysis it);
}
