package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Itemanalysis;

/**
 * Services���Ծ��ҵ��ӿڡ�
 * @author ( �� )
 *
 */
public interface SIitemAnalysis {
	/**
	 * ����:��������
	 * @return
	 */
	 boolean AddItemAnalysis(Itemanalysis itemanalysis,Admin admin); 
	/**
	 * ����:��ѯ�Ծ���
	 * @param itemanalysis
	 * @return
	 */
	 int FindItemAnalysisID(Itemanalysis it);
	 /**
	  * �޸��Ծ�
	  * @param itemanalysis
	  * @return
	  */
	 boolean UpdItemAnalysis(Itemanalysis itemanalysis);
	 /**
	  * ������Ϣ�����ѯ
	  * @param admin
	  * @return
	  */
	 String OBjectList(Admin admin); 
	 
	 /**
	  * �޸��Ծ�ʼʱ��ͽ���ʱ��
	  * @param it
	  * @return
	  */
	 boolean UpdItemAnalysisStartTimeAndEndTIme(Itemanalysis it);
}
