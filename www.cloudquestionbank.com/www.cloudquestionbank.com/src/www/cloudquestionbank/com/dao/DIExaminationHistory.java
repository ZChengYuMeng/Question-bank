package www.cloudquestionbank.com.dao;

import java.util.List;

import www.cloudquestionbank.com.entity.Examinationhistorydetails;


/**
 * DAO�㡾������ʷ�ӿڡ�
 * @author ( �� )
 *
 */
public interface DIExaminationHistory {
	/**
	 * ����������
	 * �����������ǲ�ѯ������ʷ�Ĳ�ѯ����
	 * @param Examinationhistorydetails ������һ��Examinationhistorydetails����
	 * @return ����һ��List<Examinationhistorydetails>����
	 */
	public List<Examinationhistorydetails> find(Examinationhistorydetails examinationhistorydetails);
	/**
	 * ����������
	 * ���������������ӿ�����ʷ�����ӷ���
	 * @param Examinationhistorydetails ������һ��Examinationhistorydetails����
	 * �޷���ֵ
	 */
	public void add(Examinationhistorydetails examinationhistorydetails);
	/**
	 * ����������
	 * �������������޸Ŀ�����ʷ���޸ķ���
	 * @param Examinationhistorydetails ������һ��Examinationhistorydetails����
	 * �޷���ֵ
	 */
	public void update(Examinationhistorydetails examinationhistorydetails);
	/**
	 *  ����������
	 *  ������������ɾ��������ʷ��ɾ������
	 * @param Examinationhistorydetails ������һ��Examinationhistorydetails����
	 * �޷���ֵ
	 */
	public void delete(Examinationhistorydetails examinationhistorydetails);
	/**
	 * ����������
	 * �����������ǿ�����ʷ��ɾ�� �޸�ͨ�õķ���
	 * @param id ������һ��int���͵�id
	 * @return ����һ��Examinationhistorydetails����
	 */
	public Examinationhistorydetails findID(int id);
	
}
