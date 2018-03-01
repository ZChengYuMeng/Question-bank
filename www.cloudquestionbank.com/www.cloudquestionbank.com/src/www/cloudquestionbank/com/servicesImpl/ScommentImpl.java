package www.cloudquestionbank.com.servicesImpl;

import www.cloudquestionbank.com.dao.DIcomment;
import www.cloudquestionbank.com.services.SIcomment;

/**
 * ServicesImpl【试题评论表】
 * @author ( 人 )
 *
 */
public class ScommentImpl implements SIcomment{
	DIcomment dic;

	public void setDic(DIcomment dic) {
		this.dic = dic;
	}
	
}
