package www.cloudquestionbank.com.services;

import java.util.List;

import www.cloudquestionbank.com.entity.Notice;

/**
 * Services�������
 * @author ( �� )
 *
 */
public interface SINotice {
	/**
	 * ���ܣ���ȡ�������
	 * @param notice
	 * @return
	 */
	List GetSINoticeList(Notice notice);
	/**
	 * ���ܣ���������
	 * @param notice
	 * @return
	 */
	boolean AddNotice(Notice notice);
	
}
