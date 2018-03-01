package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Examinationhistorydetails;


/**
 * DAO层【考试历史接口】
 * @author ( 人 )
 *
 */
public interface DIExaminationHistory {
	/**
	 * 署名：胡歌
	 * 方法名：这是查询考试历史的查询方法
	 * @param Examinationhistorydetails 参数是一个Examinationhistorydetails对象
	 * @return 返回一个List<Examinationhistorydetails>对象
	 */
	public List<Examinationhistorydetails> find(Examinationhistorydetails examinationhistorydetails);
	/**
	 * 署名：胡歌
	 * 方法名：这是增加考试历史的增加方法
	 * @param Examinationhistorydetails 参数是一个Examinationhistorydetails对象
	 * 无返回值
	 */
	public void add(Examinationhistorydetails examinationhistorydetails);
	/**
	 * 署名：胡歌
	 * 方法名：这是修改考试历史的修改方法
	 * @param Examinationhistorydetails 参数是一个Examinationhistorydetails对象
	 * 无返回值
	 */
	public void update(Examinationhistorydetails examinationhistorydetails);
	/**
	 *  署名：胡歌
	 *  方法名：这是删除考试历史的删除方法
	 * @param Examinationhistorydetails 参数是一个Examinationhistorydetails对象
	 * 无返回值
	 */
	public void delete(Examinationhistorydetails examinationhistorydetails);
	/**
	 * 署名：胡歌
	 * 方法名：这是考试历史的删除 修改通用的方法
	 * @param id 参数是一个int类型的id
	 * @return 返回一个Examinationhistorydetails对象
	 */
	public Examinationhistorydetails findID(int id);
	
}
