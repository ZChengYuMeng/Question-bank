package www.cloudquestionbank.com.services;

import java.util.List;
import java.util.Set;

import www.cloudquestionbank.com.entity.Subject;
import www.cloudquestionbank.com.entity.Topicselftesthistory;
import www.cloudquestionbank.com.entity.Topicselftesthistorydetails;


/**
 * Services【题目表业务接口】
 * @author ( 人 )
 *
 */
public interface SIsubject {
	/**
	 * 功能:添加 题目表
	 * @param sbj
	 */
	public boolean insertsb(Subject sbj);
	/**
	 * 题目表中查询所有课程
	 */
	public List findkc();
	
	/**
	 * 查询题目
	 * @param sql
	 * @param str
	 * @return
	 */
	public List findkc_couse(String...str);
	/**
	 * 题目自测历史表
	 * 功能:添加
	 * @param tsy
	 */
	public boolean insert_tsy(Topicselftesthistory tsy);
	/**
	 * 题目自测历史详情表
	 * 功能:添加
	 * @param tsy
	 */
	public boolean insert_tsyDetails(Topicselftesthistorydetails tsyd);
	/**
	 * 题目自测历史表
	 * 功能:查询
	 * @param tsy
	 */
	public List find_tsy(String...str);
	/**
	 * 题目自测历史详情表
	 * 功能:查询
	 * @param tsyd
	 */
	public List find_tsyDetails(String...str);
	/**
	 * 查询题目
	 * @param sql
	 * @param str
	 * @return
	 */
	public List find_timu(String...str);
	public List find_all();
	/**
	 * 功能:作答
	 * 修改时将correct作答修改为0为已作答
	 * @param tsty
	 */
	public boolean update_paper(String...str);
	
	/**
	 * 查询题目自测历史表编号
	 * @param sql
	 * @param Strs
	 * @return
	 */
   public List FindID(String... Strs);
   /**
	 * 功能:修改自测历史表
	 * 修改参数 ：交卷时间
	 * @param sql
	 * @param str
	 */
	public boolean update_tsyDetails(String...str);
	/**
	 * 功能:查询该课程是否有题目
	 * @param sb
	 * @return
	 */
	public List<Subject> find_Subject(int cid);
	
	/**
	 * 交卷
	 * @param str
	 * @return
	 */
	public boolean find_Assignment(String...str);
	
	/**
	 * 功能：查询某些课程下的题目
	 * @param subject
	 * @return
	 */
	List FindAourseCourse(String...Strs);
	
	/**
	 * 处理业务功能: 时间查询
	 * @return
	 */
	public List find_avgToDay(String...str);
	/**
	 * 处理业务功能:查询用户编号
	 * @param str
	 * @return
	 */
	public 	boolean find_guestID(String...str);
	/**
	 * 处理业务功能:查询用户阶段的题数
	 * @param str
	 * @return
	 */
	public List find_questions(String...str);
	/**
	 * 查询错的题目，但不是自测的题目
	 * @param str
	 * @return
	 */
	public List find_Thewrong(String...str);
	public List Thewrongquestion(String...str);
}
