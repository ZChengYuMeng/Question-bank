package www.cloudquestionbank.com.servicesImpl;

import java.util.List;

import www.cloudquestionbank.com.dao.DINotice;
import www.cloudquestionbank.com.entity.Notice;
import www.cloudquestionbank.com.services.SINotice;

/**
 * ServicesImpl【公告表】
 * @author ( 人 )
 *
 */
public class SNoticeImpl implements SINotice {
	DINotice Din;
	
	@Override
	public List GetSINoticeList(Notice notice) {
		return null;
	}

	@Override
	public boolean AddNotice(Notice notice) {
		String sql="insert into Notice(title,body,noticeSchoolID,noticeClassID,AdminAuthor_id,AdminAuthorTpeID,createTime,startTime,BeOverdue,windosBody)"+ 
					"VALUES('"+notice.getTitle()+"','"+notice.getBody()+"',"+notice.getNoticeSchoolId()+",'"+notice.getNoticeClassId()+"','"+notice.getAdminAuthorId()+"',"+notice.getAdminAuthorTpeId()+",now(),'"+notice.getStartTime()+"',0,'"+notice.getWindosBody()+"')";
		System.out.println(sql);
		return Din.OptionNotice(sql);
	}

	public void setDin(DINotice din) {
		Din = din;
	}
	
}
