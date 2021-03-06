package www.cloudquestionbank.com.servicesImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;

import www.cloudquestionbank.com.dao.DIGuest;
import www.cloudquestionbank.com.entity.Admin;
import www.cloudquestionbank.com.entity.Guest;
import www.cloudquestionbank.com.entity.Stage;
import www.cloudquestionbank.com.services.SIGuest;

/**
 * ServicesImpl【用户表】
 * @author ( 人 )
 *
 */
//@Service("sIGuest")
public class SGuestImpl implements SIGuest {
	DIGuest dig;
	public void setDig(DIGuest dig) {
		this.dig = dig;
	}
	Gson gson=new Gson();//json转换对象
	HashMap<String, Object> hmp;//Json传值map
	List list;				//传值
	String jsonStr;
	@Override
	public List loginfind(int uid) {
		// TODO Auto-generated method stub
		return dig.loginfind("select * from purchasestage p ,Guest g ,stage s "+
" where  p.guestID=g.guestID and s.id=p.stageID "+
" and g.guestID='"+uid+"'");
	}

	@Override
	public List loginDl( String... str) {
		return dig.loginDl("SELECT * from Guest where pwd=? and email=?", str);
	}

	@Override
	public List loginname(String name) {
		return  dig.loginDl("SELECT * from Guest where  email=?", name);
	}

	@Override
	public boolean AddGuest(Guest guest) {
		String sql="insert into Guest "+
					"(description,phone,guestName,imgUrl,lastLoginTime,statusID,guestVIPTypeID,email,pwd,createTime,updateTime,address,realName,cardNo,classID,schoolID) "+
					"values('"+guest.getDescription()+"','"+guest.getPhone()+"','"+guest.getGuestName()+"','"+guest.getImgUrl()+"',now(),3,1,'"+guest.getEmail()+"','"+guest.getPwd()+"',now(),now(),'"+guest.getAddress()+"','"+guest.getRealName()+"','"+guest.getCardNo()+"','"+guest.getClassId()+"','"+guest.getSchoolId()+"');";
		System.out.println(sql);
		return dig.OperationGuest(sql);
	}

	@Override
	public boolean EmailIsExistence(Guest guest) {
		String sql="select email from guest where email=?";
		boolean bool=false;
		bool=(dig.ISexistence(sql, guest.getEmail()).size()>0);
		return bool;
	}

	@Override
	public boolean CardNoIsExistence(Guest guest) {
		String sql="select cardNo from guest where cardNo=?";
		boolean bool=false;
		bool=(dig.ISexistence(sql, guest.getCardNo()).size()>0);
		return bool;
	}

	@Override
	public String GetJsonList(Guest guest) {
		List glist;
		String sql="select a.guestID,a.description,a.phone,a.guestName,a.lastLoginTime,d.statusName,e.vipName,a.email,a.pwd,a.createTime,a.updateTime,a.address,a.realName,a.cardNo,a.classID,a.schoolID,b.name,c.cname "+
					" from  Guest a,School b,Class c,GuestStatus d,GuestVip e "+  
					" where 1=1 and b.id=a.schoolID and a.classID=c.id and a.statusID=d.id and a.guestVIPTypeID=e.id "; 
		sql+=guest.getSchoolId()!=0?" and  a.schoolID="+guest.getSchoolId():" ";
		//System.out.println(sql);
		glist=(List) dig.ISexistence(sql);
		jsonStr="[";int i=0;
		for (Object o : glist) {
			Object []obj=(Object[]) o;
			String pwd=(String)(guest.getSchoolId()!=0?"******":obj[8]);
			
			jsonStr+="{\"GuestId\":\""+obj[0]+"\",\"description\":\""+obj[1]+"\",\"phone\":\""+obj[2]+"\",\"guestName\":\""+obj[3]+"\",\"lastLoginTime\":\""+obj[4]+"\",\"statusID\":\""+obj[5]+"\",\"guestVIPTypeID\":\""+obj[6]+"\",\"email\":\""+obj[7]+"\",\"pwd\":\""+obj[8]+"\",\"createTime\":\""+obj[9]+"\",\"updateTime\":\""+obj[10]+"\",\"address\":\""+obj[11]+"\",\"realName\":\""+obj[12]+"\",\"cardNo\":\""+obj[13]+"\",\"classID\":\""+obj[14]+"\",\"schoolID\":\""+obj[15]+"\",\"schoolName\":\""+obj[16]+"\",\"ClassName\":\""+obj[17]+"\"}";
			jsonStr+=i==glist.size()-1?"":",";
			i++;
		}
		jsonStr+="]";
		return jsonStr;
	}

	@Override
	public String AdminUpdGuest(Guest guest,Admin admin) {
		String sql="update Guest set address='"+guest.getAddress()+"',classID="+guest.getClassId();
		sql+=admin.getSchoolId()==0?",schoolID="+guest.getSchoolId():"";
		sql+=" where guestID="+guest.getGuestId();
		//System.out.println(sql);
		jsonStr=gson.toJson(dig.OperationGuest(sql));
		//System.out.println(jsonStr);
		return jsonStr;
	}

	@Override
	public String GetGuestCommonSchoolAndClass(Guest guest,Stage stage) {
		String sql="select guestID,realName from guest where classID="+guest.getClassId()+" and schoolID="+guest.getSchoolId()+" and guestID not in (select guestID from PurchaseStage where stageID="+stage.getId()+")";
		//System.out.println(sql);
		jsonStr=gson.toJson(dig.ISexistence(sql));
		return jsonStr;
	}

}
