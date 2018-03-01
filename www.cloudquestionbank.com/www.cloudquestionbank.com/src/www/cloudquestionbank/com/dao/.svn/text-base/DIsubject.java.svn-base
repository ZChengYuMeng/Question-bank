package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Subject;
import www.cloudquestionbank.com.entity.Topicselftesthistory;
import www.cloudquestionbank.com.entity.Topicselftesthistorydetails;


/**
 * DAO层【题目接口】
 * @author ( 人 )
 *
 */
public interface DIsubject {
	/**
	 * 功能:添加 题目表
	 * @param sbj
	 */
	public void insertsb(Subject sbj);
	/**
	 * 题目表中查询所有课程
	 */
	public List findkc(String sql);
	/**
	 * 查询所属课程内所有的题目
	 * @param sql
	 * @param str
	 * @return
	 */
	public List findkc_couse(String sql,String...str);
	/**
	 * 题目自测历史表
	 * 功能:添加
	 * @param tsy
	 */
	public void insert_tsy(Topicselftesthistory tsy);
	/**
	 * 题目自测历史详情表
	 * 功能:添加
	 * @param tsyd
	 */
	public void insert_tsyDetails(Topicselftesthistorydetails tsyd);
	/**
	 * 题目自测历史表
	 * 功能:查询
	 * @param tsy
	 */
	public List find_tsy(String sql,String...str);
	/**
	 * 题目自测历史详情表
	 * 功能:查询
	 * @param tsyd
	 */
	public List find_tsyDetails(String sql,String...str);
	/**
	 * 查询题目
	 * @param sql
	 * @param str
	 * @return
	 */
	public List find_timu(String sql,String...str);
	public List find_all();
	/**
	 * 功能:作答
	 * @param tsty
	 */
	public void update_paper(String sql,String...str);
	
	
	/**
	 * 通过题目自测历史详情编号查询
	 * 题目自测历史编号
	 * @param sql
	 * @param Strs
	 * @return
	 */
	public List FindID(String sql,String... Strs);
	/**
	 * 功能:修改自测历史表
	 * 修改参数 ：交卷时间
	 * @param sql
	 * @param str
	 */
	public void update_tsyDetails(String sql,String...str);
	/**
	 * 功能:查询 已作答的题目数量及答题数量
	 * @param sql
	 * @param str
	 * @return
	 */
	public Object[] find_paper_count(String sql,String...str);
	/**
	 * 功能:查询该课程是否有题目
	 * @param sb
	 * @return
	 */
	public List<Subject> find_Subject(int cid);
	/**
	 * 功能:查询用户作答是否正确
	 * @param sql查询语句
	 * @param str所需参数
	 * @return
	 */
	public List find_bool(String sql,String...str);
	/**
	 * 功能:修改用户作答正确/错误
	 * @param sql
	 * @param str
	 */
	public void update_answer(String sql,String...str);
	/**
	 * 功能:修改试卷得分
	 * @param sql
	 * @param str
	 */
	public void update_TestHistory(String sql,String...str);
	public List find_avgToDay(String sql,String...str);
	/**
	 * 功能：获取题目集合
	 * @param sql
	 * @param Strs
	 * @return
	 */
	List Getlist(String sql,String...Strs);
	
} 
