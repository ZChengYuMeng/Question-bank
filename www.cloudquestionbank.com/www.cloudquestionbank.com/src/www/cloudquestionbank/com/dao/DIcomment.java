package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Comment;


/**
 * DAO层【试题评论接口】
 * @author ( 人 )
 *
 */
public interface DIcomment {
	/**
	 * 署名：胡歌
	 * 方法名：这是查询试题评论的查询方法
	 * @param comment 参数是一个Comment对象
	 * @return 返回一个List<Comment>对象
	 */
	public List<Comment> find(Comment comment);
	/**
	 * 署名：胡歌
	 * 方法名：这是增加试题评论的增加方法
	 * @param comment 参数是一个Comment对象
	 * 无返回值
	 */
	public void add(Comment comment);
	/**
	 * 署名：胡歌
	 * 方法名：这是修改试题评论的修改方法
	 * @param comment 参数是一个Comment对象
	 * 无返回值
	 */
	public void update(Comment comment);
	/**
	 *  署名：胡歌
	 *  方法名：这是删除试题评论的删除方法
	 * @param comment 参数是一个Comment对象
	 * 无返回值
	 */
	public void delete(Comment comment);
	/**
	 * 署名：胡歌
	 * 方法名：这是试题评论的删除 修改通用的方法
	 * @param id 参数是一个int类型的id
	 * @return 返回一个Comment对象
	 */
	public Comment findID(int id);
	
}
