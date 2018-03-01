package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Comment;


/**
 * DAO�㡾�������۽ӿڡ�
 * @author ( �� )
 *
 */
public interface DIcomment {
	/**
	 * ����������
	 * �����������ǲ�ѯ�������۵Ĳ�ѯ����
	 * @param comment ������һ��Comment����
	 * @return ����һ��List<Comment>����
	 */
	public List<Comment> find(Comment comment);
	/**
	 * ����������
	 * �����������������������۵����ӷ���
	 * @param comment ������һ��Comment����
	 * �޷���ֵ
	 */
	public void add(Comment comment);
	/**
	 * ����������
	 * �������������޸��������۵��޸ķ���
	 * @param comment ������һ��Comment����
	 * �޷���ֵ
	 */
	public void update(Comment comment);
	/**
	 *  ����������
	 *  ������������ɾ���������۵�ɾ������
	 * @param comment ������һ��Comment����
	 * �޷���ֵ
	 */
	public void delete(Comment comment);
	/**
	 * ����������
	 * �������������������۵�ɾ�� �޸�ͨ�õķ���
	 * @param id ������һ��int���͵�id
	 * @return ����һ��Comment����
	 */
	public Comment findID(int id);
	
}
