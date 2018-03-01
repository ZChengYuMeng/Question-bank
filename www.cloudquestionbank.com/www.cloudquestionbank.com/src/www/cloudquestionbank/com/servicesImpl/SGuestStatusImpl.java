package www.cloudquestionbank.com.servicesImpl;

import www.cloudquestionbank.com.dao.DIGuestStatus;
import www.cloudquestionbank.com.entity.Guest;
import www.cloudquestionbank.com.services.SIGuestStatus;

/**
 * ServicesImpl【用户状态表】
 * @author ( 人 )
 *
 */
public class SGuestStatusImpl implements SIGuestStatus{
	DIGuestStatus dig;

	public void setDig(DIGuestStatus dig) {
		this.dig = dig;
	}

	@Override
	public boolean upstatus(String...str) {
		// TODO Auto-generated method stub
		try {
			dig.upstatus("update Guest set statusID=2 where  Guestid=?",str);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean upstatus1(String... str) {
		// TODO Auto-generated method stub
		try {
			dig.upstatus("update Guest set statusID=1 where  Guestid=?",str);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean upstatus2(String... str) {
		// TODO Auto-generated method stub
		try {
			dig.upstatus("update Guest set statusID=3 where Guestid=?",str);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean upstatus3(String... str) {
		// TODO Auto-generated method stub
		try {
			dig.upstatus("update Guest set statusID=4 where  Guestid=?",str);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
}	
